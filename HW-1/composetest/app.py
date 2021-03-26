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
    return "The transaction is "+str(transaction_id)

@app.route('/check_your_chungus_size')
def get_size(chungus_size = random.randint(0, 1)):
    if (chungus_size):
        return "Your chungus size is Big! Good jod!"
    else:
        return "Your chungus size is small! Boooooooooooo"
