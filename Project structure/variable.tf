variable "subnet" {
  type = map(object({
    cidr_block = string
    region     = string
  }))
}

variable "machine_type"{
    type= string
}

variable "image"{
    type= string
}