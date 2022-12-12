-- write your queries here
-- Author: Mahad Osman
-- Date: Sun Dec 11, 2011
-- Assignment: SQL Joins Exercise 

-- vehicles_owner_id_fkey (is the foreign key in the vehicles table)

Write the following SQL commands to produce the necessary output

--1. Join the two tables so that every column and record appears, regardless of if there is not an owner_id. Your output should look like this:
-- (A full join would also work in the case below)
SELECT * FROM owners o LEFT JOIN vehicles v                                                                                                   
ON o.id = v.owner_id;

--2. Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order. Your output should look like this:
SELECT o.first_name, o.last_name, COUNT(*) as total_cars from owners o                                                                        
JOIN vehicles v                                                                                                                                                
ON o.id = v.owner_id                                                                                                                                          
GROUP BY o.first_name, o.last_name                                                                                                                             
ORDER BY total_cars;

--3. Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000. Your output should look like this:

SELECT o.first_name, o.last_name, ROUND(AVG(v.price)) AS average_price , COUNT(v.owner_id) AS total_cars from owners o                                                                        
JOIN vehicles v                                                                                                                                                
ON o.id = v.owner_id                                                                                                                                    
GROUP BY o.first_name, o.last_name
HAVING COUNT(v.owner_id) > 1 AND  ROUND(AVG(v.price)) > 10000                                                                                                                   
ORDER BY o.first_name DESC;
