pipeline {
    environment {
      registryCredential = ''
      registryUri = 'http://kube1.local:5000/'
    }
    
    agent { dockerfile {
        filename 'Dockerfile'
//        additionalBuildArgs  "--build-arg CACHEBUST=${env.BUILD_TAG}"
//        additionalBuildArgs  "--no-cache"
            } 
          }
    stages {
        stage('IaC Code Scan | Checkov') {
            steps {
                sh 'tar -cvf /tmp/test.tar Dockerfile'
                sh 'tar -tf /tmp/test.tar'
                sh 'curl -s -k -X POST -H "Content-Type: multipart/form-data" -F "file=@/tmp/test.tar" https://10.0.0.142:5000/uploader'
            }
        }
        stage('Test Scripts') {
            steps{
                script {
//                    sh 'ls -l'
//                    sh 'wget http://localhost:8080'
//                    sh  'checkov --version'
                    sh  'checkov -d test'
//                    sh  'checkov -d terragoat'
                    sh 'uname -a'
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
