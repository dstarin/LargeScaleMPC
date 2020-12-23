#include "comm_patterns.h"

comm_patterns::comm_patterns(int committee_size, int _num_players, int _h, const std::string & file_basedir) {

    std::stringstream cs_string;
    std::stringstream np_string;

    std::string line;


    std::string committee_filename;
    std::string send_shares_filename;
    std::string recv_shares_filename;
    h = _h;
    num_players = _num_players;

    committee.resize(num_players);

    send_shares.resize(h);
    for (int i = 0; i < h; i++)
        send_shares[i].resize(num_players);

    recv_shares.resize(num_players);
    for (int i = 0; i < num_players; i++) {
        recv_shares[i].resize(h);
        for (int j = 0; j < h; j++) {
            recv_shares[i][j].resize(num_players);
        }
    }

    player_sends.resize(num_players);
    player_recvs.resize(num_players);
 
    for (int i = 0; i < num_players; i++) {
        player_sends[i].resize(num_players);
        player_recvs[i].resize(num_players);
    }

    cs_string << std::setfill('0') << std::setw(3) << committee_size;
    np_string << std::setfill('0') << std::setw(3) << num_players;

    committee_filename = file_basedir + "committees/" + np_string.str() + "-party/committees-" + cs_string.str() + "-" + np_string.str() + ".txt";
    std::ifstream committee_infile(committee_filename);

//    std::cout << "committee_filename: " << committee_filename << std::endl;

    int i = 0;
    while (std::getline(committee_infile, line))
    {
        std::istringstream iss(line);
        int a;
        if (!(iss >> a)) {
            std::cerr << "error reading committee file: " << committee_filename << std::endl;
            exit(-1);
        }
        committee[i] = a;
        i++;
    }

    // now read send_shares
    // committees/008-party/committees-002-008/committees-002-008-send_shares.txt
    send_shares_filename = file_basedir + "committees/" + np_string.str() + "-party/committees-" + cs_string.str() + "-" + np_string.str()
                            + "/committees-" + cs_string.str() + "-" + np_string.str() + "-send_shares.txt";

    std::ifstream send_shares_infile(send_shares_filename);

    i = 0;
    int j = 0;
    while (std::getline(send_shares_infile, line))
    {
        std::istringstream iss(line);
        int recv_player_id;
        int committee_id;
        int h_index;
        std::string gen_type;
        if (!(iss >> recv_player_id >> committee_id >> h_index >> gen_type)) {
            break;
        }
        send_shares[i][j].recv_player_id = recv_player_id; // this starts at index=1
        send_shares[i][j].committee_id = committee_id;
        send_shares[i][j].h = h_index;

        if (gen_type.compare("gen_local") == 0)
            send_shares[i][j].gen_type = 'l';

        if (gen_type.compare("gen_and_send") == 0)
            send_shares[i][j].gen_type = 's';
        
        j++;

        if (j == num_players) {
            std::getline(send_shares_infile, line);
            i++;
            j = 0;
        }
    }

/*
    for (i = 0; i < h; i++) {
        for (j = 0; j < num_players; j++) {
            std::cout << j << ": " << send_shares[i][j].recv_player_id << " "
                      << send_shares[i][j].committee_id << " " << send_shares[i][j].h
                      << " " << send_shares[i][j].gen_type << std::endl;
        }
        std::cout << std::endl;
    }
*/


    int k = 0;
    j = 0;
    for (i = 0; i < num_players; i++) {

        std::stringstream p_string;
        int committee_id;
        p_string << std::setfill('0') << std::setw(3) << i+1;

        // now read recv_shares
        // committees/008-party/committees-002-008/committees-002-008-recv_shares-001.txt
        recv_shares_filename = file_basedir + "committees/" + np_string.str() + "-party/committees-" + cs_string.str() + "-" + np_string.str()
                                + "/committees-" + cs_string.str() + "-" + np_string.str() + "-recv_shares-" + p_string.str() + ".txt";
        std::ifstream recv_shares_infile(recv_shares_filename);
        std::getline(recv_shares_infile, line);
        std::istringstream iss(line);

        std::string int_str;
        iss >> int_str;

        if (int_str.substr(1, int_str.length()-1).compare("-") != 1)
            committee_id = std::stoi(int_str.substr(1, int_str.length()-1));
        else
            committee_id = 0;
//        std::cout << "committee_id: " << committee_id << std::endl;



        for (j = 0 ; j < h; j++) {
            std::getline(recv_shares_infile, line);
            std::istringstream iss2(line);
            int h_index;
            std::string p1,p2;
            iss2 >> p1 >> p2 >> h_index;
//            std::cout << "h_index: " << h_index << std::endl;
            if (h_index == j) {
                std::getline(recv_shares_infile, line);
                if (line.substr(0,1).compare("-") != 0) {
//                    std::cout << "0: ";// << line << std::endl;

                    std::string delimiter = " ";
                    std::string token = line.substr(line.find(delimiter)+1, line.length());
                    delimiter = "(";
                    std::string gen_type = token.substr(0, token.find(delimiter));
//                    std::cout << gen_type << std::endl;

                    token = token.substr(token.find(delimiter)+1, token.length());
//                    std::cout << token << std::endl;

                    recv_shares[i][j][0].committee_id = committee_id;
                    
                    
//                    recv_shares[i][j][0].gen_type = gen_type;
                    
                    if (gen_type.compare("gen") == 0)
                        recv_shares[i][j][0].gen_type = 'g';
                    if (gen_type.compare("recv") == 0)
                        recv_shares[i][j][0].gen_type = 'r';
                    if (gen_type.compare("gen_local") == 0)
                        recv_shares[i][j][0].gen_type = 'l';


                    recv_shares[i][j][0].h = j;
                    if (gen_type.compare("gen") == 0) {
                        // 0,5)
                        token = token.substr(0, token.length()-1);
                        delimiter = ",";
                        int h_index = std::stoi(token.substr(0, token.find(delimiter)));
                        int gen_player_id = std::stoi(token.substr(token.find(delimiter)+1, token.length()));
     //                   std::cout << "h_index: " << h_index << " gen_player_id: " << gen_player_id << std::endl;
                        recv_shares[i][j][0].gen_player_id = gen_player_id;
                    }
                    if (gen_type.compare("recv") == 0) {
                        // 5)
                        token = token.substr(0, token.length()-1);
                        int send_player_id = std::stoi(token);
    //                    std::cout << "send_player_id: " << send_player_id << std::endl;
                        recv_shares[i][j][0].send_player_id = send_player_id;
                    }
                    for (k = 1; k < num_players; k++) {
                        std::getline(recv_shares_infile, line);
  //                      std::cout << k << ": ";// << line << std::endl;
                        delimiter = " ";
                        token = line.substr(line.find(delimiter)+1, line.length());
                        delimiter = "(";
                        gen_type = token.substr(0, token.find(delimiter));
//                        std::cout << gen_type << std::endl;

                        token = token.substr(token.find(delimiter)+1, token.length());
  //                      std::cout << token << std::endl;

                        recv_shares[i][j][k].committee_id = committee_id;
//                        recv_shares[i][j][k].gen_type = gen_type;
                        if (gen_type.compare("gen") == 0)
                            recv_shares[i][j][k].gen_type = 'g';
                        if (gen_type.compare("recv") == 0)
                            recv_shares[i][j][k].gen_type = 'r';
                        if (gen_type.compare("gen_local") == 0)
                            recv_shares[i][j][k].gen_type = 'l';


                        recv_shares[i][j][k].h = j;

                        if (gen_type.compare("gen") == 0) {
                            // 0,5)
                            token = token.substr(0, token.length()-1);
                            delimiter = ",";
                            int h_index = std::stoi(token.substr(0, token.find(delimiter)));
                            int gen_player_id = std::stoi(token.substr(token.find(delimiter)+1, token.length()));
//                            std::cout << "h_index: " << h_index << " gen_player_id: " << gen_player_id << std::endl;
                            recv_shares[i][j][k].gen_player_id = gen_player_id;
                        }
                        if (gen_type.compare("recv") == 0) {
                            // 5)
                            token = token.substr(0, token.length()-1);
                            int send_player_id = std::stoi(token);
//                            std::cout << "send_player_id: " << send_player_id << std::endl; 
                            recv_shares[i][j][k].send_player_id = send_player_id;
                        }
                    }
                }
            }
        }

/*        while (std::getline(recv_shares_infile, line)) {
            std::istringstream iss(line);
            

        }
  */  
    }

    for (i = 0; i < num_players; i++) {
        for (j = 0; j < num_players; j++) {
            for (k = 0; k < h; k++) {
                if ((send_shares[k][i].gen_type == 's') && ((send_shares[k][i].recv_player_id-1) == j)) {
                    player_sends[i][j].push_back(k);
                    player_recvs[j][i].push_back(k);
                }
            }
        }
    }

    player_h_values.resize(num_players);
    for (i = 0; i < num_players; i++) {
        for (j = 0; j < h; j++) {
            if ((recv_shares[i][j][0].gen_type == 'g') ||
                (recv_shares[i][j][0].gen_type == 'l') ||
                (recv_shares[i][j][0].gen_type == 'r')){
                bool found = false;
                for (k = 0; k < player_h_values[i].size(); k++){
                    if (player_h_values[i][k] == j)
                        found = true;
                }

                if (found == false)
                    player_h_values[i].push_back(j);

            }
        }
    }

/*
    for (i =0 ; i < num_players; i++) {
        std::cout << "player " << i+1 << " ";
        for (j = 0; j < player_h_values[i].size(); j++) {
            std::cout << player_h_values[i][j] << " ";
        }
        std::cout << std::endl;
    }
*/
/*
    for (i = 0; i < num_players; i++) {
        for (j = 0; j < num_players; j++) {
            std::cout << "[" << i << "," << j << "]: ";
            for (k = 0; k < player_sends[i][j].size(); k++) {
                std::cout << " " << player_sends[i][j][k];
            }
            std::cout << std::endl;
        }
    }
*/

}

int comm_patterns::get_num_gen_sends(int player_num) {

    int num_gen_sends = 0;
    for (int i = 0 ; i < h; i++) {
        if (send_shares[i][player_num - 1].gen_type == 's') {
            num_gen_sends++;
        }
    }

    return num_gen_sends;
}

int comm_patterns::get_num_recvs(int player_num) {
    int num_recvs = 0;

    for (int i = 0; i < h; i++) {
        for (int j = 0; j < num_players; j++){
            if (recv_shares[player_num - 1][i][j].gen_type == 'r') {
                num_recvs++;
            }
        }
    }

    return num_recvs;

}