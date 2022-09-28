while True:
    nome = input("Digite o seu nome: ")
    if len(nome) <= 3:
        print("O nome deve conter mais do que 3 caraccteres!")
    else:
        while True:
            idade = input('Digite a sua idade: ')
            if int(idade) <= 0 or int(idade) >=150:
                print("A idade deve estar entre 0 e 150!")
            else:
                while True:
                    salario = float(input("Digite o seu salário: "))
                    if salario <= 0:
                        print("O salário deve ser maior do que 0!")
                    else:
                        while True:
                            sexo = input("Digite f para feminino ou m para masculino: ")
                            if not (sexo == "f" or sexo== "m"):
                                print("Sexo Inválido")
                            else:
                                while True:
                                    e_civil = input("Digite s para solteiro, c para casado, v para viuvo, d para divorsiado: ")
                                    if not (e_civil == "s" or e_civil == "c" or e_civil == "v" or e_civil == "d"):
                                        print("Estado Civil inválido")
                                    else:
                                        print('Nome: {}'.format(nome))
                                        print('Idade: {}'.format(idade))
                                        print('Salário: {}'.format(salario))
                                        print('Sexo: {}'.format(sexo))
                                        print('Estado Civil: {}'.format(e_civil))
                                        break
                                break

                        break
                break
        break


