# Answering the Questions

## 1. What is PostgreSQL?

PostgreSQL is a Relational Database Management System. It is used to store, manage and query structured data efficiently, using SQL. As the most advanced RDMS in the world, it allows us to write very complex queries to extract the exact information we need from our database in a fast and reliable manner.

## 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL

**Primary Key** is a coloumn/attribute or a set of columns/attributes that can be used to uniquely identify each record/row of data in a table. The **Primary Key** should have these three charecteristics:

- Its unique.
- Its not Nullable.
- Its stable or resistent to frequent changes in its value.

**Foreign Key** is a **Primary Key** of one table inside another table. Thus, its nature as "Foreign". It is used to build a relationship between the two table/entities, so that we can make queries based on both of them. For example, they can be used to build a relationship between "Users" and "Posts" tables. We can then query both tables as one to perform CRUD operations on a post a user made on our website.

## 3. What are the LIMIT and OFFSET clauses used for?

The **LIMIT** clause is used to limit the number of records/rows a Query returns. For example, when quering for the posts made be a user, we can limit it so that we can get only the first 10 posts.

On the other hand, **OFFSET** is used to tell the database to skip a certain number of rows/records when returning the result of a query.

When used together, the clauses allow for the creation of a pagination system. Therefore, instead of returning all the potentially thousands of posts a User made, we can break up the data in chunks that we will be returned to the front-end. Thus, reducing loading time that users will have to face. We can even make it so that when the new chunk is requested the old one is removed from the memory of the client device, thus, improving the performance of our applications.

## 4. Explain the purpose of the WHERE clause in a SELECT statement

The **WHERE** clause is used to add conditions to the **SELECT** statement, so that we get a specific result from the **SELECT** statement. For example, in a hypothetical "Students" table,instead  of getting all the students like below:

```sql
SELECT * FROM students;
```

We can instead get all the students with a grade A, which is more useful

```sql
SELECT * FROM students WHERE grade = 'A';
```
