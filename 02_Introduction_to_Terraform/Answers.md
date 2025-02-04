1. Các câu lệnh cơ bản trong terraform
 - terraform init: Khởi tạo một thư mục làm việc của Terraform
 - terraform plan: Tạo kế hoạch thực thi (execution plan), thể hiện những thay đổi sẽ được thực hiện với cơ sở hạ tầng
 - terraform apply: Thực thi những thay đổi từ kế hoạch
 - terraform destroy: Hủy bỏ các tài nguyên, cơ sở hạ tầng đã cấu hình

2. Để định nghĩa biến trong Terraform, ta có thế:
- Sử dụng khối `variable`
- Định nghĩa trong file `.tfvars`
- Định nghĩa biến môi trường từ command line

3. Định nghĩa output bằng khối `output`: 
```HCL
output "output_name" {
  value = resource_or_variable
}
```