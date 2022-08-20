def createApp():
    from flask import Flask
    app = Flask(__name__)
    #app.config['SECRET_KEY'] = "This is my secret key."
    from .views import views
    from .auth import auth
    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/')
    return app
