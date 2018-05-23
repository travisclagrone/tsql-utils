﻿CREATE FUNCTION bANY (
	@values Array1D NOT NULL
)
RETURNS bit
WITH SCHEMABINDING
AS BEGIN
	DECLARE @any bit = 0;
	IF EXISTS(SELECT * FROM @values WHERE [value] = 1)
		SET @any = 1;
	ELSE IF EXISTS(SELECT * FROM @values WHERE [value] IS NULL)
		SET @any = NULL;
	RETURN @any;
END;