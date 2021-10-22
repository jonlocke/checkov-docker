pipeline {
    environment {
      registryCredential = ''
      registryUri = 'http://kube1.local:5000/'
    }
    
    agent { dockerfile {
        filename 'Dockerfile'
        additionalBuildArgs  '--no-cache'
            } 
          }
    stages {
        stage('IaC Code Scan | Checkov') {
            steps {
                sh 'tar -cvf /tmp/test.tar *'
                sh 'curl -s -k -X POST -H "Content-Type: multipart/form-data" -F "file=@/tmp/test.tar" https://10.0.0.142:5000/uploader'
            }
        }
        stage('Test Scripts') {
            steps{
                script {
                    sh 'ls -l'
                    sh 'wget http://localhost:8080'
                    sh  'checkov --version'
                    sh 'uname -a'
                    }
             }
         }
     }
}
