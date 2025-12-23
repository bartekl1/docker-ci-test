from flask import Flask, request, send_file

def create_app() -> Flask:
    app = Flask(__name__, static_folder="frontend/dist", static_url_path="/")

    @app.route("/")
    def index():
        return send_file("frontend/dist/index.html")
    
    return app

def run_app():
    app = create_app()
    app.run()

if __name__ == "__main__":
    run_app()
