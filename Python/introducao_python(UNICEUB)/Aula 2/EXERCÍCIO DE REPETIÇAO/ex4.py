ha = 80000 # populaçao inicial de A
ha = 200000 # populaçao inicial de B
txa = 3/100 # taxa de crescimento de A
txb = 1.5/100 # taxa de crescimento de B
n=1 # contador de anos
while True: # Calculadora de anos
    ha = 80000*(1+3/100)**n
    hb = 200000*(1+1.5/100)**n
    if ha >= hb:
        print('Levara {} anos'.format(n))
        break
    else:
        n += 0.0001 # precisão