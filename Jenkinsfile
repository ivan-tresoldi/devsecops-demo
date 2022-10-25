pipeline {
    agent any
    
    environment {
        PRISMA_API_URL='https://api.prismacloud.io'
    }
    
    stages {
        stage('Checkout') {
          steps {
              git branch: 'master', url: 'https://github.com/bridgecrewio/terragoat'
              stash includes: '**/*', name: 'terragoat'
          }
        }
        stage('Checkov') {
            steps {
                withCredentials([string(credentialsId: 'PC_USER', variable: 'pc_user'),string(credentialsId: 'PC_PASSWORD', variable: 'pc_password')]) {
                    script {
                        docker.image('bridgecrew/checkov:latest').inside("--entrypoint=''") {
                          unstash 'terragoat'
                          try {
                              sh 'checkov -d . --use-enforcement-rules -o cli -o junitxml --output-file-path console,results.xml --bc-api-key ${pc_user}::${pc_password} --repo-id taysmith/terragoat --branch master'
                              junit skipPublishingChecks: true, testResults: 'results.xml'
                          } catch (err) {
                              junit skipPublishingChecks: true, testResults: 'results.xml'
                              throw err
                          }
                        }
                    }
                }
            }
        }
    }
}