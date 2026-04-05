import numpy as np
import glob, sys
from scipy.io import wavfile

files = glob.glob(sys.argv[1]) #argv[1], test/* tests ALL and gives accuracy!
n_files = len(files)
correct = 0
KasM = 0
MasK = 0
#load wav

if n_files < 1:
    print("File doesn't exist!")
    exit(1)

for file in files:
    fs, values = wavfile.read(file)  # fs = sampling frequency in Hz

    # convert to mono if stereo
    if len(values.shape) > 1:
        values = np.mean(values, axis=1)

    values = values.astype(float)

    # Remove DC offset
    values_d = values - np.mean(values)

    # Time axis
    n = len(values_d)
    TW = 1 / fs
    t = np.arange(0, n * TW, TW)



    # FFT
    spectrum = np.abs(np.fft.rfft(values_d)) * 2 / n
    freqs = np.fft.rfftfreq(n, d=TW)

    mask = (freqs > 68) & (freqs < 267)
    spectrum = spectrum[mask]
    freqs = freqs[mask]



    # dominujące częstotliwości
    peaks = np.argsort(spectrum)[-11:]  # top 10 peaks
    f0 = np.median(freqs[peaks])
    fmax = freqs[np.argmax(spectrum)]

    predicted = 'M' if f0 < 172 else 'K'
    letter = file[-5]   # 5 od tyłu litera z nazwy pliku to M lub K


    if predicted == letter:
        correct += 1
    else:
        if predicted == 'M':
            KasM += 1
        else:
            MasK += 1



    if n_files == 1:
        print(predicted)
    else:
        print(f"{file} {predicted} {predicted == letter}\t f(max): {f0:.2f}Hz")


# --- Accuracy ---
if n_files > 1:
    accuracy = correct / n_files * 100
    print(f"\nAccuracy: {accuracy:.2f}% ({correct}/{n_files})")
    print(f"{MasK} mężczyzn pomylono na kobietę.")
    print(f"{KasM} kobiet pomylono na mężczyznę.")