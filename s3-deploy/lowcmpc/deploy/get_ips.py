import boto3
import os

regions = ["us-east-1",
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

hostnames = []
for region in regions:
    ec2 = boto3.resource('ec2', region_name=region)
    client = boto3.client('ec2', region_name=region)

    addresses_dict = client.describe_addresses()
    for eip_dict in addresses_dict['Addresses']:
        instanceId = eip_dict['InstanceId']
        instance = ec2.Instance(instanceId)
        instanceName = ''
        for tags in instance.tags:
            if tags["Key"] == 'Name':
                instanceName = tags["Value"]
        print(eip_dict['PublicIp'] + " " + instanceName)
        hostnames.append(eip_dict['PublicIp'] + " " + instanceName)

print("")
print("sorting " + str(len(hostnames)) + " hosts...")
print("")
sorted_hosts = sorted(hostnames, key=lambda x: x.split(" ")[1])
if os.path.isfile("hosts"):
    os.remove("hosts")
for host in sorted_hosts:
    print(host)
    print(host, file=open("hosts", "a"))
