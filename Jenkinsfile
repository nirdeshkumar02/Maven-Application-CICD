@Library('maven-app-shared-library') _

pipeline{
    
    agent any

    stages{
        stage("Git Checkout"){
            steps{
                script{
                    gitCheckout(
                        branch: "jenkins-shared-lib-pipeline"
                        url: "https://github.com/nirdeshkumar02/Maven-Application-CICD.git"
                    )
                }
            }
        }
    }
}