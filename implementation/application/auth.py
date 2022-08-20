from functools import wraps
from datetime import datetime
from datetime import timedelta

from flask import Blueprint
from flask import render_template
from flask import redirect
from flask import request
from flask import url_for
from flask import current_app
from flask import jsonify
from flask import make_response
from flask import session
from flask import flash
import jwt

from application.backend.classes.Manager import Manager
from .views import checkToken

auth = Blueprint('auth', __name__)

@auth.route('/login', methods = ['GET', 'POST'])
@checkToken
def login(user):
    if request.method == 'POST':
        pass
    elif request.method == 'GET':
        return render_template("auth/login.html")

@auth.route('/logout')
def logout():
    if 'token' in request.cookies:
        token = request.cookies.get('token')
        if token:
            msg = "logged out"
            res = make_response(render_template("any.html", any=msg))
            res.set_cookie('token', '', expires=0)
        else:
            res = make_response(render_template("any.html", any=msg))
            msg = "No Value in Token."
    else:
        res = make_response(render_template("any.html", any=msg))
        msg = "Token Not Set."
    return res

@auth.route('/register')
@checkToken
def signup(user):
    return render_template("auth/register.html")
