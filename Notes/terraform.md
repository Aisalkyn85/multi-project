Introduction to Terraform

What is Terraform?
Terraform is an open-source Infrastructure as Code (IaC) tool created by HashiCorp. It allows you to define and provision infrastructure using a high-level configuration language called HashiCorp Configuration Language (HCL), or optionally JSON. Terraform manages existing and popular service providers as well as custom in-house solutions.

Key Concepts:
	• Infrastructure as Code (IaC): Terraform allows you to manage your infrastructure with configuration files rather than through a graphical user interface. This makes infrastructure changes more consistent and repeatable.
	• Declarative Language: Terraform uses a declarative language. You define what you want your infrastructure to look like, and Terraform figures out how to achieve that state.

Key Benefits:
	• Version Control: Infrastructure definitions can be versioned just like application code, allowing for easy tracking of changes.
	• Automation: Infrastructure can be automatically provisioned and managed, reducing manual errors and speeding up deployment.
	• Consistency: Ensures that infrastructure is consistent across different environments (development, testing, production).

Use Cases:
	• Multi-Cloud Deployments: Managing resources across multiple cloud providers (AWS, Azure, GCP) using a single configuration language.
	• Environment Replication: Quickly replicating environments for testing or development purposes.
	• Disaster Recovery: Automating the setup of backup environments in case of failures.


Example1:

	provider "aws" {
  region = "us-west-2"
}
	resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

In this example:
	• The provider block specifies the cloud provider (AWS in this case) and the region.
	• The resource block defines an AWS EC2 instance with a specific Amazon Machine Image (AMI) and instance type.


Use Cases:
	1. Provisioning Cloud Infrastructure:
		○ Easily provision and manage infrastructure on cloud platforms like AWS, Azure, GCP, etc.
	2. Multi-cloud Deployments:
		○ Manage resources across multiple cloud providers in a single configuration.
	3. Version Control for Infrastructure:
		○ Track infrastructure changes in source control, just like application code.

Configuration Files and Syntax (HCL)
Terraform uses configuration files written in HashiCorp Configuration Language (HCL) or JSON to define infrastructure. These files typically have a .tf extension.

Key Components:
	1. Providers: Providers are responsible for understanding API interactions and exposing resources. Each provider offers a set of resources and/or data sources.
	Providers in Terraform are plugins that provide the infrastructure resources for a specific service. They define the resources and data sources available for that service. Each provider has its own set of resources, data sources, and configuration options.
	
		provider "aws" {
		  region = "us-west-2"
		  access_key = "your_access_key"
		  secret_key = "your_secret_key"
		}
	
	2. Resources: Resources are the most important element in the Terraform language. Each resource block describes one or more infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records.
	In Terraform, a resource block is used to define and manage individual infrastructure components. Each resource block specifies a particular type of resource, its configuration, and any dependencies it may have.
	
		resource "aws_instance" "example" {
		  ami           = "ami-0c55b159cbfafe1f0"
		  instance_type = "t2.micro"
		  tags = {
		    Name = "ExampleInstance"
		  }
		}
	
	3. Variables: Variables allow you to parameterize your Terraform configurations. This makes your configurations more flexible and reusable.
	Variables in Terraform are placeholders that can be used to dynamically configure resources. They enable you to abstract values that may change depending on the environment or user input.
	
	Variable Declaration:
	
		variable "instance_type" {
		  description = "The type of instance to create"
		  type        = string
		  default     = "t2.micro"
		}
		
	Using Variables in Resources:
	
		resource "aws_instance" "example" {
		  ami           = "ami-0c55b159cbfafe1f0"
		  instance_type = var.instance_type
		}
	
	
	4. Outputs: Outputs are a way to display useful information after your resources are created. They can also be used to pass information between different Terraform configurations.
	Outputs are declared in an output block and can be used to extract information from your Terraform configuration and display it upon completion of the terraform apply command. They can also be used as input for other configurations by referencing them in remote states.
	
		output "instance_id" {
		  description = "The ID of the EC2 instance"
		  value       = aws_instance.example.id
		}
		
		output "instance_public_ip" {
		  description = "The public IP address of the EC2 instance"
		  value       = aws_instance.example.public_ip
		}
		
		output "instance_tags" {
		  description = "The tags of the EC2 instance"
		  value       = aws_instance.example.tags
		}
		
	

