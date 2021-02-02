import operator
import time
from firebase_admin import firestore


class StockScraper:

    def __init__(self, reddit_instance, subreddit_name, dictionary):
        self.reddit_instance = reddit_instance
        self.subreddit_name = subreddit_name
        self.comments_parsed = 0
        self.total_comments = 0
        self.current_time = time.time()
        self.dictionary = dictionary
        self.db = firestore.client()

    def comment_extraction(self):
        for submission in self.reddit_instance.subreddit(self.subreddit_name).new(limit=1000):
            if submission.created_utc < (self.current_time - 86400):
                print('Breaking out')
                break
            self.total_comments += submission.num_comments

            if submission.num_comments > 4000:
                submission.comments.replace_more(limit=750)
            else:
                submission.comments.replace_more(limit=None)
            for comment in submission.comments.list():
                self.tckr_count(comment.body)
                self.comments_parsed += 1
        self.dictionary = dict(sorted(self.dictionary.items(), key=operator.itemgetter(1), reverse=True))
        self.dictionary = {key: val for key, val in self.dictionary.items() if val != 0}
        self.dictionary['comments_parsed'] = self.comments_parsed
        self.dictionary['total_comments'] = self.total_comments

    def tckr_count(self, val):
        lst = val.split()
        for tckr in lst:
            if tckr[-1] == '.' or tckr[-1] == ',' or tckr[-1] == '!' or tckr[-1] == '?':
                tckr = tckr[0:len(tckr) - 1]
            if tckr in self.dictionary:
                self.dictionary[tckr] += 1

    def firebase_operations(self):
        db_day0 = self.db.collection(self.subreddit_name).document('day0')
        db_day1 = self.db.collection(self.subreddit_name).document('day1')
        db_day2 = self.db.collection(self.subreddit_name).document('day2')
        db_day3 = self.db.collection(self.subreddit_name).document('day3')
        db_day4 = self.db.collection(self.subreddit_name).document('day4')
        db_day5total = self.db.collection(self.subreddit_name).document('day5total')
        days = self.db.collection(self.subreddit_name).limit(5).stream()
        day_data = []

        for data in days:
            day_data.append(data.to_dict())
        day_data.insert(0, self.dictionary)
        day5total = db_day5total.get()
        day_5_data = day5total.to_dict()

        # Add day 0 data into 5 day count data
        for key in day_data[0]:
            if key in day_5_data:
                day_5_data[key] = day_5_data[key] + day_data[0][key]
            else:
                day_5_data[key] = day_data[0][key]
        db_day5total.set(day_5_data)

        # Remove popped data from day_5 count
        subtracted_data = day_data.pop()
        for key in subtracted_data:
            if key in day_5_data:
                day_5_data[key] = day_5_data[key] - subtracted_data[key]
        db_day5total.set(day_5_data)
        for i in range(5):
            vars()['db_day' + str(i)].set(day_data[i])

