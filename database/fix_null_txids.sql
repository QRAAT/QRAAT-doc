-- Try to update est rows with missing txIDs. This doesn't 
-- appear to work all the time, and I imagine there are 
-- ambiguous situations. 

UPDATE qraat.mice AS e, qraat.txlist AS t
   SET e.txID = t.ID
 WHERE e.txID IS NULL
   AND t.ID <= 50 
   AND (CAST(t.frequency * 1000000 AS UNSIGNED) - 4000) < e.frequency
   AND e.frequency < (CAST(t.frequency * 1000000 AS UNSIGNED) + 4000)
  ;

-- UPDATE qraat.mice SET txID=NULL; 