Example Configuration File:

	provider "aws" {
  region = "us-west-2"
}
	resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
	variable "instance_count" {
  default = 1
}
	output "instance_id" {
  value = aws_instance.example.id
}

In this example:
	• The provider block specifies the AWS provider and the region.
	• The resource block defines an AWS EC2 instance.
	• The variable block defines a variable named instance_count with a default value of 1.
	• The output block specifies that the instance ID of the created instance should be outputted.

Commands:
	1. terraform init:
		○ Initializes a Terraform configuration. It downloads the necessary provider plugins.
	2. terraform plan:
		○ Creates an execution plan, showing what actions Terraform will take to achieve the desired state.
	3. terraform apply:
		○ Applies the changes required to reach the desired state of the configuration.
		
		The terraform apply command is one of the core commands in Terraform, responsible for executing the actions proposed in a Terraform plan. It creates, updates, or destroys infrastructure resources based on the configuration files and the current state of your environment.
		
	How to Use terraform apply:
		1. Run the Command:
		After you have created a Terraform configuration and run terraform plan to review the proposed changes, you can execute:
		
			terraform apply
		
		This command will prompt you to confirm the proposed changes before proceeding.
		
		2. Automatic Approval:
		If you want to bypass the confirmation step, you can use the -auto-approve flag:
		
			terraform apply -auto-approve
		
		This will apply the changes without asking for user confirmation.
		
		3. Using a Plan File:
		If you have generated a plan file using terraform plan -out=myplan.tfplan, you can apply that specific plan by running:
		
			terraform apply myplan.tfplan
		
		This allows you to apply a predefined set of changes without generating a new plan.
		
	4. terraform destroy:
		○ Destroys the infrastructure managed by your Terraform configuration.

Terraform Variables
Variables in Terraform allow you to parameterize your configurations. This makes your Terraform code more flexible, reusable, and easier to manage across different environments.

What are Variables?
Variables in Terraform are placeholders that can be used to dynamically configure resources. They enable you to abstract values that may change depending on the environment or user input.

Key Concepts:

	1. Variable Declaration: Variables are declared in a variable block with a name and optional attributes such as type, default value, and description.
	2. Variable Types:
		○ string: A sequence of characters.
		○ number: A numeric value.
		○ bool: A boolean value (true or false).
		○ list: A list of values.
		○ map: A map of key-value pairs.
		○ object: A complex structure that includes multiple attributes.
	3. Variable Usage: Variables are referenced in resource configurations using ${var.variable_name}.
	4. Variable Assignment: Variables can be assigned values through various methods:
		○ Command line arguments
		○ Environment variables
		○ Variable files (.tfvars)
		○ Default values in the variable block
		
Example:

Variable Declaration:

	variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}
	
In this example:
	• The variable block declares a variable named instance_type.
	• The description provides a brief explanation of the variable.
	• The type specifies the data type (string in this case).
	• The default value is set to t2.micro.

Using Variables in Resources:

	resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
}

In this example:
	• The instance_type attribute of the aws_instance resource is set using the instance_type variable.

Assigning Variable Values:

Command Line:
	terraform apply -var="instance_type=t2.small"

Environment Variable:
	export TF_VAR_instance_type=t2.small
terraform apply

Variable File (terraform.tfvars):
	instance_type = "t2.small"
	To apply:
	terraform apply -var-file="terraform.tfvars"

Use Cases:
	1. Environment Configuration:
		○ Use variables to configure different environments (e.g., development, staging, production) without changing the main configuration.
	2. Parameterizing Resource Attributes:
		○ Abstract values that might change, such as instance types, region names, and VPC IDs.
	3. Reusing Configurations:
		○ Write reusable Terraform modules and configurations that can be customized with different variable values.

Example:

Variables File (variables.tf):

	variable "region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-west-2"
}
	variable "instance_count" {
  description = "The number of instances to create"
  type        = number
  default     = 1
}

Main Configuration File (main.tf):

	provider "aws" {
  region = var.region
}
	resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleInstance"
  }
}

