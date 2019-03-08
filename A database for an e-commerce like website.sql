--------------------------------------------------------
--  File created - Friday-December-07-2018   
--------------------------------------------------------
DROP TABLE "G002_ACCOUNTS" cascade constraints;
DROP TABLE "G002_ADDRESSES" cascade constraints;
DROP TABLE "G002_INVENTORY_ITEMS" cascade constraints;
DROP TABLE "G002_ORDERS" cascade constraints;
DROP TABLE "G002_PRODUCTS" cascade constraints;
DROP TABLE "G002_PRODUCT_CATEGORIES" cascade constraints;
DROP TABLE "G002_SHOPPINGCARTS" cascade constraints;
DROP TABLE "G002_SUPPLIERS" cascade constraints;

DROP SEQUENCE "G002_ACCOUNTS_ID_NUM_SEQ";
DROP SEQUENCE "G002_ADDRESSES_ADDRESS_NUM_SEQ";
DROP SEQUENCE "G002_INVENTORYITEM_INVENTORYITEM_NUM_SEQ";
DROP SEQUENCE "G002_INVENTORY_ITEMS_INVENITEM_NUM_SEQ";
DROP SEQUENCE "G002_ORDERS_ORDER_NUM_SEQ";
DROP SEQUENCE "G002_PRODUCTCATEGORIES_CATEGORY_CODE_SEQ";
DROP SEQUENCE "G002_PRODUCTS_PRODUCT_NUM_SEQ";
DROP SEQUENCE "G002_SUPPLIERS_SUPPLIER_NUM_SEQ";
DROP PROCEDURE "G002_GETRECEIPT_SP";
DROP PROCEDURE "G002_ITEMS_SAMECAT_SP";
DROP FUNCTION "G002_AMOUNTPAID_CALC_SF";
DROP FUNCTION "G002_SUB_CALC_SF";
DROP FUNCTION "G002_TAX_CALC_SF";
--------------------------------------------------------
--  DDL for View BB_BASKETITEM_VU
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BB_BASKETITEM_VU" ("IDBASKETITEM", "IDPRODUCT", "PRICE", "QUANTITY", "IDBASKET", "OPTION1", "OPTION2") AS 
  select "IDBASKETITEM","IDPRODUCT","PRICE","QUANTITY","IDBASKET","OPTION1","OPTION2" from bb_basketitem;
--------------------------------------------------------
--  DDL for View BB_SHIP_VU
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "BB_SHIP_VU" ("IDBASKET", "SHIPFLAG", "IDSTAGE", "DTSTAGE", "NOTES", "SHIPPER", "SHIPPINGNUM") AS 
  SELECT b.idbasket, b.shipflag, bs.idstage, bs.dtstage, bs.notes,
            bs.shipper, bs.shippingnum
      FROM bb_basket b, bb_basketstatus bs
      WHERE b.idBasket = bs.idBasket;
--------------------------------------------------------
--  DDL for View CONTACT
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CONTACT" ("NAME", "CONTACT") AS 
  SELECT name, contact from publisher
