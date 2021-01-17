import setup
import praw
import keys
import parse_csv
import operator


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
i = 1
for submission in subreddit.new(limit=1000):
    if i == 1:
        i += 1
        continue
    if submission.created_utc < 1610780400:
        print('breaking out')
        break
    submission.comments.replace_more(limit=None)
    for comment in submission.comments.list():
        tckrcount(comment.body)

sorted_stock_list = dict(sorted(dictionary.items(), key=operator.itemgetter(1),reverse=True))
print(sorted_stock_list)