In this example:
	• The variables.tf file declares two variables: region and instance_count.
	• The main.tf file uses these variables to configure the AWS provider and the number of instances to create.

Terraform State
Terraform state is a critical concept in Terraform that keeps track of the infrastructure managed by Terraform. The state file acts as a source of truth for the resources Terraform manages.

What is Terraform State?
Terraform state is a file that Terraform uses to map real-world resources to your configuration, keep track of metadata, and improve performance for large infrastructures. It is essential for tracking resource changes and ensuring that the desired state specified in the configuration matches the actual state of the resources.

Key Concepts:
	1. State File: The state file (terraform.tfstate) is a JSON file that Terraform generates and maintains. It stores information about the resources managed by Terraform.
	2. Remote State: For collaborative environments and larger projects, storing the state file locally is not practical. Remote state allows you to store the state file in a remote location such as AWS S3, GCS, Azure Blob Storage, or Terraform Cloud.
	3. State Locking: When using remote state, Terraform supports state locking to prevent concurrent modifications of the state file.
	4. State Management Commands: Terraform provides several commands to manage state, including terraform state, terraform state list, terraform state show, terraform state mv, terraform state rm, and terraform state pull.

Example:
Initializing and Applying Configuration:

	provider "aws" {
  region = "us-west-2"
}
	resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
	
After running terraform apply, Terraform generates a terraform.tfstate file.

In this example:
	• The terraform.tfstate file contains information about the AWS EC2 instance managed by Terraform, including its type, name, provider, and attributes.

Remote State Configuration:
Example with AWS S3:

	terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "path/to/my/key"
    region = "us-west-2"
  }
}
To initialize the backend:

terraform init
In this example:
	• The terraform block configures Terraform to use an S3 bucket for remote state storage.
	• The terraform init command initializes the backend and migrates the state file to S3.

Use Cases:
	1. Collaboration:
		○ Store the state file in a remote location to enable multiple team members to work on the same infrastructure.
	2. Consistency:
		○ Ensure that the state file is the single source of truth for the infrastructure managed by Terraform.
	3. State Locking:
		○ Use state locking to prevent concurrent modifications and ensure the integrity of the state file.

State Management Commands:
	1. Listing Resources in State:

terraform state list

Lists all resources in the state file.
	
	2. Showing Resource Details:

terraform state show aws_instance.example

Displays detailed information about a specific resource in the state file.
	
	3. Moving Resources:

terraform state mv aws_instance.example aws_instance.new_example

Moves a resource to a new name within the state file.
	
	4. Removing Resources:

terraform state rm aws_instance.example

Removes a resource from the state file.


Example 2:
Let's modify the Terraform configuration to use a variables.tf file for better parameterization.

# variables.tf
variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the EC2 instance will be created."
}

variable "instance_ami" {
  default     = "ami-0c55b159cbfafe1f0"
  description = "The AMI ID for the EC2 instance."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "The type of EC2 instance."
}

variable "instance_name" {
  default     = "example-instance"
  description = "The name tag for the EC2 instance."
}

Now, let's update the main.tf file to use these variables:

# main.tf
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

Now, you can easily customize your EC2 instance by changing the values in the variables.tf file.

Now, you can run Terraform commands from the root directory:
terraform init
terraform apply
terraform destroy


Example 3:
Let's add an output.tf file to display information about the created EC2 instance.
|-- main.tf
|-- variables.tf
|-- output.tf

# output.tf
output "instance_id" {
  value = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

Now, you can see the instance ID and public IP address as outputs. Next, let's update the main.tf file to reference these outputs:
# main.tf
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

terraform output
This will show you the values of the specified outputs.

Now, you can run Terraform commands from the root directory:
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy


Terraform Modules
Modules in Terraform are a way to organize and reuse configurations. They allow you to encapsulate and share parts of your Terraform code, making it more manageable and reusable.

What are Modules?
A module in Terraform is a container for multiple resources that are used together. A module can be used to group related resources and configurations, which can then be reused across different projects or environments.

Key Concepts:
	1. Root Module: The root module is the top-level module of your configuration, typically the directory where your main Terraform configuration files are located.
	2. Child Module: A child module is any module that is called by another module. Child modules are used to encapsulate reusable configurations.
	3. Module Blocks: A module block is used to call a child module from the root module or another module.
	4. Inputs and Outputs: Modules can accept input variables to customize their behavior and define output values to pass information back to the calling module.
	
Example:
Directory Structure:

	my-terraform-project/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    └── ec2-instance/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
Child Module (modules/ec2-instance/main.tf):

	resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
	output "instance_id" {
  value = aws_instance.example.id
}
	
Child Module Variables (modules/ec2-instance/variables.tf):

	variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}
	variable "instance_type" {
  description = "The type of instance to create"
  type        = string
}
	variable "instance_name" {
  description = "The name of the instance"
  type        = string
}
	
