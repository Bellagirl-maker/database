CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  name VARCHAR(255),
  date_of_birth DATE,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR,
  PRIMARY KEY (id)
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id),
  PRIMARY KEY (id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  type VARCHAR,
  name VARCHAR,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES medical_histories(id)
);

CREATE TABLE medical_history_treatments (
  medical_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY (medical_history_id, treatment_id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY (id)
);



CREATE INDEX medical_histories_patient_id
ON medical_histories (patient_id);

CREATE INDEX invoices_medical_history_id
ON invoices (medical_history_id);

CREATE INDEX medical_history_treatments_medical_history_id
ON medical_history_treatments (medical_history_id);

CREATE INDEX medical_history_treatments_treatment_id
ON medical_history_treatments (treatment_id);

CREATE INDEX invoice_items_invoice_id
ON invoice_items (invoice_id);

CREATE INDEX invoice_items_treatment_id
ON invoice_items (treatment_id);












