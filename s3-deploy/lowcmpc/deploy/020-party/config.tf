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
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc001"
  }
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
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc002"
  }
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
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc003"
  }
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
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc004"
  }
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
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc005"
  }
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
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc006"
  }
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
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc007"
  }
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
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc008"
  }
}

resource "aws_eip" "mpc009" {
  provider = aws.eu-south-1
  instance = aws_instance.mpc009.id
  vpc = true
}

resource "aws_instance" "mpc009" {
  provider = aws.eu-south-1
  availability_zone = "eu-south-1a"
  ami           = "${data.aws_ami.eu-south-1.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc009"
  }
}

resource "aws_eip" "mpc010" {
  provider = aws.eu-west-1
  instance = aws_instance.mpc010.id
  vpc = true
}

resource "aws_instance" "mpc010" {
  provider = aws.eu-west-1
  availability_zone = "eu-west-1a"
  ami           = "${data.aws_ami.eu-west-1.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc010"
  }
}

resource "aws_eip" "mpc011" {
  provider = aws.eu-west-2
  instance = aws_instance.mpc011.id
  vpc = true
}

resource "aws_instance" "mpc011" {
  provider = aws.eu-west-2
  availability_zone = "eu-west-2a"
  ami           = "${data.aws_ami.eu-west-2.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc011"
  }
}

resource "aws_eip" "mpc012" {
  provider = aws.eu-west-3
  instance = aws_instance.mpc012.id
  vpc = true
}

resource "aws_instance" "mpc012" {
  provider = aws.eu-west-3
  availability_zone = "eu-west-3a"
  ami           = "${data.aws_ami.eu-west-3.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc012"
  }
}

resource "aws_eip" "mpc013" {
  provider = aws.ca-central-1
  instance = aws_instance.mpc013.id
  vpc = true
}

resource "aws_instance" "mpc013" {
  provider = aws.ca-central-1
  availability_zone = "ca-central-1a"
  ami           = "${data.aws_ami.ca-central-1.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc013"
  }
}

resource "aws_eip" "mpc014" {
  provider = aws.af-south-1
  instance = aws_instance.mpc014.id
  vpc = true
}

resource "aws_instance" "mpc014" {
  provider = aws.af-south-1
  availability_zone = "af-south-1a"
  ami           = "${data.aws_ami.af-south-1.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc014"
  }
}

resource "aws_eip" "mpc015" {
  provider = aws.ap-east-1
  instance = aws_instance.mpc015.id
  vpc = true
}

resource "aws_instance" "mpc015" {
  provider = aws.ap-east-1
  availability_zone = "ap-east-1a"
  ami           = "${data.aws_ami.ap-east-1.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc015"
  }
}

resource "aws_eip" "mpc016" {
  provider = aws.ap-northeast-1
  instance = aws_instance.mpc016.id
  vpc = true
}

resource "aws_instance" "mpc016" {
  provider = aws.ap-northeast-1
  availability_zone = "ap-northeast-1a"
  ami           = "${data.aws_ami.ap-northeast-1.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc016"
  }
}

resource "aws_eip" "mpc017" {
  provider = aws.ap-northeast-2
  instance = aws_instance.mpc017.id
  vpc = true
}

resource "aws_instance" "mpc017" {
  provider = aws.ap-northeast-2
  availability_zone = "ap-northeast-2a"
  ami           = "${data.aws_ami.ap-northeast-2.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc017"
  }
}

resource "aws_eip" "mpc018" {
  provider = aws.ap-south-1
  instance = aws_instance.mpc018.id
  vpc = true
}

resource "aws_instance" "mpc018" {
  provider = aws.ap-south-1
  availability_zone = "ap-south-1a"
  ami           = "${data.aws_ami.ap-south-1.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc018"
  }
}

resource "aws_eip" "mpc019" {
  provider = aws.ap-southeast-1
  instance = aws_instance.mpc019.id
  vpc = true
}

resource "aws_instance" "mpc019" {
  provider = aws.ap-southeast-1
  availability_zone = "ap-southeast-1a"
  ami           = "${data.aws_ami.ap-southeast-1.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc019"
  }
}

resource "aws_eip" "mpc020" {
  provider = aws.ap-southeast-2
  instance = aws_instance.mpc020.id
  vpc = true
}

resource "aws_instance" "mpc020" {
  provider = aws.ap-southeast-2
  availability_zone = "ap-southeast-2a"
  ami           = "${data.aws_ami.ap-southeast-2.id}"
  instance_type = "t3.nano"
  key_name = "dstarin_aws"
#  user_data = file("userdata.sh")

#  root_block_device {
#      volume_type = "gp2"
#      volume_size = "100"
#      delete_on_termination = "true"
#  }

  tags = {
    Name = "mpc020"
  }
}
