import soundfile as sf
import os
import random
import subprocess

# Verifica se la libreria 'pydub' è installata, e se non lo è, la installa
try:
    from pydub import AudioSegment
except ImportError:
    print("La libreria 'pydub' non è installata. Installazione in corso...")
    subprocess.call(["pip", "install", "pydub"])
    from pydub import AudioSegment

# Cartella contenente i file MP3 da convertire
# Chiedi all'utente di inserire il percorso della cartella di input
cartella_input = input("Inserisci il percorso della cartella di input: ")

# Verifica se il percorso della cartella di input è valido
if not os.path.exists(cartella_input):
    print("Il percorso della cartella di input non è valido.")
    exit(1)

# Chiedi all'utente di inserire il percorso della cartella di output
cartella_output = input("Inserisci il percorso della cartella di output: ")

# Verifica se il percorso della cartella di output è valido
if not os.path.exists(cartella_output):
    print("Il percorso della cartella di output non è valido.")
    exit(1)

# Scandisci la cartella di input per i file MP3
for filename in os.listdir(cartella_input):
    if filename.lower().endswith(".mp3"):
        file_mp3 = os.path.join(cartella_input, filename)
        audio = AudioSegment.from_mp3(file_mp3)
        nome_output = os.path.splitext(filename)[0] + ".wav"
        file_wav = os.path.join(cartella_input, nome_output)
        audio.export(file_wav, format="wav")
        print(f"Convertito: {file_mp3} -> {file_wav}")

print("Conversione da MP3 a WAV completata.")


# Installa la libreria 'soundfile' se non è già installata
try:
    import soundfile as sf
except ImportError:
    subprocess.call(["pip", "install", "soundfile"])


# Elenco dei formati di file audio supportati (estensioni)
formati_audio_supportati = [".wav", ".mp3", ".flac", ".ogg"]  # Aggiungi altri formati se necessario

# Scandisci la cartella di input
for filename in os.listdir(cartella_input):
    if filename.endswith(tuple(formati_audio_supportati)):
        file_audio = os.path.join(cartella_input, filename)

        try:
            # Genera un punto di inizio casuale all'interno del file audio
            durata_audio = sf.info(file_audio).duration  # Durata del file audio in secondi
            inizio_casuale = random.uniform(0, durata_audio - 10)  # Punto di inizio casuale

            # Converti in interi i valori di start e stop
            start_index = int(inizio_casuale * sf.info(file_audio).samplerate)
            end_index = int((inizio_casuale + 10) * sf.info(file_audio).samplerate)

            # Estrai un chunk di 10 secondi dal file audio
            chunk_audio, _ = sf.read(file_audio, start=start_index, stop=end_index)

            # Crea il nome del nuovo file audio di output
            nome_output = os.path.splitext(filename)[0] + "_chunk.wav"
            file_audio_output = os.path.join(cartella_output, nome_output)

            # Salva il chunk come un nuovo file WAV
            sf.write(file_audio_output, chunk_audio, samplerate=sf.info(file_audio).samplerate)
        except Exception as e:
            print(f"Errore nell'elaborazione del file {filename}: {str(e)}")
            continue

print("Elaborazione completata.")
