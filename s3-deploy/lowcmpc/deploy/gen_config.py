regions20 = ["us-east-1",
           "us-west-1",
           "us-east-2",
           "us-west-2",
           "af-south-1",
           "ap-east-1",
           "ap-south-1",
           "ap-northeast-1",
           "ap-northeast-2",
           "ap-southeast-1",
           "ap-southeast-2",
           "ca-central-1",
           "eu-central-1",
           "eu-west-1",
           "eu-west-2",
           "eu-south-1",
           "eu-west-3",
           "eu-north-1",
           "me-south-1",
           "sa-east-1"]

regions = ["us-east-1",
           "us-west-1",
           "us-east-2",
           "us-west-2",
           "ap-south-1",
           "ap-northeast-1",
           "ap-northeast-2",
           "ap-southeast-1",
           "ap-southeast-2",
           "ca-central-1",
           "eu-central-1",
           "eu-west-1",
           "eu-west-2",
           "eu-west-3",
           "sa-east-1"]




num_regions = len(regions)

for i in range(1, 65):
    print("resource \"aws_eip\" \"mpc" + str(i).zfill(3) + "\" {")
    print("  provider = aws." + regions[(i-1)%num_regions])
    print("  instance = aws_instance.mpc" + str(i).zfill(3) + ".id")
    print("  vpc = true")
    print("}")
    print("");

    print("resource \"aws_instance\" \"mpc" + str(i).zfill(3) +"\" {")
    print("  provider = aws." + regions[(i-1)%num_regions])
    print("  ami           = \"${data.aws_ami." + regions[(i-1)%num_regions] + ".id}\"")
    print("  instance_type = \"t2.nano\"")
    print("  key_name = \"dstarin_aws\"")
    print("  user_data = file(\"userdata.sh\")")
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
    print(" security_groups = [\"${aws_security_group." + regions[(i-1)%num_regions] + ".name}\"]")
    print("}")
    print("")
