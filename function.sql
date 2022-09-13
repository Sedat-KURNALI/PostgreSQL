--function oluşturma

-- //1. Ornek: Iki parametre ile calisip bu parametreleri toplayarak return yapan bir fonksiyon olusturun.

CREATE FUNCTION toplamaF(x NUMERIC, y NUMERIC)
RETURN NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN

RETURN x+y;

END
$$




