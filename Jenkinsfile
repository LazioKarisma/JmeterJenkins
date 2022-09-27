pipeline {
 agent any
  
  	tools { 
        maven 'maven-3.8.1'
        jdk 'jdk8' 
    }
	
	
    stages {
	 stage('Build') {
	     steps{
	          	fileOperations([fileDeleteOperation(excludes: '', includes: 'result.jtl')])
 	            fileOperations([folderDeleteOperation('html')])

	          
	         git url: 'https://github.com/LazioKarisma/JmeterJenkins.git', branch: 'master'
	         bat "${WORKSPACE}/jenkins/JMeterRun.bat"
	         
	         fileOperations([fileCopyOperation(excludes: '', flattenFiles: false, includes: '7zip.bat', renameFiles: false, sourceCaptureExpression: '', targetLocation: 'html', targetNameExpression: '')])
             dir('html'){
             	bat '7zip.bat'
        	 }  
				
		 }
		
			post {
                
                success {
				
				echo 'sucess'
			          	          
                	emailext mimeType: 'text/html', attachLog: false, attachmentsPattern: 'html/report.7z',
                	to: 'lazio_karisma@manulife.com',
                	body: 'Hi Pak Ali ,  Jmeter report terlampir --> password : Manulife',
                	subject: "Jenkins Build Jmeter Pipeline is ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
                  
                  //	fileOperations([fileDeleteOperation(excludes: '', includes: 'C:/developer/JMeter/reports/html/report.7z')])
                }
            }		
		 
	 }
	}
}
