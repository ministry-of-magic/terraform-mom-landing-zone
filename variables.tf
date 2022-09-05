variable "project" {
  type        = string
  description = <<DESC
    (Required)  The project acronym to use for the landing zone(s). This should be no longer than
    4 characters.

    Example: 'blt'
  DESC

  validation {
    condition     = length(var.project) <= 4
    error_message = "Err: the project acronym is too long, it cannot be longer than 4 characters."
  }
}

variable "location" {
  type        = string
  description = <<DESC
    (Optional)  The location where the landing zone will be produced.

    [Default: 'australieast']
  DESC

  default = "australiaeast"

  validation {
    condition     = contains(["australiaeast"], var.location)
    error_message = "Err: resources must be provisioned within the 'australiaeast' region."
  }
}

variable "environments" {
  type        = list(string)
  description = <<DESC
    (Optional)  Environments to provision for the landing zone.

    [Default: '["dev", "stg", "prd"]']
  DESC
  default     = ["dev", "stg", "prd"]

  validation {
    condition = alltrue(
      [
        for e in var.environments :
        true
        if contains(["dev", "tst", "uat", "stg", "prd"], e)
      ]
    )
    error_message = "Err: environments must be one or more of, 'dev', 'tst', 'uat', 'stg', 'prd'."
  }
}

variable "users" {
  type        = map(string)
  description = <<DESC
    (Required)  Map of users and their role to provision access to the landing zone this should be
    the users GitHub username. Valid roles are:
      'maintainer'
      'member'

    Example: `{"BrendanThompson" = "member"}`
  DESC

  validation {
    condition = alltrue(
      [
        for u, r in var.users :
        true
        if contains(["maintainer", "member"], r)
      ]
    )
    error_message = "Err: user must either be a 'maintainer' or 'member'."
  }
}
