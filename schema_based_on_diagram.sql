CREATE TABLE patients (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
name VARCHAR (255),
date_of_birth date,
PRIMARY KEY (id);
);

CREATE TABLE invoices (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
total_amount decimal,
generated_at timestamp,
payed_at timestamp,
medical_history_id INT REFERENCES medical_histories(id),
PRIMARY KEY (id);
);

CREATE TABLE medical_histories (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
admitted_at timestamp,
patient_id INT REFERENCES patients(id),
status VARCHAR
PRIMARY KEY (id);
);

CREATE TABLE treatments (
id INT REFERENCES medical_histories(id),
type VARCHAR,
name VARCHAR
);

CREATE TABLE invoice_items (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
unit_price decimal,
quantity INT,
total_price decimal,
invoice_id INT REFERENCES invoices(id),
treatment_id  INT REFERENCES treatments(id),
PRIMARY KEY (id);
);








