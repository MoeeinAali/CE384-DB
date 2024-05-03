-- Query 1
SELECT borrowerinfo.borrower_name
FROM borrowerinfo
         JOIN loan ON borrowerinfo.borrower_name = loan.borrower_name
         JOIN organization ON loan.organization_name = organization.organization_name
WHERE organization_country = borrower_country;

-- Query 2
SELECT Borrowerinfo.Borrower_name, Loan.Loan_amount
FROM Borrowerinfo
         JOIN loan ON Borrowerinfo.borrower_name = loan.borrower_name
         JOIN organization ON loan.organization_name = organization.organization_name
WHERE organization.organization_country IN ('Italy', 'Spain')
  AND loan.loan_amount > (SELECT AVG(loan_amount)
                          FROM loan
                                   JOIN organization ON organization.organization_name = loan.organization_name
                          WHERE organization_country IN ('Italy', 'Spain'));

-- Query 3
SELECT borrowerinfo.borrower_name, borrower_address, borrower_country
FROM borrowerinfo
         JOIN loan ON loan.borrower_name = borrowerinfo.borrower_name
WHERE organization_name = 'Quickloan'
  AND loan_amount > 100000;

-- Query 4
SELECT organization_name
FROM organization
WHERE organization_country = (SELECT organization_country
                              FROM organization
                              WHERE organization_name = 'Quickloan');

-- Query 5
SELECT *
FROM borrowerinfo
WHERE borrower_name NOT IN (SELECT lend.borrower_name
                            FROM lend);

-- Query 6
SELECT Borrowerinfo.Borrower_name, Borrowerinfo.Borrower_country
FROM Borrowerinfo
         JOIN Loan ON Borrowerinfo.Borrower_name = Loan.Borrower_name
         JOIN Lend ON Loan.Borrower_name = Lend.Borrower_name
         JOIN Organization ON Loan.Organization_name = Organization.Organization_name
WHERE Lend.Lender_name = 'John'
  AND Borrowerinfo.Borrower_country <> Organization.Organization_country;