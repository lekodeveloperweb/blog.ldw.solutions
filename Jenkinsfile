pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'git submodule init && git submodule update --recursive'
                sh 'docker compose -f docker-compose.blog.yml build --no-cache'
            }
        }
        stage('Cleaning up old containers') {
            steps {
                sh 'docker compose -f docker-compose.blog.yml down'
            }
        }
        stage('Run LDW solutions blog') {
            steps {
                sh 'docker compose -f docker-compose.blog.yml up -d'
            }
        }
    }
}