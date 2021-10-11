CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS departments (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY
	, name VARCHAR(255) NOT NULL
	, type VARCHAR(255) NOT NULL
	, created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
	, updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
	, CONSTRAINT department_name_unique UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS employees (
	id UUID DEFAULT uuid_generate_v4() PRIMARY KEY
	, manager_id UUID
	, department_id UUID
	, first_name VARCHAR(24) NOT NULL
	, last_name VARCHAR(24) NOT NULL
	, phone VARCHAR(15)
	, email VARCHAR(100) NOT NULL
	, salary MONEY
	, dob TIMESTAMP WITHOUT TIME ZONE NOT NULL
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
	, CONSTRAINT employee_email_unique UNIQUE (email)
);