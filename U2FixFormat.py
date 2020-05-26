#PARAMETRY
ILOSC_BITOW = 8
BITY_PO_PRZECINKU = ILOSC_BITOW - 2

def convert_to_U2Fix(x):
    x = float(x) * 2**BITY_PO_PRZECINKU
    if x < 0:
        wynik = zapisz_na_U2(zapisz_na_NKB(x))
    else:
        wynik = zapisz_na_NKB(x)
    return wynik[0:2] + "." + wynik[2::]

def zapisz_na_NKB(x):
    wynik = ""
    liczba = int(x)
    while len(wynik) < ILOSC_BITOW: # zapisuje naa ILOSC_BITOW bitach
        reszta = liczba%2
        liczba = int(liczba/2)
        wynik += "1" if reszta == 1 else "0"
    return wynik [::-1] # odwracam stringa :)

def zapisz_na_U2(x):
    zanegowane = ""
    for bit in x:
        zanegowane += "0" if bit == "1" else "1"
    # Dodajemy wektor binarny 1
    wynik = bin(int(zanegowane, 2) + 1)
    return str(wynik) [2::]

def odczytaj_U2FIX(x):
    jednosci, ulamek = x.split(".")
    ulamek = ulamek [::-1]
    print(ulamek)


if __name__ == "__main__":
    with open('signalSample.txt') as file:
        wartosci = file.read().split()

    with open('przeksztalcone_signalSample.txt', 'w') as file:
        for wartosc in wartosci:
            file.write((convert_to_U2Fix(wartosc) + "\n"))







