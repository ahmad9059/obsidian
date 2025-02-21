## 1. Data
---
a. Data is Collection of raw, unorganized facts and details like, text, observations, figures, symbols, and descriptions of things etc.
In other words, **data does not carry any specific purpose and has no significance by itself**.
Moreover, data is measured in terms of bits and bytes - which are basic units of information in the context of computer storage and processing.
b. Data can be recorded and doesn't have any meaning unless processed.
## 2. Type of Data
---
### a. Quantitative
1. Numerical form
2. Weight, Volume, cost of an item.
### b. Qualitative
1. Descriptive, but not numerical.
2. Name, Gender, hair color of a person.
## 3. Information
---
a. Information is processed, organized and structured data
b. It provides context of the data and enables decision making.
c. Processed data that make sense to us.
d. Information is extracted from the data, by analyzing and interpreting pieces of data.
e. E.g., you have data of all people living in your locality, its Data, when you analyse and interpret the data and come to some conclusion that:
1. There are 100 senior citizens.
2. The sex ratio is 1:1
3. Newborn babies are 100
These are information.

## 4. Data VS Information
---

| Data                                                                         | Information                                                                              |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Data is collection of facts                                                  | information puts those facts into context                                                |
| Data is raw and unorganized                                                  | information is organized                                                                 |
| Data points are individual and sometimes unrelated.                          | Information maps out the data to provide a big-picture view of how it all fits together. |
| Data on its own, is meaningless                                              | data is analyzed and interpreted, its becomes meaningful information                     |
| Data does not depend on information                                          | however, information depends on data                                                     |
| Data typically comes in the form of graphs, numbers, figures, or statistics. | Information is typically presented through words, language, thoughts, and ideas          |
| Data isn't sufficient for decision-making                                    | But you can make decisions based on information.                                         |

## 5. What is Database
---
Database is an electronic place/system where data is stored in a way that it can be easily accessed, managed, and updated.
To make real use Data, we need Database Management Systems(DBMS)

## 6. Database Management Systems(DBMS)
---
1. A database-management system(DBMS) is a collection of **interrelated data** and **a set of programs to access those data**. The collection of data, usually referred to as the database, contains information relevant to an enterprise. The Primary of a DBMS is to provide a way to **store and retrieve database information** that is both convenient and efficient.
2. A DBMS is the database itself, along with all software and functionality. It is used to perform different operations, like **additions**, **access**, **updating**, and **deletion** of the data.

	![](Pasted%20image%2020250118210016.png)

## 8. DBMS vs File Systems
---
a. **File-Processing Systems** has major disadvantages.
1. Data Redundancy and inconsistency
2. Difficulty in accessing data
3. Data isolation
4. integrity problems
5. Atomicity problems
6. concurrent-access anomalies
7. Security problems
b. Above 7 points are also the Advantages of DBMS (answer to "why to use DBMS")


## 9. View of Data(Three Schema Architecture)
---
1. The major purpose of DBMS is to provide users with an abstract view of the data. That is, the system hides certain details of how the data is stored and maintained.
2. To simplify user interaction with system, abstraction is applied through several levels of abstraction.
3. The main objective of three level architecture is to enable multiple users to access the same data with a personalized view while storing the underlying data only once.
### Physical Level/Internal Level
1. The lowest level of abstraction describes how the data are stored.
2. Low-Level data structures used.
3. It has *Physical Schema* which describes physical storage structure of DB.
4. Talks about: Storage allocation (N-array tree etc), Data compression & encryption etc.
5. **Goal:** We must define algorithms that allow efficient access of data.
### Logical Level / Conceptual Level
1. The *conceptual schema* describes the design of a database at the conceptual level, describes *what* data are stored in DB, and what *relationships* exist among those data.
2. User at logical level does not need to be aware about physical-level structures.
3. **DBA:** who must decide what information to keep in the DB use the logical level of abstraction.

### View Level / External Level
1. Highest level of abstraction aims to simplify user's interaction with the system by providing different view to different end-user.
2. Each view schema describes the database part that a particular user group is interested and hides the remaining database from that user group.
3. At the external level, a database contain several schemas that sometimes called subschema. The subschema is used to describe the different view of the database.
4. At views also provide a *security* mechanism to prevent users from accessing certain parts of DB.
5
		![](dbms-three-schema-architecture%201.jpg)

*Tip:* Data Point: A "data point" in a database refers to a single piece of information stored within a table.

