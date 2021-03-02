data "aws_availability_zones" "available" {
  state = "available"
}

provider "aws" {
    default = "us-east-1"
}

provider "aws" {
    region = "us-east-1"
    alias = "us-east-1"
}

provider "aws" {
    region = "us-west-1"
    alias = "us-west-1"
}

provider "aws" {
    region = "us-east-2"
    alias = "us-east-2"
}

provider "aws" {
    region = "us-west-2"
    alias = "us-west-2"
}

provider "aws" {
    region = "af-south-1"
    alias = "af-south-1"
}

provider "aws" {
    region = "ap-east-1"
    alias = "ap-east-1"
}

provider "aws" {
    region = "ap-south-1"
    alias = "ap-south-1"
}

provider "aws" {
    region = "ap-northeast-1"
    alias = "ap-northeast-1"
}

provider "aws" {
    region = "ap-northeast-2"
    alias = "ap-northeast-2"
}

provider "aws" {
    region = "ap-southeast-1"
    alias = "ap-southeast-1"
}

provider "aws" {
    region = "ap-southeast-2"
    alias = "ap-southeast-2"
}

provider "aws" {
    region = "ca-central-1"
    alias = "ca-central-1"
}

provider "aws" {
    region = "eu-central-1"
    alias = "eu-central-1"
}

provider "aws" {
    region = "eu-west-1"
    alias = "eu-west-1"
}

provider "aws" {
    region = "eu-west-2"
    alias = "eu-west-2"
}

provider "aws" {
    region = "eu-south-1"
    alias = "eu-south-1"
}

provider "aws" {
    region = "eu-west-3"
    alias = "eu-west-3"
}

provider "aws" {
    region = "eu-north-1"
    alias = "eu-north-1"
}

provider "aws" {
    region = "me-south-1"
    alias = "me-south-1"
}

provider "aws" {
    region = "sa-east-1"
    alias = "sa-east-1"
}

data "aws_ami" "us-east-1" {
  provider = aws.us-east-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


data "aws_ami" "us-east-2" {
  provider = aws.us-east-2

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


data "aws_ami" "us-west-1" {
  provider = aws.us-west-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


data "aws_ami" "us-west-2" {
  provider = aws.us-west-2

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "af-south-1" {
  provider = aws.af-south-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


data "aws_ami" "ap-east-1" {
  provider = aws.ap-east-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ap-south-1" {
  provider = aws.ap-south-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ap-northeast-1" {
  provider = aws.ap-northeast-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ap-northeast-2" {
  provider = aws.ap-northeast-2

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ap-southeast-1" {
  provider = aws.ap-southeast-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ap-southeast-2" {
  provider = aws.ap-southeast-2

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ca-central-1" {
  provider = aws.ca-central-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "eu-central-1" {
  provider = aws.eu-central-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "eu-west-1" {
  provider = aws.eu-west-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "eu-west-2" {
  provider = aws.eu-west-2

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "eu-south-1" {
  provider = aws.eu-south-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "eu-west-3" {
  provider = aws.eu-west-3

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "eu-north-1" {
  provider = aws.eu-north-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "me-south-1" {
  provider = aws.me-south-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "sa-east-1" {
  provider = aws.sa-east-1

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_security_group" "us-east-1" {
    provider = aws.us-east-1
    name = "us-east-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "us-east-1-sg"
    }
}

resource "aws_security_group" "us-west-1" {
    provider = aws.us-west-1
    name = "us-west-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "us-west-1-sg"
    }
}

resource "aws_security_group" "us-east-2" {
    provider = aws.us-east-2
    name = "us-east-2-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "us-east-2-sg"
    }
}

resource "aws_security_group" "us-west-2" {
    provider = aws.us-west-2
    name = "us-west-2-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "us-west-2-sg"
    }
}

resource "aws_security_group" "af-south-1" {
    provider = aws.af-south-1
    name = "af-south-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "af-south-1-sg"
    }
}

resource "aws_security_group" "ap-east-1" {
    provider = aws.ap-east-1
    name = "ap-east-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "ap-east-1-sg"
    }
}

resource "aws_security_group" "ap-south-1" {
    provider = aws.ap-south-1
    name = "ap-south-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "ap-south-1-sg"
    }
}

resource "aws_security_group" "ap-northeast-1" {
    provider = aws.ap-northeast-1
    name = "ap-northeast-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "ap-northeast-1-sg"
    }
}

resource "aws_security_group" "ap-northeast-2" {
    provider = aws.ap-northeast-2
    name = "ap-northeast-2-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "ap-northeast-2-sg"
    }
}

resource "aws_security_group" "ap-southeast-1" {
    provider = aws.ap-southeast-1
    name = "ap-southeast-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "ap-southeast-1-sg"
    }
}

resource "aws_security_group" "ap-southeast-2" {
    provider = aws.ap-southeast-2
    name = "ap-southeast-2-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "ap-southeast-2-sg"
    }
}

resource "aws_security_group" "ca-central-1" {
    provider = aws.ca-central-1
    name = "ca-central-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "ca-central-1-sg"
    }
}

resource "aws_security_group" "eu-central-1" {
    provider = aws.eu-central-1
    name = "eu-central-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "eu-central-1-sg"
    }
}

resource "aws_security_group" "eu-west-1" {
    provider = aws.eu-west-1
    name = "eu-west-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "eu-west-1-sg"
    }
}

resource "aws_security_group" "eu-west-2" {
    provider = aws.eu-west-2
    name = "eu-west-2-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "eu-west-2-sg"
    }
}

resource "aws_security_group" "eu-south-1" {
    provider = aws.eu-south-1
    name = "eu-south-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "eu-south-1-sg"
    }
}

resource "aws_security_group" "eu-west-3" {
    provider = aws.eu-west-3
    name = "eu-west-3-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "eu-west-3-sg"
    }
}

resource "aws_security_group" "eu-north-1" {
    provider = aws.eu-north-1
    name = "eu-north-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "eu-north-1-sg"
    }
}

resource "aws_security_group" "me-south-1" {
    provider = aws.me-south-1
    name = "me-south-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "me-south-1-sg"
    }
}

resource "aws_security_group" "sa-east-1" {
    provider = aws.sa-east-1
    name = "sa-east-1-sg"
    description = "Allow all"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }

    tags = {
        Name = "sa-east-1-sg"
    }
}

resource "aws_eip" "mpc001" {
  provider = aws.us-east-1
  instance = aws_instance.mpc001.id
  vpc = true
}

resource "aws_instance" "mpc001" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc001"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc002" {
  provider = aws.us-east-1
  instance = aws_instance.mpc002.id
  vpc = true
}

resource "aws_instance" "mpc002" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc002"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc003" {
  provider = aws.us-east-1
  instance = aws_instance.mpc003.id
  vpc = true
}

resource "aws_instance" "mpc003" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc003"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc004" {
  provider = aws.us-east-1
  instance = aws_instance.mpc004.id
  vpc = true
}

resource "aws_instance" "mpc004" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc004"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc005" {
  provider = aws.us-east-1
  instance = aws_instance.mpc005.id
  vpc = true
}

resource "aws_instance" "mpc005" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc005"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc006" {
  provider = aws.us-east-1
  instance = aws_instance.mpc006.id
  vpc = true
}

resource "aws_instance" "mpc006" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc006"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc007" {
  provider = aws.us-east-1
  instance = aws_instance.mpc007.id
  vpc = true
}

resource "aws_instance" "mpc007" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc007"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc008" {
  provider = aws.us-east-1
  instance = aws_instance.mpc008.id
  vpc = true
}

resource "aws_instance" "mpc008" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc008"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc009" {
  provider = aws.us-east-1
  instance = aws_instance.mpc009.id
  vpc = true
}

