#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np



def main():

    files = [ '1ers.csv', '1crs.csv', '2crs.csv', '1c.csv', '2c.csv']
    algorithm_names = ['1-Evol-RS', '1-Coev-RS', '2-Coev-RS', '1-Coev', '2-Coev']
    markers = ['o', 'v', 's', 'D', '^']
    colors = ['blue', 'crimson', 'hotpink', 'coral', 'deepskyblue']
    box_plot_data = []
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(11, 7))

    for file, name, marker, color  in zip(files, algorithm_names, markers, colors):
        df = pd.read_csv(file)
        x = df['effort']
        y = df.drop(columns=['generation', 'effort']).mean(axis=1)*100
        ax1.plot(x, y, label=name, marker=marker, color=color, markevery=25, markeredgecolor='black', markeredgewidth=1)


        final_results = df.drop(columns=['generation', 'effort']).iloc[-1] * 100
        box_plot_data.append(final_results)

# wykres 1
    # legenda
    ax1.legend(fontsize=12)

    # oś x
    ax1.set_xlabel('Rozegranych gier ($\\times 1000$)', fontsize=14, labelpad=15)
    ax1.set_xlim(0, 500000)
    x_ticks = np.arange(0, 500001, 100000)
    ax1.set_xticks(x_ticks, labels=[str(int(t // 1000)) for t in x_ticks])

    # górna oś x
    ax_top = ax1.twiny()
    ax_top.set_xlabel("Pokolenie", fontsize=15, labelpad=15)
    ax_top.set_xlim(0, 200)
    ax_top.set_xticks(np.arange(0, 201, 40))
    ax_top.tick_params(axis='x', labelsize=12, direction='in', length=8)


    # oś y
    ax1.set_ylabel('Odsetek wygranych gier [$\\%$]', fontsize=14, labelpad=15)
    ax1.set_ylim(60, 100)
    ax1.set_yticks(np.arange(60, 101, 5))
    ax1.tick_params(axis='y', right=True)

    # siatka
    ax1.grid(True, linestyle='--', alpha=0.8)

    # kreski
    ax1.tick_params(axis='both', labelsize=12,  direction='in', length=8)

# wykres 2
    ax2.boxplot(box_plot_data,
                         tick_labels=algorithm_names,
                         notch=True,
                         showmeans=True,
                         boxprops=dict(color='firebrick', linewidth=1.5),
                         capprops=dict(color='firebrick', linewidth=1.5),
                         whiskerprops=dict(color='firebrick', linestyle='--', linewidth=1.75),
                         flierprops=dict(marker='+', color='blue', markersize=8),
                         medianprops=dict(color='royalblue', linewidth=2),
                         meanprops=dict(marker='o', markerfacecolor='black', markersize=8))

    # oś x
    ax2.tick_params(axis='x', rotation=30)

    # oś y
    ax2.set_ylim(60, 100)
    ax2.set_yticks(np.arange(60, 101, 5))
    ax2.yaxis.tick_right()

    # siatka
    ax2.grid(True, linestyle='--', alpha=0.8)

    # kreski
    ax2.tick_params(axis='both', labelsize=12, direction='in', length=8)

    # zapis
    plt.tight_layout()
    plt.savefig('wykres.png', dpi=300)


if __name__ == '__main__':
    main()