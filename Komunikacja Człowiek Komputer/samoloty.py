import matplotlib.pyplot as plt
from skimage import io, filters, feature, morphology
from scipy import ndimage
import numpy as np

image_files = ['plane1.jpg', 'plane2.jpg', 'plane3.jpg', 'plane4.jpg', 'plane5.jpg', 'plane6.jpg']

fig, axes = plt.subplots(2, 3, figsize=(15, 10))
fig.patch.set_facecolor('black')
ax = axes.ravel()

for i, filename in enumerate(image_files):
    image = io.imread(filename, as_gray=True)

    blur = filters.gaussian(image, sigma=1.0)
    thresh = filters.threshold_otsu(blur)
    binary = blur < thresh

    binary = ndimage.binary_fill_holes(binary)

    edges = feature.canny(binary, sigma=1.4, low_threshold=0.2, high_threshold=0.35)

    edges = morphology.dilation(edges, morphology.disk(1))

    ax[i].imshow(edges, cmap='gray')
    ax[i].axis('off')

plt.tight_layout()
plt.savefig('kolaz.png', facecolor='black')
plt.show()