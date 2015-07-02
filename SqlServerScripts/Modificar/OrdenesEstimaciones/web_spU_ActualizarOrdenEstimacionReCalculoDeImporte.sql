
UPDATE oe
SET oe.ImporteTotal = (SELECT SUM(oed.Importe) FROM OrdenesEstimacionesD oed WHERE oed.ID = oe.ID) 
FROM OrdenesEstimaciones oe
INNER JOIN OrdenesEstimacionesD oed
ON oe.ID = oed.ID;