resource "aws_instance" "mpc009" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc009"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc010" {
  provider = aws.us-east-1
  instance = aws_instance.mpc010.id
  vpc = true
}

resource "aws_instance" "mpc010" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc010"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc011" {
  provider = aws.us-east-1
  instance = aws_instance.mpc011.id
  vpc = true
}

resource "aws_instance" "mpc011" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc011"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc012" {
  provider = aws.us-east-1
  instance = aws_instance.mpc012.id
  vpc = true
}

resource "aws_instance" "mpc012" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc012"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc013" {
  provider = aws.us-east-1
  instance = aws_instance.mpc013.id
  vpc = true
}

resource "aws_instance" "mpc013" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc013"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc014" {
  provider = aws.us-east-1
  instance = aws_instance.mpc014.id
  vpc = true
}

resource "aws_instance" "mpc014" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc014"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc015" {
  provider = aws.us-east-1
  instance = aws_instance.mpc015.id
  vpc = true
}

resource "aws_instance" "mpc015" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc015"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc016" {
  provider = aws.us-east-1
  instance = aws_instance.mpc016.id
  vpc = true
}

resource "aws_instance" "mpc016" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc016"
  }

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc017" {
  provider = aws.us-west-1
  instance = aws_instance.mpc017.id
  vpc = true
}

resource "aws_instance" "mpc017" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc017"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc018" {
  provider = aws.us-west-1
  instance = aws_instance.mpc018.id
  vpc = true
}

resource "aws_instance" "mpc018" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc018"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc019" {
  provider = aws.us-west-1
  instance = aws_instance.mpc019.id
  vpc = true
}

resource "aws_instance" "mpc019" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc019"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc020" {
  provider = aws.us-west-1
  instance = aws_instance.mpc020.id
  vpc = true
}

resource "aws_instance" "mpc020" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc020"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc021" {
  provider = aws.us-west-1
  instance = aws_instance.mpc021.id
  vpc = true
}

resource "aws_instance" "mpc021" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc021"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc022" {
  provider = aws.us-west-1
  instance = aws_instance.mpc022.id
  vpc = true
}

resource "aws_instance" "mpc022" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc022"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc023" {
  provider = aws.us-west-1
  instance = aws_instance.mpc023.id
  vpc = true
}

resource "aws_instance" "mpc023" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc023"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc024" {
  provider = aws.us-west-1
  instance = aws_instance.mpc024.id
  vpc = true
}

resource "aws_instance" "mpc024" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc024"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc025" {
  provider = aws.us-west-1
  instance = aws_instance.mpc025.id
  vpc = true
}

resource "aws_instance" "mpc025" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc025"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc026" {
  provider = aws.us-west-1
  instance = aws_instance.mpc026.id
  vpc = true
}

resource "aws_instance" "mpc026" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc026"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc027" {
  provider = aws.us-west-1
  instance = aws_instance.mpc027.id
  vpc = true
}

resource "aws_instance" "mpc027" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc027"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc028" {
  provider = aws.us-west-1
  instance = aws_instance.mpc028.id
  vpc = true
}

resource "aws_instance" "mpc028" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc028"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc029" {
  provider = aws.us-west-1
  instance = aws_instance.mpc029.id
  vpc = true
}

resource "aws_instance" "mpc029" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc029"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc030" {
  provider = aws.us-west-1
  instance = aws_instance.mpc030.id
  vpc = true
}

resource "aws_instance" "mpc030" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc030"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc031" {
  provider = aws.us-west-1
  instance = aws_instance.mpc031.id
  vpc = true
}

resource "aws_instance" "mpc031" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc031"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc032" {
  provider = aws.us-west-1
  instance = aws_instance.mpc032.id
  vpc = true
}

resource "aws_instance" "mpc032" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc032"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc033" {
  provider = aws.us-west-1
  instance = aws_instance.mpc033.id
  vpc = true
}

resource "aws_instance" "mpc033" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc033"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc034" {
  provider = aws.us-west-1
  instance = aws_instance.mpc034.id
  vpc = true
}

resource "aws_instance" "mpc034" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc034"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc035" {
  provider = aws.us-west-1
  instance = aws_instance.mpc035.id
  vpc = true
}

resource "aws_instance" "mpc035" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc035"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc036" {
  provider = aws.us-west-1
  instance = aws_instance.mpc036.id
  vpc = true
}

resource "aws_instance" "mpc036" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc036"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc037" {
  provider = aws.us-west-1
  instance = aws_instance.mpc037.id
  vpc = true
}

resource "aws_instance" "mpc037" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc037"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc038" {
  provider = aws.us-west-1
  instance = aws_instance.mpc038.id
  vpc = true
}

resource "aws_instance" "mpc038" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc038"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc039" {
  provider = aws.us-west-1
  instance = aws_instance.mpc039.id
  vpc = true
}

resource "aws_instance" "mpc039" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc039"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc040" {
  provider = aws.us-west-1
  instance = aws_instance.mpc040.id
  vpc = true
}

resource "aws_instance" "mpc040" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc040"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc041" {
  provider = aws.us-west-1
  instance = aws_instance.mpc041.id
  vpc = true
}

resource "aws_instance" "mpc041" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc041"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc042" {
  provider = aws.us-west-1
  instance = aws_instance.mpc042.id
  vpc = true
}

resource "aws_instance" "mpc042" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc042"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc043" {
  provider = aws.us-west-1
  instance = aws_instance.mpc043.id
  vpc = true
}

resource "aws_instance" "mpc043" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc043"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc044" {
  provider = aws.us-west-1
  instance = aws_instance.mpc044.id
  vpc = true
}

resource "aws_instance" "mpc044" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc044"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc045" {
  provider = aws.us-west-1
  instance = aws_instance.mpc045.id
  vpc = true
}

resource "aws_instance" "mpc045" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc045"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc046" {
  provider = aws.us-west-1
  instance = aws_instance.mpc046.id
  vpc = true
}

resource "aws_instance" "mpc046" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc046"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc047" {
  provider = aws.us-west-1
  instance = aws_instance.mpc047.id
  vpc = true
}

resource "aws_instance" "mpc047" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc047"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc048" {
  provider = aws.us-west-1
  instance = aws_instance.mpc048.id
  vpc = true
}

resource "aws_instance" "mpc048" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc048"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc049" {
  provider = aws.us-west-1
  instance = aws_instance.mpc049.id
  vpc = true
}

resource "aws_instance" "mpc049" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc049"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc050" {
  provider = aws.us-west-1
  instance = aws_instance.mpc050.id
  vpc = true
}

resource "aws_instance" "mpc050" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc050"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc051" {
  provider = aws.us-west-1
  instance = aws_instance.mpc051.id
  vpc = true
}

resource "aws_instance" "mpc051" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc051"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc052" {
  provider = aws.us-west-1
  instance = aws_instance.mpc052.id
  vpc = true
}

resource "aws_instance" "mpc052" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc052"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc053" {
  provider = aws.us-west-1
  instance = aws_instance.mpc053.id
  vpc = true
}

resource "aws_instance" "mpc053" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc053"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc054" {
  provider = aws.us-west-1
  instance = aws_instance.mpc054.id
  vpc = true
}

resource "aws_instance" "mpc054" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc054"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc055" {
  provider = aws.us-west-1
  instance = aws_instance.mpc055.id
  vpc = true
}

resource "aws_instance" "mpc055" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc055"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc056" {
  provider = aws.us-west-1
  instance = aws_instance.mpc056.id
  vpc = true
}

resource "aws_instance" "mpc056" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc056"
  }

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc057" {
  provider = aws.us-east-2
  instance = aws_instance.mpc057.id
  vpc = true
}

