import praw
import keys
import parse_csv
import firebase_admin
from firebase_admin import credentials
import stock_scraper
import smtplib, ssl


#Firebase Credential Setup
cred = credentials.Certificate("wsbredditwebscrapper-firebase-adminsdk-gm77o-5d81fe6603.json")
firebase_admin.initialize_app(cred)

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

#subreddits = ['wallstreetbets', 'stocks', 'investing', 'StockMarket']
subreddits = ['Daytrading']
for sub in subreddits:
    stockScraper = stock_scraper.StockScraper(reddit, sub, dictionary)
    stockScraper.comment_extraction()
    stockScraper.firebase_operations()
    print('Comments Parsed = ' + str(stockScraper.comments_parsed))
    print('Total comments = ' + str(stockScraper.total_comments))
    del stockScraper

# # Email Setup
# port = 465  # For SSL
# context = ssl.create_default_context()
# message = """\
#     Subject: Scraper Complete
#
#     Scraper Complete
# """
# with smtplib.SMTP_SSL("smtp.gmail.com", port, context=context) as server:
#     server.login(keys.sender_email, keys.password)
#     server.sendmail(keys.sender_email, keys.receiver_email, message)
