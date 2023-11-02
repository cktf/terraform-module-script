# Terraform Module Script

![pipeline](https://github.com/cktf/terraform-module-script/actions/workflows/cicd.yml/badge.svg)
![release](https://img.shields.io/github/v/release/cktf/terraform-module-script?display_name=tag)
![license](https://img.shields.io/github/license/cktf/terraform-module-script)

**Script** is a Terraform module useful for running **create** and **destroy** scripts on **remote machines**

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```bash
terraform init
```

## Usage

```hcl
module "script" {
  source = "cktf/script/module"

  connection = {
    type     = "ssh"
    host     = "192.168.100.100"
    port     = 22
    user     = "root"
    password = "pass"
  }

  create  = <<-EOF
    apt install -y docker.io
  EOF
  destroy = <<-EOF
    apt remove -y docker.io
  EOF
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This project is licensed under the [MIT](LICENSE.md).  
Copyright (c) KoLiBer (koliberr136a1@gmail.com)
