"""Шаблон простого Telegram бота."""
from aiogram import Bot, Dispatcher, executor, types
from environs import Env

env = Env()
env.read_env()
bot = Bot(token=env.str('BOT_TOKEN'))
dp = Dispatcher(bot)


@dp.message_handler(commands=['start', 'help'])
async def send_welcome(message: types.Message) -> None:
    """Обработчик команд `/start` и `/help`.

    Args:
        message (types.Message): объект сообщения
    """
    await message.reply("Hi!\nI'm EchoBot!\nPowered by aiogram.")


@dp.message_handler()
async def echo(message: types.Message) -> None:
    """Эхо. Повторяет текст, который вводит пользователь.

    Args:
        message (types.Message): объект сообщения
    """
    await message.answer(message.text)


if __name__ == '__main__':
    executor.start_polling(dp, skip_updates=True)
