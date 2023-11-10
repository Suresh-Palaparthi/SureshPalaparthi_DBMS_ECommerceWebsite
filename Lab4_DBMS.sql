create database ECommerce;
use ECommerce;

create table supplier(
  SUPP_ID int primary key,
  SUPP_NAME varchar(50) NOT null,
  SUPP_CITY varchar(50) NOT null,
  SUPP_PHONE varchar(50) NOT null
  );
desc supplier;

create table customer(
  CUS_ID int primary key,
  CUS_NAME varchar(20) not null,
  CUS_PHONE varchar(10) not null
);
DROP table customer;

create table customer(
  CUS_ID int primary key,
  CUS_NAME varchar(20) not null,
  CUS_PHONE varchar(10) not null,
  CUS_CITY varchar(30) not null,
  CUS_GENDER char
);

create table category(
 CAT_ID int primary key,
 CAT_NAME varchar(20) not null
);

create table product(
  PRO_ID int primary key,
  PRO_NAME varchar(20) not null default 'DUMMY',
  PRO_DESC varchar(60),
  CAT_ID int,
  foreign key(CAT_ID) references category(CAT_ID)
);
desc product;

create table if not exists supplier_pricing(
   PRICING_ID int primary key,
   PRO_ID int,
   SUPP_ID int,
   SUPP_PRICE int default 0,
   foreign key(PRO_ID) references product(PRO_ID),
   foreign key(SUPP_ID) references supplier(SUPP_ID)
);
desc supplier_pricing;

