pipeline {
    agent {
        docker {
            image 'bridgecrew/checkov'
        }
    }
    stages {
        stage('test') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/ivan-tresoldi/devsecops-demo.git']]])
                script { 
                    sh "checkov --directory . --prisma-api-url PRISMA_API_URL --bc-api-key PRISMA_ACCESS_KEY::PRISMA_SECRET_KEY --repo-id ivan-tresoldi/devsecops-demo"
                }
            }
        }
    }
}