import csv


def stock_dictionary():
    d = {}
    with open('stocks.csv', 'r') as stock_list:
        csv_reader = csv.reader(stock_list)
        next(csv_reader)
        for tckr in csv_reader:
            d[tckr[0]] = 0
        del d['DD']
        del d['A']
        del d['ARE']
        del d['CAN']
        del d['FORD']
        del d['ALL']
        del d['ATH']
        # del d['MOON']
        # del d['HOLD']
        # del d['DUDE']
        # del d['YOLO']
        return d
