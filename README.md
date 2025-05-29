# Product_Management_System_Java

#File Format

ProductWebApp/
├── WebContent/
│ ├── index.jsp
│ ├── productadd.jsp
│ ├── productupdate.jsp
│ ├── productdelete.jsp
│ ├── productdisplay.jsp
│ ├── reports.jsp
│ ├── report_form.jsp
│ └── report_result.jsp


#index page(Home Page):
https://github.com/4AL22CS045/Product_Management_System_Java/blob/main/servlet/index%20page.png

#Add Product(Add Page):
https://github.com/4AL22CS045/Product_Management_System_Java/blob/main/servlet/Add%20Product.png

#Delete Product(Delete Page):
https://github.com/4AL22CS045/Product_Management_System_Java/blob/main/servlet/Delete%20Product.png

#Update ProductDetails(Upadte Page):
https://github.com/4AL22CS045/Product_Management_System_Java/blob/main/servlet/Update%20Product%20DFetails.png

#Display ProductList(Product List Page):
https://github.com/4AL22CS045/Product_Management_System_Java/blob/main/servlet/Product%20List.png

#Product Report(Report page):
https://github.com/4AL22CS045/Product_Management_System_Java/blob/main/servlet/Generate%20Reports.png

#DataBase
https://github.com/4AL22CS045/Product_Management_System_Java/blob/main/dao/DataBase.png

MySQL DATABASE :

CREATE DATABASE productdb;

use productdb;

CREATE TABLE Products (

ProductID INT PRIMARY KEY,

ProductName VARCHAR(100),

Category VARCHAR(50),

Price DECIMAL(10,2),

Quantity INT

);

