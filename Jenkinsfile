pipeline {
    agent {
        docker { dockerfile true }
    }
    stages {
        stage('Test') {
            steps {
                sh 'cat /etc/hosts'
                sh 'uname -a'
            }
        }
    }
}
