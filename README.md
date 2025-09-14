# 📝 Assignment: Database Design and Normalization

This project demonstrates the principles of **good database design** and **normalization**.  
It focuses on transforming tables into **First Normal Form (1NF)** and **Second Normal Form (2NF)** to reduce redundancy and ensure data integrity.

---

## 🎯 Learning Objectives
- 🛠️ Understand the principles of **good database design**
- 💡 Apply **normalization techniques** to improve database structure and efficiency
- 🔍 Learn **First, Second, and Third Normal Forms** (1NF, 2NF, 3NF) to eliminate redundancy and optimize data storage

---

## 📚 Assignment Questions

### Question 1: Achieving 1NF 🛠️
- Problem: The `Products` column in `ProductDetail` contains multiple values (e.g., "Laptop, Mouse").
- Solution: Transform the table so that **each row represents a single product for an order**, making the table atomic and compliant with **1NF**.

### Question 2: Achieving 2NF 🧩
- Problem: In the `OrderDetails` table, `CustomerName` depends only on `OrderID`, causing a **partial dependency**.
- Solution: Split the table into:
  1. `Orders` table (`OrderID → CustomerName`)
  2. `OrderItems` table (`OrderID, Product → Quantity`)  
This ensures **all non-key columns fully depend on the entire primary key**, satisfying **2NF**.

---

## 💻 How to Run
1. Open your SQL environment (e.g., MySQL Workbench).  
2. Execute the queries from `answers.sql`.  
3. Verify that:
   - **1NF Table:** Each product appears in its own row.  
   - **2NF Tables:** Orders table stores customer info, and OrderItems table stores products and quantities.  

---

## 📜 Notes
- All queries are documented with comments for clarity.  
- This project demonstrates **atomic values, elimination of partial dependencies, and normalized table design**.

---

## 👤 Author
- **Dejenie Derese**  
- 📧 soamisodoi012@gmail.com  