create table if not exists `order`(
   ORD_ID int primary key,
   ORD_AMOUNT int not null,
   ORD_DATE date not null,
   CUS_ID int,
   PRICING_ID int,
   foreign key(CUS_ID) references customer(CUS_ID),
   foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

create table if not exists rating(
   RAT_ID int primary key,
   ORD_ID int,
   RAT_RATSTARS int not null,
   foreign key(ORD_ID) references `order`(ORD_ID)
);

insert into supplier(SUPP_ID, SUPP_NAME, SUPP_CITY , SUPP_PHONE) values (1, 'Rajesh Retails',  'Delhi', '1234567890'),
(2,  'Appario Ltd.', 'Mumbai', '2589631470') , (3, 'Knome products' ,'Banglore', '9785462315'), (4, 'Bansal Retails', 'Kochi' ,'8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

insert into customer(CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values (1, 'AAKASH', '9999999999' ,'DELHI', 'M');
insert into customer(CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) values   (2, 'AMAN', '9785463215', 'NOIDA', 'M'),
    (3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
    (4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
    (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');
    
insert into category(CAT_ID, CAT_NAME) values (1, 'BOOKS'),(2, 'GAMES'),(3, 'GROCERIES'),(4, 'ELECTRONICS'),(5, 'CLOTHES');

insert into product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) values  (1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
    (2, 'TSHIRT SIZE-L', 'Black, Blue and White variations', 5),
    (3, 'ROG LAPTOP', 'Windows 10 with 15-inch screen, i7 processor, 1TB SSD', 4),
    (4, 'OATS', 'Highly Nutritious from Nestle', 3),
    (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
    (6, 'MILK 1L', 'Toned Milk', 3),
    (7, 'Boat Earphones', '1.5 Meter long Dolby Atmos', 4),
    (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and colors', 5),
    (9, 'Project IGI', 'Compatible with Windows 7 and above', 2),
    (10, 'Hoodie Black GUCCI', 'For 13 yrs and above', 5),
    (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
    (12, 'Train Your Brain', 'By Shireen Stephen', 1);
    
insert into supplier_pricing(PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values  (1, 1, 2, 1500),
    (2, 3, 5, 30000),
    (3, 5, 1, 3000),
    (4, 2, 3, 2500),
    (5, 4, 1, 1000),
    (6, 12, 2, 780),
    (7, 12, 4, 789),
    (8, 3, 1, 31000),
    (9, 1, 5, 1450),
    (10, 4, 2, 999),
    (11, 7, 3, 549),
    (12, 7, 4, 529),
    (13, 6, 2, 105),
    (14, 6, 1, 99),
    (15, 2, 5, 2999),
    (16, 5, 2, 2999);
    
insert into `order`(ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID ,PRICING_ID) values  (101, 1500, '2021-10-06', 2, 1),
    (102, 1000, '2021-10-12', 3, 5),
    (103, 30000, '2021-09-16', 5, 2),
    (104, 1500, '2021-10-05', 1, 1),
    (105, 3000, '2021-08-16', 4, 3),
    (106, 1450, '2021-08-18', 1, 9),
    (107, 789, '2021-09-01', 3, 7),
    (108, 780, '2021-09-07', 5, 6),
    (109, 3000, '2021-09-10', 5, 3),
    (110, 2500, '2021-09-10', 2, 4),
    (111, 1000, '2021-09-15', 4, 5),
    (112, 789, '2021-09-16', 4, 7),
    (113, 31000, '2021-09-16', 1, 8),
    (114, 1000, '2021-09-16', 3, 5),
    (115, 3000, '2021-09-16', 5, 3),
    (116, 99, '2021-09-17', 2, 14);
    
insert into RATING(RAT_ID, ORD_ID , RAT_RATSTARS) values (1, 101, 4),
    (2, 102, 3),
    (3, 103, 1),
    (4, 104, 2),
    (5, 105, 4),
    (6, 106, 3),
    (7, 107, 4),
    (8, 108, 4),
    (9, 109, 3),
    (10, 110, 5),
    (11, 111, 3),
    (12, 112, 4),
    (13, 113, 2),
    (14, 114, 1),
    (15, 115, 1),
    (16, 116, 0);

-- Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.
Select C.CUS_GENDER , count(C.CUS_ID) from `order` as ord INNER JOIN customer as c 
ON C.CUS_ID = ord.CUS_ID where ord.ORD_AMOUNT >= 3000 group by C.CUS_GENDER;

-- Display all the orders along with product name ordered by a customer having Customer_Id=2
Select product.pro_name, `order`.* from `order`, supplier_pricing, product
where `order`.cus_id=2 and
`order`.pricing_id=supplier_pricing.pricing_id
 and supplier_pricing.pro_id=product.pro_id;
 
 -- Display the Supplier details of who is supplying more than one product.
 select supplier.* from supplier where supplier.supp_id in
(select supp_id from supplier_pricing group by supp_id having count(supp_id)>1);


-- Find the least expensive product from each category and print the table with 
-- id, name, and price of the product group by supplier.supp_id;
select category.cat_id,category.cat_name, min(t3.min_price) as Min_Price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id)
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

-- Display the Id and Name of the Product ordered after “2021-10-05”.
select product.pro_id,product.pro_name from `order` inner join 
supplier_pricing on supplier_pricing.pricing_id=`order`.pricing_id inner join product 
on product.pro_id=supplier_pricing.pro_id where `order`.ord_date>"2021-10-05";

-- Display customer name and gender whose names start or end with character 'A'.
select customer.cus_name,customer.cus_gender from 
customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

-- Create a stored procedure to display supplier id, name, rating and Type_of_supplier.
-- If rating >4 then “Genuine Supplier” if
-- rating >2 “Average Supplier” else “Supplier should not be considered”.

DELIMITER &&
CREATE PROCEDURE proc()
BEGIN
    SELECT
        report.supp_id,
        report.supp_name,
        report.Average,
        CASE
            WHEN report.Average = 5 THEN 'Excellent Service'
            WHEN report.Average > 4 THEN 'Good Service'
            WHEN report.Average > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM
        (SELECT
            final.supp_id,
            supplier.supp_name,
            final.Average
        FROM
            (SELECT
                test2.supp_id,
                SUM(test2.rat_ratstars) / COUNT(test2.rat_ratstars) AS Average
            FROM
                (SELECT
                    supplier_pricing.supp_id,
                    test.ORD_ID,
                    test.RAT_RATSTARS
                FROM
                    supplier_pricing
                INNER JOIN
                    (SELECT
                        `order`.pricing_id,
                        rating.ORD_ID,
                        rating.RAT_RATSTARS
                    FROM
                        `order`
                    INNER JOIN
                        rating ON rating.`ord_id` = `order`.ord_id
                    ) AS test ON test.pricing_id = supplier_pricing.pricing_id
                ) AS test2
            GROUP BY
                supplier_pricing.supp_id
            ) AS final
        INNER JOIN
            supplier
        WHERE final.supp_id = supplier.supp_id
        ) AS report;
END &&
DELIMITER ;

call proc();
