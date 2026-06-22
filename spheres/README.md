## Description of notes and code in this folder

**cpa for spheres.ipynb**: The jupyter notebook corresponds to verification/extension of the results in the paper: Noh, Heeso, et al. "Perfect coupling of light to surface plasmons by coherent absorption." Physical review letters 108.18 (2012): 186805.

**graphene coating.ipynb**: Reproduces figures from the paper: https://journals.aps.org/prb/pdf/10.1103/PhysRevB.91.125414 

**radiative_losses.ipynb**: Evaluation of the transverse-magnetic plasmon dispersion from the fully retarded expression of the TM scattering coefficients. The fully retarded and quasistatic calculations give essentially the same results, which is sanity checked by plots of the value of $kR$ (free space wavelength normalized by the nanosphere radius) as a function of $R$. 

**dielectric sphere modes.ipynb**: Reproduces figure 11.13 in Novotny and Hecht (see pages 353-355).

**cpa through finite surface impedance.ipynb**: Investigates CPA at large and small values for $kR$ for a sphere. For small $kR$, for TM modes, we tune the surface conductivity around the surface plasmon value $-il(l+1)\sigma(\omega)/\omega\varepsilon_0\approx l\varepsilon + (l+1)$ (see https://hackmd.io/@aligho/ByCdz6A3ex). For TE modes, we tune the surface conductivity around the value $\sigma(\omega)\approx -i(2l+1)/\mu_0\omega a$ (see the same set of notes). For large $kR$, we fix the conductivity to be $\sigma(\omega)=c\varepsilon_0$ and we see periodic CPA (see https://hackmd.io/@aligho/HkO2bPW6ex). This notebook saves the following files:
- **./paper/large_k_cpa_spheres_tm.pdf** and **./paper/large_k_cpa_spheres_te.pdf**, which constitute **Supplementary Figure 4** of the paper. 

**cpa surface conductivity.ipynb**: Calculates, from closed form solutions (see https://hackmd.io/@aligho/BkyC6e3agg, corresponding to **Equation 1** of **CLEO submission**) the conductivity required for CPA and calculates the bandwidth for graphene. For a derivation of an approximation to the CPA bandwidth, see https://hackmd.io/@aligho/r1zDQZNgbg (a pdf of this set of notes is in **../pdfs_of_notes/**). **Figure 1 for CLEO**. For notes on obtaining the DC scattering time from mobility measurements, refer to these notes: https://hackmd.io/@aligho/BJGLhC-h-l (pdf of notes in **../pdfs_of_notes/**. This is also **Section S2** of the SI of the paper). Saves the following files: 
- **Figure 1** of the paper in **closed_form_cpa_solution.pdf**
- **Figure 5** of the paper in **large_kr_cpa.pdf** and **large_kr_cpa_magnetic.pdf**
- **Supplementary Figure 1** for the paper in **./paper/approximate_ssquared.pdf**.
- **Supplementary Figure 16** for the paper in **./paper/closed_form_cpa_solution_spheres_te.pdf** and **real_sigma_approximation_te.pdf**
- **Figure 7** for the paper in **./paper/cpa_sphere_parameters.pdf**
- **Figure 8** for the paper in **./paper/bandwidth.pdf**

**cpa for te modes with a dielectric.ipynb**: **Figure 2 for CLEO**

**cpa for multilayered spheres**: Calculates CPA for multilayered systems recursively (see https://hackmd.io/@aligho/H1UxFPGeZx). Reproduces **figure 3** from Noh, Heeso, et al. "Perfect coupling of light to surface plasmons by coherent absorption." Physical review letters 108.18 (2012): 186805.

**CPA for multilayer with thin film.ipynb**: Compares the multilayer formalism with the closed form CPA formalism for cloaked systems. In particular, we consider we map a cloaked system to an "equivalent" multilayer system with mantle layer dielectric constant given by $\varepsilon(\omega)=1+i\sigma(\omega)/(\varepsilon_0\omega d)$.

**Void Plasmon Decay.ipynb** and **Void Plasmon Surface Scattering.ipynb**: More information provided in the **README** of the main directory, but, briefly, these verify **Figure 1** and **Figure 7**, respectively, of [Radiative decay of plasmons in a metallic nanoshell](https://link.aps.org/pdf/10.1103/PhysRevB.69.155402?casa_token=ysrofqx3MhMAAAAA:PO2xtgoR8T6w5glk_0FlmUHMIk5X6qtD1tdgkH6TqaDN3p0EXLMs_s-OFhfZkDREXNWQ3-83KUphDw). Both notebooks deal with dipolar $l=1$ modes. 

**Void Plasmon Higher Angular Momentum.ipynb**: Further analysis of the paper, [Radiative decay of plasmons in a metallic nanoshell](https://link.aps.org/pdf/10.1103/PhysRevB.69.155402?casa_token=ysrofqx3MhMAAAAA:PO2xtgoR8T6w5glk_0FlmUHMIk5X6qtD1tdgkH6TqaDN3p0EXLMs_s-OFhfZkDREXNWQ3-83KUphDw). In particular, we try to re-create **Figure 2** of the paper. This we do successfully for $l=1$, but there are discrepancies for $l>1$, possibly due to an underlying issue in the paper (perhaps a rescaling $\omega/\omega_p\rightarrow l\omega/\omega_p$. Importantly, though, this notebook defines **paper_method** and **paper_method_2**, which numerically evaluate **Equation 2** of the paper. **paper_method_2** does this while avoiding numerical instabilities which arise for $l=3$, see https://hackmd.io/@aligho/BJK40peuxl.

**Quasistatic void plasmon.ipynb** Using the formalism of the de Abajo paper, [Radiative decay of plasmons in a metallic nanoshell](https://link.aps.org/pdf/10.1103/PhysRevB.69.155402?casa_token=ysrofqx3MhMAAAAA:PO2xtgoR8T6w5glk_0FlmUHMIk5X6qtD1tdgkH6TqaDN3p0EXLMs_s-OFhfZkDREXNWQ3-83KUphDw), mentioned in the notebooks above, we compare the quasistatic and fully retarded void/sphere plasmons in nanoshells. The quasistatic ones are analyzed in this paper: [Surface plasmons and strong light-matter coupling in metallic nanoshells](https://scholar.archive.org/work/ojws3hap2jb7nax3evbj4jet2m/access/wayback/http://fisica.unipv.it/nanophotonics/Pubs/AlpeggianiPRB2012.pdf)

**Tracking Fermi energy in the complex plane.ipynb**: Finds $\tau$, $\varepsilon_F=\varepsilon_F'+i\varepsilon_F''$ when we are off CPA. In addition, for conductivity that is off CPA, we find the necessary correction to the bulk dielectric constant to bring one back on CPA. In addition, we find the complex frequency associated with CPA if the radius is tuned off CPA. This file saves three figures stored in **./paper/**.

**Fermi energy tracking analytical comparison.ipynb**: Analytic approximations for the calculations done in **Tracking Fermi energy in the complex plane.ipynb**. Note that we choose smaller radii just to see better agreement with the analytic approximations. Furthermore, this notebook saves the following files (**which are subfigures in Supplementary Figure 2 and Supplementary Figure 3**:
- **./paper/track_real_epsilon_off_cpa_analytic.pdf**
- **./paper/track_real_epsilon_off_cpa_analytic.pdf**
- **./paper/track_complex_frequencies_off_cpa_analytic.pdf** 

**Passive sink surface conductivity.ipynb**: Similar to the notebook of the same name in **../cylinders/**, just for cylinders. Saves the following files for the paper: 
- **passive_sink_vs_cpa_1.pdf**: Corresponds to Panels **(a)** and **(b)** of **Figure 3** of the paper.
- **passive_sink_vs_cpa_2.pdf**: Corresponds to Panels **(c)** and **(d)** of **Figure 3** of the paper.

**Generalized Kramers Kronig.ipynb**: Notes on the paper (Causality relations in the homogenization of metamaterials)[https://journals.aps.org/prb/pdf/10.1103/PhysRevB.84.054305?casa_token=4f21nymi9rIAAAAA%3AFQXPLXASOiUj-PXAmIum1JlwFggxSD5gFvi7e0Wx836uvSvYz3iwo8bwIpZZoSLACPKvtWAog3tjyg] by **Andrea Alu**. In particular, this notebook re-produces **Figure 1, 2, and 3** of the paper. The most important figure is **Figure 3**, which shows that the retarded polarizability may be found through the **Kramers-Kronig** relations, supplemented with a closed-form quasistatic correction. 

**scatterer_over_pec.ipynb**: Plots some of the figures from the paper [Perfect absorption of a focused light beam by a single nanoparticle](https://onlinelibrary.wiley.com/doi/abs/10.1002/lpor.202000430?casa_token=Wc0i7Q2Kf9EAAAAA:eyrI3Zs-eBJDO36d_QvW7vMngLaB3btUd770cWKkcJDdmKKg9fYZM8bLoQhAQDklaAB8OQwj7efc-Tw) (**Laser and Photonics Reviews, 2021**). See the main directory for notes on this paper. Furthermore, we calculate the physical parameters necessary for a coated scatterer to absorb light in this geometry. 

**utils.py**: Expressions for scattering coefficients for spheres. The zeros of the denominator functions give the surface plasmon frequencies and the zeros of the numerator functions give the CPA frequencies. For derivation of the scattering coefficients, see: https://hackmd.io/@aligho/ByRl-iJ_ge. 


