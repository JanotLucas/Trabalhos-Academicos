#4) Faça um Programa que leia 4 notas, mostre as notas e a média na tela.
sum = 0
for i in range(4):
    seq = ['primeira',"segunda","terceira","quarta"]
    num = float(input("Digite a {} nota do aluno: ".format(seq[i])))
    sum = sum + num
print(sum/4)