CREATE FUNCTION GetBookAverageRating(@bookId BIGINT)
RETURNS DECIMAL(3,2)
AS
BEGIN
    DECLARE @AvgRating DECIMAL(3,2);
    
    SELECT @AvgRating = AVG(CAST(r.rating AS DECIMAL(3,2)))
    FROM [Review] r
    WHERE r.bookGroupId = @bookId;
    
    RETURN ISNULL(@AvgRating, 0);
END;
GO

ALTER TABLE [BookGroup]
ADD AverageRating AS (dbo.GetBookAverageRating(bookId));