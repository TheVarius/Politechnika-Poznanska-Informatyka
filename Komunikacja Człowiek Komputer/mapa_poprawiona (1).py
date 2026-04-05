import numpy as np
import matplotlib.pyplot as plt
import colorsys


def load_dem(filename):
    with open(filename, "r") as f:
        w, h, spacing = map(float, f.readline().split())
        w, h = int(w), int(h)
        data = np.loadtxt(f)
        return data, w, h, spacing


gradient = [
    (0.00, (20, 160, 20)),
    (0.40, (140, 220, 40)),
    (0.60, (250, 240, 60)),
    (0.75, (230, 160, 40)),
    (1.00, (200, 50, 40)),
]


def interp_color(c0, c1, t):
    return (
        c0[0] + (c1[0] - c0[0]) * t,
        c0[1] + (c1[1] - c0[1]) * t,
        c0[2] + (c1[2] - c0[2]) * t,
    )


def gradient_color(val):
    for i in range(len(gradient) - 1):
        p0, c0 = gradient[i]
        p1, c1 = gradient[i + 1]
        if p0 <= val <= p1:
            t = (val - p0) / (p1 - p0) if (p1 - p0) != 0 else 0
            return interp_color(c0, c1, t)
    return gradient[-1][1]


def create_color_image(dem, w, h):
    hmin, hmax = np.min(dem), np.max(dem)
    if hmax == hmin:
        hmax += 1e-6
    norm = (dem - hmin) / (hmax - hmin)

    color_img = np.zeros((h, w, 3), dtype=np.float32)
    for y in range(h):
        for x in range(w):
            r, g, b = gradient_color(norm[y, x])
            color_img[y, x] = [r / 255.0, g / 255.0, b / 255.0]
    return color_img


def advanced_shading(dem, color_img, w, h, spacing):
    advanced_shaded = color_img.copy()

    light_vec = np.array([-1.0, -1.0, 0.5])
    light_vec /= np.linalg.norm(light_vec)

    strength = 3.2
    spacing_m = spacing / 100.0

    for y in range(1, h - 1):
        for x in range(1, w - 1):
            dzdx = (dem[y, x + 1] - dem[y, x - 1]) / (2 * spacing_m)
            dzdy = (dem[y + 1, x] - dem[y - 1, x]) / (2 * spacing_m)

            normal_vec = np.array([-dzdx, -dzdy, 1.0])
            normal_vec /= np.linalg.norm(normal_vec)

            brightness = np.dot(normal_vec, light_vec)
            brightness = max(0.0, brightness)

            r, g, b = advanced_shaded[y, x]
            h_hsv, s_hsv, v_hsv = colorsys.rgb_to_hsv(r, g, b)

            factor = 1.0 + (brightness - 0.5) * strength
            v_new = np.clip(v_hsv * factor, 0.0, 1.0)

            r_new, g_new, b_new = colorsys.hsv_to_rgb(h_hsv, s_hsv, v_new)
            advanced_shaded[y, x] = [r_new, g_new, b_new]

    global_brightness_boost = 2.1
    advanced_shaded = np.clip(advanced_shaded * global_brightness_boost, 0, 1)

    return advanced_shaded


if __name__ == "__main__":
    dem_filename = "big.dem"
    dem_data, w, h, spacing = load_dem(dem_filename)
    base_color_img = create_color_image(dem_data, w, h)
    advanced_img = advanced_shading(dem_data, base_color_img, w, h, spacing)
    fig, ax = plt.subplots(figsize=(10, 8), facecolor='white')
    ax.imshow(advanced_img)
    ticks = np.arange(0, 401, 100)
    ax.set_xticks(ticks)
    ax.set_xlim(0, w)
    ax.set_yticks(ticks)
    ax.set_ylim(h, 0)

    ax.tick_params(
        axis='both',
        which='major',
        labelsize=12,
        direction='in',
        length=8,
        right=True,
        top=True
    )

    plt.tight_layout()
    plt.savefig("mapa.png", dpi=300)
    plt.show()