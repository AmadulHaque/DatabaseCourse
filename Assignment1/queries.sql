   
    SELECT Title
    FROM Book
    WHERE Stock > 0
    ORDER BY PublishedDate DESC
    LIMIT 20;


    SELECT *
    FROM Purchase
    WHERE PurchaseDate >= '2024-01-01';

    SELECT Name
    FROM Author
    WHERE Name LIKE 'Mohammad%' OR Name LIKE 'MD%'
    ORDER BY Name ASC;
