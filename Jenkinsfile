pipeline {
    agent {
        docker {
            image 'kennethreitz/pipenv:latest'
            args '-u root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('test') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/ivan-tresoldi/devsecops-demo.git']]])
                script { 
                    sh """export PRISMA_API_URL=https://api.prismacloud.io
                    pipenv install
                    pipenv run pip install bridgecrew
                    pipenv run bridgecrew --directory . --bc-api-key PRISMA_ACCESS_KEY::PRISMA_SECRET_KEY --repo-id ivan-tresoldi/devsecops-demo"""
                }
            }
        }
    }
}