#4) Faça um Programa que leia um vetor de 10 caracteres, e diga quantas consoantes foram lidas. Imprima as consoantes.
vogal = ['a','e','i','o','u']
consoante = []
count = 0
for i in range(10):
    chr = input('Digite um caracter: ')
    if not chr in vogal:
        count = count + 1
        consoante.append(chr)
print(count)
print(consoante)
