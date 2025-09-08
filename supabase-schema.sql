-- Create listings table
CREATE TABLE IF NOT EXISTS listings (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  ticker VARCHAR(50) NOT NULL,
  short_desc TEXT NOT NULL,
  chain VARCHAR(20) NOT NULL CHECK (chain IN ('solana', 'ethereum', 'bnb', 'base', 'polygon')),
  
  -- Social media links
  website TEXT,
  twitter TEXT,
  telegram TEXT,
  discord TEXT,
  github TEXT,
  pumpfun TEXT,
  moonshot TEXT,
  
  -- Aggregator links
  coingecko_url TEXT,
  cmc_url TEXT,
  dexscreener_url TEXT,
  dextools_url TEXT,
  
  -- Trust signals
  audit_url TEXT,
  kyc_url TEXT,
  liquidity_lock_url TEXT,
  liquidity_lock_until TIMESTAMP WITH TIME ZONE,
  
  -- Media
  image_data_url TEXT,
  
  -- Metadata
  owner VARCHAR(255) NOT NULL DEFAULT 'anonymous',
  status VARCHAR(20) NOT NULL DEFAULT 'listed' CHECK (status IN ('pending', 'paid', 'listed')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  listed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_listings_chain ON listings(chain);
CREATE INDEX IF NOT EXISTS idx_listings_status ON listings(status);
CREATE INDEX IF NOT EXISTS idx_listings_created_at ON listings(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_listings_name ON listings USING gin(to_tsvector('english', name));
CREATE INDEX IF NOT EXISTS idx_listings_ticker ON listings USING gin(to_tsvector('english', ticker));

-- Add unique constraint to prevent duplicate listings
-- First check if constraint doesn't exist, then add it
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints 
        WHERE constraint_name = 'unique_name_ticker' 
        AND table_name = 'listings'
    ) THEN
        ALTER TABLE listings ADD CONSTRAINT unique_name_ticker UNIQUE (name, ticker);
    END IF;
END $$;

-- Create updated_at trigger
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Drop trigger if it exists, then create it
DROP TRIGGER IF EXISTS update_listings_updated_at ON listings;
CREATE TRIGGER update_listings_updated_at 
    BEFORE UPDATE ON listings 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- Enable Row Level Security (RLS)
ALTER TABLE listings ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist, then create them
DROP POLICY IF EXISTS "Allow public read access" ON listings;
CREATE POLICY "Allow public read access" ON listings
    FOR SELECT USING (true);

DROP POLICY IF EXISTS "Allow authenticated users to insert" ON listings;
CREATE POLICY "Allow authenticated users to insert" ON listings
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');

DROP POLICY IF EXISTS "Allow users to update their own listings" ON listings;
CREATE POLICY "Allow users to update their own listings" ON listings
    FOR UPDATE USING (auth.uid()::text = owner OR owner = 'anonymous');

DROP POLICY IF EXISTS "Allow users to delete their own listings" ON listings;
CREATE POLICY "Allow users to delete their own listings" ON listings
    FOR DELETE USING (auth.uid()::text = owner OR owner = 'anonymous');

-- Insert some sample data
INSERT INTO listings (name, ticker, short_desc, chain, website, twitter, telegram, owner, status) VALUES
('GoatG', 'GOAATG', 'GOAT YES IS GOAT - The ultimate goat meme coin on Solana', 'solana', 'https://goatg.com', 'https://twitter.com/goatg', 'https://t.me/goatg', 'anonymous', 'listed'),
('MonkyDar', 'MDAAR', 'dont be a monky daar - Revolutionary monkey meme token', 'solana', 'https://monkydar.fun', 'https://twitter.com/monkydar', NULL, 'anonymous', 'listed'),
('SuperDoge', 'SDOGE', 'Superdoge is a super sdoge with amazing tokenomics and locked liquidity', 'solana', 'https://superdoge.io', 'https://twitter.com/superdoge', 'https://t.me/superdoge', 'anonymous', 'listed');
