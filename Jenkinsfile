pipeline{
    
    agent { 
        node {
            label 'worker' 
            customWorkspace '/home/ubuntu/jenkins/workspace/pipelines/'
        }
    }

    stages{
        stage("Git Checkout"){
            steps{
                script{
                    git branch: 'main' 'https://github.com/nirdeshkumar02/Maven-Application-CICD-2.git'
                }
            }
        }
    }
}