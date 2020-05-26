CREATE TABLE branch (
    branchID int(10) NOT NULL AUTO_INCREMENT,
    branchName varchar(255) NOT NULL,
    branchManager varchar(255),
    CONSTRAINT PK_branchID PRIMARY KEY (branchID)
);

CREATE TABLE branch_address (
    branchID int(10) NOT NULL,
    pin int(7),
    region varchar(255),
    city varchar(255) NOT NULL,
    state varchar(255) NOT NULL,
    CONSTRAINT FK_branchIDInAddress FOREIGN KEY (branchID) REFERENCES branch(branchID)
);


CREATE TABLE customer (
    customerID int(255) NOT NULL AUTO_INCREMENT,
    firstName varchar(255) NOT NULL,
    lastName varchar(255),
    age int(3),
    CHECK (age>=4),
    CONSTRAINT PK_customerID PRIMARY KEY (customerID)
);

CREATE TABLE customer_subscription (
    branchID int(10) NOT NULL,
    customerID int(10) NOT NULL,
    CONSTRAINT FK_branchIDInSubscription FOREIGN KEY (branchID) REFERENCES branch(branchID),
    CONSTRAINT FK_customerIDInSubscription FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

CREATE TABLE author (
    authorID int(10) NOT NULL AUTO_INCREMENT,
    firstName varchar(255) NOT NULL,
    lastName varchar(255),
    CONSTRAINT PK_authorID PRIMARY KEY (authorID)
);

CREATE TABLE books (
    bookID int(10) NOT NULL AUTO_INCREMENT,
    authorID int(10) NOT NULL,
    branchID int(10) NOT NULL,
    bookName varchar(255) NOT NULL,
    bookGenre varchar(255) NOT NULL,
    CONSTRAINT PK_bookID PRIMARY KEY (bookID),
    CONSTRAINT FK_authorIDInBooks FOREIGN KEY (authorID) REFERENCES author(authorID),
    CONSTRAINT FK_branchIDInBooks FOREIGN KEY (branchID) REFERENCES branch(branchID)
);

CREATE TABLE borrowed (
    bookID int(10) NOT NULL,
    customerID int(10) NOT NULL,
    borrowedDate date NOT NULL,
    dueDate date NOT NULL,
    dateReturned date,
    payFine int(5),
    CONSTRAINT FK_bookIDInBorrowed FOREIGN KEY (bookID) REFERENCES books(bookID),
    CONSTRAINT FK_customerIDInBorrowed FOREIGN KEY (customerID) REFERENCES customer(customerID)
);
