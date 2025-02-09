pipeline {
    agent any

#קליטת פרמטרים 
    parameters {
        string(name: 'NAME', defaultValue: 'John Doe', description: 'Enter your name')
        string(name: 'AGE', defaultValue: '30', description: 'Enter your age')
    }

    stages {
        stage('Validate Input & Calculate Year of Birth') {
            steps {
                script {

                    def name = params.NAME.trim()
                    def age = params.AGE.trim()
                    def currentYear = new Date().format("yyyy").toInteger()
                    def outputMessage = ""

                    # ולידציה - בדיקת שם – חייב להכיל רק אותיות ורווחים

                    def namePattern = /^[A-Za-z\s]+$/

                    if (!name.matches(namePattern)) {
                        outputMessage = "<h2 style='color:red;'>Invalid Input: Name must contain only letters and spaces.</h2>"
                        echo "Invalid name input!"
                    }

                   # ולידציה - בדיקת גיל – חייב להיות מספר שלם
                    def birthYear = 0
                    
                    if (age.isInteger()) {
                        def ageInt = age.toInteger()
                        if (ageInt > 0 && ageInt < 150) {
                            birthYear = currentYear - ageInt
                            outputMessage = "<h2>Hello ${name}!</h2><p>Your estimated birth year is: <strong>${birthYear}</strong></p>"
                            echo "Valid input. Calculated birth year: ${birthYear}"
                        } else {
                            outputMessage = "<h2 style='color:red;'>Invalid Input: Age must be a positive number less than 150.</h2>"
                            echo "Invalid age input!"
                        }
                    } else {
                        outputMessage = "<h2 style='color:red;'>Invalid Input: Age must be a valid number.</h2>"
                        echo "Invalid age input!"
                    }

                   # שמירת הפלט בקובץ HTML להצגה ב-Jenkins
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
           # פרסום הקובץ ב-Jenkins HTML Publisher Plugin
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
