import praw
import keys
import parse_csv
import operator
import time
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

#Firebase Credential Setup
cred = credentials.Certificate("wsbredditwebscrapper-firebase-adminsdk-gm77o-5d81fe6603.json")
firebase_admin.initialize_app(cred)

#Firebase Database Setup
db = firestore.client()
wsb_db_day0 = db.collection('WSB').document('day0')
wsb_db_day1 = db.collection('WSB').document('day1')
wsb_db_day2 = db.collection('WSB').document('day2')
wsb_db_day3 = db.collection('WSB').document('day3')
wsb_db_day4 = db.collection('WSB').document('day4')
wsb_db_day5total = db.collection('WSB').document('day5total')

#Reddit Credential Setup
reddit = praw.Reddit(
    user_agent="Comment Extraction by u/pete_sauce",
    client_id=keys.CLIENT_ID,
    client_secret=keys.CLIENT_SECRET,
    username=keys.USERNAME,
    password=keys.PASSWORD
)

#Create Dictionary of Tickers
dictionary = parse_csv.stock_dictionary()

#Parse Comments for Ticker
def tckrcount(val):
    lst = val.split()
    for tckr in lst:
        if tckr[-1] == '.' or tckr[-1] == ',':
            tckr = tckr[0:len(tckr) - 1]
        if tckr in dictionary:
            dictionary[tckr] += 1


#Reddit variables
subreddit = reddit.subreddit("wallstreetbets")
total_comments = 0
comments_parsed = 0
subs = 0
current_time = time.time()

#Comment Extraction From Reddit
for submission in subreddit.new(limit=1000):
    #If 24 hours into comments break out of loop
    if submission.created_utc < (current_time - 86400):
        break
    total_comments += submission.num_comments

    #If post with large amount of comments reduce the amount of comments read
    if submission.num_comments > 2000:
        submission.comments.replace_more(limit=100)
    else:
        submission.comments.replace_more(limit=None)
    subs += 1
    for comment in submission.comments.list():
        tckrcount(comment.body)
        comments_parsed += 1

#Sort List of Stocks
sorted_stock_list = dict(sorted(dictionary.items(), key=operator.itemgetter(1),reverse=True))
print('Total comments ='+str(total_comments))
print('Comments parsed = '+str(comments_parsed))
print('Submissions parsed = '+str(subs))
sorted_stock_list = {key:val for key, val in sorted_stock_list.items() if val != 0}

#Collect DB Data
days = db.collection('WSB').limit(5).stream()
day_data = []
for data in days:
    day_data.append(data.to_dict())
day_data.insert(0, sorted_stock_list)

day5total = wsb_db_day5total.get()
day_5_data = day5total.to_dict()

#Add day 0 data into 5 day count data
for key in day_data[0]:
    if key in day_5_data:
        day_5_data[key] = day_5_data[key] + day_data[0][key]
    else:
        day_5_data[key] = day_data[0][key]


wsb_db_day5total.set(day_5_data)

#Remove popped data from day_5 count
subtracted_data = day_data.pop()
for key in subtracted_data:
    if key in day_5_data:
        day_5_data[key] = day_5_data[key] - subtracted_data[key]
wsb_db_day5total.set(day_5_data)

for i in range(5):
    vars()['wsb_db_day' + str(i)].set(day_data[i])