
# README for Module 1/7: Identifying Customers Who Have Never Placed an Order

---

## Task Objective:
You are required to write an SQL query that finds all customers who have **never** placed an order.

## Hints:
- Use the SQL clauses `WHERE` and `NOT IN` to solve this task.

---

## Database Structure:

### Table: `Customers`
| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

- **id**: The primary key for the `Customers` table, a unique identifier for each customer.
- **name**: Stores the name of the customer.

### Table: `Orders`
| Column Name | Type |
|-------------|------|
| id          | int  |
| customerId  | int  |

- **id**: The primary key for the `Orders` table, a unique identifier for each order.
- **customerId**: A foreign key referencing the `id` column from the `Customers` table, indicating which customer placed the order.

---

## Example:

### Customers table:
| id  | name  |
|-----|-------|
| 1   | Joe   |
| 2   | Henry |
| 3   | Sam   |
| 4   | Max   |

### Orders table:
| id  | customerId |
|-----|------------|
| 1   | 3          |
| 2   | 1          |

### Expected Output:
| Customers |
|-----------|
| Henry     |
| Max       |

---

## SQL Query Example:

```sql
SELECT name
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders);
```

This query returns the names of customers who are **not** found in the `Orders` table, indicating they have never placed an order.