resource "aws_instance" "mpc057" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc057"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc058" {
  provider = aws.us-east-2
  instance = aws_instance.mpc058.id
  vpc = true
}

resource "aws_instance" "mpc058" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc058"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc059" {
  provider = aws.us-east-2
  instance = aws_instance.mpc059.id
  vpc = true
}

resource "aws_instance" "mpc059" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc059"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc060" {
  provider = aws.us-east-2
  instance = aws_instance.mpc060.id
  vpc = true
}

resource "aws_instance" "mpc060" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc060"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc061" {
  provider = aws.us-east-2
  instance = aws_instance.mpc061.id
  vpc = true
}

resource "aws_instance" "mpc061" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc061"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc062" {
  provider = aws.us-east-2
  instance = aws_instance.mpc062.id
  vpc = true
}

resource "aws_instance" "mpc062" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc062"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc063" {
  provider = aws.us-east-2
  instance = aws_instance.mpc063.id
  vpc = true
}

resource "aws_instance" "mpc063" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc063"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc064" {
  provider = aws.us-east-2
  instance = aws_instance.mpc064.id
  vpc = true
}

resource "aws_instance" "mpc064" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc064"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc065" {
  provider = aws.us-east-2
  instance = aws_instance.mpc065.id
  vpc = true
}

resource "aws_instance" "mpc065" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc065"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc066" {
  provider = aws.us-east-2
  instance = aws_instance.mpc066.id
  vpc = true
}

resource "aws_instance" "mpc066" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc066"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc067" {
  provider = aws.us-east-2
  instance = aws_instance.mpc067.id
  vpc = true
}

resource "aws_instance" "mpc067" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc067"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc068" {
  provider = aws.us-east-2
  instance = aws_instance.mpc068.id
  vpc = true
}

resource "aws_instance" "mpc068" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc068"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc069" {
  provider = aws.us-east-2
  instance = aws_instance.mpc069.id
  vpc = true
}

resource "aws_instance" "mpc069" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc069"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc070" {
  provider = aws.us-east-2
  instance = aws_instance.mpc070.id
  vpc = true
}

resource "aws_instance" "mpc070" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc070"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc071" {
  provider = aws.us-east-2
  instance = aws_instance.mpc071.id
  vpc = true
}

resource "aws_instance" "mpc071" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc071"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc072" {
  provider = aws.us-east-2
  instance = aws_instance.mpc072.id
  vpc = true
}

resource "aws_instance" "mpc072" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc072"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc073" {
  provider = aws.us-east-2
  instance = aws_instance.mpc073.id
  vpc = true
}

resource "aws_instance" "mpc073" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc073"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc074" {
  provider = aws.us-east-2
  instance = aws_instance.mpc074.id
  vpc = true
}

resource "aws_instance" "mpc074" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc074"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc075" {
  provider = aws.us-east-2
  instance = aws_instance.mpc075.id
  vpc = true
}

resource "aws_instance" "mpc075" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc075"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc076" {
  provider = aws.us-east-2
  instance = aws_instance.mpc076.id
  vpc = true
}

resource "aws_instance" "mpc076" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc076"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc077" {
  provider = aws.us-east-2
  instance = aws_instance.mpc077.id
  vpc = true
}

resource "aws_instance" "mpc077" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc077"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc078" {
  provider = aws.us-east-2
  instance = aws_instance.mpc078.id
  vpc = true
}

resource "aws_instance" "mpc078" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc078"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc079" {
  provider = aws.us-east-2
  instance = aws_instance.mpc079.id
  vpc = true
}

resource "aws_instance" "mpc079" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc079"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc080" {
  provider = aws.us-east-2
  instance = aws_instance.mpc080.id
  vpc = true
}

resource "aws_instance" "mpc080" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc080"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc081" {
  provider = aws.us-east-2
  instance = aws_instance.mpc081.id
  vpc = true
}

resource "aws_instance" "mpc081" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc081"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc082" {
  provider = aws.us-east-2
  instance = aws_instance.mpc082.id
  vpc = true
}

resource "aws_instance" "mpc082" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc082"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc083" {
  provider = aws.us-east-2
  instance = aws_instance.mpc083.id
  vpc = true
}

resource "aws_instance" "mpc083" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc083"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc084" {
  provider = aws.us-east-2
  instance = aws_instance.mpc084.id
  vpc = true
}

resource "aws_instance" "mpc084" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc084"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc085" {
  provider = aws.us-east-2
  instance = aws_instance.mpc085.id
  vpc = true
}

resource "aws_instance" "mpc085" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc085"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc086" {
  provider = aws.us-east-2
  instance = aws_instance.mpc086.id
  vpc = true
}

resource "aws_instance" "mpc086" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc086"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc087" {
  provider = aws.us-east-2
  instance = aws_instance.mpc087.id
  vpc = true
}

resource "aws_instance" "mpc087" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc087"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc088" {
  provider = aws.us-east-2
  instance = aws_instance.mpc088.id
  vpc = true
}

resource "aws_instance" "mpc088" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc088"
  }

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc089" {
  provider = aws.us-west-2
  instance = aws_instance.mpc089.id
  vpc = true
}

resource "aws_instance" "mpc089" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc089"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc090" {
  provider = aws.us-west-2
  instance = aws_instance.mpc090.id
  vpc = true
}

resource "aws_instance" "mpc090" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc090"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc091" {
  provider = aws.us-west-2
  instance = aws_instance.mpc091.id
  vpc = true
}

resource "aws_instance" "mpc091" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc091"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc092" {
  provider = aws.us-west-2
  instance = aws_instance.mpc092.id
  vpc = true
}

resource "aws_instance" "mpc092" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc092"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc093" {
  provider = aws.us-west-2
  instance = aws_instance.mpc093.id
  vpc = true
}

resource "aws_instance" "mpc093" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc093"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc094" {
  provider = aws.us-west-2
  instance = aws_instance.mpc094.id
  vpc = true
}

resource "aws_instance" "mpc094" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc094"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc095" {
  provider = aws.us-west-2
  instance = aws_instance.mpc095.id
  vpc = true
}

resource "aws_instance" "mpc095" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc095"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc096" {
  provider = aws.us-west-2
  instance = aws_instance.mpc096.id
  vpc = true
}

resource "aws_instance" "mpc096" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc096"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc097" {
  provider = aws.us-west-2
  instance = aws_instance.mpc097.id
  vpc = true
}

resource "aws_instance" "mpc097" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc097"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc098" {
  provider = aws.us-west-2
  instance = aws_instance.mpc098.id
  vpc = true
}

resource "aws_instance" "mpc098" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc098"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc099" {
  provider = aws.us-west-2
  instance = aws_instance.mpc099.id
  vpc = true
}

resource "aws_instance" "mpc099" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc099"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc100" {
  provider = aws.us-west-2
  instance = aws_instance.mpc100.id
  vpc = true
}

resource "aws_instance" "mpc100" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc100"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc101" {
  provider = aws.us-west-2
  instance = aws_instance.mpc101.id
  vpc = true
}

resource "aws_instance" "mpc101" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc101"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc102" {
  provider = aws.us-west-2
  instance = aws_instance.mpc102.id
  vpc = true
}

resource "aws_instance" "mpc102" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc102"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc103" {
  provider = aws.us-west-2
  instance = aws_instance.mpc103.id
  vpc = true
}

resource "aws_instance" "mpc103" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc103"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc104" {
  provider = aws.us-west-2
  instance = aws_instance.mpc104.id
  vpc = true
}

resource "aws_instance" "mpc104" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc104"
  }

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc105" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc105.id
  vpc = true
}

resource "aws_instance" "mpc105" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc105"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc106" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc106.id
  vpc = true
}

resource "aws_instance" "mpc106" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc106"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc107" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc107.id
  vpc = true
}

