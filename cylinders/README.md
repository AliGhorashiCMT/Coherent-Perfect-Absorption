## Description of notes and code in this folder

**cpa for cylinders.ipynb**: This jupyter notebook corresponds to verification/extension of the results in the paper: Noh, Heeso, et al. "Perfect coupling of light to surface plasmons by coherent absorption." Physical review letters 108.18 (2012): 186805.

**surface_plasmons.ipynb**: This jupyter notebook calculates the surface plasmon dispersion for graphene coated cylinders using quasistatic and fully retarded expressions. 

**cpa through finite surface impedance.ipynb**: This jupyter notebook finds the regime for coherent perfect absorption for small and large $kR$ (free space wavelength normalized to cylinder radius). For small $kR$, we tune the surface conductivity to be $-il\sigma(\omega)/\omega\varepsilon_0a\approx 1+\varepsilon$ (for modes with $E_z=0$) and $1/\sigma(\omega)\approx (i/2)(ka/lc\varepsilon_0)\rightarrow \sigma(\omega)\approx -2il/(\mu_0 a\omega)$ (see https://hackmd.io/@aligho/rk6siaGTeg). In order to reach CPA, we add dissipation either in the bulk (by tuning the imaginary part of the dielectric constant of the bulk) or by adding dissipation in the surface (by adding a finite real component to the surface conductivity). For large $kR$, we fix the conductivity to be $\sigma(\omega)=c\varepsilon_0$ and we see periodic CPA (see https://hackmd.io/@aligho/B1Gs5Cz2el). 

**cpa surface conductivity .ipynb**:  Calculates, from closed form solutions (see https://hackmd.io/@aligho/BkyC6e3agg), the conductivity required for CPA and calculates the bandwidth for graphene.

**utils.py**: Scattering coefficients relevant to CPA for cylinders (see https://hackmd.io/@aligho/B1Gs5Cz2el).

