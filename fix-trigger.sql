-- Fix for existing trigger error
-- Drop the trigger if it exists first
DROP TRIGGER IF EXISTS update_listings_updated_at ON listings;

-- Then create the trigger
CREATE TRIGGER update_listings_updated_at 
    BEFORE UPDATE ON listings 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();
