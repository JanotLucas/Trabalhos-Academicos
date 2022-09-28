#2) Faça um Programa que peça um número e então mostre a mensagem O número informado foi [número].
while True:
    a = input('Digite um número: ')
    if a.isdigit():
        print('O número informado foi {}'.format(a))
        break
    else:
        print('Inválido')
