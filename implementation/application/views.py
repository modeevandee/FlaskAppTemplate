import logging
import json
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

from application.backend.classes.Manager import Manager

views = Blueprint('views', __name__)

manager = Manager()
logger = logging.getLogger("app_logger")


@views.route('/')
def home(user):
    if not user:
       return redirect(url_for('auth.login'))
    else:
        return render_template("index.html", user=user)

@views.route('/dash')
def dash(user):
    return render_template("dash.html", user=user)
