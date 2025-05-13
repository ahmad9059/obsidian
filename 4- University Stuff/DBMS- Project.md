
## 1. Users Table

| Column Name | Data Type      | Description            |
| ----------- | -------------- | ---------------------- |
| `UserID`    | `INT` (PK)     | Unique user ID         |
| `Name`      | `VARCHAR(100)` | Full name              |
| `Email`     | `VARCHAR(100)` | Unique                 |
| `Password`  | `VARCHAR(255)` | Hashed password        |
| `Phone`     | `VARCHAR(15)`  | Optional               |
| `Address`   | `TEXT`         | Shipping address       |
| `Role`      | `VARCHAR(10)`  | `Customer` or `Admin`  |
| `CreatedAt` | `DATETIME`     | Registration timestamp |

## 2. Books Table

| Column Name   | Data Type       | Description              |
| ------------- | --------------- | ------------------------ |
| `BookID`      | `INT` (PK)      | Unique book ID           |
| `Title`       | `VARCHAR(200)`  | Book title               |
| `Author`      | `VARCHAR(100)`  | Book author              |
| `Description` | `TEXT`          | Summary of the book      |
| `ISBN`        | `VARCHAR(20)`   | Unique identifier        |
| `Price`       | `DECIMAL(10,2)` | Book price               |
| `Stock`       | `INT`           | Available quantity       |
| `CategoryID`  | `INT` (FK)      | Linked to Category table |
| `ImageURL`    | `VARCHAR(255)`  | Optional book cover      |

## 3. Categories Table

| Column Name    | Data Type      | Description        |
| -------------- | -------------- | ------------------ |
| `CategoryID`   | `INT` (PK)     | Unique category ID |
| `CategoryName` | `VARCHAR(100)` | E.g., "Fiction"    |

## 4. Cart Table

| Column Name | Data Type  | Description             |
| ----------- | ---------- | ----------------------- |
| `CartID`    | `INT` (PK) | Unique cart item ID     |
| `UserID`    | `INT` (FK) | User who added the item |
| `BookID`    | `INT` (FK) | Book added to cart      |
| `Quantity`  | `INT`      | Number of copies added  |


## 5. Orders Table

|Column Name|Data Type|Description|
|---|---|---|
|`OrderID`|`INT` (PK)|Unique order ID|
|`UserID`|`INT` (FK)|User who placed the order|
|`OrderDate`|`DATETIME`|When the order was placed|
|`TotalAmount`|`DECIMAL(10,2)`|Total cost of order|
|`Status`|`VARCHAR(50)`|Pending, Shipped, Delivered|

## 6. OrderItems Table

| Column Name       | Data Type       | Description                 |
| ----------------- | --------------- | --------------------------- |
| `OrderItemID`     | `INT` (PK)      | Unique item ID              |
| `OrderID`         | `INT` (FK)      | Linked to Orders            |
| `BookID`          | `INT` (FK)      | Linked to Books             |
| `Quantity`        | `INT`           | How many copies             |
| `PriceAtPurchase` | `DECIMAL(10,2)` | Price per copy at that time |
## Optional Tables (Advanced)

| Column     | Description   |
| ---------- | ------------- |
| `ReviewID` | PK            |
| `UserID`   | FK to Users   |
| `BookID`   | FK to Books   |
| `Rating`   | 1-5           |
| `Comment`  | Optional text |

## Author
## Payment
## Publisher

## 🔗 Relationships Summary

- **Users → Orders**: 1 to many
- **Users → Cart**: 1 to many
- **Users → Reviews**: 1 to many
- **Orders → OrderItems**: 1 to many
- **Books → OrderItems**: 1 to many
- **Books → Category**: many to 1
- **Books → Reviews**: 1 to many
- **Users → Wishlist (Many-to-Many)**
- **Users → Cart (Many-to-Many through Cart)**