## Instances and Schemas of DB
---
1. The collection of information stored in the DB at a particular moment is called **instance** of DB.
2. The overall design of the DB is called *DB Schema*.
3. Schema is structural description of data. Schema *doesn't change frequently*. Data may change frequently.
4. **DB schema** corresponds to the variable declarations (along with type) in a program.
5. We have 3 type of schemas **physical**,**logical**, several **view schemas** called subschemas.
6. Logical schema is most important in terms of its effect on application programs, as programmers construct apps by using logical schema.
7. **Physical data independence**, physical schema change should not affect logical schema/application programs.
## Data Models
---
1. Provides a way to describe the *design* of a DB at **logical level**.
2. Underlying the structure of the DB is the Data Model; a collection of conceptual tools for describing **data**, **data relationships**, **data semantics & consistency constraints**.
3. E.g., **ER** model, **Relations** Model, **object-oriented** model, **object-relational** data model etc.
## Database Languages
---
1. **Data Definition Language(DDL)** to specify the database schema.
2. **Data Manipulation Language(DML)** to express database queries and updates.
3. **Pratically**, both language features are present in a single DB language, e.g., SQL language.
4. **DDL** we specify consistency constraints, which must be checked, every time DB is updated.
5. **DML** 
	1. **Data manipulation** involves
		- *Retrieval* of information stored in DB.
		- *Insertion* of new information into DB.
		- *Deletion* of information from DB.
		- *Updating* existing information stored in DB.
	2. **Query Language**, a part of DML to specify statement requesting the retrieval of information.
## How is Database accessed from Application programs?

1. Apps(written in host languages, C/C++,Java) interacts with DB.
2. E.g., Banking system's module generating payrolls access DB by executing DML statements from the host language.
3. API provided to send DML/DDL statements to DB and retrieve the results.
	1. Open Database Connectivity(*ODBC*), Microsoft "C".
	2. Java Database Connectivity (*JDBC*), Java.
## Database Administrator(DBA)
---
1. A person who has *central control* of both the data and the programs that access those data.
2. **Functions** of DBA:
	1. Schema Definition
	2. Storage Structure and access methods.
	3. Schema and physical organization modifications
	4. Authorization control.
	5. Routine maintenance
		1. Periodic backups
		2. Security patches
		3. Any upgrades.
## DBMS Application Architectures
---
Client machines, on which remote DB users work, and server machines on which DB system runs.
1. **T1** Architecture:
	1. The client,server, and DB all present on the same machine.
	
	![](Pasted%20image%2020250126005436.png)
	
1. **T2** Architecture:
	1. App is partitioned into 2-components.
	2. Client Machine, which invokes DB system functionality at server end through query language statements.
	3. API standards like *ODBC* & *JDBC* are used to interact between client and server.
	![](Pasted%20image%2020250126005449.png)
	
1. **T3** Architecture:
	1. App is partitioned into 3 logical components.
	2. Client machine is just a frontend and doesn't contain any direct DB calls.
	3. Client machine communicates with App server, and App server communicated with DB system to access data.
	4. *Business* logic, what action to take at that condition is in App server itself.
	5. T3 architecture are best for *WWW* Applications.
	6. **Advantages:** 
		1. *Scalability* due to distributed application servers.
		2. *Data Integrity*, App server acts as a middle layer between client and DB, which minimize the chances of data corruption/hacking.
		3. *Security*, client can't directly access DB, hence it is more secure.
		![](Pasted%20image%2020250126005503.png)


## Entity-Relationship Model
### Data Model

Data Model is Collection of conceptual tools for **describing data, data relationships, data semantics, and consistency constraints**.

### ER Model

1. It is a high level data model based on a perception of a real world that consists of a collection of basic objects, called entities and of relationships among these objects.
2. Graphical Representation of ER Model is **ER Diagram**, which acts as a blueprint of DB.

### Entity

An Entity is a **thing** or **object** in the real world that is distinguishable from all other objects.

1. Th has physical existence.
2. Each student in a college is an entity.
3. Entity can be uniquely identified. (by a primary attribute, aka Primary Key)
4. **Strong Entity**: Can be uniquely identified.
5. **Weak Entity**: Can't be uniquely identified, depends on some other strong entity.
	1. It doesn't have sufficient attributes to select a uniquely identifiable attribute.
	2. Loan -> Strong Strong, Payment-> Weak, as installments sequential number counter can be generated separate for each loan.
	3. Weak entity depends on strong entity existence.

### Entity Set

1. It is a set of entities of the same type that share the same properties, or attributes.
2. E.g., Student is an entity set.
3. E.g., Customer of a bank.

### Attributes

1. An entity is represented by a set of attributes.
2. Each entity has a value for each of its attributes.
3. For each attribute, there is a set of permitted values, called the domain, or value set, of that attribute.
4. E.g., Student Entity has following attributes
	A.Student_ID
	B. Name 
	C. Standard 
	D. Course 
	E. Batch 
	F. Contact number

### Types of Attributes

1. **Simple:** Attributes which can't be divided further. E.g., Customer's account number in a bank, Student's Roll number etc.
2. **Composite:** Can be divided into subparts(that is, other attributes).
	1. E.g., Name of a person, can be divided into first-name,middle-name, last-name. 
	2. If user want to refers to an entire attribute or to only a component of the attribute. 
	3. Address an also be divided, street, city, state, PIN code.
3. **Single-valued:** Only one value attribute. E.g., Student ID, loan-number for a loan.
4. **Multi-valued:** Attribute having more than one value. E.g., phone-number, nominee-name on some insurance, dependent-name etc. Limit constraint may be applied, upper or lower limits.

5. **Derived:** Value of this type of attribute can be derived from the value of other related attributes. E.g., Age, loan-age, membership-period etc.

