
# BUILT-INS
import os.path


# VENDOR
from flask import Flask, Response, abort
from flask_restful import Resource, Api
import sqlite3


# CODE
app = Flask(__name__)
api = Api(app)


def get_mimetype (path):
      mimetypes = dict(
            css="text/css",
            js="application/javascript",
            html="text/html"
      )

      path, extension = os.path.splitext(path)
      return mimetypes.get(extension.replace(".", "").lower(), "text/plain")


class Workers (Resource):
      
      def get (self, day):
            query = """SELECT
                a.id,
                a.name,
                b.works
            FROM
                workers AS a
            LEFT JOIN
                labordays AS b
            ON
                a.id = b.worker
            WHERE
                b.day = ?;
            """

            db = sqlite3.connect("app.db")
            cur = db.cursor()
            cur.execute(query, (day,))

            data = cur.fetchall()

            data = [
                  {
                        "id": row[0],
                        "name": row[1],
                        "works": row[2]
                  } for row in data
            ]

            db.close()

            return data


@app.route("/", methods=["GET"])
def index ():
      with open("index.html", "r") as connection:
            content = connection.read()
            return Response(content,  mimetype="text/html")


@app.route("/statics/<path:path>", methods=["GET"])
def statics (path):
      if os.path.isfile(path):
            with open(path, "r") as conn:
                  content = conn.read()
                  return Response(content, mimetype=get_mimetype(path))
      else:
            abort(404)

api.add_resource(Workers, "/rest/workers/<int:day>")


if __name__ == "__main__":
   app.run(debug=True)
