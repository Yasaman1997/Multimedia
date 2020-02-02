import wikipedia
import pickle


def readwiki(title):
    ny = wikipedia.page(title)
    content = ""
    for i in ny.content:
        if i == '\n':
            break
        content += i
    # print(content)
    return content


page_contentE = readwiki('Earthquake')
page_contentF = readwiki('Flood')
page_contentC = readwiki('Cyclone')
page_contentW = readwiki('Wildfire')

with open('content/E.pickle', 'wb') as handle:
    pickle.dump(page_contentE, handle, protocol=pickle.HIGHEST_PROTOCOL)
with open('content/F.pickle', 'wb') as handle:
    pickle.dump(page_contentF, handle, protocol=pickle.HIGHEST_PROTOCOL)
with open('content/C.pickle', 'wb') as handle:
    pickle.dump(page_contentC, handle, protocol=pickle.HIGHEST_PROTOCOL)
with open('content/W.pickle', 'wb') as handle:
    pickle.dump(page_contentW, handle, protocol=pickle.HIGHEST_PROTOCOL)
