import random


def generar_pl1():
    with open("productos.csv", "w") as f:
        for i in range(1,25000001):
            f.write(f"{i},prod_{i},{random.randint(0,20000)},{random.randint(10,5000)}\n")
if __name__ == "__main__":
    generar_pl1()