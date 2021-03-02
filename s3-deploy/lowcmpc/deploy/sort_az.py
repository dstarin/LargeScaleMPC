azs = ["af-south-1a",
       "af-south-1b",
       "af-south-1c",
       "ap-east-1a",
       "ap-east-1b",
       "ap-east-1c",
       "ap-northeast-1a",
       "ap-northeast-1c",
       "ap-northeast-1d",
       "ap-northeast-2a",
       "ap-northeast-2b",
       "ap-northeast-2c",
       "ap-northeast-2d",
       "ap-south-1a",
       "ap-south-1b",
       "ap-south-1c",
       "ap-southeast-1a",
       "ap-southeast-1b",
       "ap-southeast-1c",
       "ap-southeast-2a",
       "ap-southeast-2b",
       "ap-southeast-2c",
       "ca-central-1a",
       "ca-central-1b",
       "ca-central-1d",
       "eu-central-1a",
       "eu-central-1b",
       "eu-central-1c",
       "eu-north-1a",
       "eu-north-1b",
       "eu-north-1c",
       "eu-south-1a",
       "eu-south-1b",
       "eu-south-1c",
       "eu-west-1a",
       "eu-west-1b",
       "eu-west-1c",
       "eu-west-2a",
       "eu-west-2b",
       "eu-west-2c",
       "eu-west-3a",
       "eu-west-3b",
       "eu-west-3c",
       "me-south-1a",
       "me-south-1b",
       "me-south-1c",
       "sa-east-1a",
       "sa-east-1b",
       "sa-east-1c",
       "us-east-1a",
       "us-east-1b",
       "us-east-1c",
       "us-east-1d",
       "us-east-1e",
       "us-east-1f",
       "us-east-2a",
       "us-east-2b",
       "us-east-2c",
       "us-west-1a",
       "us-west-1b",
       "us-west-2a",
       "us-west-2b",
       "us-west-2c",
       "us-west-2d"]

# sort reverse alpha to get us based first
azs_sorted1 = sorted(azs, key=lambda x: x[0], reverse=True)

# sort by a, b, c, etc
azs_sorted = sorted(azs_sorted1, key=lambda x: x[-1:])

#print(azs_sorted)
#['us-east-1a', 'us-east-2a', 'us-west-1a', 'us-west-2a', 'sa-east-1a', 'me-south-1a', 'eu-central-1a', 'eu-north-1a', 'eu-south-1a', 'eu-west-1a', 'eu-west-2a', 'eu-west-3a', 'ca-central-1a', 'af-south-1a', 'ap-east-1a', 'ap-northeast-1a', 'ap-northeast-2a', 'ap-south-1a', 'ap-southeast-1a', 'ap-southeast-2a', 'us-east-1b', 'us-east-2b', 'us-west-1b', 'us-west-2b', 'sa-east-1b', 'me-south-1b', 'eu-central-1b', 'eu-north-1b', 'eu-south-1b', 'eu-west-1b', 'eu-west-2b', 'eu-west-3b', 'ca-central-1b', 'af-south-1b', 'ap-east-1b', 'ap-northeast-2b', 'ap-south-1b', 'ap-southeast-1b', 'ap-southeast-2b', 'us-east-1c', 'us-east-2c', 'us-west-2c', 'sa-east-1c', 'me-south-1c', 'eu-central-1c', 'eu-north-1c', 'eu-south-1c', 'eu-west-1c', 'eu-west-2c', 'eu-west-3c', 'af-south-1c', 'ap-east-1c', 'ap-northeast-1c', 'ap-northeast-2c', 'ap-south-1c', 'ap-southeast-1c', 'ap-southeast-2c', 'us-east-1d', 'us-west-2d', 'ca-central-1d', 'ap-northeast-1d', 'ap-northeast-2d', 'us-east-1e', 'us-east-1f']

for i in range(1, 9):
    print("resource \"aws_eip\" \"mpc" + str(i).zfill(3) + "\" {")
    print("  provider = aws." + azs_sorted[(i-1)%64][:-1])
    print("  instance = aws_instance.mpc" + str(i).zfill(3) + ".id")
    print("  vpc = true")
    print("}")
    print("");

    print("resource \"aws_instance\" \"mpc" + str(i).zfill(3) +"\" {")
    print("  provider = aws." + azs_sorted[(i-1)%64][:-1])
    print("  availability_zone = \"" + azs_sorted[(i-1)%64] + "\"")
    print("  ami           = \"${data.aws_ami." + azs_sorted[(i-1)%64][:-1] + ".id}\"")
    print("  instance_type = \"t3.nano\"")
    print("  key_name = \"dstarin_aws\"")
    print("#  user_data = file(\"userdata.sh\")")
    print("")
    print("#  root_block_device {")
    print("#      volume_type = \"gp2\"")
    print("#      volume_size = \"100\"")
    print("#      delete_on_termination = \"true\"")
    print("#  }")
    print("")
    print("  tags = {")
    print("    Name = \"mpc" + str(i).zfill(3) + "\"")
    print("  }")
    print("")
    print("  security_groups = [\"${aws_security_group." + azs_sorted[(i-1)%64][:-1] + ".name}\"]")
    print("}")
    print("")