WITH READ ONLY;
--------------------------------------------------------
--  DDL for Table G002_ACCOUNTS
--------------------------------------------------------

  CREATE TABLE "G002_ACCOUNTS" 
   (	"USERID" VARCHAR2(20 BYTE), 
	"ID_NUM" NUMBER(3,0), 
	"F_NAME" VARCHAR2(25 BYTE), 
	"L_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(35 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table G002_ADDRESSES
--------------------------------------------------------

  CREATE TABLE "G002_ADDRESSES" 
   (	"ADDRESS_NUM" NUMBER(3,0), 
	"ID_NUM" NUMBER(3,0), 
	"STREET" VARCHAR2(40 BYTE), 
	"CITY" VARCHAR2(40 BYTE), 
	"PROVINCE" CHAR(2 BYTE), 
	"POSTAL_CODE" CHAR(6 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table G002_INVENTORY_ITEMS
--------------------------------------------------------

  CREATE TABLE "G002_INVENTORY_ITEMS" 
   (	"INVENTORYITEM_NUM" NUMBER(3,0), 
	"PRODUCT_NUM" NUMBER(3,0), 
	"DESCRIPTION" VARCHAR2(40 BYTE), 
	"QUANTITY" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table G002_ORDERS
--------------------------------------------------------

  CREATE TABLE "G002_ORDERS" 
   (	"ORDER_NUM" NUMBER(3,0), 
	"CUSTOMER_ID_NUM" NUMBER(3,0), 
	"ORDER_DATE" DATE, 
	"SHIP_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table G002_PRODUCTS
--------------------------------------------------------

  CREATE TABLE "G002_PRODUCTS" 
   (	"PRODUCT_NUM" NUMBER(3,0), 
	"NAME" VARCHAR2(30 BYTE), 
	"PRICE" NUMBER(6,2), 
	"SUPPLIER_NUM" NUMBER(3,0), 
	"CATEGORY_CODE" VARCHAR2(3 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table G002_PRODUCT_CATEGORIES
--------------------------------------------------------

  CREATE TABLE "G002_PRODUCT_CATEGORIES" 
   (	"CATEGORY_CODE" VARCHAR2(3 BYTE), 
	"CATEGORY_NAME" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table G002_SHOPPINGCARTS
--------------------------------------------------------

  CREATE TABLE "G002_SHOPPINGCARTS" 
   (	"ORDER_NUM" NUMBER(3,0), 
	"INVENTORYITEM_NUM" NUMBER(3,0), 
	"AMOUNTPAID" NUMBER(7,2), 
	"QUANTITY" NUMBER(3,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table G002_SUPPLIERS
--------------------------------------------------------

  CREATE TABLE "G002_SUPPLIERS" 
   (	"SUPPLIER_NUM" NUMBER(3,0), 
	"NAME" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Sequence G002_ACCOUNTS_ID_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "G002_ACCOUNTS_ID_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence G002_ADDRESSES_ADDRESS_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "G002_ADDRESSES_ADDRESS_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence G002_INVENTORYITEM_INVENTORYITEM_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "G002_INVENTORYITEM_INVENTORYITEM_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence G002_INVENTORY_ITEMS_INVENITEM_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "G002_INVENTORY_ITEMS_INVENITEM_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 37 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence G002_ORDERS_ORDER_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "G002_ORDERS_ORDER_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence G002_PRODUCTCATEGORIES_CATEGORY_CODE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "G002_PRODUCTCATEGORIES_CATEGORY_CODE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence G002_PRODUCTS_PRODUCT_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "G002_PRODUCTS_PRODUCT_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence G002_SUPPLIERS_SUPPLIER_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "G002_SUPPLIERS_SUPPLIER_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 17 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
REM INSERTING into G002_ACCOUNTS
SET DEFINE OFF;
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('aCustomer',1,'Roman','Parsons','blahblah@gmail.com','647-885-4731');
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('addData',2,'Mac','Clain','gmailgmail@gmail.com','324-352-4443');
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('thisIsID',3,'Michael','Clardy','emailmail@outlook.com','647-002-4352');
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('anotherId',4,'Frank','Corral','not@gmail.com','416-551-2311');
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('oijwe',5,'Harold','Hoekstra','asjdiow@gmail.com','647-128-4732');
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('asji',6,'Bradford','Larson','asdfzxcv@gmail.com','647-321-9932');
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('qwertyid',7,'David','Andrews','pppppp@gmail.com','416-753-3641');
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('shortId',8,'Shirley','Cunningham','oooooo@gmail.com','647-221-4008');
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('longlongId',9,'Thomas','Brown','ioqwurioyiq@gmail.com','647-910-3321');
Insert into G002_ACCOUNTS (USERID,ID_NUM,F_NAME,L_NAME,EMAIL,PHONE_NUMBER) values ('notlongId',10,'Georgine','Eells','iqowhe@gmail.com','647-310-6321');
REM INSERTING into G002_ADDRESSES
SET DEFINE OFF;
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (1,1,'St. John Street','Beechy','SK','S4P3Y2');
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (2,2,'Mortier Ave.','Toronto','ON','S1O4N2');
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (3,3,'Pearl Street','Streetsville','ON','L4W9X0');
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (4,4,'Levy','Montreal','QC','N2K1M4');
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (5,5,'Saint-Charles','Longueuil','QC','J4H1M3');
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (6,6,'Wascana','Parkway','SK','K2O5N1');
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (7,7,'Birkett Lane','Brantford','ON','M2G3N5');
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (8,8,'Carven Place','Medicine Hat','AB','W1M6J4');
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (9,9,'Birkett Lane','Brantford','ON','W1Q5B2');
Insert into G002_ADDRESSES (ADDRESS_NUM,ID_NUM,STREET,CITY,PROVINCE,POSTAL_CODE) values (10,10,'Yonge Street','Toronto','ON','A1B2P6');
REM INSERTING into G002_INVENTORY_ITEMS
SET DEFINE OFF;
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (1,1,'Blue',45);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (2,1,'White',54);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (3,1,'Red',56);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (4,1,'Black',50);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (5,1,'Pink',54);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (6,2,'Green',50);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (7,2,'Violet',55);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (8,3,'40ml',77);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (9,4,'60ml',109);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (10,5,'Black',75);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (11,5,'White',77);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (12,6,'Blue',61);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (13,6,'Silver',75);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (14,6,'Black',66);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (15,6,'Red',67);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (16,7,'Double',97);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (17,7,'Queen',59);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (18,7,'King',56);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (19,8,'For Double Bed',45);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (20,9,'Bride wedding collection',66);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (21,10,'Golf club e-certificates',76);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (22,11,'200g',69);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (23,12,'80g',65);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (24,13,'Capsule',66);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (25,14,'Capsule',65);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (26,15,'Medium',86);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (27,16,'Medium',88);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (28,17,'Small',86);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (29,18,'Medium',56);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (30,19,'Green',56);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (31,19,'Red',58);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (32,19,'White',64);
Insert into G002_INVENTORY_ITEMS (INVENTORYITEM_NUM,PRODUCT_NUM,DESCRIPTION,QUANTITY) values (33,20,'Black',61);
REM INSERTING into G002_ORDERS
SET DEFINE OFF;
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (1,1,to_date('10-MAR-18','DD-MON-RR'),to_date('13-MAR-18','DD-MON-RR'));
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (2,1,to_date('10-MAR-18','DD-MON-RR'),to_date('15-MAR-18','DD-MON-RR'));
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (3,4,to_date('11-MAR-18','DD-MON-RR'),to_date('14-MAR-18','DD-MON-RR'));
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (4,2,to_date('11-MAR-18','DD-MON-RR'),to_date('12-MAR-18','DD-MON-RR'));
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (5,5,to_date('12-MAR-18','DD-MON-RR'),to_date('14-MAR-18','DD-MON-RR'));
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (6,7,to_date('13-MAR-18','DD-MON-RR'),to_date('17-MAR-18','DD-MON-RR'));
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (7,3,to_date('15-MAR-18','DD-MON-RR'),to_date('19-MAR-18','DD-MON-RR'));
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (8,9,to_date('15-MAR-18','DD-MON-RR'),to_date('18-MAR-18','DD-MON-RR'));
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (9,2,to_date('16-MAR-18','DD-MON-RR'),to_date('19-MAR-18','DD-MON-RR'));
Insert into G002_ORDERS (ORDER_NUM,CUSTOMER_ID_NUM,ORDER_DATE,SHIP_DATE) values (10,4,to_date('17-MAR-18','DD-MON-RR'),null);
REM INSERTING into G002_PRODUCTS
SET DEFINE OFF;
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (1,'humidifier',13.24,12,'APP');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (2,'air purifier',23.11,13,'APP');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (3,'car care kit',16.84,3,'AUT');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (4,'exterior wash and wax',21,3,'AUT');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (5,'laser printer',320.24,5,'COM');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (6,'gaming desktop',669.99,5,'COM');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (7,'white double bed',1299.99,13,'FUR');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (8,'king tufted headboard',135.5,12,'FUR');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (9,'bride wedding collection',65,7,'GIF');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (10,'golf club e-certificates',87.22,8,'GIF');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (11,'matcha green tea powder',43.33,9,'GRO');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (12,'dark and milk chocolate mix',34.22,10,'GRO');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (13,'ubiquinol',33.42,11,'HEL');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (14,'vegan omega-3',43.22,11,'HEL');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (15,'himalayan salt lamps',35.11,8,'HOM');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (16,'round starburst mirror',23.52,5,'HOM');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (17,'gold wedding band',44.22,14,'JEW');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (18,'black ceramic ring',63.53,14,'JEW');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (19,'noise-cancelling headphones',141.22,4,'ELT');
Insert into G002_PRODUCTS (PRODUCT_NUM,NAME,PRICE,SUPPLIER_NUM,CATEGORY_CODE) values (20,'X-box one S 1TB',636.64,4,'ELT');
REM INSERTING into G002_PRODUCT_CATEGORIES
SET DEFINE OFF;
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('APP','appliances');
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('AUT','automotive');
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('COM','computer');
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('ELT','electronics');
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('FUR','furniture');
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('GIF','gift');
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('GRO','grocery');
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('HEL','health');
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('HOM','home');
Insert into G002_PRODUCT_CATEGORIES (CATEGORY_CODE,CATEGORY_NAME) values ('JEW','jewellery');
REM INSERTING into G002_SHOPPINGCARTS
SET DEFINE OFF;
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (1,4,26.48,2);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (1,14,669.99,1);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (2,29,63.53,1);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (3,22,43.33,1);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (4,11,320.24,1);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (5,1,13.24,1);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (6,23,68.44,2);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (7,3,66.2,5);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (8,32,141.22,1);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (8,8,50.52,3);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (9,20,65,1);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (10,22,43.33,1);
Insert into G002_SHOPPINGCARTS (ORDER_NUM,INVENTORYITEM_NUM,AMOUNTPAID,QUANTITY) values (10,33,636.64,1);
REM INSERTING into G002_SUPPLIERS
SET DEFINE OFF;
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (1,'Air Controllers','647-324-4632','awetasd@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (2,'Our Great Great car','416-235-4745','lweht@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (3,'Our Best Car','647-853-4631','welkht@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (4,'Vision Computer','346-342-4362','oqoqo@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (5,'Sony','416-442-8573','qeqtddds@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (6,'Fun Furniture','647-3747-2342','yololol@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (7,'The Gift Shop','416-556-4722','hahaha@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (8,'Dream Gift','332-475-4731','powerover@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (9,'Tea and Coffee','416-343-3458','whelming@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (10,'Chocolate Makers','647-434-7574','theflower@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (11,'Very Vitamins','647-221-4747','smshwa@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (12,'Sweet Sweet Home','647-322-8842','yohoho@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (13,'Home Stuff','647-324-7753','meowbow@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (14,'Fair Jewellery Co.','416-222-1214','ejlhsi@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (15,'The Source','416-990-5765','ywmwmwa@gmail.com');
Insert into G002_SUPPLIERS (SUPPLIER_NUM,NAME,PHONE_NUMBER,EMAIL) values (16,'Electric Electronics','647-332-9976','yuokwm@gmail.com');
--------------------------------------------------------
--  DDL for Index G002_ACCOUNTS_ID_NUM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "G002_ACCOUNTS_ID_NUM_PK" ON "G002_ACCOUNTS" ("ID_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index G002_ADDRESSES_ADDRESS_NUM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "G002_ADDRESSES_ADDRESS_NUM_PK" ON "G002_ADDRESSES" ("ADDRESS_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index G002_INVENTORY_ITEMS_INVENNUM
--------------------------------------------------------

  CREATE UNIQUE INDEX "G002_INVENTORY_ITEMS_INVENNUM" ON "G002_INVENTORY_ITEMS" ("INVENTORYITEM_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index G002_ORDERS_ORDER_NUM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "G002_ORDERS_ORDER_NUM_PK" ON "G002_ORDERS" ("ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index G002_PRODUCTS_PRODUCT_NUM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "G002_PRODUCTS_PRODUCT_NUM_PK" ON "G002_PRODUCTS" ("PRODUCT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index G002_PRODUCT_CATEGORIES_CATEGORY_CODE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "G002_PRODUCT_CATEGORIES_CATEGORY_CODE_PK" ON "G002_PRODUCT_CATEGORIES" ("CATEGORY_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index G002_SHOPPINGCARTS_ORDER_NUM_INVENTORYITEM_NUM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "G002_SHOPPINGCARTS_ORDER_NUM_INVENTORYITEM_NUM_PK" ON "G002_SHOPPINGCARTS" ("ORDER_NUM", "INVENTORYITEM_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index G002_SUPPLIERS_SUPPLIER_NUM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "G002_SUPPLIERS_SUPPLIER_NUM_PK" ON "G002_SUPPLIERS" ("SUPPLIER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ACCOUNTS_NAMES_IDX
--------------------------------------------------------

  CREATE INDEX "ACCOUNTS_NAMES_IDX" ON "G002_ACCOUNTS" ("F_NAME", "L_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTS_NAME_IDX
--------------------------------------------------------

  CREATE INDEX "PRODUCTS_NAME_IDX" ON "G002_PRODUCTS" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger G002_STOCKQTY_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "G002_STOCKQTY_TRG"
  before insert on g002_shoppingcarts for each row
declare
  lv_qty g002_inventory_items.quantity%type;
  ex_qty exception;
begin

select quantity into lv_qty from g002_inventory_items
  where INVENTORYITEM_NUM = :new.inventoryitem_num;

if lv_qty < :new.quantity then
  raise_application_error(-20001, 'The number of Items ordered is
                              more than the stock quantity');
  else
    update g002_inventory_items
      set quantity = quantity - :new.quantity
      where inventoryitem_num = :new.inventoryitem_num;
  end if;
end;
/
ALTER TRIGGER "G002_STOCKQTY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger G002_STOCKWARNING_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "G002_STOCKWARNING_TRG" 
  after update on g002_inventory_items for each row
declare
  ex_lowStock exception;
begin
  if :new.quantity < 20 then
    raise ex_lowStock;
  end if;
  exception when ex_lowStock then
    dbms_output.put_line('Stock level: '||:new.quantity);
    dbms_output.put_line('Need to be ordered.');
end;
/
ALTER TRIGGER "G002_STOCKWARNING_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure G002_GETRECEIPT_SP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "G002_GETRECEIPT_SP" 
  (orderNo in G002_ORDERS.ORDER_NUM%type)
is
  total g002_shoppingcarts.amountpaid%type := 0;
  type type_subtotals is table of g002_shoppingcarts%rowtype
    index by pls_integer;
  type type_items is table of g002_products%rowtype
    index by pls_integer;
  tbl_carts type_subtotals;
  tbl_items type_items;
begin
  
  select * bulk collect into tbl_carts
  from g002_shoppingcarts
  where ORDER_NUM = orderNo;
  
  select product_num, name, price,
    supplier_num, category_code bulk collect into tbl_items
  from g002_products join g002_inventory_items
  using (product_num) join g002_shoppingcarts
  using (inventoryitem_num)
  where ORDER_NUM = orderNo;
  
  for i in 1..tbl_carts.count loop
    total := total + tbl_carts(i).amountpaid;
  end loop;
  
  if total != 0 then
  dbms_output.put_line('The receipt for the order# '||orderNo);
  
  for i in 1..tbl_carts.count loop
    dbms_output.put_line('Item #'||i||' '||tbl_items(i).name);
    dbms_output.put_line('          '||TO_CHAR(tbl_carts(i).amountpaid, '$99,999.99'));
  end loop;

  dbms_output.put_line('----------------');
  dbms_output.put_line('Total     '||TO_CHAR(total, '$99,999.99'));
  else
  dbms_output.put_line('Non-existing order#');
  end if;
  
  EXCEPTION WHEN no_data_found then
  dbms_output.put_line('Non-existing order#');
end;

/
--------------------------------------------------------
--  DDL for Procedure G002_ITEMS_SAMECAT_SP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "G002_ITEMS_SAMECAT_SP" 
  (ordernum in number)
is
  type type_product is table of g002_products%rowtype
    index by pls_integer;
  catCode G002_PRODUCTS.CATEGORY_CODE%type;
  cust_num g002_orders.customer_id_num%type;
  cat_ref type_product;
  products type_product;
begin
  select product_num, name, price,
    supplier_num, category_code
    bulk collect into cat_ref
    from g002_products
    join g002_inventory_items using (product_num)
    join g002_shoppingcarts using (inventoryitem_num)
    join g002_orders using (order_num)
    where order_num = ordernum;
  
  catCode := cat_ref(1).category_code;
  
  select * bulk collect into products
  from g002_products
  where category_code = catCode;
  
  select customer_id_num into cust_num
  from g002_orders where order_num = ordernum;
  
  dbms_output.put_line('Recommended items for customer# ' || cust_num);
  
  for i in 1..products.count loop
    dbms_output.put_line(products(i).name);
    end loop;
    
  EXCEPTION when NO_DATA_FOUND then
  dbms_output.put_line('Non-existing order');
end;

/
--------------------------------------------------------
--  DDL for Function G002_AMOUNTPAID_CALC_SF
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "G002_AMOUNTPAID_CALC_SF" 
(inventoryNum number,
 quantity number)
return number
is
lv_price g002_products.price%type;
lv_amtPaid g002_shoppingcarts.amountpaid%type;
begin
select price into lv_price from g002_shoppingcarts
join g002_inventory_items using (inventoryitem_num)
join g002_products using (product_num)
where inventoryitem_num = inventoryNum;

lv_amtPaid := lv_price * quantity;

return lv_amtPaid;
end;

/
--------------------------------------------------------
--  DDL for Function G002_SUB_CALC_SF
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "G002_SUB_CALC_SF" -- amountpaid calculation
  (order_id G002_ORDERS.ORDER_NUM%type)
RETURN NUMBER
IS
  sub_total NUMBER(19,2);
BEGIN
  select sum(amountpaid) into sub_total
  from g002_shoppingcarts
  where order_num = order_id;
  return sub_total;
  EXCEPTION WHEN no_data_found then
  dbms_output.put_line('Non-existing order#');
END;

/
--------------------------------------------------------
--  DDL for Function G002_TAX_CALC_SF
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "G002_TAX_CALC_SF" -- tax calculation
  (sub_total number)
RETURN NUMBER
IS
  total_tax NUMBER(8,2);
  tax_rate NUMBER(8,2) := 0.13;
BEGIN
  total_tax := sub_total * tax_rate;
  return total_tax;
END;

/
--------------------------------------------------------
--  Constraints for Table G002_ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "G002_ACCOUNTS" ADD CONSTRAINT "G002_ACCOUNTS_ID_NUM_PK" PRIMARY KEY ("ID_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table G002_ADDRESSES
--------------------------------------------------------

  ALTER TABLE "G002_ADDRESSES" ADD CONSTRAINT "G002_ADDRESSES_ADDRESS_NUM_PK" PRIMARY KEY ("ADDRESS_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table G002_INVENTORY_ITEMS
--------------------------------------------------------

  ALTER TABLE "G002_INVENTORY_ITEMS" ADD CONSTRAINT "G002_INVENTORY_ITEMS_INVENNUM" PRIMARY KEY ("INVENTORYITEM_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table G002_ORDERS
--------------------------------------------------------

  ALTER TABLE "G002_ORDERS" ADD CONSTRAINT "G002_ORDERS_ORDER_NUM_PK" PRIMARY KEY ("ORDER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table G002_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "G002_PRODUCTS" ADD CONSTRAINT "G002_PRODUCTS_PRODUCT_NUM_PK" PRIMARY KEY ("PRODUCT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table G002_PRODUCT_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "G002_PRODUCT_CATEGORIES" ADD CONSTRAINT "G002_PRODUCT_CATEGORIES_CATEGORY_CODE_PK" PRIMARY KEY ("CATEGORY_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table G002_SHOPPINGCARTS
--------------------------------------------------------

  ALTER TABLE "G002_SHOPPINGCARTS" ADD CONSTRAINT "G002_SHOPPINGCARTS_ORDER_NUM_INVENTORYITEM_NUM_PK" PRIMARY KEY ("ORDER_NUM", "INVENTORYITEM_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table G002_SUPPLIERS
--------------------------------------------------------

  ALTER TABLE "G002_SUPPLIERS" ADD CONSTRAINT "G002_SUPPLIERS_SUPPLIER_NUM_PK" PRIMARY KEY ("SUPPLIER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table G002_ADDRESSES
--------------------------------------------------------

  ALTER TABLE "G002_ADDRESSES" ADD CONSTRAINT "G002_ADDRESSES_ID_NUM_FK" FOREIGN KEY ("ID_NUM")
	  REFERENCES "G002_ACCOUNTS" ("ID_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table G002_ORDERS
--------------------------------------------------------

  ALTER TABLE "G002_ORDERS" ADD CONSTRAINT "G002_ORDERS_ID_NUM_FK" FOREIGN KEY ("CUSTOMER_ID_NUM")
	  REFERENCES "G002_ACCOUNTS" ("ID_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table G002_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "G002_PRODUCTS" ADD CONSTRAINT "G002_PRODUCTS_SUPP_NUM_FK" FOREIGN KEY ("SUPPLIER_NUM")
	  REFERENCES "G002_SUPPLIERS" ("SUPPLIER_NUM") ENABLE;