resource "aws_instance" "mpc107" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc107"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc108" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc108.id
  vpc = true
}

resource "aws_instance" "mpc108" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc108"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc109" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc109.id
  vpc = true
}

resource "aws_instance" "mpc109" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc109"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc110" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc110.id
  vpc = true
}

resource "aws_instance" "mpc110" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc110"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc111" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc111.id
  vpc = true
}

resource "aws_instance" "mpc111" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc111"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc112" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc112.id
  vpc = true
}

resource "aws_instance" "mpc112" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc112"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc113" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc113.id
  vpc = true
}

resource "aws_instance" "mpc113" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc113"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc114" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc114.id
  vpc = true
}

resource "aws_instance" "mpc114" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc114"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc115" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc115.id
  vpc = true
}

resource "aws_instance" "mpc115" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc115"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc116" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc116.id
  vpc = true
}

resource "aws_instance" "mpc116" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc116"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc117" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc117.id
  vpc = true
}

resource "aws_instance" "mpc117" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc117"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc118" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc118.id
  vpc = true
}

resource "aws_instance" "mpc118" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc118"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc119" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc119.id
  vpc = true
}

resource "aws_instance" "mpc119" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc119"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc120" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc120.id
  vpc = true
}

resource "aws_instance" "mpc120" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc120"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc121" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc121.id
  vpc = true
}

resource "aws_instance" "mpc121" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc121"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc122" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc122.id
  vpc = true
}

resource "aws_instance" "mpc122" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc122"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc123" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc123.id
  vpc = true
}

resource "aws_instance" "mpc123" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc123"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc124" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc124.id
  vpc = true
}

resource "aws_instance" "mpc124" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc124"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc125" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc125.id
  vpc = true
}

resource "aws_instance" "mpc125" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc125"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc126" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc126.id
  vpc = true
}

resource "aws_instance" "mpc126" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc126"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc127" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc127.id
  vpc = true
}

resource "aws_instance" "mpc127" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc127"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc128" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc128.id
  vpc = true
}

resource "aws_instance" "mpc128" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc128"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc129" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc129.id
  vpc = true
}

resource "aws_instance" "mpc129" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc129"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc130" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc130.id
  vpc = true
}

resource "aws_instance" "mpc130" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc130"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc131" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc131.id
  vpc = true
}

resource "aws_instance" "mpc131" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc131"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc132" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc132.id
  vpc = true
}

resource "aws_instance" "mpc132" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc132"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc133" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc133.id
  vpc = true
}

resource "aws_instance" "mpc133" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc133"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc134" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc134.id
  vpc = true
}

resource "aws_instance" "mpc134" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc134"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc135" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc135.id
  vpc = true
}

resource "aws_instance" "mpc135" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc135"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc136" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc136.id
  vpc = true
}

resource "aws_instance" "mpc136" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc136"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc137" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc137.id
  vpc = true
}

resource "aws_instance" "mpc137" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc137"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc138" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc138.id
  vpc = true
}

resource "aws_instance" "mpc138" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc138"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc139" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc139.id
  vpc = true
}

resource "aws_instance" "mpc139" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc139"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc140" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc140.id
  vpc = true
}

resource "aws_instance" "mpc140" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc140"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc141" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc141.id
  vpc = true
}

resource "aws_instance" "mpc141" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc141"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc142" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc142.id
  vpc = true
}

resource "aws_instance" "mpc142" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc142"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc143" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc143.id
  vpc = true
}

resource "aws_instance" "mpc143" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc143"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc144" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc144.id
  vpc = true
}

resource "aws_instance" "mpc144" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc144"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc145" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc145.id
  vpc = true
}

resource "aws_instance" "mpc145" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc145"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc146" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc146.id
  vpc = true
}

resource "aws_instance" "mpc146" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc146"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc147" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc147.id
  vpc = true
}

resource "aws_instance" "mpc147" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc147"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc148" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc148.id
  vpc = true
}

resource "aws_instance" "mpc148" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc148"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc149" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc149.id
  vpc = true
}

resource "aws_instance" "mpc149" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc149"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc150" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc150.id
  vpc = true
}

resource "aws_instance" "mpc150" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc150"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc151" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc151.id
  vpc = true
}

resource "aws_instance" "mpc151" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc151"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc152" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc152.id
  vpc = true
}

resource "aws_instance" "mpc152" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc152"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc153" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc153.id
  vpc = true
}

resource "aws_instance" "mpc153" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc153"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc154" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc154.id
  vpc = true
}

resource "aws_instance" "mpc154" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc154"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc155" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc155.id
  vpc = true
}

resource "aws_instance" "mpc155" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc155"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc156" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc156.id
  vpc = true
}

resource "aws_instance" "mpc156" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc156"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc157" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc157.id
  vpc = true
}

resource "aws_instance" "mpc157" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc157"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc158" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc158.id
  vpc = true
}

resource "aws_instance" "mpc158" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc158"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc159" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc159.id
  vpc = true
}

resource "aws_instance" "mpc159" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc159"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc160" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc160.id
  vpc = true
}

resource "aws_instance" "mpc160" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc160"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc161" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc161.id
  vpc = true
}

resource "aws_instance" "mpc161" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc161"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc162" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc162.id
  vpc = true
}

resource "aws_instance" "mpc162" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc162"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc163" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc163.id
  vpc = true
}

resource "aws_instance" "mpc163" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc163"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc164" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc164.id
  vpc = true
}

resource "aws_instance" "mpc164" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc164"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc165" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc165.id
  vpc = true
}

resource "aws_instance" "mpc165" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc165"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc166" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc166.id
  vpc = true
}

resource "aws_instance" "mpc166" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc166"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc167" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc167.id
  vpc = true
}

resource "aws_instance" "mpc167" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc167"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc168" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc168.id
  vpc = true
}

resource "aws_instance" "mpc168" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc168"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc169" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc169.id
  vpc = true
}

resource "aws_instance" "mpc169" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc169"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc170" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc170.id
  vpc = true
}

resource "aws_instance" "mpc170" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc170"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc171" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc171.id
  vpc = true
}

resource "aws_instance" "mpc171" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc171"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc172" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc172.id
  vpc = true
}

resource "aws_instance" "mpc172" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc172"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc173" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc173.id
  vpc = true
}

resource "aws_instance" "mpc173" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc173"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc174" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc174.id
  vpc = true
}

resource "aws_instance" "mpc174" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc174"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc175" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc175.id
  vpc = true
}

resource "aws_instance" "mpc175" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc175"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc176" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc176.id
  vpc = true
}

resource "aws_instance" "mpc176" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc176"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc177" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc177.id
  vpc = true
}

resource "aws_instance" "mpc177" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc177"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc178" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc178.id
  vpc = true
}

resource "aws_instance" "mpc178" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc178"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc179" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc179.id
  vpc = true
}

resource "aws_instance" "mpc179" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc179"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc180" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc180.id
  vpc = true
}

resource "aws_instance" "mpc180" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc180"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc181" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc181.id
  vpc = true
}

resource "aws_instance" "mpc181" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc181"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc182" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc182.id
  vpc = true
}

resource "aws_instance" "mpc182" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc182"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc183" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc183.id
  vpc = true
}

resource "aws_instance" "mpc183" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc183"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc184" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc184.id
  vpc = true
}

resource "aws_instance" "mpc184" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc184"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc185" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc185.id
  vpc = true
}

resource "aws_instance" "mpc185" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc185"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc186" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc186.id
  vpc = true
}

resource "aws_instance" "mpc186" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc186"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc187" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc187.id
  vpc = true
}

resource "aws_instance" "mpc187" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc187"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc188" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc188.id
  vpc = true
}

