# 3)Crie um algoritmo que a partir de uma variável criada no código, imprima o texto "o valor é maior que 10" caso isso seja verdade, senão imprima "o valor é menor que 10". Salve o arquivo com o nome ex3.py
while True:
	a = input("Digite um Número: ")
	if a:
		if a.isdigit():
			if ',' or '.' in a:
				a = float(a)
			else:
				a = inter(a)
			if a > 10:
				print('{} é maior que 10'.format(a))
				break
			elif a < 10:
				print("{} é menor que 10".format(a))
				break
			else:
				print('{} é igual a 10'.format(a))
				break
		else:
			print("Inválido")
	else:
		print("Inválido")






