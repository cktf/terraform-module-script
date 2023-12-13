resource "terraform_data" "this" {
  triggers_replace = {
    connection = jsonencode(var.connection)
    create     = var.create
    destroy    = var.destroy
  }

  connection {
    type                = try(jsondecode(self.triggers_replace.connection).type, null)
    host                = try(jsondecode(self.triggers_replace.connection).host, null)
    port                = try(jsondecode(self.triggers_replace.connection).port, null)
    user                = try(jsondecode(self.triggers_replace.connection).user, null)
    password            = try(jsondecode(self.triggers_replace.connection).password, null)
    timeout             = try(jsondecode(self.triggers_replace.connection).timeout, null)
    script_path         = try(jsondecode(self.triggers_replace.connection).script_path, null)
    private_key         = try(jsondecode(self.triggers_replace.connection).private_key, null)
    certificate         = try(jsondecode(self.triggers_replace.connection).certificate, null)
    agent               = try(jsondecode(self.triggers_replace.connection).agent, null)
    agent_identity      = try(jsondecode(self.triggers_replace.connection).agent_identity, null)
    host_key            = try(jsondecode(self.triggers_replace.connection).host_key, null)
    https               = try(jsondecode(self.triggers_replace.connection).https, null)
    insecure            = try(jsondecode(self.triggers_replace.connection).insecure, null)
    use_ntlm            = try(jsondecode(self.triggers_replace.connection).use_ntlm, null)
    cacert              = try(jsondecode(self.triggers_replace.connection).cacert, null)
    bastion_host        = try(jsondecode(self.triggers_replace.connection).bastion_host, null)
    bastion_host_key    = try(jsondecode(self.triggers_replace.connection).bastion_host_key, null)
    bastion_port        = try(jsondecode(self.triggers_replace.connection).bastion_port, null)
    bastion_user        = try(jsondecode(self.triggers_replace.connection).bastion_user, null)
    bastion_password    = try(jsondecode(self.triggers_replace.connection).bastion_password, null)
    bastion_private_key = try(jsondecode(self.triggers_replace.connection).bastion_private_key, null)
    bastion_certificate = try(jsondecode(self.triggers_replace.connection).bastion_certificate, null)
  }

  provisioner "remote-exec" {
    when = create
    inline = [
      "export DEBIAN_FRONTEND=noninteractive",
      "echo '${try(jsondecode(self.triggers_replace.connection).password, "")}' | sudo -S -v",
      "echo ${base64encode(self.triggers_replace.create)} | base64 -d | sudo sh"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "export DEBIAN_FRONTEND=noninteractive",
      "echo '${try(jsondecode(self.triggers_replace.connection).password, "")}' | sudo -S -v",
      "echo ${base64encode(self.triggers_replace.destroy)} | base64 -d | sudo sh"
    ]
  }
}
