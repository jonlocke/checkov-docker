pipeline {
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
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry(registryUri) {
                    dockerImage.push("$BUILD_NUMBER")
                    dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
