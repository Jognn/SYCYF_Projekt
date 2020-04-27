import sys
import math
import matplotlib.pyplot as plt
import numpy as np

#STALE
j = complex(0, 1) # jednostka urojona
PO_PRZECINKU = 3 # liczba miejsc po przecinku do zaokraglenia
global N # ilosc probek
czestotliwosc_probkowania = 44100 # 44100?
plik_ze_wspolczynnikami = "wspolczynniki.txt"

def dft(signal, wyliczone): # Discrete Fourier Transform
    if wyliczone:
        wspolczynniki_xk = signal
    else:
        print("ZAPISUJE WYNIKI")
        with open(plik_ze_wspolczynnikami, 'w') as f:
            wspolczynniki_xk = oblicz_wspolczynniki(signal)
            f.write(nazwa_pliku + "\n")
            for wspolczynnik in wspolczynniki_xk:
                f.write(f"{str(wspolczynnik.real)}, {str(wspolczynnik.imag)} \n")

    moduly_wspolczynnikow = [round(math.sqrt(x.real**2 + x.imag**2), PO_PRZECINKU) for x in wspolczynniki_xk]
    amplitudy = nyquist_check(moduly_wspolczynnikow)

    print("--------------------------------------------------")
    print("Wspolczynniki:", wspolczynniki_xk)
    print("Moduły:", moduly_wspolczynnikow)
    print("Amplitudy dla częstotliwości:", amplitudy)

    #Rysowanie wykresu
    y = amplitudy[:math.ceil(N/2)]
    x = np.arange(0.0, czestotliwosc_probkowania/2, czestotliwosc_probkowania/N)
    plt.plot(x, y)
    plt.title("Widmo sygnału :)")
    plt.xlabel("Częstotliwości")
    plt.ylabel("Amplitudy")
    plt.grid()
    plt.show()

def oblicz_wspolczynniki(signal):
    wspolczynniki = list()
    for k in range(N):
        suma = 0
        for n in range(N):
            suma += signal[n] * exp(k, n)
            zaokraglona = complex(round(suma.real, PO_PRZECINKU), round(suma.imag, PO_PRZECINKU))
        wspolczynniki.append(zaokraglona)
    return wspolczynniki

def exp(k, n):
    return math.e**((-j*2*math.pi*k*n)/N) # N - ilosc probek!!

def nyquist_check(moduly): # Twierdzenie o probkowaniu :)
    wartosci = moduly.copy() # Tworze sobie tutaj kopie, zeby nie zmieniac oryginalnych wartosci modulow wspolczynnikow
    """
        Dziele swoje wartosci na 2 podzbiory od polowy
    """
    nyquist_limit = math.ceil(N/2)
    pierwsza_czesc = wartosci[0:nyquist_limit]
    druga_czesc = wartosci[nyquist_limit:]
    for i in range(len(druga_czesc)):
        if druga_czesc[i] != 0 and druga_czesc[i] in pierwsza_czesc:
            l = pierwsza_czesc.index(druga_czesc[i])
            wartosci[l] = pierwsza_czesc[l] + druga_czesc[i]
            wartosci[i+nyquist_limit] = 0
    return moduly

if __name__ == "__main__":
    nazwa_pliku = sys.argv[1] if len(sys.argv)>1 else 'signalSample.txt'
    print("Analizowany sygnal: " + nazwa_pliku)
    print("Częstotoliwość próbkowania: " + str(czestotliwosc_probkowania))

    try:
        with open(plik_ze_wspolczynnikami, 'r') as wyniki:
            naglowek = wyniki.readline().strip()
            if naglowek == nazwa_pliku:
                wylicz_flaga = False
            else:
                wylicz_flaga = True
    except FileNotFoundError:
        wylicz_flaga = True

    #Jezeli nie istnieje plik 'wspolczynniki.txt' albo jest on pusty, to program wylicza dft na nowo
    if wylicz_flaga:
        with open(nazwa_pliku, 'r') as file:
            sygnal = [float(wartosc.strip()) for wartosc in file.readlines()]
            N = len(sygnal)  # ilosc probek sygnalu
            dft(sygnal, False)
    else:
        with open(plik_ze_wspolczynnikami, 'r') as wyniki:
            print("WCZYTUJE WYNIKI")
            wyliczone_wspolczynniki = []
            for index, wartosc in enumerate(wyniki.readlines()):
                if index == 0:
                    continue
                z = wartosc.strip().split(',')
                wyliczone_wspolczynniki.append(complex(float(z[0]), float(z[1])))
            N = len(wyliczone_wspolczynniki)
        dft(wyliczone_wspolczynniki, True)





