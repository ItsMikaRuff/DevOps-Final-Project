def processUserInput(String name, String age) {
    name = name.trim()
    age = age.trim()

    def currentYear = new Date().format("yyyy").toInteger()
    def outputMessage = ""

    if (!(name ==~ /^[A-Za-z\s]+$/)) {
        outputMessage = "<h2 style='color:red;'>Invalid Input: Name must contain only letters and spaces.</h2>"
        echo "Invalid name input!"
    } else if (!age.isInteger()) {
        outputMessage = "<h2 style='color:red;'>Invalid Input: Age must be a valid number.</h2>"
        echo "Invalid age input!"
    } else {
        def ageInt = age.toInteger()
        if (ageInt > 0 && ageInt < 150) {
            def birthYear = currentYear - ageInt
            outputMessage = "<h2>Hello ${name}!</h2><p>Your estimated birth year is: <strong>${birthYear}</strong></p>"
            echo "Valid input. Calculated birth year: ${birthYear}"
        } else {
            outputMessage = "<h2 style='color:red;'>Invalid Input: Age must be a positive number less than 150.</h2>"
            echo "Invalid age input!"
        }
    }
    return outputMessage
}

return this  // מאפשר לטעון את הסקריפט ולהשתמש בפונקציה מחוץ לו
