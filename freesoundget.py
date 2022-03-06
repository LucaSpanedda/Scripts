import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d
from pyrate_limiter import Limiter, RequestRate, Duration
import numpy as np
import freesound, os, requests, time, json, fileinput

CLIENT_ID = '4X0wVAZZkSF2nf9AgAqT'
CLIENT_SECRET = 'HIJGXDKDAniLwNpKq6gtrzy0yTOi3y0JRtd5juPP'

c = freesound.FreesoundClient()
c.set_token(CLIENT_SECRET)

howm = int(input("How many sounds?: "))
querys = input("keyword: ")
print("Searching using descriptor and text:")

#sotto la voce descriptor puoi scegliere quali. Questa è la ricerca
#combinata e comporta il fatto di avere una sola pagina, usa un
#diverso metodo di ricerca per usare solo le parole chiave

results_pager = c.combined_search(query = querys,
                                  page_size=howm,
                                  filter = "samplerate:44100")
                                  #descriptors_filter = "lowlevel.spectral_complexity.mean:[1.0 TO 10.0] lowlevel.average_loudness:[0.3 TO 0.8]")

print("----------------------------")
a = 0
for sound in results_pager:
    a+=1
print("found %i sounds" %(a))
path = input("specify path: ")
i = 0
for sound in results_pager:
    print(i, "\t-", sound.name, "by", sound.username)
    sound.retrieve_preview(path ,sound.name+".mp3")
    #il time sleep serve per non eccedere le 60 richieste per minuto,
    #limite massimo concesso da Freesound API
    time.sleep(0)
    i+=1
exit
