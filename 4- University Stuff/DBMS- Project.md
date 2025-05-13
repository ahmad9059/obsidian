
## Tables - Schema

### 1. User Table

|Column|Data Type|Constraints|
|---|---|---|
|UserID|INT|PRIMARY KEY, IDENTITY(1,1)|
|Name|VARCHAR(100)|NOT NULL|
|Email|VARCHAR(100)|UNIQUE, NOT NULL|
|Password|VARCHAR(255)|NOT NULL|
|Phone|VARCHAR(15)||
|Address|TEXT||
|Role|VARCHAR(10)|CHECK (Role IN ('Customer', 'Admin'))|
|CreatedAt|DATETIME|DEFAULT GETDATE()|

### 2. Authors Table

|Column|Data Type|Constraints|
|---|---|---|
|AuthorID|INT|PRIMARY KEY, IDENTITY(1,1)|
|Name|VARCHAR(100)|NOT NULL|
|Bio|TEXT||

### 3. Publishers Table 

|Column|Data Type|Constraints|
|---|---|---|
|PublisherID|INT|PRIMARY KEY, IDENTITY(1,1)|
|Name|VARCHAR(100)|NOT NULL|
|Website|VARCHAR(255)||
|ContactInfo|TEXT||

### 4. Categories Table

|Column|Data Type|Constraints|
|---|---|---|
|CategoryID|INT|PRIMARY KEY, IDENTITY(1,1)|
|CategoryName|VARCHAR(100)|NOT NULL|

### 5. Books Table

|Column|Data Type|Constraints|
|---|---|---|
|BookID|INT|PRIMARY KEY, IDENTITY(1,1)|
|Title|VARCHAR(200)|NOT NULL|
|AuthorID|INT|FOREIGN KEY REFERENCES Authors(AuthorID)|
|PublisherID|INT|FOREIGN KEY REFERENCES Publishers(PublisherID)|
|Description|TEXT||
|ISBN|VARCHAR(20)|UNIQUE|
|Price|DECIMAL(10,2)|NOT NULL|
|Stock|INT|NOT NULL|
|CategoryID|INT|FOREIGN KEY REFERENCES Categories(CategoryID)|
|ImageURL|VARCHAR(255)||

### 6. Cart Table

|Column|Data Type|Constraints|
|---|---|---|
|CartID|INT|PRIMARY KEY, IDENTITY(1,1)|
|UserID|INT|FOREIGN KEY REFERENCES Users(UserID)|
|BookID|INT|FOREIGN KEY REFERENCES Books(BookID)|
|Quantity|INT|NOT NULL|

### 7. 