resource "aws_instance" "mpc188" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc188"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc189" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc189.id
  vpc = true
}

resource "aws_instance" "mpc189" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc189"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc190" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc190.id
  vpc = true
}

resource "aws_instance" "mpc190" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc190"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc191" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc191.id
  vpc = true
}

resource "aws_instance" "mpc191" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc191"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc192" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc192.id
  vpc = true
}

resource "aws_instance" "mpc192" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc192"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc193" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc193.id
  vpc = true
}

resource "aws_instance" "mpc193" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc193"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc194" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc194.id
  vpc = true
}

resource "aws_instance" "mpc194" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc194"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc195" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc195.id
  vpc = true
}

resource "aws_instance" "mpc195" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc195"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc196" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc196.id
  vpc = true
}

resource "aws_instance" "mpc196" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc196"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc197" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc197.id
  vpc = true
}

resource "aws_instance" "mpc197" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc197"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc198" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc198.id
  vpc = true
}

resource "aws_instance" "mpc198" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc198"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc199" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc199.id
  vpc = true
}

resource "aws_instance" "mpc199" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc199"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc200" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc200.id
  vpc = true
}

resource "aws_instance" "mpc200" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc200"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc201" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc201.id
  vpc = true
}

resource "aws_instance" "mpc201" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc201"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc202" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc202.id
  vpc = true
}

resource "aws_instance" "mpc202" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc202"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc203" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc203.id
  vpc = true
}

resource "aws_instance" "mpc203" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc203"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc204" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc204.id
  vpc = true
}

resource "aws_instance" "mpc204" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc204"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc205" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc205.id
  vpc = true
}

resource "aws_instance" "mpc205" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc205"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc206" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc206.id
  vpc = true
}

resource "aws_instance" "mpc206" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc206"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc207" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc207.id
  vpc = true
}

resource "aws_instance" "mpc207" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc207"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc208" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc208.id
  vpc = true
}

resource "aws_instance" "mpc208" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc208"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc209" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc209.id
  vpc = true
}

resource "aws_instance" "mpc209" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc209"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc210" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc210.id
  vpc = true
}

resource "aws_instance" "mpc210" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc210"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc211" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc211.id
  vpc = true
}

resource "aws_instance" "mpc211" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc211"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc212" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc212.id
  vpc = true
}

resource "aws_instance" "mpc212" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc212"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc213" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc213.id
  vpc = true
}

resource "aws_instance" "mpc213" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc213"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc214" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc214.id
  vpc = true
}

resource "aws_instance" "mpc214" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc214"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc215" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc215.id
  vpc = true
}

resource "aws_instance" "mpc215" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc215"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc216" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc216.id
  vpc = true
}

resource "aws_instance" "mpc216" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc216"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc217" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc217.id
  vpc = true
}

resource "aws_instance" "mpc217" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc217"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc218" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc218.id
  vpc = true
}

resource "aws_instance" "mpc218" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc218"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc219" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc219.id
  vpc = true
}

resource "aws_instance" "mpc219" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc219"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc220" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc220.id
  vpc = true
}

resource "aws_instance" "mpc220" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc220"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc221" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc221.id
  vpc = true
}

resource "aws_instance" "mpc221" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc221"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc222" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc222.id
  vpc = true
}

resource "aws_instance" "mpc222" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc222"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc223" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc223.id
  vpc = true
}

resource "aws_instance" "mpc223" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc223"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc224" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc224.id
  vpc = true
}

resource "aws_instance" "mpc224" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc224"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc225" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc225.id
  vpc = true
}

resource "aws_instance" "mpc225" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc225"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc226" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc226.id
  vpc = true
}

resource "aws_instance" "mpc226" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc226"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc227" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc227.id
  vpc = true
}

resource "aws_instance" "mpc227" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc227"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc228" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc228.id
  vpc = true
}

resource "aws_instance" "mpc228" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc228"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc229" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc229.id
  vpc = true
}

resource "aws_instance" "mpc229" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc229"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc230" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc230.id
  vpc = true
}

resource "aws_instance" "mpc230" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc230"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc231" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc231.id
  vpc = true
}

resource "aws_instance" "mpc231" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc231"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc232" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc232.id
  vpc = true
}

resource "aws_instance" "mpc232" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc232"
  }

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc233" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc233.id
  vpc = true
}

resource "aws_instance" "mpc233" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc233"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc234" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc234.id
  vpc = true
}

resource "aws_instance" "mpc234" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc234"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc235" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc235.id
  vpc = true
}

resource "aws_instance" "mpc235" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc235"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc236" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc236.id
  vpc = true
}

resource "aws_instance" "mpc236" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc236"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc237" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc237.id
  vpc = true
}

resource "aws_instance" "mpc237" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc237"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc238" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc238.id
  vpc = true
}

resource "aws_instance" "mpc238" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc238"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc239" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc239.id
  vpc = true
}

resource "aws_instance" "mpc239" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc239"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc240" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc240.id
  vpc = true
}

resource "aws_instance" "mpc240" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc240"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc241" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc241.id
  vpc = true
}

resource "aws_instance" "mpc241" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc241"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc242" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc242.id
  vpc = true
}

resource "aws_instance" "mpc242" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc242"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc243" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc243.id
  vpc = true
}

resource "aws_instance" "mpc243" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc243"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc244" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc244.id
  vpc = true
}

resource "aws_instance" "mpc244" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc244"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc245" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc245.id
  vpc = true
}

resource "aws_instance" "mpc245" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc245"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc246" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc246.id
  vpc = true
}

resource "aws_instance" "mpc246" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc246"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc247" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc247.id
  vpc = true
}

resource "aws_instance" "mpc247" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc247"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc248" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc248.id
  vpc = true
}

resource "aws_instance" "mpc248" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc248"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc249" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc249.id
  vpc = true
}

resource "aws_instance" "mpc249" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc249"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc250" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc250.id
  vpc = true
}

resource "aws_instance" "mpc250" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc250"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc251" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc251.id
  vpc = true
}

resource "aws_instance" "mpc251" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc251"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc252" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc252.id
  vpc = true
}

resource "aws_instance" "mpc252" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc252"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc253" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc253.id
  vpc = true
}

resource "aws_instance" "mpc253" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc253"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc254" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc254.id
  vpc = true
}

resource "aws_instance" "mpc254" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc254"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc255" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc255.id
  vpc = true
}

resource "aws_instance" "mpc255" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc255"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc256" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc256.id
  vpc = true
}

resource "aws_instance" "mpc256" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc256"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc257" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc257.id
  vpc = true
}

resource "aws_instance" "mpc257" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc257"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc258" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc258.id
  vpc = true
}

resource "aws_instance" "mpc258" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc258"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc259" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc259.id
  vpc = true
}

resource "aws_instance" "mpc259" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc259"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc260" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc260.id
  vpc = true
}

resource "aws_instance" "mpc260" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc260"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc261" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc261.id
  vpc = true
}

resource "aws_instance" "mpc261" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc261"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc262" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc262.id
  vpc = true
}

resource "aws_instance" "mpc262" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc262"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc263" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc263.id
  vpc = true
}

resource "aws_instance" "mpc263" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc263"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc264" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc264.id
  vpc = true
}

resource "aws_instance" "mpc264" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc264"
  }

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc265" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc265.id
  vpc = true
}

resource "aws_instance" "mpc265" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc265"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc266" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc266.id
  vpc = true
}

resource "aws_instance" "mpc266" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc266"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc267" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc267.id
  vpc = true
}

resource "aws_instance" "mpc267" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc267"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc268" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc268.id
  vpc = true
}

resource "aws_instance" "mpc268" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc268"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc269" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc269.id
  vpc = true
}

