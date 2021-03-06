variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
}

variable "cost_centre" {
  description = "The TNA cost centre used for TDR"
  type        = string
}
