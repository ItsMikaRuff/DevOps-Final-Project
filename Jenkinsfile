pipeline {
    agent any

    parameters {
        string(name: 'NAME', defaultValue: 'John Doe', description: 'Enter your name')
        integer(name: 'AGE', defaultValue: 30, description: 'Enter your age (must be a positive number)')
    }
    
    stages {
        stage('Validate Input') {
            steps {
                script {
                    // בדיקת שם - האם ריק או מכיל רק רווחים
                    if (params.NAME.trim().isEmpty()) {
                        error "Invalid input: NAME cannot be empty!"
                    }

                    // בדיקת גיל - האם חיובי
                    if (params.AGE <= 0) {
                        error "Invalid input: AGE must be a positive number!"
                    }
                }
            }
        }

        stage('Calculate Year of Birth') {
            steps {
                script {
                    // קבלת השנה הנוכחית
                    def currentYear = new Date().format("yyyy").toInteger()

                    // חישוב שנת הלידה
                    def birthYear = currentYear - params.AGE

                    // הצגת התוצאות
                    echo "Hello ${params.NAME}!"
                    echo "Based on your age of ${params.AGE}, your year of birth is likely: ${birthYear}"
                }
            }
        }
    }
}
