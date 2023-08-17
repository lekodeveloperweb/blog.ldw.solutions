pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'git submodule init && git submodule update --recursive'
                sh 'docker build -t ldw.solutions/blog:latest . --no-cache'
            }
        }
        stage('Cleaning up old containers') {
            steps {
                sh 'docker rm -f ldw-blog'
            }
        }
        stage('Run LDW solutions blog') {
            steps {
                sh 'docker run -d --network ldwsolutions --name ldw-blog --label traefik.enable=true --label="traefik.http.routers.analytics.rule=Host(\'blog.ldw.solutions\')" ldw.solutions/blog:latest'
            }
        }
    }
}