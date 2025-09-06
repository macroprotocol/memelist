# Supabase Integration Setup Guide

## Step 1: Create Supabase Project
1. Go to [supabase.com](https://supabase.com) and sign up/login
2. Click "New Project"
3. Choose your organization (or create one)
4. Fill in project details:
   - Project name: `memelist-db`
   - Database password: Choose a strong password
   - Region: Choose closest to your users
5. Click "Create new project"

## Step 2: Get Your Supabase Credentials
1. Go to Settings → API in your Supabase dashboard
2. Copy these values:
   - Project URL
   - Project API Key (anon/public key)

## Step 3: Set Up Environment Variables
Create a `.env.local` file in your project root with:
```
VITE_SUPABASE_URL=your_project_url_here
VITE_SUPABASE_ANON_KEY=your_anon_key_here
```

## Step 4: Create Database Schema
1. Go to SQL Editor in your Supabase dashboard
2. Copy and paste the contents of `supabase-schema.sql`
3. Click "Run" to execute the SQL

## Step 5: Test the Integration
1. Start your development server: `npm run dev`
2. Open your app and try:
   - Viewing listings (should load from database)
   - Creating a new listing
   - Editing a listing (with dev wallet)
   - Deleting a listing (with dev wallet)

## Database Schema Overview
The `listings` table includes:
- Basic info: name, ticker, description, chain
- Social links: website, twitter, telegram, discord, github, pumpfun, moonshot
- Aggregator links: coingecko, cmc, dexscreener, dextools
- Trust signals: audit, kyc, liquidity lock
- Media: image data URL
- Metadata: owner, status, timestamps

## Security Features
- Row Level Security (RLS) enabled
- Public read access
- Authenticated users can create listings
- Users can only edit/delete their own listings
- Dev wallet has admin privileges (handled in app logic)

## Troubleshooting
- Check browser console for database errors
- Verify environment variables are set correctly
- Ensure database schema was created successfully
- Check Supabase project is active and not paused
