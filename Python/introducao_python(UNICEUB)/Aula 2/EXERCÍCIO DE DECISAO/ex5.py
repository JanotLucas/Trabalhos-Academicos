count = 0
sum = 0
while True:
    a = input('Digite a Nota ou M para a média: ')
    if a == "M":
        media = sum/(count)
        if media >= 7 and media<10 :
            print("Aprovado")
        elif media>7 and media<10:
            print("Aprovado")
        elif media<7:
            print("Reprovado")
        else:
            print("Aprovado com distinção")
        break
    else:
        sum = sum + float(a)
        count += 1

