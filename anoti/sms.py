from twilio.rest import Client
from . import config
from .util import logger


def send_text_message(message):
    client = Client(config.TWILIO_ACCOUNT_SID, config.TWILIO_AUTH_TOKEN)

    logger.info(f'Sending the following message to sms: {message}')
    for receiver_number in config.RECEIVER_NUMBER:
        client = Client(config.TWILIO_ACCOUNT_SID, config.TWILIO_AUTH_TOKEN)
        _message = client.messages.create(
            to=receiver_number, from_=config.ANOTI_NUMBER, body=message
        )
