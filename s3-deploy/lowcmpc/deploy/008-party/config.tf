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
  availability_zone = "us-east-1a"
  ami           = "${data.aws_ami.us-east-1.id}"
  instance_type = "t3.nano"
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
  provider = aws.us-east-2
  instance = aws_instance.mpc002.id
  vpc = true
}

resource "aws_instance" "mpc002" {
  provider = aws.us-east-2
  availability_zone = "us-east-2a"
  ami           = "${data.aws_ami.us-east-2.id}"
  instance_type = "t3.nano"
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

  security_groups = ["${aws_security_group.us-east-2.name}"]
}

resource "aws_eip" "mpc003" {
  provider = aws.us-west-1
  instance = aws_instance.mpc003.id
  vpc = true
}

resource "aws_instance" "mpc003" {
  provider = aws.us-west-1
  availability_zone = "us-west-1a"
  ami           = "${data.aws_ami.us-west-1.id}"
  instance_type = "t3.nano"
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

  security_groups = ["${aws_security_group.us-west-1.name}"]
}

resource "aws_eip" "mpc004" {
  provider = aws.us-west-2
  instance = aws_instance.mpc004.id
  vpc = true
}

resource "aws_instance" "mpc004" {
  provider = aws.us-west-2
  availability_zone = "us-west-2a"
  ami           = "${data.aws_ami.us-west-2.id}"
  instance_type = "t3.nano"
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
  provider = aws.sa-east-1
  instance = aws_instance.mpc005.id
  vpc = true
}

resource "aws_instance" "mpc005" {
  provider = aws.sa-east-1
  availability_zone = "sa-east-1a"
  ami           = "${data.aws_ami.sa-east-1.id}"
  instance_type = "t3.nano"
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

  security_groups = ["${aws_security_group.sa-east-1.name}"]
}

resource "aws_eip" "mpc006" {
  provider = aws.me-south-1
  instance = aws_instance.mpc006.id
  vpc = true
}

resource "aws_instance" "mpc006" {
  provider = aws.me-south-1
  availability_zone = "me-south-1a"
  ami           = "${data.aws_ami.me-south-1.id}"
  instance_type = "t3.nano"
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

  security_groups = ["${aws_security_group.me-south-1.name}"]
}

resource "aws_eip" "mpc007" {
  provider = aws.eu-central-1
  instance = aws_instance.mpc007.id
  vpc = true
}

resource "aws_instance" "mpc007" {
  provider = aws.eu-central-1
  availability_zone = "eu-central-1a"
  ami           = "${data.aws_ami.eu-central-1.id}"
  instance_type = "t3.nano"
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

  security_groups = ["${aws_security_group.eu-central-1.name}"]
}

resource "aws_eip" "mpc008" {
  provider = aws.eu-north-1
  instance = aws_instance.mpc008.id
  vpc = true
}

resource "aws_instance" "mpc008" {
  provider = aws.eu-north-1
  availability_zone = "eu-north-1a"
  ami           = "${data.aws_ami.eu-north-1.id}"
  instance_type = "t3.nano"
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

  security_groups = ["${aws_security_group.eu-north-1.name}"]
}
