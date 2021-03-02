import sys
from random import randrange



if (len(sys.argv) != 2):
    print("usage: python3 gen_committees.py <num_players>")

#committee_size = int(sys.argv[1])
num_players = int(sys.argv[1])

for committee_size in range(1, num_players+1):

    b_list = [0] * num_players

    num_zeros = 0
    for i in range(0, num_players):
        if b_list[i] == 0:
            num_zeros = num_zeros + 1

    num_committees = 0
    while num_zeros >= committee_size:
        num_committees = num_committees + 1
        for i in range(0, committee_size):
            j = randrange(0, num_players)
            while b_list[j] != 0:
                j = randrange(0, num_players)
            b_list[j] = num_committees
        num_zeros = 0
        for i in range(0, num_players):
            if b_list[i] == 0:
                num_zeros = num_zeros + 1

    f = open("committees/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + ".txt", "a")
    for j in range(0, num_players):
        print(b_list[j], file = f)
    f.close()
    print(b_list)
    print("")
