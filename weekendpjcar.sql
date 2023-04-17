CREATE TABLE SalesPerson (
  sales_person_id SERIAL PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  phone_number BIGINT,
  email VARCHAR(150),
  address VARCHAR(150),
  city VARCHAR(50),
  "state" VARCHAR(50),
  zipcode INTEGER,
  hiredate DATE,
  commission_rate NUMERIC(5,2)
);
CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  phone_number BIGINT,
  email VARCHAR(150),
  address VARCHAR(150),
  city VARCHAR(50),
  "state" VARCHAR(50),
  zipcode INTEGER,
  birthdate DATE,
  gender VARCHAR(10)
);
CREATE TABLE Mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  phone_number BIGINT,
  email VARCHAR(150),
  address VARCHAR(150),
  city VARCHAR(50),
  "state" VARCHAR(50),
  zipcode INTEGER,
  hiredate DATE,
  hourly_rate NUMERIC(5,2),
  specialization VARCHAR(100)
);
CREATE TABLE Supplier (
  supplier_id SERIAL PRIMARY KEY,
  supplier_name VARCHAR(60),
  phone_number BIGINT,
  email VARCHAR(60),
  address VARCHAR(150),
  city VARCHAR(60),
  "state" VARCHAR(30),
  zipcode INTEGER
);
CREATE TABLE Car (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(25),
  model VARCHAR(25),
  "year" INTEGER,
  vin VARCHAR(50),
  color VARCHAR(15),
  price NUMERIC(10,2),
  customer_id INTEGER,
  FOREIGN KEY (customer_id)
      REFERENCES Customer(customer_id)
);
CREATE TABLE Service (
  service_id SERIAL PRIMARY KEY,
  service_date DATE,
  description VARCHAR(150),
  service_status VARCHAR(25),
  amount NUMERIC(8,2),
  car_id INTEGER,
  FOREIGN KEY (car_id)
      REFERENCES Car(car_id)
);
CREATE TABLE Parts (
  parts_id SERIAL PRIMARY KEY,
  parts_name VARCHAR(60),
  price NUMERIC(8,2),
  quantity INTEGER,
  description VARCHAR(150),
  supplier_id INTEGER,
  FOREIGN KEY (supplier_id)
      REFERENCES Supplier(supplier_id)
);
CREATE TABLE Invoice (
  invoice_id SERIAL PRIMARY KEY,
  invoice_date DATE,
  total_amount NUMERIC(10,2),
  tax NUMERIC(8,2),
  discount NUMERIC(8,2),
  mrp_car NUMERIC(10,2),
  car_id INTEGER,
  sales_person_id INTEGER,
  FOREIGN KEY (sales_person_id)
      REFERENCES SalesPerson(sales_person_id),
  FOREIGN KEY (car_id)
      REFERENCES Car(car_id)
);
CREATE TABLE Mechanic_Service (
  ms_id SERIAL PRIMARY KEY,
  service_id INTEGER,
  mechanic_id INTEGER,
  FOREIGN KEY (mechanic_id)
      REFERENCES Mechanic(mechanic_id),
  FOREIGN KEY (service_id)
      REFERENCES Service(service_id)
);
CREATE TABLE Parts_Service (
  ps_id SERIAL PRIMARY KEY,
  service_id INTEGER,
  parts_id INTEGER,
  FOREIGN KEY (parts_id)
      REFERENCES Parts(parts_id),
  FOREIGN KEY (service_id)
      REFERENCES Service(service_id)
);














