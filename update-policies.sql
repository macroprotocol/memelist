-- Update RLS policies to allow anonymous users
-- Drop existing policies
DROP POLICY IF EXISTS "Allow authenticated users to insert" ON listings;
DROP POLICY IF EXISTS "Allow users to update their own listings" ON listings;
DROP POLICY IF EXISTS "Allow users to delete their own listings" ON listings;

-- Create new policies that allow anonymous users
CREATE POLICY "Allow anyone to insert" ON listings
    FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow anyone to update" ON listings
    FOR UPDATE USING (true);

CREATE POLICY "Allow anyone to delete" ON listings
    FOR DELETE USING (true);
