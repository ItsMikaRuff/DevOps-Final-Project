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
                    // Convert the AGE parameter (which is a string) to an integer
                    def ageInt = params.AGE.toInteger()
                    
                    // Get the current year as an integer
                    def currentYear = new Date().format("yyyy").toInteger()
                    
                    // Calculate the birth year
                    def birthYear = currentYear - ageInt
                    
                    // Print the results
                    echo "Hello ${params.NAME}!"
                    echo "Based on your age of ${ageInt}, your year of birth is likely: ${birthYear}"
                }
            }
        }
    }
}
