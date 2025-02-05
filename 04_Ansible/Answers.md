# 4.1 Ansible inventories

1. Ansible inventory là file cấu hình định nghĩa các host mà Ansible sẽ quản lý

2. 
- Host và các nhóm host 
- Các tham số cho việc kết nối đến host 
- Các biến 

3.  ```bash
    [group:vars]
    key=value
    ````

4. Children trong inventory được sử dụng để tạo ra các mối quan hệ parent/children hay nested groups. Các children sẽ là các groups con trong group cha lớn hơn

# 4.2 Playbooks
1. Ansible playbook là những bản thiết kế tự động hóa, được viết bằng YAML. Ansible dùng playbook để triển khai và cấu hình các node trong inventory

2. 
- Basic structure của playbook bao gồm các plays, mỗi plays bao gồm các tasks để thực hiện trên các hosts
- Basic structure bao gồm thông tin về một hoặc nhiều group host mà play sẽ thực hiện, các tasks cần thực hiện và module ansible cần dùng trong tasks

3. Playbook thực thi các task theo thứ tự, từ trên xuống dưới

# 4.3 Ansible roles
1. Ansible role cho phép ta load các biến, file, tasks,... dựa trên một cấu trúc thư mục đã định nghĩa. 

2. Cấu trúc thư mục của một role gồm 7 thư mục chuẩn:
- tasks/main.yml: Một danh sách các tasks mà role cung cấp đến play để thực thi
-  handlers/main.yml: Các handlers được import vào play để sử dụng trong các tasks
- defaults/main.yml: Các biến có độ ưu tiên thấp. Các role sẽ ưu tiên biến mặc định của bản thân hơn là các role khác. Tuy nhiên, khi có bất cứ nguồn biến nào khác thì chúng sẽ bị ghi đè
- vars/main.yml: Các biến có độ ưu tiên cao hơn
- files/stuff.txt: Các file được cung cấp cho role và các children của nó
- templates/something.j2: Template được sử dụng cho role và các role con
- meta/main.yml: Chứa metadata của role.

3. 
- `include_role`: Sử dụng role động. Chỉ khi nào thực thi đến câu lệnh mới có thể sử dụng role
- `import_role`: Sử dụng role tĩnh. Role được thêm từ đầu khi chạy playbook 

# 4.4 Ansible variablé
1. 
- Chỉ được dùng các ký tự chữ, số và dấu gạch dưới
- Không được dùng các keyword trong python và playbook 
- Không được bắt đầu bằng số
2. 
- simple
- boolean
- list
- dictionary
- combine
- register
3. `"{{ var }}"`
4. 
Nơi đặt biến theo thứ tự ưu tiên từ thấp đến cao:
- Giá trị command line

- role defaults 

- inventory file hoặc script group vars 

- inventory group_vars/all 

- playbook group_vars/all 

- inventory group_vars/* 

- playbook group_vars/* 

- inventory file hoặc script host vars 

- inventory host_vars/* 

- playbook host_vars/* 

- host facts / cached set_facts 

- play vars

- play vars_prompt

- play vars_files

- role vars

- block vars 

- task var

- include_vars

- set_facts / registered vars

- role (và include_role) params

- include params

- extra vars 