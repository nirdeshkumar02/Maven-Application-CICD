pipeline{
    
    agent any

    stages{
        stage("Git Checkout"){
            steps{
                script{
                    git branch: 'master' 'https://github.com/nirdeshkumar02/Maven-Application-CICD.git'
                }
            }
        }
    }
}