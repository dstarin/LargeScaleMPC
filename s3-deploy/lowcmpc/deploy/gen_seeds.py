import base64
import os
import sys

num_players = int(sys.argv[1])



keys = [[0 for x in range(num_players)] for y in range(num_players)]

for i in range(0, num_players):
    for j in range(0, num_players):
        rnd = os.urandom(32)        
        rnd_str = str(base64.b64encode(rnd),'utf-8')
        if i != j:
            keys[i][j] = rnd_str
            keys[j][i] = rnd_str
        else:
            keys[i][j] = "-"

for i in range(0, num_players):
    f = open("seeds/mpc" + str(i+1).zfill(3) + "-seeds.txt", "a")
    for j in range(0, num_players):
        print(keys[i][j], file = f)
    f.close()

