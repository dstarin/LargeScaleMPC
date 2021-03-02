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
  instance_type = "t2.nano"
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
  provider = aws.us-west-1
  instance = aws_instance.mpc002.id
  vpc = true
}

resource "aws_instance" "mpc002" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc003" {
  provider = aws.us-east-2
  instance = aws_instance.mpc003.id
  vpc = true
}

resource "aws_instance" "mpc003" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc004" {
  provider = aws.us-west-2
  instance = aws_instance.mpc004.id
  vpc = true
}

resource "aws_instance" "mpc004" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc005" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc005.id
  vpc = true
}

resource "aws_instance" "mpc005" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc006" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc006.id
  vpc = true
}

resource "aws_instance" "mpc006" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc007" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc007.id
  vpc = true
}

resource "aws_instance" "mpc007" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc008" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc008.id
  vpc = true
}

resource "aws_instance" "mpc008" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc009" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc009.id
  vpc = true
}

resource "aws_instance" "mpc009" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc010" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc010.id
  vpc = true
}

resource "aws_instance" "mpc010" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc011" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc011.id
  vpc = true
}

resource "aws_instance" "mpc011" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc012" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc012.id
  vpc = true
}

resource "aws_instance" "mpc012" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc013" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc013.id
  vpc = true
}

resource "aws_instance" "mpc013" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc014" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc014.id
  vpc = true
}

resource "aws_instance" "mpc014" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc015" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc015.id
  vpc = true
}

resource "aws_instance" "mpc015" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc016" {
  provider = aws.us-east-1
  instance = aws_instance.mpc016.id
  vpc = true
}

resource "aws_instance" "mpc016" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.nano"
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
  instance_type = "t2.nano"
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
  provider = aws.us-east-2
  instance = aws_instance.mpc018.id
  vpc = true
}

resource "aws_instance" "mpc018" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc019" {
  provider = aws.us-west-2
  instance = aws_instance.mpc019.id
  vpc = true
}

resource "aws_instance" "mpc019" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc020" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc020.id
  vpc = true
}

resource "aws_instance" "mpc020" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc021" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc021.id
  vpc = true
}

resource "aws_instance" "mpc021" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc022" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc022.id
  vpc = true
}

resource "aws_instance" "mpc022" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc023" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc023.id
  vpc = true
}

resource "aws_instance" "mpc023" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc024" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc024.id
  vpc = true
}

resource "aws_instance" "mpc024" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc025" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc025.id
  vpc = true
}

resource "aws_instance" "mpc025" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc026" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc026.id
  vpc = true
}

resource "aws_instance" "mpc026" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc027" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc027.id
  vpc = true
}

resource "aws_instance" "mpc027" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc028" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc028.id
  vpc = true
}

resource "aws_instance" "mpc028" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc029" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc029.id
  vpc = true
}

resource "aws_instance" "mpc029" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc030" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc030.id
  vpc = true
}

resource "aws_instance" "mpc030" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc031" {
  provider = aws.us-east-1
  instance = aws_instance.mpc031.id
  vpc = true
}

resource "aws_instance" "mpc031" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc032" {
  provider = aws.us-west-1
  instance = aws_instance.mpc032.id
  vpc = true
}

resource "aws_instance" "mpc032" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.nano"
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
  provider = aws.us-east-2
  instance = aws_instance.mpc033.id
  vpc = true
}

resource "aws_instance" "mpc033" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc034" {
  provider = aws.us-west-2
  instance = aws_instance.mpc034.id
  vpc = true
}

resource "aws_instance" "mpc034" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc035" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc035.id
  vpc = true
}

resource "aws_instance" "mpc035" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc036" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc036.id
  vpc = true
}

resource "aws_instance" "mpc036" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc037" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc037.id
  vpc = true
}

resource "aws_instance" "mpc037" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc038" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc038.id
  vpc = true
}

resource "aws_instance" "mpc038" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc039" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc039.id
  vpc = true
}

resource "aws_instance" "mpc039" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc040" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc040.id
  vpc = true
}

resource "aws_instance" "mpc040" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc041" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc041.id
  vpc = true
}

resource "aws_instance" "mpc041" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc042" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc042.id
  vpc = true
}

resource "aws_instance" "mpc042" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc043" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc043.id
  vpc = true
}

resource "aws_instance" "mpc043" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc044" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc044.id
  vpc = true
}

resource "aws_instance" "mpc044" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc045" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc045.id
  vpc = true
}

resource "aws_instance" "mpc045" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc046" {
  provider = aws.us-east-1
  instance = aws_instance.mpc046.id
  vpc = true
}

resource "aws_instance" "mpc046" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc047" {
  provider = aws.us-west-1
  instance = aws_instance.mpc047.id
  vpc = true
}

resource "aws_instance" "mpc047" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.nano"
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
  provider = aws.us-east-2
  instance = aws_instance.mpc048.id
  vpc = true
}

