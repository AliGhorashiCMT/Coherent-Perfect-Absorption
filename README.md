# Coherent-Perfect-Absorption

**Void and sphere plasmons (and their radiative decay)**: https://hackmd.io/@aligho/BJK40peuxl 
- For code, see **./spheres/Void Plasmon Decay.ipynb** where we verify the dispersion and radiative loss for the $H=0.4, 0.8, 1.2, q=1$ dipolar sphere-like and void-like modes in the range $2<R<7$, corresponding **Figure 1** of the paper.

**Graphene coated nanospheres**: https://hackmd.io/@aligho/ByRl-iJ_ge 
- Includes derivation of TM (no radial magnetic field) and TE (no radial electric field) scattering coefficients in the presence of finite surface conductivity.
- Includes a derivation of nonlocal hydrodynamic corrections for the surface layer.
- For numerical validation, see **./spheres/graphene coating.ipynb**

**Derivation of non-retarded multipolar polarizability for finite surface impedance**: https://hackmd.io/@aligho/ByCdz6A3ex 

- Includes derivation of TM plasmon modes in the quasistatic approximation and demonstrates equivalence with the general, retarded, result in the small sphere (as compared to wavelength) limit.
- For numerical comparisons between the quasistatic and fully retarded expressions for nanospheres, see **./spheres/radiative_losses.ipynb**
- The TE plasmon dispersion is also calculated for small spheres (Relevant if the imaginary part of the conductivity can be negative).
- The plasmon dispersions are used implicitly in **./spheres/cpa through finite surface impedance.ipynb**

**Non-retarded surface plasmons for cylinders**: https://hackmd.io/@aligho/rk6siaGTeg 

- Demonstrates equivalence of the fully retarded and quasistatic TM plasmon dispersions for small cylinders.
- The TE plasmon dispersion for small cylinders is also calculated.
- For numerical validation, see **./cylinders/surface_plasmons.ipynb**
- The TE and TM plasmon dispersions are used for the small radius limits of CPA in **./cylinders/cpa through finite surface impedance.ipynb**

**Formalism for radiative decay for spheres with finite surface impedance**: https://hackmd.io/@aligho/r1OqhOxpgl 

**Demonstration that radiative decay rates through two different methods are equivalent**: 

- For bulk permittivities: https://hackmd.io/@aligho/Bkq90Xxybx
- For finite surface impedance: https://hackmd.io/@aligho/HyiKTnQkbe

**Radiative decay for photonic crystal leaky modes**:

- https://hackmd.io/@aligho/rJXEdoObbg

**CPA for thin films, cylinders and spheres**: https://hackmd.io/@aligho/SymTGLcPxg

**CPA at large $\omega a/c$ (large radius as compared to wavelength) for spheres with finite surface impedance**: https://hackmd.io/@aligho/HkO2bPW6ex
- For numerical validation, see **./spheres/cpa through finite surface impedance.ipynb**

**Conservation of energy for CPA in thin films**: https://hackmd.io/@aligho/rkFKOwoFgg 

- Also includes a discussion on scaling of scattering time/plasma frequency for doped semiconductors. 
- In addition, we discuss the plasma and Woltersdorff thicknesses and evaluate them in specific cases. 

**Nonlocal corrections to plasmons in spheres**: https://hackmd.io/@aligho/BJ8qUUMOgg

**Nonlocal corrections for SPPs in various configurations of flat metal-insulator boundaries**: https://hackmd.io/@aligho/HJdkkZS_xl

**Feibelman d-parameters**: https://hackmd.io/@aligho/BJKFkQdOgx

**Derivation of Feibelman d-parameters**: https://hackmd.io/@aligho/rJnJYnKixl

**Lowest order corrections to surface plasmon dispersions due to d-parameters and hydrodynamic pressure**: https://hackmd.io/@aligho/B1DdxSe3gg

**Mie scattering coefficients with Feibelman d-parameters**: https://hackmd.io/@aligho/Bke9op__lx

**CPA for graphene multilayers (prediction)**: https://hackmd.io/@aligho/HyMyvezclx 

**CPA sum rule in 2D**: https://hackmd.io/@aligho/BJCvem1hll

**Cloacking for (long) cylindrical scatterers**: https://hackmd.io/@aligho/B1Gs5Cz2el

- Expressions derived in this set of notes are used in **./cylinders/cpa through finite surface impedance.ipynb**. In particular, this set of notes
finds both the general expressions for the scattering coefficients and also their large $a\omega/c$ asymptotic expansions. 

**Derivation of hydrodynamic equation for plasmons**: https://hackmd.io/@aligho/rk4PhV1jel

**Modes of the universe approach**: https://hackmd.io/@aligho/rySmTBry-x

**Miscellaneous Notes**: Anisotropic dielectrics: https://hackmd.io/@aligho/BkfSXAi0xl, https://hackmd.io/@aligho/SJ6BpiaCgx

