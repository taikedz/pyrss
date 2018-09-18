#!/usr/bin/env python3

from flask import Flask
from flask import Response as FlaskResponse
import re

import web
import parse

app = Flask(__name__)

@app.route('/')
def index():
    return "<h1>It works !</h1>"

@app.route('/proxy/<path:url>')
def myfunc(url):
    status,mime,pagedata = web.pull(url)

    if re.match("text/(x|ht|xht)ml", mime):
        pagedata = parse.fix(pagedata, url)

    return FlaskResponse(pagedata, mimetype=mime), status

if __name__ == '__main__':
    app.run(debug=True)
