import setup
import praw
import keys
import parse_csv
import operator
import time

reddit = praw.Reddit(
    user_agent="Comment Extraction by u/pete_sauce",
    client_id=keys.CLIENT_ID,
    client_secret=keys.CLIENT_SECRET,
    username=keys.USERNAME,
    password=keys.PASSWORD
)

dictionary = parse_csv.stock_dictionary()


def tckrcount(val):
    lst = val.split()
    for tckr in lst:
        if tckr[-1] == '.' or tckr[-1] == ',':
            tckr = tckr[0:len(tckr) - 1]
        if tckr in dictionary:
            dictionary[tckr] += 1


subreddit = reddit.subreddit("wallstreetbets")
print(subreddit.title)
comments = 0
subs = 0
current_time = time.time()
print('Current time '+ str(current_time))
for submission in subreddit.new(limit=1000):
    # if i == 1:
    #     i += 1
    #     continue
    if submission.created_utc < (current_time - 86400):
        print('breaking out')
        break
    if submission.num_comments > 2000:
        submission.comments.replace_more(limit=50)
    else:
        submission.comments.replace_more(limit=None)
    subs += 1
    for comment in submission.comments.list():
        tckrcount(comment.body)
        comments += 1

sorted_stock_list = dict(sorted(dictionary.items(), key=operator.itemgetter(1),reverse=True))
print('Comments parsed = '+str(comments))
print('Submissions parsed = '+str(subs))
sorted_stock_list = {key:val for key, val in sorted_stock_list.items() if val != 0}
print(sorted_stock_list)
