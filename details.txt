1. Create new battles (Use the Login API to get token) - - LOGIN API (POINT 8)
API curl 

curl --location --request POST 'http://0.0.0.0:8484/battles' \
--header 'aikey: hocpsjmgebqxudrykzitvwanlf' \
--header 'Authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoibWl0Y2hlbGxlIiwiZW1haWwiOiJjcmVhZG9taXRjaGVsbGVAZ2FtaWwuY29tIn0.SvRhMcDBMW9R1Ew8XGzebkrXKuOQBYYObXrgdSQdnC0' \
--header 'Content-Type: application/json' \
--data-raw '[
    {
        "name": "Battle between 2 leaders",
        "year": "2020w",
        "battle_number": 402,
        "attacker_king": "Daniel",
        "defender_king": "Chris",
        "attacker_1": "",
        "attacker_2": "",
        "attacker_3": "",
        "attacker_4": "",
        "defender_1": "",
        "defender_2": "",
        "defender_3": "",
        "defender_4": "",
        "attacker_outcome": "",
        "battle_type": "",
        "major_death": "",
        "major_capture": "",
        "attacker_size": "",
        "defender_size": "",
        "attacker_commander": "",
        "defender_commander": "",
        "summer": "",
        "location": "",
        "region": "",
        "note": ""
    },
    {
        "name": "Battle between 2 politians",
        "year": "2021",
        "battle_number": 40,
        "attacker_king": "Rohan",
        "defender_king": "Ankit",
        "attacker_1": "",
        "attacker_2": "",
        "attacker_3": "",
        "attacker_4": "",
        "defender_1": "",
        "defender_2": "",
        "defender_3": "",
        "defender_4": "",
        "attacker_outcome": "",
        "battle_type": "",
        "major_death": "",
        "major_capture": "",
        "attacker_size": "",
        "defender_size": "",
        "attacker_commander": "",
        "defender_commander": "",
        "summer": "",
        "location": "",
        "region": "",
        "note": ""
    }
]'

response - 

if battle exists
{
    "message": "Battle exists",
    "success": true
}

else 
{
    "message": "Battle inserted successfully",
    "success": true
}

2. GET data

curl --location --request GET 'http://0.0.0.0:8484/battles' \
--data-raw ''

result - 

get all data 

3. GET data by id 

curl --location --request GET 'http://0.0.0.0:8484/battles?battle_number=3' \
--data-raw ''

result - 

{
    "data": [
        {
            "attacker_1": "Lannister",
            "attacker_2": "",
            "attacker_3": "",
            "attacker_4": "",
            "attacker_commander": "Jaime Lannister, Andros Brax",
            "attacker_king": "Joffrey/Tommen Baratheon",
            "attacker_outcome": "win",
            "attacker_size": 15000,
            "battle_number": 3,
            "battle_type": "pitched battle",
            "defender_1": "Tully",
            "defender_2": "",
            "defender_3": "",
            "defender_4": "",
            "defender_commander": "Edmure Tully, Tytos Blackwood",
            "defender_king": "Robb Stark",
            "defender_size": 10000,
            "id": 2,
            "location": "Riverrun",
            "major_capture": 1,
            "major_death": 0,
            "name": "Battle of Riverrun",
            "note": "",
            "region": "The Riverlands",
            "summer": 1,
            "year": "298"
        }
    ],
    "message": "Fetched Battle 3"
}

4. Filter data by columns 

curl --location --request GET 'http://0.0.0.0:8484/filter-battles?filter_list=name,%20year' \
--data-raw ''

result - 

