pipeline {
 agent any
  
  	tools { 
        maven 'maven_main'
        jdk 'jdk_main' 
  }
	
	
    stages {
	 stage('Build') {
	     steps{
	        fileOperations([fileDeleteOperation(excludes: '', includes: 'result.jtl')])
 	        fileOperations([folderDeleteOperation('html')])

	        //fileOperations([folderCopyOperation(destinationFolderPath: 'html/content', sourceFolderPath: 'content')])
              	//fileOperations([folderCopyOperation(destinationFolderPath: 'html/sbadmin2-1.0.7', sourceFolderPath: 'sbadmin2-1.0.7')])
                //fileOperations([fileCopyOperation(excludes: '', flattenFiles: false, includes: 'index.html', renameFiles: false, sourceCaptureExpression: '', targetLocation: 'html', targetNameExpression: '')])
	            
		 git url: 'https://github.com/LazioKarisma/JmeterJenkins.git', branch: 'master'
	         bat "${WORKSPACE}/jenkins/JMeterRun.bat"
	       
			//fileOperations([fileCopyOperation(excludes: '', flattenFiles: false, includes: '7zip.bat', renameFiles: false, sourceCaptureExpression: '', targetLocation: 'html', targetNameExpression: '')])
			// dir('html'){
			//  bat '7zip.bat'
			//  }  
		 }
		
	   post {
		   always {
		     archive (includes: 'pkg/*.gem')
			// publish html
			    publishHTML ([
				allowMissing: false,
				alwaysLinkToLastBuild: false,
				keepAll: true,
				reportDir: 'html/',
				reportFiles: 'index.html',
				reportName: "Test Report Jmeter"
			    ])
			   
			emailext mimeType: 'text/html', attachLog: false, attachmentsPattern: 'html/index.html',
			to: 'lazio_karisma@manulife.com',
			body: '${FILE,path="templateBody.html"}',       
			subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"

                   //	fileOperations([fileDeleteOperation(excludes: '', includes: 'C:/developer/JMeter/reports/html/report.7z')])
		   }
            }			 
	 }
     }
}
