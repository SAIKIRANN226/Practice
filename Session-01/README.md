# Terraform provisioners
- local-exec
- remote exec

### Locals in terraform 
In locals we dont have count.index because count.index is only used for creating multiple instances and route53 records, count.index refers to current itiration, which does not support in locals 
