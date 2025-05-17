# GAME-Generalized-Approximate-Master-Equations

Julia code implementing the Generalized Approximate Master Equations (GAME) model and its adaptive variant (A-GAME).

The code allows to reproduce the results in Burgio, G., St-Onge, G. & Hébert-Dufresne, L. _Characteristic scales and adaptation in higher-order contagions._ Nat Commun 16, 4589 (2025) ([doi](https://doi.org/10.1038/s41467-025-59777-0)).

GAME_dyn.jl (A_GAME_dyn.jl) and the auxiliary files build.jld and DFT.jl allow to integrate the GAME (A-GAME). GAME_main.jl (A_GAME_main.jl) includes the basic workflow to extract results from the (adaptive) model. HMF.jl contains the code to integrate a heterogeneous mean-field model used for comparison. MonteCarlo.jl provides the code to run Monte Carlo simulations. Lastly, the two .jld files contain the list of hyperedges extracted from two real-world dataset.

The raw data to reproduce all the figures in the manuscript are available at [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15352770.svg)](https://doi.org/10.5281/zenodo.15352770).
