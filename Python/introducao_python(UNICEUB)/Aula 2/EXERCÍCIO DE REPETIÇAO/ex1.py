while True:
    nota = input("Digite uma nota entre 0 e 10: ")
    if not nota.isalpha():
        if float(nota) >= 0 and float(nota) <=10:
            print(nota)
            break

        else:
            print("Valor inválido")
    else:
        print("Valor inválido")