def display_board(board):
    print("""
    +-------+-------+-------+
    |       |       |       |
    |   {}   |   {}   |   {}   |
    |       |       |       |
    +-------+-------+-------+
    |       |       |       |
    |   {}   |   {}   |   {}   |
    |       |       |       |
    +-------+-------+-------+
    |       |       |       |
    |   {}   |   {}   |   {}   |
    |       |       |       |
    +-------+-------+-------+
    """.format(board[0][0],board[0][1],board[0][2],board[1][0],board[1][1],board[1][2],board[2][0],board[2][1],board[2][2]))

def enter_move(board):
    # The function accepts the board current status, asks the user about their move, 
    # checks the input and updates the board according to the user's decision.
    moves = {
        1 : (0,0),
        2 : (0,1),
        3 : (0,2),
        4 : (1,0),
        5 : (1,1),
        6 : (1,2),
        7 : (2,0),
        8 : (2,1),
        9 : (2,2)
    }
    invalid_move = True
    while invalid_move:
        move = int(input("Enter your move: "))
        if move > 0:
            move = moves[move]
            a,b = move
            if not(board[a][b] == "X" or board[a][b] == "O"):
                board[a][b] = "O"
                invalid_move = False
            else:
                print("Invalid move!")
        else:
            print("Invalid move!")

def make_list_of_free_fields(board):
    free_squares = []
    for item in board:
        for i in item:
            if i == "X" or i == "O":
                continue
            else:
                free_squares.append(i)
    if free_squares == []:
        return False
    else:
        return True

def victory_for(board, sign):
    # The function analyzes the board status in order to check if 
    # the player using 'O's or 'X's has won the gamedef victory_for(board, sign):
    if ((board[0][0] == sign and board[0][1] == sign and board[0][2] == sign) or (board[1][0] == sign and board[1][1] == sign and board[1][2] == sign) \
    or (board[2][0] == sign and board[2][1] == sign and board[2][2] == sign) or (board[0][0] == sign and board[1][1] == sign and board[2][2] == sign) \
    or (board[0][2] == sign and board[1][1] == sign and board[2][0] == sign) or (board[0][0] == sign and board[1][0] == sign and board[2][0] == sign)\
    or (board[0][1] == sign and board[1][1] == sign and board[2][1] == sign) or (board[0][2] == sign and board[1][2] == sign and board[2][2] == sign)):
        return True
    else:
        return False

        
def draw_move(board):
    from random import randrange
    moves = {
        1 : (0,0),
        2 : (0,1),
        3 : (0,2),
        4 : (1,0),
        5 : (1,1),
        6 : (1,2),
        7 : (2,0),
        8 : (2,1),
        9 : (2,2)
    }
    invalid_move = True
    while invalid_move:
        move = randrange(1,10)
        move = moves[move]
        a,b = move
        if not(board[a][b] == "X" or board[a][b] == "O"):
            board[a][b] = "X"
            invalid_move = False
board = [[1,2,3],[4,"X",6],[7,8,9]]
make_list_of_free_fields(board)
while not((victory_for(board,"X")) or (victory_for(board,"O")) or (not(make_list_of_free_fields(board)))):
    display_board(board)
    enter_move(board)
    display_board(board)
    make_list_of_free_fields(board)
    if (victory_for(board,"O")):
        display_board(board)
        print('You won!!!')
        break
    elif not (make_list_of_free_fields(board)):
        display_board(board)
        print('It\'s a tie!!!')
        break
    draw_move(board)
    if (victory_for(board,"X")):
        display_board(board)
        print('You lost!!!')
        break
    elif not (make_list_of_free_fields(board)):
        display_board(board)
        print('It\'s a tie!!!')
        break
