pipeline {
    agent any

    parameters {
        string(name: 'NAME', defaultValue: 'John Doe', description: 'Enter your name')
        string(name: 'AGE', defaultValue: '30', description: 'Enter your age')
    }

    stages {
        stage('Calculate Year of Birth') {
            steps {
                script {
                    // Convert AGE from String to Integer
                    def ageInt = params.AGE.toInteger()
                    def currentYear = new Date().format("yyyy").toInteger()
                    def birthYear = currentYear - ageInt

                    echo "Hello ${params.NAME}!"
                    echo "Based on your age of ${ageInt}, your year of birth is: ${birthYear}"
                }
            }
        }
    }
}
