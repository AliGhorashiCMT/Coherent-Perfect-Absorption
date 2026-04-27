## Description of notes and code in this folder

**cpa for cylinders.ipynb**: This jupyter notebook corresponds to verification/extension of the results in the paper: Noh, Heeso, et al. "Perfect coupling of light to surface plasmons by coherent absorption." Physical review letters 108.18 (2012): 186805.

**surface_plasmons.ipynb**: This jupyter notebook calculates the surface plasmon dispersion for graphene coated cylinders using quasistatic and fully retarded expressions. 

**cpa through finite surface impedance.ipynb**: This jupyter notebook finds the regime for coherent perfect absorption for small and large $kR$ (free space wavelength normalized to cylinder radius). For small $kR$, we tune the surface conductivity to be $-il\sigma(\omega)/\omega\varepsilon_0a\approx 1+\varepsilon$ (for modes with $E_z=0$) and $1/\sigma(\omega)\approx (i/2)(ka/lc\varepsilon_0)\rightarrow \sigma(\omega)\approx -2il/(\mu_0 a\omega)$ (see https://hackmd.io/@aligho/rk6siaGTeg). In order to reach CPA, we add dissipation either in the bulk (by tuning the imaginary part of the dielectric constant of the bulk) or by adding dissipation in the surface (by adding a finite real component to the surface conductivity). For large $kR$, we fix the conductivity to be $\sigma(\omega)=c\varepsilon_0$ and we see periodic CPA (see https://hackmd.io/@aligho/B1Gs5Cz2el). Saves **./paper/large_k_cpa_cylinders_tm.pdf** and **./paper/large_k_cpa_cylinders_te.pdf**, corresponding to **Supplementary Figure 7**. 

**cpa surface conductivity .ipynb**:  Calculates, from closed form solutions (see https://hackmd.io/@aligho/BkyC6e3agg), the conductivity required for CPA and calculates the bandwidth for graphene.

**Multilayered cylinders.ipynb**: Verifies that our closed form solutions for CPA for cylinders are consistent with a multilayer approach in which the dielectric function of the mantle layer is thickness dependent: $\varepsilon(\omega)=1+i\sigma(\omega)/(\varepsilon_0\omega d)$. In addition, we find the wavelengths and radii corresponding to CPA for a silica-metal multilayer. We find that for Cesium one can get CPA even when the radius of the inner silica core goes to zero. Saves **paper/thin_film_limit_tm.pdf** corresponding to **Supplemental Figure 8**. 

**Passive sink.ipynb**: Reproduces figures in the paper [Broadband subwavelength focusing of
light using a passive sink](https://opg.optica.org/oe/fulltext.cfm?uri=oe-21-15-17435) by **Hui Cao**. 

**Passive sink plane waves and time domain.ipynb**: Passive sink calculations from [Broadband subwavelength focusing of
light using a passive sink](https://opg.optica.org/oe/fulltext.cfm?uri=oe-21-15-17435) by **Hui Cao** which involve plane wave excitations. 

**Passive sink surface conductivity.ipynb**: Passive sink but with coating instead of a metallic bulk. 

**utils.py**: Scattering coefficients relevant to CPA for cylinders (see https://hackmd.io/@aligho/B1Gs5Cz2el).

**Polarizability from scattering coefficients.ipynb**: Calculates the fully retarded and static polarizability for a cylinder and saves these in **./paper/polarizability_parallel.pdf** (parallel to the cylinder axis) and **./paper/polarizability_perp.pdf** (perpendicular to the cylinder axis). These pdfs correspond to **Supplementary Figure 5**.

**Dipole lattice sums.ipynb**: Saves **./paper/lattice_cpa_conductivity.pdf** and **./paper/lattice_sum.pdf** corresponding to **Figure 2** and **Supplementary Figure 6**. 
