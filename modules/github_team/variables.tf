variable "team" {
  description = "The configuration of the project team"
  type = object({
    name        = string
    description = string
    privacy     = string
    members = list(object({
      username = string
      role     = string
    }))
  })
  # default = {
  #   name        = "some-team",
  #   description = "Some cool team",
  #   privacy     = "closed",
  #   members = [
  #     {
  #       username = "ievhen2013",
  #       role     = "maintainer"
  #     },
  #     {
  #       username = "volodymyr-devops",
  #       role     = "maintainer"
  #     },
  #   ]
  # }
}