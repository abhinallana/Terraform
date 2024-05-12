resource "local_file" "example_1"{
	content = "Hello ! Terraform Basics"
	filename= "/home/abhi/devops/terraform/hello_tf/Example.txt"
}

resource "local_file" "demo-dir"{
	content = "$touch demo.txt"
	filename ="mkdir /home/abhi/Desktop/demofile"
}

variable "message"{
	default="Hi!! from Terraform. Created a demo file in it."
}

output "op_message"{
	value=var.message
}
