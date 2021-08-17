import telebot

# My python files
import config

bot = telebot.TeleBot(config.TOKEN)

#@bot.message_handler(commands=["start"])
#def start_command_handler(msg):
#	print(msg)

if __name__ == '__main__':
	bot.polling(none_stop=True)
