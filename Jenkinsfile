node {
    
    stage('Clone repository') {
        checkout scm
    }

    stage('Check Applicstion Code dependencies have no vulnerabilities') {
        sh('chmod +x files/reposcan.sh && ./files/reposcan.sh')
    }

    stage('Apply security policies (Policy-as-Code) for evilpetclinic') {
        sh('chmod +x files/addPolicies.sh && ./files/addPolicies.sh')
    }

   // stage('Download latest twistcli') {
        // sh 'curl -k -u $PC_USER:$PC_PASS --output ./twistcli https://$PC_CONSOLE/api/v1/util/twistcli'
        // sh 'sudo chmod a+x ./twistcli'
    }
	
    stage('Scan image with twistcli and Publish results to Jenkins') {
      try {
	    sh 'docker pull itresoldi/evilpetclinic:latest'  
            withCredentials([usernamePassword(credentialsId: 'twistlock_creds', passwordVariable: 'TL_PASS', usernameVariable: 'TL_USER')]) {
            prismaCloudScanImage ca: '', cert: '', dockerAddress: 'unix:///var/run/docker.sock', ignoreImageBuildTime: true, image: 'itresoldi/evilpetclinic:latest', key: '', logLevel: 'debug', podmanPath: '', project: '', resultsFile: 'prisma-cloud-scan-results.json'
            }
	  } finally {
            prismaCloudPublish resultsFilePattern: 'prisma-cloud-scan-results.json'
        }
    }
		
    //stage('Scan K8s yaml manifest with Bridgecrew/checkov') {
	  //  withDockerContainer(image: 'bridgecrew/jenkins_bridgecrew_runner:latest') {              
	  //  sh "/run.sh aaba9c95-c632-5403-9762-24bbcd0a4611 https://github.com/ivan-tresoldi/shiftleftdemo"
	  //  }
    //}

    stage('Deploy evilpetclinic') {
        sh 'kubectl create ns evil --dry-run -o yaml | kubectl apply -f -'
        sh 'kubectl delete --ignore-not-found=true -f files/deploy.yml -n evil'
        sh 'kubectl apply -f files/deploy.yml -n evil'
        sh 'sleep 10'
    }

    stage('Run Runtime attacks') {
        sh('chmod +x files/runtime_attacks.sh && ./files/runtime_attacks.sh')
    }

    stage('Run WAAS attacks') {
        sh('chmod +x files/waas_attacks.sh && ./files/waas_attacks.sh')
    }
	
}
