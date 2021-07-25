import sys  
reload(sys)  
sys.setdefaultencoding('utf8')
import logging
import pandas as pd 
import numpy as np
from bottle import HTTPResponse
from mysql.connector import connect, Error, IntegrityError
logger = logging.getLogger(__name__)
import requests
from flask import Flask, request, jsonify, _request_ctx_stack, Response
from flask import request
from flask import jsonify
from flask_cors import cross_origin
from functools import wraps
from six.moves.urllib.request import urlopen
from functools import wraps
from flask import Flask, request, jsonify, _request_ctx_stack
from flask_cors import cross_origin
# from your_validator import your_validator
# from oauthlib.oauth1 import AccessTokenEndpoint
# endpoint = AccessTokenEndpoint(your_validator)
app = Flask(__name__)
app.config.from_object('config.DevelopmentConfig')
import csv 
from csv import DictWriter
import json
import jwt

connection = connect(
    database = app.config['MYSQL_DB'],
    host = app.config['MYSQL_HOST'],
    user = app.config['MYSQL_USER'],
    password = app.config['MYSQL_PASSWORD']
)

def authorization(header):
    try:
        payload = jwt.decode(
            header['Authorization'],
            "secret", algorithms=["HS256"]
        )
        print(payload['email'])
        if (connection) :
            query = "SELECT * from auth_users where email = %s"
            value = (payload['email'],)
            cursor = connection.cursor(dictionary=True) 
            if (cursor):
                try:
                    cursor.execute(query, value)
                    result = cursor.fetchall()
                    print(result)
                    if result:
                        return True
                    connection.commit()
                except Error as err:
                    pass
        return False
    except Exception as e:
        pass

@app.route("/login", methods = ['POST'])
def login():
    try:
        user_name = request.form['user_name']
        email = request.form['email']
        token = jwt.encode({'user': user_name, 'email': email}, 'secret', algorithm='HS256')
        res = {
            'success': True,
            'token': token
        }
        return res
    except Exception as e:
        res = {
            'success': False,
            'message': e
        }

        return res

# @app.route("/battles", methods = ['POST', 'GET'])
# @cross_origin(headers=["Content-Type", "Authorization"])
# @requires_auth
@app.route("/battles", methods = ['POST', 'GET'])
def battles():
    try:
        header = request.headers
        data = request.json
        args = request.args
    
        if request.method == 'POST':
            if authorization(header) is not True: 
                res = {
                    'success': False,
                    'message': "Unauthorized",
                }
                return Response(json.dumps(res), status=401, mimetype='application/json')
            for battle in data:
                if 'name' in battle:
                    if (connection) :
                        query = "INSERT INTO battles (name, year, battle_number, attacker_king, defender_king, attacker_1, attacker_2, attacker_3, attacker_4, defender_1, defender_2, defender_3, defender_4, attacker_outcome, battle_type, major_death, major_capture, attacker_size, defender_size, attacker_commander, defender_commander, summer, location, region, note) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                        value = (battle['name'], battle['year'], int(float(battle['battle_number'] or 0.0)), battle['attacker_king'], battle['defender_king'], battle['attacker_1'], battle['attacker_2'], battle['attacker_3'], battle['attacker_4'], battle['defender_1'], battle['defender_2'], battle['defender_3'], battle['defender_4'], battle['attacker_outcome'], battle['battle_type'], int(float(battle['major_death'] or 0.0)), int(float(battle['major_capture'] or 0.0)), int(float(battle['attacker_size'] or 0.0)), int(float(battle['defender_size'] or 0.0)), battle['attacker_commander'], battle['defender_commander'], int(float(battle['summer'] or 0.0)), battle['location'], battle['region'], battle['note'])
                        cursor = connection.cursor() 
                        if (cursor):
                            try:
                                cursor.execute(query, value)
                                connection.commit()
                                message = 'New Battle created'
                            except IntegrityError as err:
                                message = "Battle exists"
                            
            res = {
                'success': True,
                'message': message
            }
            return Response(json.dumps(res), status=200, mimetype='application/json')
        elif request.method == 'GET':
            if (connection) :
                query = "SELECT * FROM battles"
                message = 'Battle Fetched'
                if 'battle_number' in args:
                    battle_number = args['battle_number']
                    query = "SELECT * FROM battles WHERE battle_number = %s"
                    message = 'Fetched Battle '+battle_number
                    value = (battle_number,)
                cursor = connection.cursor(dictionary=True) 
                if (cursor):
                    try:
                        cursor.execute(query, value)
                        result = cursor.fetchall()
                        print(result)
                        connection.commit()
                    except Error as err:
                        print(err)
                        message = "Error Fetching"

            res = {
                "data": result,
                "message": message
            }
            
            return Response(json.dumps(res), status=200, mimetype='application/json')

        else:
            res = {
                'success': False,
                'message': 'Something went wrong'
            }

            return Response(json.dumps(res), status=500, mimetype='application/json')

    except Exception as e:
        res = {
            'success': False,
            'message': e
        }

        return Response(json.dumps(res), status=500, mimetype='application/json')