Root Module (main.tf):

	provider "aws" {
  region = "us-west-2"
}
	module "ec2_instance" {
  source        = "./modules/ec2-instance"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  instance_name = "ExampleInstance"
}
	output "instance_id" {
  value = module.ec2_instance.instance_id
}
In this example:
	• The root module calls the ec2-instance module located in the modules/ec2-instance directory.
	• The ec2-instance module defines an EC2 instance resource and accepts input variables for the AMI, instance type, and instance name.
	• The root module provides values for these variables and outputs the instance ID.

Benefits of Using Modules:
	1. Reusability:
		○ Write a module once and reuse it across multiple configurations and projects.
	2. Organization:
		○ Break down complex configurations into smaller, more manageable modules.
	3. Consistency:
		○ Ensure consistent configurations across different environments and teams by using standardized modules.

Use Cases:
	1. Creating Infrastructure Components:
		○ Use modules to create and manage infrastructure components such as VPCs, subnets, security groups, and instances.
	2. Environment-Specific Configurations:
		○ Create modules for different environments (e.g., development, staging, production) with customized configurations.
	3. Third-Party Modules:
		○ Use modules from the Terraform Registry to leverage community-contributed configurations.

Using Modules from the Terraform Registry:
You can use pre-built modules from the Terraform Registry by specifying the module source in the module block.

	module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"
  
  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs  = ["us-west-2a", "us-west-2b"]
  ...
}
In this example:
	• The vpc module is sourced from the Terraform Registry (terraform-aws-modules/vpc/aws).
	• The module is configured with custom inputs such as name, cidr, and azs.


Example 4:
let's create a directory structure with a global directory to store the global variables. The variables.tf file inside the global directory will contain variables that are common across different Terraform modules.

terraform-ec2-example/
|-- global/
|   |-- variables.tf
|-- main.tf
|-- variables.tf
|-- output.tf
Now, let's define the global variables in global/variables.tf:

# global/variables.tf
variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the EC2 instance will be created."
}

variable "instance_name" {
  default     = "example-instance"
  description = "The name tag for the EC2 instance."
}

Next, let's update the root variables.tf file to include the global variables and add specific variables for the EC2 instance:
# variables.tf
# Include global variables
module "global" {
  source = "./global"
}

# Specific variables for EC2 instance
variable "instance_ami" {
  default     = "ami-0c55b159cbfafe1f0"
  description = "The AMI ID for the EC2 instance."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "The type of EC2 instance."
}

Now, update the main.tf file to use these variables:
# main.tf
provider "aws" {
  region = module.global.aws_region
}

resource "aws_instance" "example" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = {
    Name = module.global.instance_name
  }
}

Finally, let's add the output.tf file as before:
# output.tf
output "instance_id" {
  value = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

Now, you can run Terraform commands from the root directory:
terraform init
terraform apply
terraform output
terraform destroy

This structure makes it easier to organize and manage your Terraform configurations, separating global variables from specific module variables.


Example 5:
Let's further organize the Terraform configuration by creating an environment directory with a dev subdirectory. This structure allows you to have different configurations for different environments.

terraform-ec2-example/
|-- global/
|   |-- variables.tf
|-- environment/
|   |-- dev/
|       |-- main.tf
|       |-- variables.tfvars
|-- main.tf
|-- variables.tf
|-- output.tf

Now, create the environment/dev/main.tf file for the specific configuration of the dev environment:

# environment/dev/main.tf
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = {
    Name = module.global.instance_name
  }
}

In the environment/dev directory, you can also create a variables.tfvars file to specify the values for the variables:

