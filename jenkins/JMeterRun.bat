@echo off

set jmeter=C:\developer\JMeter\apache-jmeter-5.5\bin\jmeter.bat

"%jmeter%" -e -n -t .\jenkins\jenkins.io.jmx -o html -l result.jtl
