variable "region" {
  type        = string
  description = "Name of the region to upload images to"
}

variable "architectures" {
  type        = list
  description = "List of supported architectures by cloud"
}