{
    "data": [
        {
            "name": "Battle of the Golden Tooth",
            "year": "298"
        },
        {
            "name": "Battle of Riverrun",
            "year": "298"
        },
        {
            "name": "Battle of the Green Fork",
            "year": "298"
        },
        {
            "name": "Battle of the Whispering Wood",
            "year": "298"
        },
        {
            "name": "Battle of the Camps",
            "year": "298"
        },
        {
            "name": "Battle of Torrhen's Square",
            "year": "299"
        },
        {
            "name": "Sack of Winterfell",
            "year": "299"
        },
        {
            "name": "Battle of Oxcross",
            "year": "299"
        },
        {
            "name": "Siege of Storm's End",
            "year": "299"
        },
        {
            "name": "Battle of the Fords",
            "year": "299"
        },
        {
            "name": "Sack of Harrenhal",
            "year": "299"
        },
        {
            "name": "The Red Wedding",
            "year": "299"
        },
        {
            "name": "Battle of Castle Black",
            "year": "300"
        },
        {
            "name": "Retaking of Deepwood Motte",
            "year": "300"
        },
        {
            "name": "Battle between 2 leaders",
            "year": "2020w"
        },
        {
            "name": "Battle between 2 politians",
            "year": "2021"
        }
    ],
    "message": "Battle Fetched"
}

5. Filter & search 

curl --location --request GET 'http://0.0.0.0:8484/filter-battles?filter_list=name,%20year&search_list=%27name=%22Battle%20of%20the%20Golden%20Tooth%22,year=%22298%22%27' \
--data-raw ''

result - 

{
    "data": [
        {
            "name": "Battle of the Golden Tooth",
            "year": "298"
        }
    ],
    "message": "Battle Fetched"
}

6. Search 

curl --location --request GET 'http://0.0.0.0:8484/filter-battles?search_list=%27name=%22Battle%20of%20the%20Golden%20Tooth%22,year=%22298%22%27' \
--data-raw ''

result - 

{
    "data": [
        {
            "attacker_1": "Lannister",
            "attacker_2": "",
            "attacker_3": "",
            "attacker_4": "",
            "attacker_commander": "Jaime Lannister",
            "attacker_king": "Joffrey/Tommen Baratheon",
            "attacker_outcome": "win",
            "attacker_size": 15000,
            "battle_number": 1,
            "battle_type": "pitched battle",
            "defender_1": "Tully",
            "defender_2": "",
            "defender_3": "",
            "defender_4": "",
            "defender_commander": "Clement Piper, Vance",
            "defender_king": "Robb Stark",
            "defender_size": 4000,
            "id": 1,
            "location": "Golden Tooth",
            "major_capture": 0,
            "major_death": 1,
            "name": "Battle of the Golden Tooth",
            "note": "",
            "region": "The Westerlands",
            "summer": 1,
            "year": "298"
        }
    ],
    "message": "Battle Fetched"
}

7. Aggregrate functions 

curl --location --request GET 'http://0.0.0.0:8484/battle-summary' \
--data-raw ''

result - 

{
    "data": {
        "active_attacker_king": [
            {
                "attacker_king": "Robb Stark",
                "attacker_king_occurrence": 6
            }
        ],
        "active_defender_king": [
            {
                "defender_king": "Robb Stark",
                "defender_king_occurrence": 5
            }
        ],
        "battle_count": [
            {
                "battle_type": "pitched battle",
                "count(battle_type)": 6
            },
            {
                "battle_type": "ambush",
                "count(battle_type)": 6
            },
            {
                "battle_type": "siege",
                "count(battle_type)": 2
            },
            {
                "battle_type": "",
                "count(battle_type)": 2
            }
        ],
        "defender_summary": [
            {
                "avg_defender_size": 6285,
                "max_defender_size": 20000,
                "min_defender_size": 0
            }
        ]
    },
    "message": "Battle Summary Fetched"
}

8. Login API request

curl --location --request POST 'http://0.0.0.0:8484/login' \
--header 'content-type: application/x-www-form-urlencoded' \
--form 'user_name="mitchelle"' \
--form 'email="creadomitchelle@gamil.com"'

response - 

{
    "success": true,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoibWl0Y2hlbGxlIiwiZW1haWwiOiJjcmVhZG9taXRjaGVsbGVAZ2FtaWwuY29tIn0.SvRhMcDBMW9R1Ew8XGzebkrXKuOQBYYObXrgdSQdnC0"
}

