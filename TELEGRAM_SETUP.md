# Telegram Bot Setup Guide

## Step 1: Create a Telegram Bot

1. **Open Telegram** and search for `@BotFather`
2. **Start a chat** with BotFather
3. **Send `/newbot`** command
4. **Follow the prompts**:
   - Bot name: `Memelist Bot` (or your preferred name)
   - Bot username: `memelist_bot` (must end with `_bot`)
5. **Copy the bot token** (looks like: `123456789:ABCdefGHIjklMNOpqrsTUVwxyz`)

## Step 2: Create a Telegram Channel

1. **Create a new channel** in Telegram
2. **Add your bot** as an administrator:
   - Go to channel settings → Administrators
   - Add your bot (`@memelist_bot`)
   - Give it permission to post messages
3. **Get the channel ID**:
   - Forward any message from your channel to `@userinfobot`
   - Copy the channel ID (looks like: `-1001234567890`)

## Step 3: Configure Environment Variables

Create a `.env.local` file in your project root with:

```
# Telegram Bot Configuration
VITE_TELEGRAM_BOT_TOKEN=your_bot_token_here
VITE_TELEGRAM_CHAT_ID=your_channel_id_here
VITE_TELEGRAM_ENABLED=true
```

## Step 4: Test the Integration

1. **Restart your dev server**: `npm run dev`
2. **Open browser console** and run:
   ```javascript
   testBotPermissions()
   ```
3. **Test sending a message**:
   ```javascript
   testTelegram()
   ```

## Troubleshooting

- **Bot token format**: Should be `123456789:ABCdefGHIjklMNOpqrsTUVwxyz`
- **Channel ID format**: Should be `-1001234567890` (negative number)
- **Bot permissions**: Bot must be admin in the channel
- **Environment variables**: Must start with `VITE_` to be accessible in browser

## Example Configuration

```
VITE_TELEGRAM_BOT_TOKEN=123456789:ABCdefGHIjklMNOpqrsTUVwxyz
VITE_TELEGRAM_CHAT_ID=-1001234567890
VITE_TELEGRAM_ENABLED=true
```
