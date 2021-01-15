import setup
import praw
import keys


reddit = praw.Reddit(
    user_agent="Comment Extraction by u/pete_sauce",
    client_id=keys.CLIENT_ID,
    client_secret=keys.CLIENT_SECRET,
    username=keys.USERNAME,
    password=keys.PASSWORD
)

# url = "https://www.reddit.com/r/veganrecipes/comments/iod9ba/vegan_mac_and_cheese_i_made_camping/"
# submission = reddit.submission(url=url)
# submission.comments.replace_more(limit=None)
# for comment in submission.comments.list():
#     print(comment.body)

subreddit = reddit.subreddit("wallstreetbets")
print(subreddit.title)
i = 1
for submission in subreddit.hot(limit=3):
    print("Submission "+str(i)+": "+submission.title+'\n')
    submission.comments.replace_more(limit=0)
    for comment in submission.comments.list():
        print(comment.body)
    i += 1

