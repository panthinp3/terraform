pipeline {
    agent any

    stages {
        stage('git-checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/panthinp3/terraform.git']]])
            }
        }
        
        
        
        stage('init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'f8278818-31b1-496b-bd27-7a27f594161c', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                 
                sh 'cd main; terraform init'
        }
                
            }
        }
        
        
        stage('plan') {
            
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'f8278818-31b1-496b-bd27-7a27f594161c', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            
                 sh 'cd main; terraform plan'
        }
                
            }
        }
        
        
        stage('apply') {
            
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'f8278818-31b1-496b-bd27-7a27f594161c', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                
                sh 'cd main; terraform apply -auto-approve=true'
        }
                
            }
        }

        /*
        stage('destroy') {
            
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'f8278818-31b1-496b-bd27-7a27f594161c', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                // some block
                sh 'cd main; terraform destroy -auto-approve=true'
        }
                
            }
        }
        */

    }
}
