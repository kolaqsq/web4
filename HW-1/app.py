import time
import random

import redis
from flask import Flask

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)


def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


@app.route('/')
def hello():
    count = get_hit_count()
    return 'Hello from Docker! I have been seen {} times.\n'.format(count)


@app.route('/sale/<transaction_id>')
def get_sale(transaction_id=0):
    return "The transaction is " + str(transaction_id)


@app.route('/check_your_chungus_size')
def get_size(chungus_size=random.randint(0, 1000)):
    if chungus_size % 2 == 1:
        return "Your chungus size is Big! Good jod!"
    else:
        return "Your chungus size is small! Boooooooooooo"

@app.route('/test')
def helloTest():
    ddd = get_hit_count()
    # обратиться ко внешнему сервису, чтобы он отправил смс
    # у смс сервиса есть  API
    # нам нужно подменить оригинальный API/ROUTE на наш МОК
    # ENV_SMS_API_ROUTE=http://localhost/8081/sms-send/
    # ENV_SMS_API_ROUTE=http://original
    # {"id":"123213", "status_code":12321}
    return 'test {} \n '.format(ddd)
