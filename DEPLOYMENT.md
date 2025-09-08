# Deployment Guide for MemeList.fun

## 🚀 Quick Deployment Steps

### 1. Environment Variables Setup
Create a `.env.local` file in your project root with:
```bash
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
VITE_TELEGRAM_BOT_TOKEN=your_telegram_bot_token (optional)
VITE_TELEGRAM_CHAT_ID=your_telegram_chat_id (optional)
```

### 2. GitHub Repository Setup
1. Push your code to GitHub repository
2. Go to repository Settings → Secrets and Variables → Actions
3. Add these secrets:
   - `VERCEL_TOKEN`: Your Vercel API token
   - `VERCEL_ORG_ID`: Your Vercel organization ID
   - `VERCEL_PROJECT_ID`: Your Vercel project ID

### 3. Vercel Deployment
1. Connect your GitHub repository to Vercel
2. Set environment variables in Vercel dashboard
3. Deploy automatically on push to main branch

### 4. Supabase Configuration
1. Ensure your Supabase project is active
2. Run the SQL schema from `supabase-schema.sql`
3. Verify RLS policies are enabled
4. Test database connection

## 🔧 Build Commands

```bash
# Development
npm run dev

# Production build
npm run build

# Type checking
npm run type-check

# Linting
npm run lint
npm run lint:fix
```

## 📁 Project Structure
```
memelist/
├── .github/workflows/     # CI/CD workflows
├── src/
│   ├── components/        # React components
│   ├── services/         # API services
│   ├── lib/              # Utilities and configs
│   └── hooks/            # Custom React hooks
├── public/               # Static assets
├── vercel.json           # Vercel configuration
└── env.example           # Environment variables template
```

## 🛡️ Security Features
- Row Level Security (RLS) enabled
- Environment variables for sensitive data
- Production-only wallet adapters
- Input validation and sanitization

## 🔄 Update Process
1. Make changes locally
2. Test with `npm run dev`
3. Run `npm run build` to verify build
4. Push to main branch
5. Vercel automatically deploys
6. Verify deployment at memelist.fun

## 🐛 Troubleshooting
- Check Vercel deployment logs
- Verify environment variables
- Test Supabase connection
- Check browser console for errors
- Verify wallet connection on different devices
