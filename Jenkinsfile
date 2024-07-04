pipeline{
	agent any 
	tools{
		maven "maven"
	}
	
	stages{
		stage('Code Checkout'){
			steps{
				git branch: 'main', url: 'https://github.com/sreevarshitha1234/Cloud-Gen-Project.git'
			}
		}

	stage("code analysis"){
		steps{
			withSonarQubeEnv('wardeploy'){
				sh 'mvn clean install sonar:sonar'
			}
		}
	}
	stage ('Build Artifcat'){
		steps{
			sh 'mvn package'
		}
	    post{
		success{
		echo "Archiving the Artifcat"
		archiveArtifacts artifacts: '**/*.war'
			}
		}
		}

	stage ('Deploying Artifcat into Nexus'){
		steps{
			sh 'mvn deploy'
		}
	}
	stage("Deploying war file into Tomcat Server"){
		steps{
		sshagent(['wardeploy']) {
			sh "scp -o StrictHostKeyChecking=no webapp/target/cloudgen-registration-form.war root@192.168.254.153:/opt/tomcat/webapps"
   
		}

		}
	}

	}

post{
	failure{
		emailext subject: "Failed:\${JOB_NAME} \${BUILD_NUMBER}",
		body: "Hi Your Build was Something went Wrong, Pls Check onece your build at \${BUILD_URL}",
		to: "srivarshithaias@gmail.com",
		from: "srivarshitharcp@gmail.com"
	}


	success{
		emailext subject: "Successfull :\${JOB_NAME} \${BUILD_NUMBER}",
		body: "Hi Your Build was Successful. Have a look for details at \${BUILD_URL}",
		to: "srivarshithaias@gmail.com",
		from: "srivarshitharcp@gmail.com"
			}
		}
}
