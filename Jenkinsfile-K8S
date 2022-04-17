pipeline {
    agent any

    environment {
        registry = "211223789150.dkr.ecr.us-east-2.amazonaws.com/my-python-repo"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/akannan1087/myPythonDockerRepo']]])
            }
        }
    
        stage ("Build image") {
            steps {
                script {
                    docker.build registry
                }
            }
        }
        
        stage ("docker push") {
         steps {
             script {
                sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 211223789150.dkr.ecr.us-east-2.amazonaws.com"
                sh "docker push 211223789150.dkr.ecr.us-east-2.amazonaws.com/my-python-repo"
                 
             }
           }   
        }
        
        stage ("Kube Deploy") {
            steps {
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'K8S', namespace: '', serverUrl: '') {
                 sh "kubectl apply -f eks-deploy-from-ecr.yaml"
                }
            }
        }
    }
}
