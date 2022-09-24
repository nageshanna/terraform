variable "string_example" {
  type = string  
}
variable "number_example" {
 type = number  
}
variable "bool_example" {
    type = bool
  
}
variable "list_example" {
  type = list(string)
  default = [ "sg1","sg2","sg3" ]
}
variable "object_example" {
  type = object({
    name = string
    new_tag = number
  })   
  
}