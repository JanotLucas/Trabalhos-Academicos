def programa(n):
    for i in range(1,n+1):
        count = 1
        while True:
            print(i, end = ' ')
            if count == i:
                break
            count += 1
        print()

programa(5)
