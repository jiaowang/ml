#!/usr/bin/env python

import math
print 'learning itemcf.'

userdat = './ml-1m/user.dat';
moviesdat = './ml-1m/user.dat';
ratingsdat = './ml-1m/ratings.dat';

def loaddat(path):
    fobj = open(path,'r')
    try:
        return fobj.readlines(1000);
    except Exception as e:
        raise
    fobj.close();

def ratings2map():
    itemes = loaddat(ratingsdat);
    ratingsmap = dict();
    for item in itemes:
        idx = item.split('::');
        if ratingsmap.has_key(idx[0]):
            ratingsmap[idx[0]].append(idx[1]);
        else:
            ratingsmap[idx[0]] = [idx[1]];
    return ratingsmap;

def ItemSimilarity(train):
    C = dict()
    N = dict()
    for u , items in train.items():
        for i in items:
            if N.has_key(i):
                N[i] += 1
            else:
                N[i] = 0
            for j in items:
                if i == j:
                    continue
                if i in C:
                    if C[i].has_key(j):
                        val = C[i][j]
                        C[i].update({j:val+1})
                    else:
                        C[i][j] = 0
                else:
                    C.update({i:{j:0}})
    W = dict()
    for i,related_items in C.items():
        for j, cij in related_items.items():
            W[i][j] = 0 if cij == 0 or math.sqrt(N[i]*N[j]) == 0 else cij / math.sqrt(N[i]*N[j])
            #W[i][j] = cij / math.sqrt(N[i]*N[j])
    return W

if __name__ == '__main__':
    train = ratings2map()
    #print train
    rst = ItemSimilarity(train)
    print rst