resource "aws_instance" "mpc269" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc269"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc270" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc270.id
  vpc = true
}

resource "aws_instance" "mpc270" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc270"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc271" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc271.id
  vpc = true
}

resource "aws_instance" "mpc271" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc271"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc272" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc272.id
  vpc = true
}

resource "aws_instance" "mpc272" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc272"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc273" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc273.id
  vpc = true
}

resource "aws_instance" "mpc273" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc273"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc274" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc274.id
  vpc = true
}

resource "aws_instance" "mpc274" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc274"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc275" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc275.id
  vpc = true
}

resource "aws_instance" "mpc275" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc275"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc276" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc276.id
  vpc = true
}

resource "aws_instance" "mpc276" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc276"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc277" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc277.id
  vpc = true
}

resource "aws_instance" "mpc277" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc277"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc278" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc278.id
  vpc = true
}

resource "aws_instance" "mpc278" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc278"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc279" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc279.id
  vpc = true
}

resource "aws_instance" "mpc279" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc279"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc280" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc280.id
  vpc = true
}

resource "aws_instance" "mpc280" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc280"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc281" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc281.id
  vpc = true
}

resource "aws_instance" "mpc281" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc281"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc282" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc282.id
  vpc = true
}

resource "aws_instance" "mpc282" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc282"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc283" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc283.id
  vpc = true
}

resource "aws_instance" "mpc283" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc283"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc284" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc284.id
  vpc = true
}

resource "aws_instance" "mpc284" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc284"
  }

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc285" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc285.id
  vpc = true
}

resource "aws_instance" "mpc285" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc285"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc286" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc286.id
  vpc = true
}

resource "aws_instance" "mpc286" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc286"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc287" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc287.id
  vpc = true
}

resource "aws_instance" "mpc287" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc287"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc288" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc288.id
  vpc = true
}

resource "aws_instance" "mpc288" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc288"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc289" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc289.id
  vpc = true
}

resource "aws_instance" "mpc289" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc289"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc290" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc290.id
  vpc = true
}

resource "aws_instance" "mpc290" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc290"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc291" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc291.id
  vpc = true
}

resource "aws_instance" "mpc291" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc291"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc292" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc292.id
  vpc = true
}

resource "aws_instance" "mpc292" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc292"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc293" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc293.id
  vpc = true
}

resource "aws_instance" "mpc293" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc293"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc294" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc294.id
  vpc = true
}

resource "aws_instance" "mpc294" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc294"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc295" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc295.id
  vpc = true
}

resource "aws_instance" "mpc295" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc295"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc296" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc296.id
  vpc = true
}

resource "aws_instance" "mpc296" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc296"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc297" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc297.id
  vpc = true
}

resource "aws_instance" "mpc297" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc297"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc298" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc298.id
  vpc = true
}

resource "aws_instance" "mpc298" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc298"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc299" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc299.id
  vpc = true
}

resource "aws_instance" "mpc299" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc299"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc300" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc300.id
  vpc = true
}

resource "aws_instance" "mpc300" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc300"
  }

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc301" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc301.id
  vpc = true
}

resource "aws_instance" "mpc301" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc301"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc302" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc302.id
  vpc = true
}

resource "aws_instance" "mpc302" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc302"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc303" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc303.id
  vpc = true
}

resource "aws_instance" "mpc303" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc303"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc304" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc304.id
  vpc = true
}

resource "aws_instance" "mpc304" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc304"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc305" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc305.id
  vpc = true
}

resource "aws_instance" "mpc305" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc305"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc306" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc306.id
  vpc = true
}

resource "aws_instance" "mpc306" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc306"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc307" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc307.id
  vpc = true
}

resource "aws_instance" "mpc307" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc307"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc308" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc308.id
  vpc = true
}

resource "aws_instance" "mpc308" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc308"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc309" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc309.id
  vpc = true
}

resource "aws_instance" "mpc309" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc309"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc310" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc310.id
  vpc = true
}

resource "aws_instance" "mpc310" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc310"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc311" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc311.id
  vpc = true
}

resource "aws_instance" "mpc311" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc311"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc312" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc312.id
  vpc = true
}

resource "aws_instance" "mpc312" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc312"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc313" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc313.id
  vpc = true
}

resource "aws_instance" "mpc313" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc313"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc314" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc314.id
  vpc = true
}

resource "aws_instance" "mpc314" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc314"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc315" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc315.id
  vpc = true
}

resource "aws_instance" "mpc315" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc315"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc316" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc316.id
  vpc = true
}

resource "aws_instance" "mpc316" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc316"
  }

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc317" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc317.id
  vpc = true
}

resource "aws_instance" "mpc317" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc317"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc318" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc318.id
  vpc = true
}

resource "aws_instance" "mpc318" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc318"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc319" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc319.id
  vpc = true
}

resource "aws_instance" "mpc319" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc319"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc320" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc320.id
  vpc = true
}

resource "aws_instance" "mpc320" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc320"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc321" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc321.id
  vpc = true
}

resource "aws_instance" "mpc321" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc321"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc322" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc322.id
  vpc = true
}

resource "aws_instance" "mpc322" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc322"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc323" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc323.id
  vpc = true
}

resource "aws_instance" "mpc323" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc323"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc324" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc324.id
  vpc = true
}

resource "aws_instance" "mpc324" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc324"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc325" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc325.id
  vpc = true
}

resource "aws_instance" "mpc325" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc325"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc326" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc326.id
  vpc = true
}

resource "aws_instance" "mpc326" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc326"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc327" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc327.id
  vpc = true
}

resource "aws_instance" "mpc327" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc327"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc328" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc328.id
  vpc = true
}

resource "aws_instance" "mpc328" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc328"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc329" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc329.id
  vpc = true
}

resource "aws_instance" "mpc329" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc329"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc330" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc330.id
  vpc = true
}

resource "aws_instance" "mpc330" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc330"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc331" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc331.id
  vpc = true
}

resource "aws_instance" "mpc331" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc331"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc332" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc332.id
  vpc = true
}

resource "aws_instance" "mpc332" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc332"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc333" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc333.id
  vpc = true
}

resource "aws_instance" "mpc333" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc333"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc334" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc334.id
  vpc = true
}

resource "aws_instance" "mpc334" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc334"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc335" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc335.id
  vpc = true
}

resource "aws_instance" "mpc335" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc335"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc336" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc336.id
  vpc = true
}

resource "aws_instance" "mpc336" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc336"
  }

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc337" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc337.id
  vpc = true
}

resource "aws_instance" "mpc337" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc337"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc338" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc338.id
  vpc = true
}

resource "aws_instance" "mpc338" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc338"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc339" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc339.id
  vpc = true
}

resource "aws_instance" "mpc339" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc339"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc340" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc340.id
  vpc = true
}

resource "aws_instance" "mpc340" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc340"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc341" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc341.id
  vpc = true
}

resource "aws_instance" "mpc341" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc341"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc342" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc342.id
  vpc = true
}

resource "aws_instance" "mpc342" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc342"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc343" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc343.id
  vpc = true
}

resource "aws_instance" "mpc343" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc343"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc344" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc344.id
  vpc = true
}

resource "aws_instance" "mpc344" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc344"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc345" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc345.id
  vpc = true
}

resource "aws_instance" "mpc345" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc345"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc346" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc346.id
  vpc = true
}

resource "aws_instance" "mpc346" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc346"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc347" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc347.id
  vpc = true
}

resource "aws_instance" "mpc347" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc347"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc348" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc348.id
  vpc = true
}

resource "aws_instance" "mpc348" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc348"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc349" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc349.id
  vpc = true
}

resource "aws_instance" "mpc349" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc349"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc350" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc350.id
  vpc = true
}

resource "aws_instance" "mpc350" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc350"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc351" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc351.id
  vpc = true
}

