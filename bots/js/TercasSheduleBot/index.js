var TelegramBot = require('node-telegram-bot-api');
var token = '454696476:AAG0ZRhMj2-Ce1TYTWt4t0WbtfaQWLZJiY0';
var botOptions = {
    polling : true
};
var bot = new TelegramBot(token, botOptions);

bot.getMe().then(function(me) {
    console.log('');
    console.log('Hello! My name is %s!', me.first_name);
    console.log('My id is %s.', me.id);
    console.log('And my username is @%s.', me.username);
    console.log('');
});

bot.onText(/^\/start/, (msg) => {
               console.log("START");

               var chatId = msg.chat.id;
               var msgUserFirstName = msg.from.first_name;
               var messageText = 'Приветствую тебя'; //, ' + msgUserFirstName;
               $keyboard = [
                   [ 'Начать ПРИЕМ дежурства' ]
               ];
               var messageOptions = {
                   reply_markup : {
                       keyboard : $keyboard,
                       resize_keyboard : true
                   }
               };

               bot.sendMessage(chatId, messageText, messageOptions);
           });

bot.onText(/ПРИЕМ/, (msg) => {
               var chatId = msg.chat.id;
               var messageText = 'Выберите сектор';
               $keyboard = [
                   [ 'П1' , 'В1П2' , 'В1П1П2' ]
               ];
               var messageOptions = {
                   reply_markup : {
                       keyboard : $keyboard,
                       resize_keyboard : true
                   }
               };

               bot.sendMessage(chatId, messageText, messageOptions);
           });

var sectorLabel = 'П1';

bot.onText(/П[12]/, (msg) => {
               var chatId = msg.chat.id;
               sectorLabel = msg.text;
               var messageText = 'Выбран сектор ' + sectorLabel;
               $keyboard = [
                   ['СТАРТ'] ,
                   ['Назад']
               ];
               var messageOptions = {
                    reply_markup : {
                       keyboard : $keyboard,
                       resize_keyboard : true
                    }
               };

               bot.sendMessage(chatId, messageText, messageOptions);
           });

bot.onText(/СТАРТ/, (msg) => {
               var chatId = msg.chat.id;
               var messageText = 'Выбран сектор \n' +
                                             'TIMER';
               $keyboard = [
                   ['СТОП']
               ];
               var messageOptions = {
                    reply_markup : {
                       keyboard : $keyboard,
                       resize_keyboard : true
                    }
               };

               bot.sendMessage(chatId, messageText, messageOptions);
           });

bot.onText(/СТОП/, (msg) => {
               var chatId = msg.chat.id;
               var messageText = 'Выбран сектор \n' +
                                              'TIMER STOPPED\n' +
                                              'ПРИЕМ';

               bot.sendMessage(chatId, messageText).then(function (go) {
                   console.log("STOPPED");
               });
           });
