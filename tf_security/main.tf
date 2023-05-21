#suppose this res needs to be created in region 1

resource "aws_eip" "eip1"{
    vpc = true
}

#suppose this res needs to be created in region 2 -> use provider name.alias
resource "aws_eip" "eip2"{
    vpc = true
    provider = aws.mumbai
    # profile = "pf2" --> if another aws account
}

output "eipid"{
    value = eip1.private_ip
    sensative = true //an arg to not display any sensitive o/p on cmd
}