@Library('maven-app-shared-library') _

pipeline{
    agent any 

/* This way you can run docker as agent or any other jenkins agent:
    agent{
        // Install Docker and Docker Pipeline Plugin to verify docker as agent
        docker {
            image 'maven:3.9.0-eclipse-temurin-11' 
            args '-v /root/.m2:/root/.m2'
        }
    }
*/
    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose Create/Destroy')
    }

    stages{
        stage('Git Checkout'){
            //  When action is create then perform all operation otherwise no operation should be performed
            when {expression { params.action == 'create'}} 
            steps{
                gitCheckout(
                    branch: "jenkins-shared-lib-pipeline",
                    url: "https://github.com/nirdeshkumar02/Maven-Application-CICD.git"
                )
            }
        }

        stage('Maven Unit Test'){
            when {expression { params.action == 'create'}} 
            steps{
                script{
                    mvnTest()
                }
            }
        }

        stage('Maven Integration Test'){
            when {expression { params.action == 'create'}} 
            steps{
                script{
                    mvnIntegration()
                }
            }
        }

        stage('SAST Testing - SonarQube'){
            when {expression { params.action == 'create'}} 
            steps{
                script{
                    def SonarCreds = 'sonar-creds'
                    sonarScanner(SonarCreds)
                }
            }
        }
    }
}