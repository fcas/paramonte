#!/usr/bin/env python

import matplotlib.pyplot as plt
import paramonte as pm
import pandas as pd
import numpy as np
import glob
import sys
import os
funcname = os.path.basename(os.getcwd())

linewidth = 2
fontsize = 17
files = glob.glob("./out/*_chain.txt")

for file in files:

    df = pd.read_csv(file, delimiter = ",")
    sindex = list(df.columns).index("sampleLogFunc") + 1 # start column index.

    # traceplot

    #print(df.values)
    fig = plt.figure(figsize = (8, 6))
    ax = plt.subplot(1,1,1)
    ax.plot ( range(len(df.values[:,0]))
            , df.values[:, sindex:]
            , zorder = 1000
            )
    plt.minorticks_on()
    ax.set_xscale("log")
    ax.set_xlabel("MCMC Count", fontsize = 17)
    ax.set_ylabel("MCMC State", fontsize = 17)
    ax.tick_params(axis = "x", which = "minor")
    ax.tick_params(axis = "y", which = "minor")
    plt.grid(visible = True, which = "both", axis = "both", color = "0.85", linestyle = "-")
    #ax.legend(df.columns.values, fontsize = fontsize)
    plt.tight_layout()
    plt.savefig(funcname + ".traceplot.png")

    # scatterplot

    if len(df.values[1, sindex:]) > 1:
        #print(df.values)
        fig = plt.figure(figsize = (8, 6))
        ax = plt.subplot(1,1,1)
        ax.scatter  ( df.values[:, sindex]
                    , df.values[:, sindex + 1]
                    , zorder = 1000
                    , alpha = 0.5
                    , s = 1
                    )
        plt.minorticks_on()
        #ax.set_xscale("log")
        ax.set_xlabel(df.columns.values[sindex], fontsize = 17)
        ax.set_ylabel(df.columns.values[sindex + 1], fontsize = 17)
        ax.tick_params(axis = "x", which = "minor")
        ax.tick_params(axis = "y", which = "minor")
        plt.grid(visible = True, which = "both", axis = "both", color = "0.85", linestyle = "-")
        #ax.legend(df.columns.values, fontsize = fontsize)
        plt.tight_layout()
        plt.savefig(funcname + ".scatterplot.png")

    # adaptation measure.

    #print(df.values)
    if "adaptationMeasure" in df.columns.values:
        if any(df["adaptationMeasure"].values != 0):
            fig = plt.figure(figsize = (8, 6))
            ax = plt.subplot(1,1,1)
            ax.scatter  ( range(len(df.values[:,0]))
                        , df["adaptationMeasure"].values
                        , zorder = 1000
                        , alpha = 0.5
                        , c = "red"
                        , s = 1
                        )
            plt.minorticks_on()
            #ax.set_xscale("log")
            ax.set_yscale("log")
            ax.set_xlabel("MCMC Count", fontsize = 17)
            ax.set_ylabel("adaptationMeasure", fontsize = 17)
            ax.tick_params(axis = "x", which = "minor")
            ax.tick_params(axis = "y", which = "minor")
            plt.grid(visible = True, which = "both", axis = "both", color = "0.85", linestyle = "-")
            #ax.legend(df.columns.values, fontsize = fontsize)
            plt.tight_layout()
            plt.savefig(funcname + ".adaptationMeasure.png")

    #sim = pm.ParaDRAM()
    #sample = sim.readSample("./out/", renabled = True)
    #sample[0].plot.grid()