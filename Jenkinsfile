pipeline {
    environment {
      registryCredential = ''
      registryUri = 'http://kube1.local:5000/'
    }
    
    agent { dockerfile {
        filename 'Dockerfile'
//        additionalBuildArgs  "--build-arg CACHEBUST=${env.BUILD_TAG}"
        additionalBuildArgs  "--no-cache"
            } 
          }
    stages {
        stage('Display Version and help') {
            steps {
                sh 'checkov -v'
                sh 'checkov -h'
                sh 'cat /etc/os-release'
            }
        }
        stage('IaC Code Scan ') {
            steps {
                sh 'ls -lh'
                sh 'tar -cvf /tmp/test.tar Dockerfile'
                sh 'curl -s -k -X POST -H "Content-Type: multipart/form-data" -F "file=@/tmp/test.tar" http://10.0.123.142:5000/uploader'
            }
        }
        stage('Functionality Step') {
            steps{
                script {
                    sh  'checkov -d terragoat'
                    }
             }
         }
     }

  post {
        always {
            echo 'One way or another, I have finished'
//            deleteDir() /* clean up our workspace */
        }
        success {
            echo 'I succeeded!'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Things were different before...'
        }
  }
}
