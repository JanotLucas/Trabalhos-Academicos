#2)Faça um Programa que leia um vetor de 10 números reais e mostre-os na ordem inversa.
vetor = []
for i in range(10):
    num = float(input('Digite um número real: '))
    vetor.append(num)
vetor.reverse()
print(vetor)