resource "aws_instance" "mpc351" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc351"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc352" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc352.id
  vpc = true
}

resource "aws_instance" "mpc352" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc352"
  }

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc353" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc353.id
  vpc = true
}

resource "aws_instance" "mpc353" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc353"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc354" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc354.id
  vpc = true
}

resource "aws_instance" "mpc354" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc354"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc355" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc355.id
  vpc = true
}

resource "aws_instance" "mpc355" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc355"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc356" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc356.id
  vpc = true
}

resource "aws_instance" "mpc356" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc356"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc357" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc357.id
  vpc = true
}

resource "aws_instance" "mpc357" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc357"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc358" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc358.id
  vpc = true
}

resource "aws_instance" "mpc358" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc358"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc359" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc359.id
  vpc = true
}

resource "aws_instance" "mpc359" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc359"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc360" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc360.id
  vpc = true
}

resource "aws_instance" "mpc360" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc360"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc361" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc361.id
  vpc = true
}

resource "aws_instance" "mpc361" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc361"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc362" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc362.id
  vpc = true
}

resource "aws_instance" "mpc362" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc362"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc363" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc363.id
  vpc = true
}

resource "aws_instance" "mpc363" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc363"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc364" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc364.id
  vpc = true
}

resource "aws_instance" "mpc364" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc364"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc365" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc365.id
  vpc = true
}

resource "aws_instance" "mpc365" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc365"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc366" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc366.id
  vpc = true
}

resource "aws_instance" "mpc366" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc366"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc367" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc367.id
  vpc = true
}

resource "aws_instance" "mpc367" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc367"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc368" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc368.id
  vpc = true
}

resource "aws_instance" "mpc368" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc368"
  }

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc369" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc369.id
  vpc = true
}

resource "aws_instance" "mpc369" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc369"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc370" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc370.id
  vpc = true
}

resource "aws_instance" "mpc370" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc370"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc371" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc371.id
  vpc = true
}

resource "aws_instance" "mpc371" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc371"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc372" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc372.id
  vpc = true
}

resource "aws_instance" "mpc372" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc372"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc373" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc373.id
  vpc = true
}

resource "aws_instance" "mpc373" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc373"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc374" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc374.id
  vpc = true
}

resource "aws_instance" "mpc374" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc374"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc375" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc375.id
  vpc = true
}

resource "aws_instance" "mpc375" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc375"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc376" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc376.id
  vpc = true
}

resource "aws_instance" "mpc376" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc376"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc377" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc377.id
  vpc = true
}

resource "aws_instance" "mpc377" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc377"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc378" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc378.id
  vpc = true
}

resource "aws_instance" "mpc378" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc378"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc379" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc379.id
  vpc = true
}

resource "aws_instance" "mpc379" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc379"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc380" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc380.id
  vpc = true
}

resource "aws_instance" "mpc380" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc380"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc381" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc381.id
  vpc = true
}

resource "aws_instance" "mpc381" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc381"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc382" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc382.id
  vpc = true
}

resource "aws_instance" "mpc382" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc382"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc383" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc383.id
  vpc = true
}

resource "aws_instance" "mpc383" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc383"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc384" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc384.id
  vpc = true
}

resource "aws_instance" "mpc384" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc384"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc385" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc385.id
  vpc = true
}

resource "aws_instance" "mpc385" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc385"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc386" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc386.id
  vpc = true
}

resource "aws_instance" "mpc386" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc386"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc387" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc387.id
  vpc = true
}

resource "aws_instance" "mpc387" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc387"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc388" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc388.id
  vpc = true
}

resource "aws_instance" "mpc388" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc388"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc389" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc389.id
  vpc = true
}

resource "aws_instance" "mpc389" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc389"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc390" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc390.id
  vpc = true
}

resource "aws_instance" "mpc390" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc390"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc391" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc391.id
  vpc = true
}

resource "aws_instance" "mpc391" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc391"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc392" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc392.id
  vpc = true
}

resource "aws_instance" "mpc392" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc392"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc393" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc393.id
  vpc = true
}

resource "aws_instance" "mpc393" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc393"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc394" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc394.id
  vpc = true
}

resource "aws_instance" "mpc394" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc394"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc395" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc395.id
  vpc = true
}

resource "aws_instance" "mpc395" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc395"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc396" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc396.id
  vpc = true
}

resource "aws_instance" "mpc396" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc396"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc397" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc397.id
  vpc = true
}

resource "aws_instance" "mpc397" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc397"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc398" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc398.id
  vpc = true
}

resource "aws_instance" "mpc398" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc398"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc399" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc399.id
  vpc = true
}

resource "aws_instance" "mpc399" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc399"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc400" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc400.id
  vpc = true
}

resource "aws_instance" "mpc400" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc400"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc401" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc401.id
  vpc = true
}

resource "aws_instance" "mpc401" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc401"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc402" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc402.id
  vpc = true
}

resource "aws_instance" "mpc402" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc402"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc403" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc403.id
  vpc = true
}

resource "aws_instance" "mpc403" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc403"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc404" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc404.id
  vpc = true
}

resource "aws_instance" "mpc404" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc404"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc405" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc405.id
  vpc = true
}

resource "aws_instance" "mpc405" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc405"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc406" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc406.id
  vpc = true
}

resource "aws_instance" "mpc406" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc406"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc407" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc407.id
  vpc = true
}

resource "aws_instance" "mpc407" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc407"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc408" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc408.id
  vpc = true
}

resource "aws_instance" "mpc408" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc408"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc409" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc409.id
  vpc = true
}

resource "aws_instance" "mpc409" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc409"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc410" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc410.id
  vpc = true
}

resource "aws_instance" "mpc410" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc410"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc411" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc411.id
  vpc = true
}

resource "aws_instance" "mpc411" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc411"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc412" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc412.id
  vpc = true
}

resource "aws_instance" "mpc412" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc412"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc413" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc413.id
  vpc = true
}

resource "aws_instance" "mpc413" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc413"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc414" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc414.id
  vpc = true
}

resource "aws_instance" "mpc414" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc414"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc415" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc415.id
  vpc = true
}

resource "aws_instance" "mpc415" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc415"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc416" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc416.id
  vpc = true
}

resource "aws_instance" "mpc416" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc416"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc417" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc417.id
  vpc = true
}

resource "aws_instance" "mpc417" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc417"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc418" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc418.id
  vpc = true
}

resource "aws_instance" "mpc418" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc418"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc419" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc419.id
  vpc = true
}

resource "aws_instance" "mpc419" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc419"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc420" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc420.id
  vpc = true
}

resource "aws_instance" "mpc420" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc420"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc421" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc421.id
  vpc = true
}

resource "aws_instance" "mpc421" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc421"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc422" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc422.id
  vpc = true
}

resource "aws_instance" "mpc422" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc422"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc423" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc423.id
  vpc = true
}

resource "aws_instance" "mpc423" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc423"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc424" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc424.id
  vpc = true
}

resource "aws_instance" "mpc424" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc424"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc425" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc425.id
  vpc = true
}

resource "aws_instance" "mpc425" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc425"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc426" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc426.id
  vpc = true
}

resource "aws_instance" "mpc426" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc426"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc427" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc427.id
  vpc = true
}

resource "aws_instance" "mpc427" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc427"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc428" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc428.id
  vpc = true
}

resource "aws_instance" "mpc428" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc428"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc429" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc429.id
  vpc = true
}

resource "aws_instance" "mpc429" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc429"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc430" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc430.id
  vpc = true
}

resource "aws_instance" "mpc430" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc430"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc431" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc431.id
  vpc = true
}

resource "aws_instance" "mpc431" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc431"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc432" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc432.id
  vpc = true
}

