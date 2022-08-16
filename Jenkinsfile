pipeline {
    agent any
  
  	tools { 
        maven 'maven-3.8.1'
        jdk 'jdk8' 
    }

    stages {
        stage('Build') {
            steps {
			    dir('C:\developer\JMeter\apache-jmeter-5.5\bin'){
                bat 'jmeter -e -n -t jenkins.io.jmx -o ${WORKSPACE}\report\html -l ${WORKSPACE}\report\result.jtl'
		}
		   
            }

            post {
                
                always {	
				
               		dir('${WORKSPACE}\report\html'){
            			bat 'test.bat'
        	   		}
                	             	          
                	emailext mimeType: 'text/html', attachLog: false, attachmentsPattern: 'QmetryReport/report.7z',
                	to: 'ali_ridho@manulife.com',
                	body: '${FILE,path="templateBody.html"}',
                	subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
                  
                  	fileOperations([fileDeleteOperation(excludes: '', includes: 'QmetryReport/report.7z')])
          
                }
            }
        }
    }
}