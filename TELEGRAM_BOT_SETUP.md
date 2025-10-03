# Telegram Bot Setup for Memelist.Fun

## Environment Variables Required

Add these environment variables to your deployment platform (Vercel, Netlify, etc.):

```bash
# Required: Your Telegram Bot Token
TELEGRAM_BOT_TOKEN=your_bot_token_here

# Optional: Additional targets (if you want to post to multiple channels)
TELEGRAM_GROUP_ID=your_group_id_here
TELEGRAM_CHANNEL_ID=your_channel_id_here
```

## How to Get Your Bot Token

1. **Create a Telegram Bot:**
   - Message [@BotFather](https://t.me/BotFather) on Telegram
   - Send `/newbot` command
   - Follow the instructions to create your bot
   - Copy the bot token (looks like: `123456789:ABCdefGHIjklMNOpqrsTUVwxyz`)

2. **Add Bot to Your Channel:**
   - Go to your channel [@memelistfun](https://t.me/memelistfun)
   - Add your bot as an administrator
   - Give it permission to post messages
   - Make sure the bot can post without admin approval

## Current Configuration

The bot is now configured to post to:
- **Primary Target**: [@memelistfun](https://t.me/memelistfun) (your main channel)
- **Fallback**: Any additional channels you configure

## Testing

1. Add a new listing to your website
2. Check your [@memelistfun](https://t.me/memelistfun) channel
3. You should see a new post with the listing details

## Troubleshooting

**If posts don't appear:**
1. Check that `TELEGRAM_BOT_TOKEN` is set correctly
2. Verify the bot is added to your channel as admin
3. Check the bot has permission to post messages
4. Look at your deployment logs for error messages

**Common Issues:**
- Bot not added to channel → Add bot as admin
- Wrong bot token → Check token format
- Bot doesn't have post permissions → Update bot permissions in channel settings
