## Create a NACL

```sh
aws ec2 create-network-acl --vpc-id vpc-0b9a876a1f8dc1da6
```

## Explicitly associate NACL with subnet

```sh
subnet_ass_id=$(aws ec2 describe-network-acls \
--query "NetworkAcls[*].Associations[?SubnetId=='subnet-0afd549a9710268fe'].[NetworkAclId, NetworkAclAssociationId]" \
--output text)
```

```sh
aws ec2 replace-network-acl-association \
--association-id "$subnet_ass_id" \
--network-acl-id acl-086a2f27ebdc8b829
```

## Create a rule to block my ip address

```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-086a2f27ebdc8b829 \
--ingress \
--rule-number 90 \
--protocol -1 \
--cidr-block 175.157.22.62/32 \
--rule-action deny
```

## Extra: (Get AMI image id for Amazon Linux 2 for EC2 instance creation for testing NACL)

```sh
aws ec2 describe-images \
--region ap-south-1 \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
--query 'Images | sort_by(@, &CreationDate) | [-1].ImageId' \
--output text
```
