/*
task 4 
*/

CREATE TABLE zipcodes(
zipcode VARCHAR(10) NOT NULL,
PRIMARY KEY (zipcode)
);


CREATE TABLE states(
zipcode VARCHAR(10) NOT NULL,
state VARCHAR(20) NOT NULL,
FOREIGN KEY (zipcode) REFERENCES zipcodes(zipcode) ON DELETE CASCADE
); 

CREATE TABLE cities(
zipcode VARCHAR(10) NOT NULL,
city VARCHAR(20) NOT NULL,
FOREIGN KEY(zipcode) REFERENCES zipcodes(zipcode) ON DELETE CASCADE
);

INSERT INTO zipcodes VALUES
("62701"),
("53703"),
("73301"),
("98101"),
("80201"),
("85001"),
("97201"),
("33101"),
("30301"),
("2101"),
("10001"),
("90001"),
("60601"),
("94101"),
("75201"),
("77001"),
("19101"),
("92101"),
("89101"),
("32801"),
("28201"),
("46201"),
("43201"),
("37201"),
("21201"),
("53201"),
("64101");


INSERT INTO cities VALUES
("62701", "Springfield"),
("53703", "Madison"),
("73301", "Austin"),
("98101", "Seattle"),
("80201", "Denver"),
("85001", "Phoenix"),
("97201", "Portland"),
("33101", "Miami"),
("30301", "Atlanta"),
("2101", "Boston"),
("10001", "New York"),
("90001", "Los Angeles"),
("60601", "Chicago"),
("94101", "San Francisco"),
("75201", "Dallas"),
("77001", "Houston"),
("19101", "Philadelphia"),
("92101", "San Diego"),
("89101", "Las Vegas"),
("32801", "Orlando"),
("28201", "Charlotte"),
("46201", "Indianapolis"),
("43201", "Columbus"),
("37201", "Nashville"),
("21201", "Baltimore"),
("53201", "Milwaukee"),
("64101", "Kansas City");

INSERT INTO states VALUES
("62701", "Illinois"),
("53703", "Wisconsin"),
("73301", "Texas"),
("98101", "Washington"),
("80201", "Colorado"),
("85001", "Arizona"),
("97201", "Oregon"),
("33101", "Florida"),
("30301", "Georgia"),
("2101", "Massachusetts"),
("10001", "New York"),
("90001", "California"),
("60601", "Illinois"),
("94101", "California"),
("75201", "Texas"),
("77001", "Texas"),
("19101", "Pennsylvania"),
("92101", "California"),
("89101", "Nevada"),
("32801", "Florida"),
("28201", "North Carolina"),
("46201", "Indiana"),
("43201", "Ohio"),
("37201", "Tennessee"),
("21201", "Maryland"),
("53201", "Wisconsin"),
("64101", "Missouri");

SELECT z.zipcode, c.city , s.state
FROM zipcodes z 
JOIN cities c ON z.zipcode = c.zipcode 
JOIN states s ON c.zipcode = s.zipcode
ORDER BY c.city AND s.state ; 
