## Description of notes and code in this folder

**cpa for spheres.ipynb**: The jupyter notebook corresponds to verification/extension of the results in the paper: Noh, Heeso, et al. "Perfect coupling of light to surface plasmons by coherent absorption." Physical review letters 108.18 (2012): 186805.

**graphene coating.ipynb**: Reproduces figures from the paper: https://journals.aps.org/prb/pdf/10.1103/PhysRevB.91.125414 

**radiative_losses.ipynb**: Evaluation of the transverse-magnetic plasmon dispersion from the fully retarded expression of the TM scattering coefficients. The fully retarded and quasistatic calculations give essentially the same results, which is sanity checked by plots of the value of $kR$ (free space wavelength normalized by the nanosphere radius) as a function of $R$. 

**dielectric sphere modes.ipynb**: Reproduces figure 11.13 in Novotny and Hecht (see pages 353-355).

**cpa through finite surface impedance.ipynb**: Investigates CPA at large and small values for $kR$ for a sphere. For small $kR$, for TM modes, we tune the surface conductivity around the surface plasmon value $-il(l+1)\sigma(\omega)/\omega\varepsilon_0\approx l\varepsilon + (l+1)$ (see https://hackmd.io/@aligho/ByCdz6A3ex). For TE modes, we tune the surface conductivity around the value $\sigma(\omega)\approx -i(2l+1)/\mu_0\omega a$ (see the same set of notes). For large $kR$, we fix the conductivity to be $\sigma(\omega)=c\varepsilon_0$ and we see periodic CPA (see https://hackmd.io/@aligho/HkO2bPW6ex).

**cpa surface conductivity.ipynb**: Calculates, from closed form solutions (see https://hackmd.io/@aligho/BkyC6e3agg) the conductivity required for CPA and calculates the bandwidth for graphene. 

**cpa for multilayered spheres**: Calculates CPA for multilayered systems recursively (see https://hackmd.io/@aligho/H1UxFPGeZx). Reproduces **figure 3** from Noh, Heeso, et al. "Perfect coupling of light to surface plasmons by coherent absorption." Physical review letters 108.18 (2012): 186805.

**utils.py**: Expressions for scattering coefficients for spheres. The zeros of the denominator functions give the surface plasmon frequencies and the zeros of the numerator functions give the CPA frequencies. For derivation of the scattering coefficients, see: https://hackmd.io/@aligho/ByRl-iJ_ge. 

