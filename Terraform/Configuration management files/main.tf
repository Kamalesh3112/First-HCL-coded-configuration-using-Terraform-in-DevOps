#Learning basic HCL
#This is a terraform configuration file

/*
This is a
multi line comment*/

#Block example
variable "block1-type" {
    default = "value1"
}

variable "block2_type" {
    default = "value2"
}

variable "block3_type" {
    default = "value3"
}

#Sample AWS terraform configuration file
resource "aws_instance" "example" {
    ami = "ami-0c55b159cbfafe1f00"
    instance_type = "t2.micro"
    count = 3
}

#Attributes
#Key = value

#Datatypes
/*type = "string"
number = 1
boolean = true
*/

#List
#Map (Dictonary of key-value pairs)

variable "example-block-configuration-map" {
    type = map
    default = {key1 = "value1", key2 = "value2", key3 = "value3"}
}

resource "aws_instance" "name" {
  ami           = "ami-0c94855ba95c574c8"
  instance_type = "t2.micro"
}



#Condtions

variable "environment" {
    description = "Environment variable to provision the configuration file"
    type = string
    default = "development"
}

resource "aws_instance" "server" {
    instance_type = var.environment == "development" ? "t2.micro" : "t2.small"
}

#Functions
locals {
    name = "Virat Kohli"
    sports = ["Cricket", "Football"]
    talent = ["fitness","cricket","football"]
    message ="Hello ${upper(local.name)}! I know you like ${join(",", local.sports, local.talent)}"
}

#Output for above function: Hello Virat Kohli! I know you like Cricket, Football, Fitness

#Resourcedependency
#It is used to create relationship between two resources
#Implicit and Explicit dependencies

resource "aws_instance" "name" {
    vpc_security_group_ids = aws_security_group.mysg.id
}

resource "aws_security_group" "mysg" {
  #inbound rules

}


#Creating a configuration file for the local machine

resource "null_resource" "file" {
    provisioner "local-exec" {
        command = "echo 'Message: ${upper("hello world!")}' > challenge.txt"
    }
}