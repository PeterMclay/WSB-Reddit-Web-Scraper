import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Setup
cred = credentials.Certificate("wsbredditwebscrapper-firebase-adminsdk-gm77o-38c30d51c9.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
wsb_db_day0 = db.collection('WSB').document('day0')
wsb_db_day1 = db.collection('WSB').document('day1')
wsb_db_day2 = db.collection('WSB').document('day2')
wsb_db_day3 = db.collection('WSB').document('day3')
wsb_db_day4 = db.collection('WSB').document('day4')

day_data = []

new_data = {
    'PLTR': 7,
    'TSLA': 7,
    'GME': 7
}

days = db.collection('WSB').limit(5).stream()
for data in days:
    day_data.append(data.to_dict())
day_data.insert(0, new_data)
day_data.pop()
for i in range(5):
    vars()['wsb_db_day' + str(i)].set(day_data[i])




