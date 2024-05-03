-- Create Tables

CREATE TABLE IF NOT EXISTS Borrowerinfo
(
    Borrower_name    VARCHAR(255) NOT NULL Primary Key,
    Borrower_address VARCHAR(255),
    Borrower_country VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Organization
(
    Organization_name    VARCHAR(255) NOT NULL Primary Key,
    Organization_country VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Lend
(
    Borrower_name VARCHAR(255) NOT NULL,
    Lender_name   VARCHAR(255) NOT NULL,
    PRIMARY KEY (Borrower_name, Lender_name)
);

CREATE TABLE IF NOT EXISTS Loan
(
    Borrower_name     VARCHAR(64) NOT NULL REFERENCES Borrowerinfo (Borrower_name),
    Organization_name VARCHAR(64) NOT NULL REFERENCES Organization (Organization_name),
    Loan_amount       INT         NOT NULL,
    PRIMARY KEY (Borrower_name, Organization_name)
);


-- Insert Data into Tables

\copy Borrowerinfo(Borrower_name, Borrower_address, Borrower_country) FROM './Data/tables/borrowerinfo.csv' DELIMITER ',' CSV HEADER;
\copy Organization(Organization_name, Organization_country) FROM 'Data/tables/organization.csv' DELIMITER ',' CSV HEADER;
\copy Lend(Borrower_name, Lender_name) FROM './Data/tables/lend.csv' DELIMITER ',' CSV HEADER;
\copy Loan(Borrower_name, Organization_name, Loan_amount) FROM './Data/tables/loan.csv' DELIMITER ',' CSV HEADER;
