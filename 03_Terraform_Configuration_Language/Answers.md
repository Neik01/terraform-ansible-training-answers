# 3.1 Resources and data sources
1.
- Resources: Dùng để tạo và quản lý hạ tầng và có thể được theo dõi bằng state của terraform
- Data sources: Dùng để lấy và sử dụng thông tin từ ngoài terraform. Không làm thay đổi tài nguyên của terraform. 

2. 
- Resource dependencies xuất hiện khi một resource phụ thuộc vào sự tồn tại của một resource khác. terraform sẽ dựa vào dependencies để xác định thứ tự mà các tài nguyên được tạo, sửa, xóa
- Có thể thiết lập quan hệ phụ thuọc giữa các resources bằng Implicit dependencies hoặc Explicit dependencies

3. 
- Để tạo nhiều resources tương tự/giống nhau, có thể dùng `count` hoặc `for_each`
 + `count`: Dựa trên số thứ tự để lặp, ít linh hoạt hơn, các resource được tạo ra có tên được đánh số dựa trên index vòng lặp count.index. Để truy cập cũng dùng đến count.index. Sử dụng tốt nhất trong trường hợp cần tạo các resources giống hệt nhau, chỉ quan trong số lượng
 + `for_each`: Sử dụng cặp key và value dựa trên set, map hoặc danh sách , linh hoạt, được đánh tên theo key. Có thể truy cập thông qua each.key hoặc each.value 


# 3.2 Providers
1. Provider cung cấp các data resource và resource type cho terraform quản lý. 
2. Thông tin về các providers và tài liệu có thể tìm ở: https://registry.terraform.io/browse/providers

# 3.3 Input variables and output values 
1. Các thuộc tính của variable:
- default: Giá trị mặc định của variable, nếu được khai báo, variable có thể là tùy chọn
- type: Kiểu dữ liệu của variable
- description: Mô tả về variable
- validation: Quy tắc xác thực cho variable
- ephemeral: Variable sẽ chỉ có sẵn trong runtime, state và plan sẽ bỏ qua biến này
- sensitive: Ngăn không cho terraform hiện giá trị ra output trong lệnh apply hoặc plan, hoặc khi sử dụng dụng ở nơi khác để cấu hình
- nullable: Kiểm soát xem có thể gán giá trị null cho variable này hay không

2. Để có thể khiến terraform tự động load file .tfvas khi chạy, có 2 cách:
- Đặt tên file chính xác là `terraform.tfvars` hoặc `terraform.tfvars.json`
- Bất cứ file nào kết thúc bằng `.auto.tfvars` hoặc `auto.tfvars.json`

3. Output values làm cho thông tin về hạ tầng có thể có sẵn trên command line và mở những thông tin đó cho các cài đặt, cấu hình khác trong terraform

4. Sử dụng local values khi muốn tránh việc lặp lại các giá trị nhiều lần trong cấu hình và có khả năng giá trị đó có thể thay đổi trong tương lai

# 3.4 Expressions
1. Các kiểu dữ liệu của terraform:
- string
- number
- bool
- list/tuple
- set
- map/object

2. `${...}`

# 3.5 Backends and state
1. Backend mặc định của terraform là local. Nó lưu trữ state như là một file trên đĩa
2. State là một file lưu trữ thông tin trạng thái của hạ tầng được tạo và quản lý bởi người dùng qua terraform. Terraform sử dụng state để xác định những thay đổi nào sẽ được thực hiện với hạ tầng. 

    Mục đích chính của state là để lưu trữ liên kết giữa một đối tượng ở remote system với resource trong cấu hình. Khi terraform thực hiện tạo một đối tượng remote theo như những thay đổi của cấu hình,  nó sẽ lưu trữ định danh của đối tượng đó lên một đối tượng resource cụ thể, sau đó sẽ có thể udpate hoặc xóa đối tượng đó theo thay đổi của cấu hình trong tương lai