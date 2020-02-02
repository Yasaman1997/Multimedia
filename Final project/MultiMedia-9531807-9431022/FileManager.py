import pandas as pd


def readFile(path):
    if path.endswith('csv'):
        dfs = pd.read_csv(path)
        dfs.to_excel(path[:-3] + 'xlsx', index=None, header=True)
    dic = {}
    dfs = pd.read_excel(path, sheet_name=None)
    # print(type(dfs))
    # print(dfs.keys())
    for key, value in dfs.items():
        for index, row in value.iterrows():
            dic[row['index']] = row['class']
            # print((row['index']))
            # print(index)
    # print(dic)
    return dic


# readFile('index.xlsx')
