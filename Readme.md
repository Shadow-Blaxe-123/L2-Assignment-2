# Answering the Questions

## 1. What is PostgreSQL?

PostgreSQL is a Relational Database Management System. It is used to store, manage and query structured data efficiently, using SQL. As the most advanced RDMS in the world, it allows us to write very complex queries to extract the exact information we need from our database in a fast and reliable manner.

## 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL

**Primary Key** is a coloumn/attribute or a set of columns/attributes that can be used to uniquely identify each record/row of data in a table. The **Primary Key** should have these three charecteristics:

- Its unique.
- Its not Nullable.
- Its stable or resistent to frequent changes in its value.

**Foreign Key** is a **Primary Key** of one table inside another table. Thus, its nature as "Foreign". It is used to build a relationship between the two table/entities, so that we can make queries based on both of them. For example, they can be used to build a relationship between "Users" and "Posts" tables. We can then query both tables as one to perform CRUD operations on a post a user made on our website.
