import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate("wsbredditwebscrapper-firebase-adminsdk-gm77o-38c30d51c9.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

db.collection('persons').add({'name': 'peter', 'age': 24})
