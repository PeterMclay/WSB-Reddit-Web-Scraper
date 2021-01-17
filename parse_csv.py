import csv


def stock_dictionary():
    d = {}
    with open('stocks.csv', 'r') as stock_list:
        csv_reader = csv.reader(stock_list)
        next(csv_reader)
        for tckr in csv_reader:
            d[tckr[0]] = 0
        del d['DD']
        del d['AT']
        return d
