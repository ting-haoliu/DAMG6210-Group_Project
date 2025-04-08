CREATE FUNCTION dbo.fn_IsValidAccountName (@accountName VARCHAR(255))
    RETURNS BIT
    WITH SCHEMABINDING
AS
BEGIN
    RETURN CASE
               WHEN LEN(@accountName) > 5 THEN 1
               ELSE 0
        END
END;

ALTER TABLE Account
    ADD CONSTRAINT CHK_AccountName_Length
        CHECK (dbo.fn_IsValidAccountName(accountName) = 1);
