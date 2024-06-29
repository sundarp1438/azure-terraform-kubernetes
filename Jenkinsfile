pipeline {
    
    agent any
    tools{
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "TERRAFORM_HOME"
    }
  environment {
        
        PATH = "$PATH:/usr/local/bin"
        
    }
    
    stages {
      stage('Workspace Cleaning'){
            steps{
                cleanWs()
            }
        }
        stage('Git Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/sundarp1438/azure-terraform-kubernetes.git'
            }
        }
        stage('Terraform init'){
            steps{
              withCredentials([azureServicePrincipal(
                    credentialsId: 'azure-credentials',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
              sh "export TF_VAR_region=${env.region} && export TF_VAR_environment=${env.environment} && export TF_VAR_min_node_count=${env.min_node_count} && export TF_VAR_max_node_count=${env.max_node_count} && export TF_VAR_node_vm_size=${env.node_vm_size} && terraform init"
              }
            }
        }
        stage('Terraform plan'){
            steps{
              withCredentials([azureServicePrincipal(
                    credentialsId: 'azure-credentials',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                      sh "export TF_VAR_region=${env.region} && export TF_VAR_environment=${env.environment} && export TF_VAR_min_node_count=${env.min_node_count} && export TF_VAR_max_node_count=${env.max_node_count} && export TF_VAR_node_vm_size=${env.node_vm_size} && terraform plan -var client_id=$ARM_CLIENT_ID -var client_secret=$ARM_CLIENT_SECRET -var subscription_id=$ARM_SUBSCRIPTION_ID -var tenant_id=$ARM_TENANT_ID"
                } 
            }
        }
        stage('Approval') {
            steps {
                script {
                    def userInput = input(id: 'Confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'Confirm'] ])
                }
            }
        }
        stage('Terraform apply'){
            steps{
              withCredentials([azureServicePrincipal(
                    credentialsId: 'azure-credentials',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) { 
                      sh "export TF_VAR_region=${env.region} && export TF_VAR_environment=${env.environment} && export TF_VAR_min_node_count=${env.min_node_count} && export TF_VAR_max_node_count=${env.max_node_count} && export TF_VAR_node_vm_size=${env.node_vm_size} && terraform plan -var client_id=$ARM_CLIENT_ID -var client_secret=$ARM_CLIENT_SECRET -var subscription_id=$ARM_SUBSCRIPTION_ID -var tenant_id=$ARM_TENANT_ID"
                  }
            }
        }
    }
  }
