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
        choice(name: 'action', choices: 'Create\nDelete', description: 'Choose Create/Destroy')
        string(name: 'DockerHubUser', description: "DockerHub UserName", defaultValue: 'nirdeshkumar02')
        string(name: 'ImageName', description: "Give a name to your docker image", defaultValue: 'maven_app')
        string(name: 'ImageTag', description: "Give a tag to your docker image", defaultValue: 'v1')
    }

    stages{
        stage('Git Checkout'){
            //  When action is create then perform all operation otherwise no operation should be performed
            when {expression { params.action == 'Create'}} 
            steps{
                gitCheckout(
                    branch: "jenkins-shared-lib-pipeline",
                    url: "https://github.com/nirdeshkumar02/Maven-Application-CICD.git"
                )
            }
        }

        stage('Maven Unit Test'){
            when {expression { params.action == 'Create'}} 
            steps{
                script{
                    mvnTest()
                }
            }
        }

        stage('Maven Integration Test'){
            when {expression { params.action == 'Create'}} 
            steps{
                script{
                    mvnIntegration()
                }
            }
        }

        stage('SAST Testing - SonarQube'){
            when {expression { params.action == 'Create'}} 
            steps{
                script{
                    def SonarCreds = 'sonar-creds'
                    sonarScanner(SonarCreds)
                }
            }
        }

        stage('Quality Gate Status Checking - SonarQube'){
            when {expression { params.action == 'Create'}} 
            steps{
                script{
                    def SonarCreds = 'sonar-creds'
                    sonarQualityGate(SonarCreds)
                }
            }
        }

        stage('Building Maven Package: Maven'){
            when {expression { params.action == 'Create'}} 
            steps{
                script{
                    mvnBuild()
                }
            }
        }

        stage('Build DockerHub Image: Docker'){
            when {expression { params.action == 'Create'}} 
            steps{
                script{ 
                    dockerImageBuild("${params.DockerHubUser}", "${params.ImageName}", "${params.ImageTag}")
                }
            }
        }

        stage('Scanning DockerHub Image: Trivy'){
            when {expression { params.action == 'Create'}} 
            steps{
                script{ 
                    dockerImageScan("${params.DockerHubUser}", "${params.ImageName}")
                }
            }
        }

        stage('DockerHub Image Push: Docker'){
            when {expression { params.action == 'Create'}} 
            steps{
                script{ 
                    def DockerCreds = 'docker-creds'
                    dockerImagePush(DockerCreds, "${params.DockerHubUser}", "${params.ImageName}", "${params.ImageTag}")
                }
            }
        }
        stage('DockerHub Image CleanUP: Docker'){
            when {expression { params.action == 'Create'}} 
            steps{
                script{ 
                    dockerImageCleanup("${params.DockerHubUser}", "${params.ImageName}", "${params.ImageTag}")
                }
            }
        }
    }
}