#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import division
import matplotlib

matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib import rc
import numpy as np


def plot_color_gradients(gradients, names):
    rc('legend', fontsize=10)
    column_width_pt = 400
    pt_per_inch = 72
    size = column_width_pt / pt_per_inch
    fig, axes = plt.subplots(nrows=len(gradients), sharex=True, figsize=(size, 0.75 * size))
    fig.subplots_adjust(top=1.00, bottom=0.05, left=0.25, right=0.95)
    for ax, gradient, name in zip(axes, gradients, names):
        img = np.zeros((2, 1024, 3))
        for i, v in enumerate(np.linspace(0, 1, 1024)):
            img[:, i] = np.clip(gradient(v), 0, 1)
        im = ax.imshow(img, aspect='auto')
        im.set_extent([0, 1, 0, 1])
        ax.yaxis.set_visible(False)
        pos = list(ax.get_position().bounds)
        x_text = pos[0] - 0.25
        y_text = pos[1] + pos[3] / 2.
        fig.text(x_text, y_text, name, va='center', ha='left', fontsize=10)
    fig.savefig('my-gradients.pdf')


def hsv2rgb(h, s, v):
    h_deg = h * 360.0

    if h_deg >= 360.0:
        h_deg = 0.0

    if s == 0:
        r = g = b = v
    else:
        Hi = int(h_deg / 60) % 6
        f = (h_deg / 60) - Hi
        p = v * (1 - s)
        q = v * (1 - s * f)
        t = v * (1 - s * (1 - f))
        if Hi == 0:
            r, g, b = v, t, p
        elif Hi == 1:
            r, g, b = q, v, p
        elif Hi == 2:
            r, g, b = p, v, t
        elif Hi == 3:
            r, g, b = p, q, v
        elif Hi == 4:
            r, g, b = t, p, v
        elif Hi == 5:
            r, g, b = v, p, q
    return (r, g, b)


def gradient_rgb_bw(v):
    return (v, v, v)


def gradient_rgb_gbr(v):
    if v < 0.5:
        v_local = v * 2
        r = 0.0
        g = 1.0 - v_local
        b = v_local
        return (r, g, b)
    else:
        v_local = (v - 0.5) * 2
        r = v_local
        g = 0.0
        b = 1.0 - v_local
        return (r, g, b)


def gradient_rgb_gbr_full(v):
    if v < 0.25:
        v_local = v * 4
        return (0.0, 1.0, v_local)
    elif v < 0.5:
        v_local = (v - 0.25) * 4
        return (0.0, 1.0 - v_local, 1.0)
    elif v < 0.75:
        v_local = (v - 0.5) * 4
        return (v_local, 0.0, 1.0)
    else:
        v_local = (v - 0.75) * 4
        return (1.0, 0.0, 1.0 - v_local)


def gradient_rgb_wb_custom(v):
    if v < 1 / 7:
        v_local = v * 7
        return (1.0, 1.0 - v_local, 1.0)
    elif v < 2 / 7:
        v_local = (v - 1 / 7) * 7
        return (1.0 - v_local, 0.0, 1.0)
    elif v < 3 / 7:
        v_local = (v - 2 / 7) * 7
        return (0.0, v_local, 1.0)
    elif v < 4 / 7:
        v_local = (v - 3 / 7) * 7
        return (0.0, 1.0, 1.0 - v_local)
    elif v < 5 / 7:
        v_local = (v - 4 / 7) * 7
        return (v_local, 1.0, 0.0)
    elif v < 6 / 7:
        v_local = (v - 5 / 7) * 7
        return (1.0, 1.0 - v_local, 0.0)
    else:
        v_local = (v - 6 / 7) * 7
        return (1.0 - v_local, 0.0, 0.0)


def gradient_hsv_bw(v):
    return hsv2rgb(0, 0, v)


def gradient_hsv_gbr(v):
    h_start = 1 / 3
    h_end = 1.0
    h = h_start + v * (h_end - h_start)
    return hsv2rgb(h, 1, 1)


def gradient_hsv_unknown(v):
    h = 0.25 * (1.0 - v)
    s = 0.7 - (0.3 * v)
    val = 1.0
    return hsv2rgb(h, s, val)


def gradient_hsv_custom(v):
    if v < 0.2:
        v_local = v * 5
        return (1.0, v_local, 0.0)
    elif v < 0.4:
        v_local = (v - 0.2) * 5
        return (1.0 - v_local, 1.0, 0.0)
    elif v < 0.6:
        v_local = (v - 0.4) * 5
        return (0.0, 1.0, v_local)
    elif v < 0.8:
        v_local = (v - 0.6) * 5
        r = 0.0 + v_local * 0.8
        g = 1.0 - v_local * 0.2
        b = 1.0
        return (r, g, b)
    else:
        v_local = (v - 0.8) * 5
        r = 0.8 + v_local * 0.2
        g = 0.8 + v_local * 0.2
        b = 1.0
        return (r, g, b)


if __name__ == '__main__':
    def toname(g):
        return g.__name__.replace('gradient_', '').replace('_', '-').upper()


    gradients = (
        gradient_rgb_bw,
        gradient_rgb_gbr,
        gradient_rgb_gbr_full,
        gradient_rgb_wb_custom,
        gradient_hsv_bw,
        gradient_hsv_gbr,
        gradient_hsv_unknown,
        gradient_hsv_custom
    )
    plot_color_gradients(gradients, [toname(g) for g in gradients])