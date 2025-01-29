# GAME-Generalized-Approximate-Master-Equations

Julia code implementing the Generalized Approximate Master Equations (GAME) model and its adaptive variant (A-GAME).

The code allows to reproduce the results in "Characteristic scales and adaptation in higher-order contagions" by G. Burgio, G. St-Onge, and L. Hébert-Dufresne. In particular, the .jld file contains the list of hyperedges extracted from a real-world dataset of face-to-face interactions. 

GAME_dyn.jl (A_GAME_dyn.jl) and the auxiliary files build.jld and DFT.jl allow to integrate the GAME (A-GAME). GAME_main.jl (A_GAME_main.jl) includes the basic workflow to extract results from the (adaptive) model. HMF.jl contains the code to integrate a heterogeneous mean-field model used for comparison. Lastly, MonteCarlo.jl provides the code to run Monte Carlo simulations.

The raw data to reproduce all the figures in the manuscript are available at [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14764963.svg)](https://doi.org/10.5281/zenodo.14764963).
