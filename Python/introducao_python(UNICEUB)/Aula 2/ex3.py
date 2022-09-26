#3) Faça um Programa que peça dois números e imprima a soma.
while True:
    a = input('Digite o primeiro número: ')
    if a.isdigit():
        while True:
            b = input('Digite o segundo número: ')
            if b.isdigit():
                if ',' or '.' in a:
                    a = float(a)
                else:
                    a = int(a)
                if ',' or '.' in b:
                    b = float(b)
                else:
                    b = int(b)
                print('A soma dos dois números é {}'.format(a+b))
                break


            else:
                print('Inválido')
        break
    else:
        print('Inválido')