resource "aws_instance" "mpc048" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc049" {
  provider = aws.us-west-2
  instance = aws_instance.mpc049.id
  vpc = true
}

resource "aws_instance" "mpc049" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc050" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc050.id
  vpc = true
}

resource "aws_instance" "mpc050" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc051" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc051.id
  vpc = true
}

resource "aws_instance" "mpc051" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc052" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc052.id
  vpc = true
}

resource "aws_instance" "mpc052" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc053" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc053.id
  vpc = true
}

resource "aws_instance" "mpc053" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc054" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc054.id
  vpc = true
}

resource "aws_instance" "mpc054" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc055" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc055.id
  vpc = true
}

resource "aws_instance" "mpc055" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc056" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc056.id
  vpc = true
}

resource "aws_instance" "mpc056" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc057" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc057.id
  vpc = true
}

resource "aws_instance" "mpc057" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc058" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc058.id
  vpc = true
}

resource "aws_instance" "mpc058" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc059" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc059.id
  vpc = true
}

resource "aws_instance" "mpc059" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc060" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc060.id
  vpc = true
}

resource "aws_instance" "mpc060" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc061" {
  provider = aws.us-east-1
  instance = aws_instance.mpc061.id
  vpc = true
}

resource "aws_instance" "mpc061" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc062" {
  provider = aws.us-west-1
  instance = aws_instance.mpc062.id
  vpc = true
}

resource "aws_instance" "mpc062" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc063" {
  provider = aws.us-east-2
  instance = aws_instance.mpc063.id
  vpc = true
}

resource "aws_instance" "mpc063" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.nano"
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
  provider = aws.us-west-2
  instance = aws_instance.mpc064.id
  vpc = true
}

resource "aws_instance" "mpc064" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc065" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc065.id
  vpc = true
}

resource "aws_instance" "mpc065" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc066" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc066.id
  vpc = true
}

resource "aws_instance" "mpc066" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc067" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc067.id
  vpc = true
}

resource "aws_instance" "mpc067" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc068" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc068.id
  vpc = true
}

resource "aws_instance" "mpc068" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc069" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc069.id
  vpc = true
}

resource "aws_instance" "mpc069" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc070" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc070.id
  vpc = true
}

resource "aws_instance" "mpc070" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc071" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc071.id
  vpc = true
}

resource "aws_instance" "mpc071" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc072" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc072.id
  vpc = true
}

resource "aws_instance" "mpc072" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc073" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc073.id
  vpc = true
}

resource "aws_instance" "mpc073" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc074" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc074.id
  vpc = true
}

resource "aws_instance" "mpc074" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc075" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc075.id
  vpc = true
}

resource "aws_instance" "mpc075" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc076" {
  provider = aws.us-east-1
  instance = aws_instance.mpc076.id
  vpc = true
}

resource "aws_instance" "mpc076" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc077" {
  provider = aws.us-west-1
  instance = aws_instance.mpc077.id
  vpc = true
}

resource "aws_instance" "mpc077" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc078" {
  provider = aws.us-east-2
  instance = aws_instance.mpc078.id
  vpc = true
}

resource "aws_instance" "mpc078" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.nano"
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
  provider = aws.us-west-2
  instance = aws_instance.mpc079.id
  vpc = true
}

resource "aws_instance" "mpc079" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc080" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc080.id
  vpc = true
}

resource "aws_instance" "mpc080" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc081" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc081.id
  vpc = true
}

resource "aws_instance" "mpc081" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc082" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc082.id
  vpc = true
}

resource "aws_instance" "mpc082" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc083" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc083.id
  vpc = true
}

resource "aws_instance" "mpc083" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc084" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc084.id
  vpc = true
}

resource "aws_instance" "mpc084" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc085" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc085.id
  vpc = true
}

resource "aws_instance" "mpc085" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc086" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc086.id
  vpc = true
}

resource "aws_instance" "mpc086" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc087" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc087.id
  vpc = true
}

resource "aws_instance" "mpc087" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc088" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc088.id
  vpc = true
}

resource "aws_instance" "mpc088" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc089" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc089.id
  vpc = true
}

resource "aws_instance" "mpc089" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc090" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc090.id
  vpc = true
}

resource "aws_instance" "mpc090" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc091" {
  provider = aws.us-east-1
  instance = aws_instance.mpc091.id
  vpc = true
}

resource "aws_instance" "mpc091" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc092" {
  provider = aws.us-west-1
  instance = aws_instance.mpc092.id
  vpc = true
}

resource "aws_instance" "mpc092" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc093" {
  provider = aws.us-east-2
  instance = aws_instance.mpc093.id
  vpc = true
}

resource "aws_instance" "mpc093" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc094" {
  provider = aws.us-west-2
  instance = aws_instance.mpc094.id
  vpc = true
}

resource "aws_instance" "mpc094" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.nano"
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
  provider = aws.ap-south-1
  instance = aws_instance.mpc095.id
  vpc = true
}

