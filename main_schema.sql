CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE departments (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY
	, name VARCHAR(255)
	, type VARCHAR(255)
	, created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
	, updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
);

CREATE TABLE employees (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY
	, manager_id UUID
	, department_id UUID
	, first_name VARCHAR(24)
	, last_name VARCHAR(24)
	, phone VARCHAR(15)
	, email VARCHAR(100)
	, salary MONEY
	, dob TIMESTAMP WITHOUT TIME ZONE
	, created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
	, updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
	, CONSTRAINT fk_manager_id
		FOREIGN KEY(manager_id)
		REFERENCES employees(id)
		ON DELETE SET NULL
	, CONSTRAINT fk_department_id
		FOREIGN KEY(department_id)
		REFERENCES departments(id)
		ON DELETE SET NULL
);