# environment/dev/variables.tfvars
aws_region     = "us-west-2"  # Change this to your desired dev region
instance_ami   = "ami-0123456789abcdef0"  # Change this to your dev AMI
instance_type  = "t2.small"   # Change this to your dev instance type
instance_name  = "dev-instance"  # Change this to your dev instance name
Now, from the root directory, initialize and apply the configuration for the dev environment:

cd environment/dev
terraform init
terraform apply -var-file=variables.tfvars
This approach allows you to have separate configurations for different environments while reusing the common global variables. You can repeat this structure for other environments by creating additional subdirectories under the environment directory.

Now, you can run Terraform commands from the root directory:
terraform init
terraform apply
terraform output
terraform destroy


Example 6:
Let's create a VPC directly in the main Terraform configuration. Here's an example:

main.tf: Set up the VPC in the main Terraform configuration.
# main.tf

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.instance_name
  }
}

resource "aws_subnet" "example" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"  # Change this to your desired availability zone

  map_public_ip_on_launch = true

  tags = {
    Name = "example-subnet"
  }
}

variables.tf: Define global variables.
# variables.tf

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the infrastructure will be created."
}

variable "instance_name" {
  default     = "example-instance"
  description = "The name tag for the resources."
}

variable "instance_ami" {
  default     = "ami-0c55b159cbfafe1f0"
  description = "The AMI ID for the EC2 instance."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "The type of EC2 instance."
}

output.tf: Display VPC information as output.
# output.tf

output "vpc_id" {
  value = aws_vpc.example.id
}

output "subnet_id" {
  value = aws_subnet.example.id
}

Now, navigate to the root directory and run the Terraform commands:

# Run these commands from the root directory

# Initialize the Terraform configurations
terraform init

# Apply the VPC configuration
terraform apply
This will create a VPC and subnet according to the specified configurations.


Example 7:
Let's create a modularized Terraform configuration to create a VPC, a security group, and attach that security group to an existing EC2 instance.

terraform-ec2-example/
|-- modules/
|   |-- vpc/
|       |-- main.tf
|-- environment/
|   |-- dev/
|       |-- main.tf
|       |-- variables.tfvars
|-- main.tf
|-- variables.tf
|-- output.tf
Now, let's create the Terraform configurations:


modules/vpc/main.tf: Create a VPC and public subnet.

# modules/vpc/main.tf
variable "aws_region" {}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"  # Change this to your desired availability zone

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}




environment/dev/main.tf: Create a security group and attach it to an EC2 instance.

# environment/dev/main.tf
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source      = "../modules/vpc"
  aws_region  = var.aws_region
}

resource "aws_security_group" "web_sg" {
  vpc_id = module.vpc.aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "web_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.aws_subnet.public.id
  key_name      = var.key_pair_name
  security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web-instance"
  }
}


main.tf: Set global variables.

# main.tf
module "vpc" {
  source      = "./modules/vpc"
  aws_region  = var.aws_region
}

variable "instance_ami" {
  default     = "ami-0c55b159cbfafe1f0"  # Change this to your desired AMI
}

variable "instance_type" {
  default     = "t2.micro"  # Change this to your desired instance type
}

variable "key_pair_name" {
  default     = "your-key-pair-name"  # Replace with a desired key pair name
}

variable "aws_region" {
  default     = "us-east-1"  # Change this to your desired AWS region
}



variables.tf: Define global variables.

# variables.tf
variable "aws_region" {
  description = "The AWS region where the infrastructure will be created."
}

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance."
}

variable "instance_type" {
  description = "The type of EC2 instance."
}

variable "key_pair_name" {
  description = "The name of the key pair for EC2 instances."
}






# output.tf
output "vpc_id" {
  value = module.vpc.aws_vpc.main.id
}

output "subnet_id" {
  value = module.vpc.aws_subnet.public.id
}

output "instance_id" {
  value = aws_instance.web_instance.id
}

output "public_ip" {
  value = aws_instance.web_instance.public_ip
}


This configuration creates a modularized setup with a VPC module and a separate environment module for creating the security group and EC2 instance.

# Initialize the Terraform configurations
terraform init

# Apply the VPC and security group configurations
terraform apply