resource "aws_instance" "mpc095" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-south-1.name}"]
}

resource "aws_eip" "mpc096" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc096.id
  vpc = true
}

resource "aws_instance" "mpc096" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc097" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc097.id
  vpc = true
}

resource "aws_instance" "mpc097" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc098" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc098.id
  vpc = true
}

resource "aws_instance" "mpc098" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc099" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc099.id
  vpc = true
}

resource "aws_instance" "mpc099" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc100" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc100.id
  vpc = true
}

resource "aws_instance" "mpc100" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc101" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc101.id
  vpc = true
}

resource "aws_instance" "mpc101" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc102" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc102.id
  vpc = true
}

resource "aws_instance" "mpc102" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc103" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc103.id
  vpc = true
}

resource "aws_instance" "mpc103" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc104" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc104.id
  vpc = true
}

resource "aws_instance" "mpc104" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc105" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc105.id
  vpc = true
}

resource "aws_instance" "mpc105" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc106" {
  provider = aws.us-east-1
  instance = aws_instance.mpc106.id
  vpc = true
}

resource "aws_instance" "mpc106" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc107" {
  provider = aws.us-west-1
  instance = aws_instance.mpc107.id
  vpc = true
}

resource "aws_instance" "mpc107" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc108" {
  provider = aws.us-east-2
  instance = aws_instance.mpc108.id
  vpc = true
}

resource "aws_instance" "mpc108" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc109" {
  provider = aws.us-west-2
  instance = aws_instance.mpc109.id
  vpc = true
}

resource "aws_instance" "mpc109" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc110" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc110.id
  vpc = true
}

resource "aws_instance" "mpc110" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.nano"
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
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc111.id
  vpc = true
}

resource "aws_instance" "mpc111" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc112" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc112.id
  vpc = true
}

resource "aws_instance" "mpc112" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc113" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc113.id
  vpc = true
}

resource "aws_instance" "mpc113" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

resource "aws_eip" "mpc114" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc114.id
  vpc = true
}

resource "aws_instance" "mpc114" {
  provider = aws.ap-southeast-2
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-2.name}"]
}

resource "aws_eip" "mpc115" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc115.id
  vpc = true
}

resource "aws_instance" "mpc115" {
  provider = aws.ca-central-1
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ca-central-1.name}"]
}

resource "aws_eip" "mpc116" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc116.id
  vpc = true
}

resource "aws_instance" "mpc116" {
  provider = aws.eu-central-1
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc117" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc117.id
  vpc = true
}

resource "aws_instance" "mpc117" {
  provider = aws.eu-west-1
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-1.name}"]
}

resource "aws_eip" "mpc118" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc118.id
  vpc = true
}

resource "aws_instance" "mpc118" {
  provider = aws.eu-west-2
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-2.name}"]
}

resource "aws_eip" "mpc119" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc119.id
  vpc = true
}

resource "aws_instance" "mpc119" {
  provider = aws.eu-west-3
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.eu-west-3.name}"]
}

resource "aws_eip" "mpc120" {
  provider = aws.sa-east-1
  instance = aws_instance.mpc120.id
  vpc = true
}

resource "aws_instance" "mpc120" {
  provider = aws.sa-east-1
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc121" {
  provider = aws.us-east-1
  instance = aws_instance.mpc121.id
  vpc = true
}

resource "aws_instance" "mpc121" {
  provider = aws.us-east-1
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-1.name}"]
}

resource "aws_eip" "mpc122" {
  provider = aws.us-west-1
  instance = aws_instance.mpc122.id
  vpc = true
}

resource "aws_instance" "mpc122" {
  provider = aws.us-west-1
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc123" {
  provider = aws.us-east-2
  instance = aws_instance.mpc123.id
  vpc = true
}

resource "aws_instance" "mpc123" {
  provider = aws.us-east-2
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc124" {
  provider = aws.us-west-2
  instance = aws_instance.mpc124.id
  vpc = true
}

resource "aws_instance" "mpc124" {
  provider = aws.us-west-2
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.us-west-2.name}"]
}

resource "aws_eip" "mpc125" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc125.id
  vpc = true
}

resource "aws_instance" "mpc125" {
  provider = aws.ap-south-1
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t2.nano"
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
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc126.id
  vpc = true
}

resource "aws_instance" "mpc126" {
  provider = aws.ap-northeast-1
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-1.name}"]
}

resource "aws_eip" "mpc127" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc127.id
  vpc = true
}

resource "aws_instance" "mpc127" {
  provider = aws.ap-northeast-2
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-northeast-2.name}"]
}

resource "aws_eip" "mpc128" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc128.id
  vpc = true
}

resource "aws_instance" "mpc128" {
  provider = aws.ap-southeast-1
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t2.nano"
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

 security_groups = ["${aws_security_group.ap-southeast-1.name}"]
}

