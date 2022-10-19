node {
	stage('Clone repository') {
        	checkout scm
    }
	
	stage('Download latest twistcli') {
          	sh('chmod +x ./files/download_twistcli.sh && ./files/download_twistcli.sh')
    }
    
    stage('Check Application Code dependencies have no vulnerabilities') {
        	sh('chmod +x ./files/repoScan.sh && ./files/repoScan.sh')
    }

    stage('Apply security policies (Policy-as-Code) for evilpetclinic') {
        	sh('chmod +x ./files/addPolicies.sh && ./files/addPolicies.sh')
    }
	
    stage('Scan image with twistcli and Publish results to Jenkins') {
		sh 'sudo docker pull itresoldi/evilpetclinic:latest'  
           	prismaCloudScanImage ca: '', cert: '', dockerAddress: '', ignoreImageBuildTime: true, image: 'itresoldi/evilpetclinic:latest', key: '', logLevel: 'debug', project: '', resultsFile: 'prisma-cloud-scan-results.json'
            prismaCloudPublish resultsFilePattern: 'prisma-cloud-scan-results.json'
    	}

    stage('Runtime Container Image Scanning') {
        	//sh('chmod +x ./files/sandboxscan.sh && ./files/sandboxscan.sh')
    }
    
    
    stage('Code Security Scanning') {
        withDockerContainer(image: 'kennethreitz/pipenv:latest') {              
        }
        script { 
                sh """export PRISMA_API_URL=https://api.prismacloud.io
                pipenv install
                pipenv run pip install bridgecrew
                pipenv run bridgecrew --directory . --bc-api-key PRISMA_ACCESS_KEY::PRISMA_SECRET_KEY --repo-id ivan-tresoldi/devsecops-demo"""
            }
    }
    
    stage('Deploy Application') {
        	sh 'kubectl apply -f files/deploy.yml'
        	sh 'sleep 10'
    }

    stage('Run Runtime attacks') {
        	sh('chmod +x ./files/runtime_attacks.sh && ./files/runtime_attacks.sh')
    }

    stage('Run WAAS attacks') {
        	sh('chmod +x ./files/waas_attacks.sh && ./files/waas_attacks.sh')
    }
}