# Apply the dev environment configuration
cd environment/dev
terraform apply -var-file=variables.tfvars
This modular structure makes it easier to organize and manage your Terraform configurations by separating concerns into distinct modules.

Terraform destroy


Example 7:
Let's create 

aws ec2 create-key-pair --key-name your-key-pair-name --query 'KeyMaterial' --output text > your-key-pair-name.pem

# main.tf

provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

resource "aws_key_pair" "example" {
  key_name = "your-key-pair-name"  # Replace with a desired key pair name

  public_key = file("path/to/your/public-key-file.pub")  # Replace with the path to your public key file
}






Organizing Terraform code with a clear and consistent directory structure helps maintainability and collaboration. The recommended directory structure for a Terraform project:

Terraform-Project/
|-- modules/
|   |-- networking/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |   |-- outputs.tf
|   |-- compute/
|       |-- main.tf
|       |-- variables.tf
|       |-- outputs.tf
|-- environments/
|   |-- dev/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |   |-- outputs.tf
|   |-- prod/
|       |-- main.tf
|       |-- variables.tf
|       |-- outputs.tf
|-- global/
|   |-- main.tf
|   |-- variables.tf
|   |-- outputs.tf
|-- terraform.tfvars
|-- backend.tf
|-- variables.tf
|-- outputs.tf
|-- main.tf


modules/: This directory contains reusable Terraform modules. Modules are a way to organize and package Terraform configurations into reusable components.

environments/: Each environment (e.g., dev, prod) has its own directory. This is where you define the specifics for that environment, such as which modules to use and what values to set for variables.

global/: This directory contains configurations that are common across all environments. It might include resources that are shared among different environments.

terraform.tfvars: This file contains variable values for your Terraform configurations. It can be environment-specific or shared among multiple environments.

backend.tf: This file specifies the backend configuration for storing Terraform state. It can be an S3 bucket, Azure Storage Account, etc.

variables.tf: This file contains variable declarations. It's a good practice to define all your variables in a centralized location.

outputs.tf: This file contains output declarations. Declare the values that should be visible after running Terraform apply.

main.tf: This is the entry point for your Terraform configuration. It might include provider configuration, locals, and references to modules.

This structure provides a clear separation of concerns, making it easier to manage and scale your Terraform codebase.









modules/vpc/main.tf: Create a VPC and public subnet.

# modules/vpc/main.tf
variable "aws_region" {}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"  # Change this to your desired availability zone

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}




environment/dev/main.tf: Create a security group and attach it to an EC2 instance.

# environment/dev/main.tf
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source      = "../modules/vpc"
  aws_region  = var.aws_region
}

resource "aws_security_group" "web_sg" {
  vpc_id = module.vpc.aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "web_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.aws_subnet.public.id
  key_name      = var.key_pair_name
  security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web-instance"
  }
}


main.tf: Set global variables.

# main.tf
module "vpc" {
  source      = "./modules/vpc"
  aws_region  = var.aws_region
}

variable "instance_ami" {
  default     = "ami-0c55b159cbfafe1f0"  # Change this to your desired AMI
}

variable "instance_type" {
  default     = "t2.micro"  # Change this to your desired instance type
}

variable "key_pair_name" {
  default     = "your-key-pair-name"  # Replace with a desired key pair name
}

variable "aws_region" {
  default     = "us-east-1"  # Change this to your desired AWS region
}



variables.tf: Define global variables.

# variables.tf
variable "aws_region" {
  description = "The AWS region where the infrastructure will be created."
}

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance."
}

variable "instance_type" {
  description = "The type of EC2 instance."
}

variable "key_pair_name" {
  description = "The name of the key pair for EC2 instances."
}






# output.tf
output "vpc_id" {
  value = module.vpc.aws_vpc.main.id
}

output "subnet_id" {
  value = module.vpc.aws_subnet.public.id
}

output "instance_id" {
  value = aws_instance.web_instance.id
}

output "public_ip" {
  value = aws_instance.web_instance.public_ip
}


This configuration creates a modularized setup with a VPC module and a separate environment module for creating the security group and EC2 instance.


resource "aws_route53_zone" "example_zone" {
  name = "example.com" 
}
