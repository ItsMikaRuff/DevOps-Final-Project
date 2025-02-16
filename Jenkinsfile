pipeline {
    agent any

    parameters {
        string(name: 'NAME', defaultValue: 'John Doe', description: 'Enter your name')
        string(name: 'AGE', defaultValue: '30', description: 'Enter your age')
    }

    stages {
        stage('Process User Input') {
            steps {
                script {
                    def scriptPath = 'process_user_input.groovy'
                    def outputMessage = load(scriptPath).processUserInput(params.NAME, params.AGE)

                    writeFile file: 'output.html', text: """
                        <html>
                        <head><title>Jenkins Output</title></head>
                        <body>
                        ${outputMessage}
                        </body>
                        </html>
                    """
                }
            }
        }
    }

    post {
        always {
            publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: '',
                reportFiles: 'output.html',
                reportName: 'User Data Output'
            ])
        }
    }
}
