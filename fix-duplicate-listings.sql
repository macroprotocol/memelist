-- Add unique constraint to prevent duplicate listings
-- This ensures that the combination of name and ticker is unique

-- First, let's check if there are any existing duplicates
-- (This query will show duplicates if they exist)
SELECT name, ticker, COUNT(*) as count
FROM listings 
GROUP BY name, ticker 
HAVING COUNT(*) > 1;

-- Add unique constraint on name and ticker combination
-- This will prevent duplicate listings based on name and ticker
ALTER TABLE listings 
ADD CONSTRAINT unique_name_ticker UNIQUE (name, ticker);

-- Alternative: If you want to be more strict and also consider chain
-- ALTER TABLE listings 
-- ADD CONSTRAINT unique_name_ticker_chain UNIQUE (name, ticker, chain);

-- Create an index for better performance on the unique constraint
CREATE INDEX IF NOT EXISTS idx_listings_name_ticker ON listings(name, ticker);
