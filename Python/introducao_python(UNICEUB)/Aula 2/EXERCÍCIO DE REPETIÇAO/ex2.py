while True:
    usuario = input("Digite o nome de usuário: ")
    while True:
        senha = input("Digite sua senha: ")
        if not senha == usuario:
            print('Usuário = {}, Senha = {}'.format(usuario,senha))
            break
        else:
            print("Usuário e senha não podem coincidir")