resource "aws_instance" "mpc432" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc432"
  }

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc433" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc433.id
  vpc = true
}

resource "aws_instance" "mpc433" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc433"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc434" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc434.id
  vpc = true
}

resource "aws_instance" "mpc434" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc434"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc435" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc435.id
  vpc = true
}

resource "aws_instance" "mpc435" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc435"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc436" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc436.id
  vpc = true
}

resource "aws_instance" "mpc436" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc436"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc437" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc437.id
  vpc = true
}

resource "aws_instance" "mpc437" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc437"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc438" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc438.id
  vpc = true
}

resource "aws_instance" "mpc438" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc438"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc439" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc439.id
  vpc = true
}

resource "aws_instance" "mpc439" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc439"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc440" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc440.id
  vpc = true
}

resource "aws_instance" "mpc440" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc440"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc441" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc441.id
  vpc = true
}

resource "aws_instance" "mpc441" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc441"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc442" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc442.id
  vpc = true
}

resource "aws_instance" "mpc442" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc442"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc443" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc443.id
  vpc = true
}

resource "aws_instance" "mpc443" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc443"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc444" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc444.id
  vpc = true
}

resource "aws_instance" "mpc444" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc444"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc445" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc445.id
  vpc = true
}

resource "aws_instance" "mpc445" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc445"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc446" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc446.id
  vpc = true
}

resource "aws_instance" "mpc446" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc446"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc447" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc447.id
  vpc = true
}

resource "aws_instance" "mpc447" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc447"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc448" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc448.id
  vpc = true
}

resource "aws_instance" "mpc448" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc448"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc449" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc449.id
  vpc = true
}

resource "aws_instance" "mpc449" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc449"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc450" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc450.id
  vpc = true
}

resource "aws_instance" "mpc450" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc450"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc451" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc451.id
  vpc = true
}

resource "aws_instance" "mpc451" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc451"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc452" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc452.id
  vpc = true
}

resource "aws_instance" "mpc452" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc452"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc453" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc453.id
  vpc = true
}

resource "aws_instance" "mpc453" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc453"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc454" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc454.id
  vpc = true
}

resource "aws_instance" "mpc454" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc454"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc455" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc455.id
  vpc = true
}

resource "aws_instance" "mpc455" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc455"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc456" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc456.id
  vpc = true
}

resource "aws_instance" "mpc456" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc456"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc457" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc457.id
  vpc = true
}

resource "aws_instance" "mpc457" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc457"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc458" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc458.id
  vpc = true
}

resource "aws_instance" "mpc458" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc458"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc459" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc459.id
  vpc = true
}

resource "aws_instance" "mpc459" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc459"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc460" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc460.id
  vpc = true
}

resource "aws_instance" "mpc460" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc460"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc461" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc461.id
  vpc = true
}

resource "aws_instance" "mpc461" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc461"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc462" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc462.id
  vpc = true
}

resource "aws_instance" "mpc462" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc462"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc463" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc463.id
  vpc = true
}

resource "aws_instance" "mpc463" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc463"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc464" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc464.id
  vpc = true
}

resource "aws_instance" "mpc464" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc464"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc465" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc465.id
  vpc = true
}

resource "aws_instance" "mpc465" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc465"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc466" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc466.id
  vpc = true
}

resource "aws_instance" "mpc466" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc466"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc467" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc467.id
  vpc = true
}

resource "aws_instance" "mpc467" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc467"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc468" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc468.id
  vpc = true
}

resource "aws_instance" "mpc468" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc468"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc469" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc469.id
  vpc = true
}

resource "aws_instance" "mpc469" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc469"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc470" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc470.id
  vpc = true
}

resource "aws_instance" "mpc470" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc470"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc471" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc471.id
  vpc = true
}

resource "aws_instance" "mpc471" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc471"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc472" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc472.id
  vpc = true
}

resource "aws_instance" "mpc472" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc472"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc473" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc473.id
  vpc = true
}

resource "aws_instance" "mpc473" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc473"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc474" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc474.id
  vpc = true
}

resource "aws_instance" "mpc474" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc474"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc475" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc475.id
  vpc = true
}

resource "aws_instance" "mpc475" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc475"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc476" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc476.id
  vpc = true
}

resource "aws_instance" "mpc476" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc476"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc477" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc477.id
  vpc = true
}

resource "aws_instance" "mpc477" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc477"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc478" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc478.id
  vpc = true
}

resource "aws_instance" "mpc478" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc478"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc479" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc479.id
  vpc = true
}

resource "aws_instance" "mpc479" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc479"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc480" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc480.id
  vpc = true
}

resource "aws_instance" "mpc480" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc480"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc481" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc481.id
  vpc = true
}

resource "aws_instance" "mpc481" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc481"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc482" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc482.id
  vpc = true
}

resource "aws_instance" "mpc482" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc482"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc483" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc483.id
  vpc = true
}

resource "aws_instance" "mpc483" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc483"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc484" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc484.id
  vpc = true
}

resource "aws_instance" "mpc484" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc484"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc485" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc485.id
  vpc = true
}

resource "aws_instance" "mpc485" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc485"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc486" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc486.id
  vpc = true
}

resource "aws_instance" "mpc486" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc486"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc487" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc487.id
  vpc = true
}

resource "aws_instance" "mpc487" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc487"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc488" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc488.id
  vpc = true
}

resource "aws_instance" "mpc488" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc488"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc489" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc489.id
  vpc = true
}

resource "aws_instance" "mpc489" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc489"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc490" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc490.id
  vpc = true
}

resource "aws_instance" "mpc490" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc490"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc491" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc491.id
  vpc = true
}

resource "aws_instance" "mpc491" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc491"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc492" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc492.id
  vpc = true
}

resource "aws_instance" "mpc492" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc492"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc493" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc493.id
  vpc = true
}

resource "aws_instance" "mpc493" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc493"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc494" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc494.id
  vpc = true
}

resource "aws_instance" "mpc494" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc494"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc495" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc495.id
  vpc = true
}

resource "aws_instance" "mpc495" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc495"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc496" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc496.id
  vpc = true
}

resource "aws_instance" "mpc496" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc496"
  }

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc497" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc497.id
  vpc = true
}

resource "aws_instance" "mpc497" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc497"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc498" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc498.id
  vpc = true
}

resource "aws_instance" "mpc498" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc498"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc499" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc499.id
  vpc = true
}

resource "aws_instance" "mpc499" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc499"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc500" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc500.id
  vpc = true
}

resource "aws_instance" "mpc500" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc500"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc501" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc501.id
  vpc = true
}

resource "aws_instance" "mpc501" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc501"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc502" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc502.id
  vpc = true
}

resource "aws_instance" "mpc502" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc502"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc503" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc503.id
  vpc = true
}

resource "aws_instance" "mpc503" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc503"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc504" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc504.id
  vpc = true
}

resource "aws_instance" "mpc504" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc504"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc505" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc505.id
  vpc = true
}

resource "aws_instance" "mpc505" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc505"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc506" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc506.id
  vpc = true
}

resource "aws_instance" "mpc506" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc506"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc507" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc507.id
  vpc = true
}

resource "aws_instance" "mpc507" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc507"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc508" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc508.id
  vpc = true
}

resource "aws_instance" "mpc508" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc508"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc509" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc509.id
  vpc = true
}

resource "aws_instance" "mpc509" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc509"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc510" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc510.id
  vpc = true
}

resource "aws_instance" "mpc510" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc510"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc511" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc511.id
  vpc = true
}

resource "aws_instance" "mpc511" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc511"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc512" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc512.id
  vpc = true
}

resource "aws_instance" "mpc512" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.micro"
  key_name = "dstarin_aws"
  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc512"
  }

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}
