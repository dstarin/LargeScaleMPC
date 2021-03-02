import os
import sys
import json
import jsonpickle

if (len(sys.argv) != 3):
    print("usage: python3 gen_committee_shares.py <committee_size> <num_players>")

committee_size = int(sys.argv[1])
num_players = int(sys.argv[2])

h = 0
if num_players == 8:
    h = 6

if num_players == 16:
    h = 11

if num_players == 32:
    h = 22

if num_players == 64:
    h = 43

if num_players == 128:
    h = 86

if num_players == 256:
    h = 171

if not os.path.exists("committees/" + str(num_players).zfill(3) + "-party/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3)):
    os.makedirs("committees/" + str(num_players).zfill(3) + "-party/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3))

committee_file = "committees/" + str(num_players).zfill(3) + "-party/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + ".txt"

players = []
with open(committee_file) as f:
    committees = []
    for line in f:
        players.append(int(line))

#print(players)
# need to build committees data structure
# committees[0] = [<member_id>, <member_id>, <member_id>]
# committees[1] = ...

committees = []
for committee_id in range(1, num_players):
    committee_members = []
    for i in range(0, num_players):
        if players[i] == committee_id:
            committee_members.append(i+1)
    if len(committee_members) > 0:
        committees.append(committee_members)

num_committees = len(committees)
print(committees)
print(json.dumps(committees))

with open("committees/" + str(num_players).zfill(3) + "-party/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + "/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + ".json", 'w', encoding='utf-8') as f:
    json.dump(committees, f, ensure_ascii=False)
# these go from 0 --> h for each player
# we want to know where these shares are being sent
# and how to generate the share
# where? recv_player_id (1-->num_players)
# how to generate? (recv_player_id, committee_id, other committee members, index for AES)

# h = 0 share sent to same committee
# round robin committee through players

# h = 1 share sent to next committee
# round robin committee through players


class SendData():
    def __init__(self):
        self.recv_player_id = 0
        self.committee_id = 0
        self.h_index = 0
        self.gen_type = ""

send_a_shares = [[SendData() for j in range(num_players)] for i in range(h)]
send_b_shares = [[SendData() for j in range(num_players)] for i in range(h)]
send_c_shares = [[SendData() for j in range(num_players)] for i in range(h)]

curr_committee = 0
for i in range(0, h):
    correction = 0
    for j in range(0, num_players):
        send_a_shares[i][j].recv_player_id = committees[curr_committee][(j - correction) % len(committees[curr_committee])]
        send_a_shares[i][j].committee_id = curr_committee
        send_a_shares[i][j].h_index = i

        send_b_shares[i][j].recv_player_id = committees[curr_committee][j % len(committees[curr_committee])]
        send_b_shares[i][j].committee_id = curr_committee
        send_b_shares[i][j].h_index = i

        send_c_shares[i][j].recv_player_id = committees[curr_committee][j % len(committees[curr_committee])]
        send_c_shares[i][j].committee_id = curr_committee
        send_c_shares[i][j].h_index = i

        # if sending player is committee member, handle local
        # need to skip for the round robin
        if (j+1) in committees[curr_committee]:
            send_a_shares[i][j].gen_type = "gen_local"
            send_b_shares[i][j].gen_type = "gen_local"
            send_c_shares[i][j].gen_type = "gen_local"
            correction = correction + 1
        else:
            send_a_shares[i][j].gen_type = "gen_and_send"
            send_b_shares[i][j].gen_type = "gen_and_send"
            send_c_shares[i][j].gen_type = "gen_and_send"

    curr_committee = (curr_committee + 1) % num_committees

with open("committees/" + str(num_players).zfill(3) + "-party/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + "/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + "-send_shares.txt", 'w', encoding='utf-8') as f:
    for i in range(0, h):
        for j in range(0, num_players):
            print(str(send_a_shares[i][j].recv_player_id) + " " + str(send_a_shares[i][j].committee_id) + " " + str(send_a_shares[i][j].h_index) + " " + send_a_shares[i][j].gen_type)
            print(str(send_a_shares[i][j].recv_player_id) + " " + str(send_a_shares[i][j].committee_id) + " " + str(send_a_shares[i][j].h_index) + " " + send_a_shares[i][j].gen_type, file=f)
        print("")
        print("", file=f)


#with open("committees/" + str(num_players).zfill(3) + "-party/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + "-send_shares.json", 'w', encoding='utf-8') as f:
#    f.write(jsonpickle.encode(send_a_shares))
#    json.dump(send_a_shares, f, ensure_ascii=False)


class RecvData():
    def __init__(self):
        self.gen_player_id = 0
        self.send_player_id = 0
        self.committee_id = 0
        self.h_index = 0
        self.gen_type = ""

recv_a_shares = [[[RecvData() for k in range(num_players)] for j in range(h)] for i in range(num_players)]
recv_b_shares = [[[RecvData() for k in range(num_players)] for j in range(h)] for i in range(num_players)]
recv_c_shares = [[[RecvData() for k in range(num_players)] for j in range(h)] for i in range(num_players)]


for i in range(0, num_players):
    with open("committees/" + str(num_players).zfill(3) + "-party/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + "/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + "-recv_shares-" + str(i+1).zfill(3) + ".txt", 'w', encoding='utf-8') as f:
        if players[i] > 0:
            print("(" + str(players[i]) + ") player " + str(i+1))
            print("(" + str(players[i]) + ") player " + str(i+1), file=f)
            for j in range(0, h):
                print ("h = " + str(j))
                print ("h = " + str(j), file=f)
                if (send_a_shares[j][0].committee_id == players[i] - 1):
                    for k in range(0, num_players):
                        print(str(k+1) + ": ", end='')
                        f.write(str(k+1) + ": ")
                        recv_a_shares[i][j][k].committee_id = players[i]-1
                        recv_a_shares[i][j][k].h_index = j
                        recv_a_shares[i][j][k].gen_player_id = k+1

                        # check for gen_local
                        if send_a_shares[j][k].gen_type == "gen_local" and (i == k):
                            recv_a_shares[i][j][k].gen_type = "gen_local"
                            print("gen_local")
                            f.write("gen_local\n")
                        if send_a_shares[j][k].gen_type == "gen_local" and (i != k):
                            recv_a_shares[i][j][k].gen_type = "gen"
                            print("gen(" + str(j) + "," + str(k+1) + ")")
                            f.write("gen(" + str(j) + "," + str(k+1) + ")\n")
                        if send_a_shares[j][k].gen_type == "gen_and_send":
                            recv_a_shares[i][j][k].send_player_id = k+1
                            if send_a_shares[j][k].recv_player_id == i+1:
                                recv_a_shares[i][j][k].gen_type = "recv"
                                print("recv(" + str(k+1) + ")")
                                f.write("recv(" + str(k+1) + ")\n")
                            else:
                                recv_a_shares[i][j][k].gen_type = "gen"
                                print("gen(" + str(j) + "," + str(k+1) + ")")
                                f.write("gen(" + str(j) + "," + str(k+1) + ")\n")


                else:
                    # for this h, this player doesn't recv shares
                    print("-")
                    f.write("-\n")
        else:
            print("(-) player " + str(i+1))
            f.write("(-) player " + str(i+1) + "\n")

#with open("committees/" + str(num_players).zfill(3) + "-party/committees-" + str(committee_size).zfill(3) + "-" + str(num_players).zfill(3) + "-recv_shares.json", 'w', encoding='utf-8') as f:
#    f.write(jsonpickle.encode(recv_a_shares))
