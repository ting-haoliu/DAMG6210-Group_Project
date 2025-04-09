--This view provides detailed book information by joining book data with related author, genre, and inventory data.
CREATE VIEW BookDetailsView AS
SELECT 
    b.bookId,
    bg.title,
    a.name AS authorName,
    g.name AS genreName,
    bg.price,
    i.quantity AS inventoryQuantity
FROM 
    Book b
JOIN 
    BookGroup bg ON b.bookGroupId = bg.bookGroupId
JOIN 
    Author a ON bg.authorId = a.authorId
JOIN 
    Genre g ON bg.genreId = g.genreId
JOIN 
    Inventory i ON bg.inventoryId = i.inventoryId;

SELECT * FROM BookDetailsView;


--Generating reports showing all reviews by customers
--Building admin dashboards for managing user feedback
--Quickly connecting login data (from Account) with actual customer feedback
CREATE VIEW CustomerReviewAccountView AS
SELECT
    c.customerId,
    c.name AS customerName,
    a.accountName,
    r.reviewId,
    r.bookGroupId,
    r.rating,
    r.comment,
    r.reviewDate
FROM
    Customer c
JOIN
    Account a ON c.customerId = a.customerId
LEFT JOIN
    Review r ON c.customerId = r.customerId;

SELECT * FROM CustomerReviewAccountView WHERE rating >= 4;


