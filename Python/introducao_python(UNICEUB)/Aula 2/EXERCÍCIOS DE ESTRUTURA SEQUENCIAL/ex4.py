#4) Faça um Programa que peça as 4 notas bimestrais e mostre a média.
while True:
    a = input('Digite a primeira nota: ')
    if a.isdigit():
        while True:
            b = input('Digite a segunda nota: ')
            if b.isdigit():
                while True:
                    c = input('Digite a terceira nota: ')
                    if c.isdigit():
                        while True:
                            d = input('Digite a quarta nota: ')
                            if d.isdigit():
                                if ',' or '.' in a:
                                    a = float(a)
                                else:
                                    a = int(a)
                                if ',' or '.' in b:
                                    b = float(b)
                                else:
                                    b = int(b)
                                if ',' or '.' in c:
                                    c = float(c)
                                else:
                                    c = int(c)
                                if ',' or '.' in d:
                                    d = float(d)
                                else:
                                    d = int(d)
                                M = (a+b+c+d)/4
                                print(M)
                                break
                            else:
                                print('Inválido')
                        break
                    else:
                        print('Inválido')
                break
            else:
                print('Inválido')
        break
    else:
        print('Inválido')


