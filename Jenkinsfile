pipeline{
    
    agent{
        // Install Docker and Docker Pipeline Plugin to verify docker as agent
        docker {
            image 'maven:3.9.0-eclipse-temurin-11' 
            args '-v /root/.m2:/root/.m2'
        }
    }

    stages{
        stage('Git Checkout'){
            steps{
                script{
                    git branch: 'master', url: 'https://github.com/nirdeshkumar02/Maven-Application-CICD.git'
                }
            }
        }
        stage('Maven Unit Test'){
            steps{
                script{
                    sh 'mvn test'
                }
            }
        }
    }
}