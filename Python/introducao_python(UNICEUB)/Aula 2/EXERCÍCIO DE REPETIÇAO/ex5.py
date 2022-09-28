while True:
    ha = input("Digite a população inicial do pais A: ")
    if ha.isalpha():
        print("Valor inválido")
    elif float(ha) <=0:
        print("Valor inválido")
    else:
        while True:
            txa = input("Digite a taxa de crescimento do pais A: ")
            if txa.isalpha():
                print("Valor inválido")
            elif float(txa) <= 0:
                print("Valor inválido")
            else:
                while True:
                    hb = input("Digite a população inicial do pais B: ")
                    if hb.isalpha():
                        print("Valor inválido")
                    elif float(hb) <= 0:
                        print("Valor inválido")
                    else:
                        while True:
                            txb = input("Digite a taxa de crescimento do pais B: ")
                            if txb.isalpha():
                                print("Valor inválido")
                            elif float(txb) <= 0:
                                print("Valor inválido")
                            else:
                                while True:
                                    p = input("Digite a precisão do calculo: ")
                                    if p.isalpha():
                                        print("Valor inválido")
                                    elif float(p) <= 0:
                                        print("Valor inválido")
                                    else:
                                        n=1 # contador de anos
                                        while True: # Calculadora de anos
                                            ha = float(ha)
                                            hb = float(hb)
                                            txa = float(txa)
                                            txb = float(txb)
                                            p = float(p)
                                            fa = ha*(1+txa/100)**n
                                            fb = hb*(1+txb/100)**n
                                            if fa >= fb:
                                                print('Levara {} anos'.format(n))
                                                break
                                            else:
                                                n = n + p # precisão
                                        break
                                break
                        break
                break
        break
