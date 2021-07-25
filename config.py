class Config(object):
    DEBUG = False
    TESTING = False

    FILENAME = "battles.csv"

class DevelopmentConfig(object):
    DEBUG = True
    FILENAME = "battles_dev.csv"
    RESPONSE_FILENAME = "battles_dev.json"
    FILEDS = ['name', 'year', 'battle_number', 'attacker_king', 'defender_king', 'attacker_1', 'attacker_2', 'attacker_3', 'attacker_4', 'defender_1', 'defender_2', 'defender_3', 'defender_4', 'attacker_outcome', 'battle_type', 'major_death', 'major_capture', 'attacker_size', 'defender_size', 'attacker_commander', 'defender_commander', 'summer', 'location', 'region', 'note'] 
    MYSQL_HOST = "localhost"
    MYSQL_USER = "root"
    MYSQL_PASSWORD = "abc12345"
    MYSQL_DB = "battles"
    AUTH0_DOMAIN = '0.0.0.0:8484/'
    API_AUDIENCE = 'YOUR_API_AUDIENCE'
    ALGORITHMS = ["RS256"]
