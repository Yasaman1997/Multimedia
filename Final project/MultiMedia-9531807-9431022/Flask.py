from flask import Flask, render_template, request, redirect
app = Flask(__name__)
import cv2 as cv
import numpy
import matplotlib.pyplot as plt
from FileManager import readFile
from Wikipedia import readwiki
import pickle


def readE():
    file = open('content/E.pickle', 'rb')
    variable = pickle.load(file)
    file.close()
    return variable


def readF():
    file = open('content/F.pickle', 'rb')
    variable = pickle.load(file)
    file.close()
    return variable


def readW():
    file = open('content/W.pickle', 'rb')
    variable = pickle.load(file)
    file.close()
    return variable


def readC():
    file = open('content/C.pickle', 'rb')
    variable = pickle.load(file)
    file.close()
    return variable


def show_with_plot(img, title):
    plt.figure()
    if 'gray' in title:
        plt.imshow(img, cmap='gray')
    else:
        plt.imshow(img)
    plt.xticks([])
    plt.yticks([])
    plt.title(title)
    plt.show()


dic = readFile('index.xlsx')
page_content = "None"
label = "None"


@app.route("/", methods=['GET', 'POST'])
@app.route("/index.html", methods=['GET', 'POST'])
def indexPage():
    global page_content, new_content, label
    if request.method == "POST":
        if request.form['action'] == "Process":
            # print(request.form)
            label = dic[int(request.files['file'].filename[:-4])]
            print(label)
            if label == 'E':
                label = 'Earthquake'
                page_content = readE()
            elif label == 'F':
                label = 'Flood'
                page_content = readF()
            elif label == 'C':
                label = 'Cyclone'
                page_content = readC()
            else:
                label = 'Wildfire'
                page_content = readW()
            print(len(page_content))
            new_content = page_content
            # if len(page_content) > 1000:
            #     page_content = page_content[:1000]
            # filename = request.form['file']
            # img = cv.imdecode(numpy.fromstring(request.files['file'].read(), numpy.uint8), cv.IMREAD_UNCHANGED)
            # print(img.shape)
            # imageRGB = cv.cvtColor(img, cv.COLOR_BGR2RGB)
            # show_with_plot(imageRGB, 'title')
            # img = request.form['pic']
        return redirect("/res.html")
    return render_template('/index.html')


@app.route("/res.html", methods=['GET', 'POST'])
def resultPage():
    return render_template("/res.html", page_content=page_content, label=label)
    # if request.method == "POST":
    #     return redirect("/res.html")


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=31807)