@app.route("/filter-battles", methods = ['GET'])
def filterBattles():
    try: 
       
        header = request.headers
        args = request.args
        if (connection) :
            query = "SELECT * FROM battles"
            message = 'Battle Fetched'
            if 'filter_list' in args:
                filter_list = args['filter_list']
                query = "SELECT %s FROM battles" %(filter_list) 
            if 'search_list' in args:
                search_list = args['search_list']
                search_list = search_list.replace(",", " and ").replace("'", "")
                search_list_query = " WHERE %s" %(search_list)
                query = query + search_list_query
                print(query)
            cursor = connection.cursor(dictionary=True) 
            if (cursor):
                try:
                    cursor.execute(query)
                    result = cursor.fetchall()
                    print(result)
                    connection.commit()
                except Error as err:
                    print(err)
                    message = "Error Fetching"

        res = {
            "data": result,
            "message": message
        }
        
        return Response(json.dumps(res), status=200, mimetype='application/json')
    except Exception as e:
        res = {
            'success': False,
            'message': e
        }

        return Response(json.dumps(res), status=500, mimetype='application/json')

@app.route("/battle-summary", methods = ['GET'])
def battleSummary():
    try: 
        header = request.headers
        args = request.args
        if (connection) :
            battle_type_query = "select count(battle_type), battle_type from battles group by battle_type;"
            defender_size_query = "select FLOOR(min(defender_size)) as min_defender_size, FLOOR(avg(defender_size)) as avg_defender_size, FLOOR(max(defender_size)) as max_defender_size from battles;"
            attacker_king_query = "SELECT attacker_king, COUNT(attacker_king) AS `attacker_king_occurrence` FROM battles GROUP BY attacker_king ORDER BY `attacker_king_occurrence` DESC LIMIT 1;"
            defender_king_query = "SELECT defender_king, COUNT(defender_king) AS `defender_king_occurrence` FROM battles GROUP BY defender_king ORDER BY `defender_king_occurrence` DESC LIMIT 1;"
            message = 'Battle Summary Fetched'
            cursor = connection.cursor(dictionary=True) 
            if (cursor):
                try:
                    cursor.execute(battle_type_query)
                    battle_type_result = cursor.fetchall()
                    cursor.execute(defender_size_query)
                    defender_size_result = cursor.fetchall()
                    cursor.execute(attacker_king_query)
                    attacker_king_result = cursor.fetchall()
                    cursor.execute(defender_king_query)
                    defender_king_result = cursor.fetchall()
                    print(attacker_king_result)
                    result = {
                        "battle_count": battle_type_result,
                        "defender_summary": defender_size_result,
                        "active_attacker_king": attacker_king_result,
                        "active_defender_king": defender_king_result,
                    }
                    connection.commit()
                except Error as err:
                    print(err)
                    message = "Error Fetching"

        res = {
            "data": result,
            "message": message
        }
        
        return Response(json.dumps(res), status=200, mimetype='application/json')
    except Exception as e:
        res = {
            'success': False,
            'message': e
        }

        return Response(json.dumps(res), status=500, mimetype='application/json')
    
if __name__ == "__main__":
	app.run(debug = True, host = "0.0.0.0", port = 8484)	# ADHR (1488(18))