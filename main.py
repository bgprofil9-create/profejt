from telegram import Update
from telegram.ext import Application, CommandHandler, ContextTypes
import os

TOKEN = os.getenv("BOT_TOKEN")  # Токенът се взима от Environment в Render

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text("Главният контролер работи! 👋\nИзползвай /list за устройства.")

async def list_devices(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text("Засега няма свързани устройства...")

def main():
    if not TOKEN:
        print("Грешка: BOT_TOKEN не е зададен в Environment!")
        return
    
    print(f"Стартирам бота с токен: {TOKEN[:10]}...")  # Показва само първите 10 символа за сигурност
    
    app = Application.builder().token(TOKEN).build()
    
    app.add_handler(CommandHandler("start", start))
    app.add_handler(CommandHandler("list", list_devices))
    
    print("Ботът стартира...")
    app.run_polling(allowed_updates=Update.ALL_TYPES)

if __name__ == "__main__":
    main()
