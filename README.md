# Coherent-Perfect-Absorption

**Void and sphere plasmons (and their radiative decay)**: https://hackmd.io/@aligho/BJK40peuxl. This set of notes concerns the paper [Radiative decay of plasmons in a metallic nanoshell](https://link.aps.org/pdf/10.1103/PhysRevB.69.155402?casa_token=ysrofqx3MhMAAAAA:PO2xtgoR8T6w5glk_0FlmUHMIk5X6qtD1tdgkH6TqaDN3p0EXLMs_s-OFhfZkDREXNWQ3-83KUphDw) by **Teperik, Popov and de Abajo**. For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 
- For code, see **./spheres/Void Plasmon Decay.ipynb** where we verify the dispersion and radiative loss for the $H=0.4, 0.8, 1.2, q=1$ dipolar sphere-like and void-like modes in the range $2<R<7$, corresponding **Figure 1** of the paper.
- Additionally, in **./spheres/Void Plasmon Surface Scattering.ipynb**, we verify **Figure 7** of the paper. In particular, for the fundamental dipolar mode, we calculate the plasmon loss with and without (diffuse) surface scattering.

**Graphene coated nanospheres**: https://hackmd.io/@aligho/ByRl-iJ_ge. This set of notes concerns the paper [Localized plasmons in graphene-coated nanospheres](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.91.125414).
 (A pdf of this set of notes is in **./pdfs_of_notes/**)
- Includes derivation of TM (no radial magnetic field) and TE (no radial electric field) scattering coefficients in the presence of finite surface conductivity.
- Includes a derivation of nonlocal hydrodynamic corrections for the surface layer.
- For numerical validation, see **./spheres/graphene coating.ipynb**

**Derivation of non-retarded multipolar polarizability for finite surface impedance**: https://hackmd.io/@aligho/ByCdz6A3ex (A pdf of this set of notes is in **./pdfs_of_notes/**)

- Includes derivation of TM plasmon modes in the quasistatic approximation and demonstrates equivalence with the general, retarded, result in the small sphere (as compared to wavelength) limit.
- For numerical comparisons between the quasistatic and fully retarded expressions for nanospheres, see **./spheres/radiative_losses.ipynb**
- The TE plasmon dispersion is also calculated for small spheres (Relevant if the imaginary part of the conductivity can be negative).
- The plasmon dispersions are used implicitly in **./spheres/cpa through finite surface impedance.ipynb**
- For a discussion on **Kramers-Kronig** relations for multipolar polarizabilities: https://hackmd.io/@aligho/SkebhByH-g (notes on the paper [Causality relations in the homogenization of metamaterials](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.84.054305?casa_token=4f21nymi9rIAAAAA%3AFQXPLXASOiUj-PXAmIum1JlwFggxSD5gFvi7e0Wx836uvSvYz3iwo8bwIpZZoSLACPKvtWAog3tjyg)) by **Andrea Alu**. A pdf of this set of notes is in **./pdfs_of_notes/**.
    - For numerical validation see **./spheres/Generalized Kramers Kronig.ipynb** in which we reproduce **Figures 1, 2, and 3** of the paper by **Andrea Alu**.
- For a discussion on using the polarizability (with radiation losses included) to model coupled plasmonic chains: https://hackmd.io/@aligho/Skwq_uHH-e. A pdf of this set of notes is in **./pdfs_of_notes/**.
- Couplied dipole model for a lattice of cylinders: https://hackmd.io/@aligho/HJXva_Dv-e (a pdf of this is in **./pdfs_of_notes/**)
    - Includes notes on the paper: [Extraordinary optical reflection from sub-wavelength cylinder arrays](https://opg.optica.org/directpdfaccess/87a6fce8-e489-4bee-bbbfeae2114ce881_89577/oe-14-9-3730.pdf?da=1&id=89577&seq=0&mobile=no)
- A potpourri of important identities/proofs related to the electrodynamics of lattices of multipoles: https://hackmd.io/@aligho/HkWVQPID-x (a pdf of this is in **./pdfs_of_notes/**)
    - Includes notes on the following papers: [Metasurfaces with Electric Quadrupole and Magnetic Dipole Resonant Coupling](https://pubs.acs.org/doi/pdf/10.1021/acsphotonics.7b01520?casa_token=v04BC17EN1UAAAAA:rnwHOYYYx3r5GktBJd6xuvCDCUcEA9GfVKDMCcOtKI6fIYkbz4y1dhSyHuZg-VkLFQ-OJosvvp2ULT4) by **Babicheva and Andrey B. Evlyukhin**, [Optical response features of Si-nanoparticle arrays](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.82.045404) by **Evlyukhin et al**, and [Colloquium: Light scattering by particle and hole arrays](https://journals.aps.org/rmp/pdf/10.1103/RevModPhys.79.1267), which is a review paper by **de Abajo**.

**Non-retarded surface plasmons for cylinders**: https://hackmd.io/@aligho/rk6siaGTeg 

- Demonstrates equivalence of the fully retarded and quasistatic TM plasmon dispersions for small cylinders.
- The TE plasmon dispersion for small cylinders is also calculated.
- For numerical validation, see **./cylinders/surface_plasmons.ipynb**
- The TE and TM plasmon dispersions are used for the small radius limits of CPA in **./cylinders/cpa through finite surface impedance.ipynb**

**Formalism for radiative decay for spheres with finite surface impedance**: https://hackmd.io/@aligho/r1OqhOxpgl 

**Demonstration that radiative decay rates through two different methods are equivalent**: 

- For bulk permittivities: https://hackmd.io/@aligho/Bkq90Xxybx (a pdf of this document is in **./pdfs_of_notes/**). This set of notes also involves some discussion of the following papers by **Jacob Khurgin**: [Electroluminescence efficiency enhancement using metal nanoparticles](https://pubs.aip.org/aip/apl/article/93/2/021120/336422) and [Impact of high-order surface plasmon modes of metal nanoparticles on enhancement of optical emission](https://pubs.aip.org/aip/apl/article/95/17/171103/321136).
- For finite surface impedance: https://hackmd.io/@aligho/HyiKTnQkbe (a pdf of this document is in **./pdfs_of_notes/**).

**Radiative decay for photonic crystal leaky modes**:

- https://hackmd.io/@aligho/rJXEdoObbg This set of notes contains explanations on the paper [Nearly free-photon approximation for two-dimensional photonic crystal slabs
](https://link.aps.org/pdf/10.1103/PhysRevB.64.045108?casa_token=KEHf3djAdGMAAAAA:T_xApBgLfdw8dMs1SKbaoDatljLS4qbNSl_k91XndY0hHcei7Kwbaoh-BZcaJvc8BsrRIJHwgUct-Gk) by **Ochiai and K. Sakoda** as well as the paper [Photonic-crystal slabs with a triangular lattice of triangular holes investigated using a guided-mode expansion method](https://link.aps.org/pdf/10.1103/PhysRevB.73.235114?casa_token=arXRw1d3YfsAAAAA:05tQftGqAnJrkoZ59fKwfWk-kJL2CrXv1deid7L_wJ2tJLm_ejEt0MUHdDuf5HkllnXpGueTJReF4DE) by **Andreani and Gerace**

**CPA for thin films, cylinders and spheres**: https://hackmd.io/@aligho/SymTGLcPxg

**CPA at large $\omega a/c$ (large radius as compared to wavelength) for spheres with finite surface impedance**: https://hackmd.io/@aligho/HkO2bPW6ex
- For numerical validation, see **./spheres/cpa through finite surface impedance.ipynb**

**Conservation of energy for CPA in thin films**: https://hackmd.io/@aligho/rkFKOwoFgg Includes discussion on the paper: [Ultrathin broadband nearly perfect absorber with symmetrical coherent illumination](https://opg.optica.org/viewmedia.cfm?seq=0&uri=oe-20-3-2246) by **Pu et al**. 

- Also includes a discussion on scaling of scattering time/plasma frequency for doped semiconductors. 
- In addition, we discuss the plasma and Woltersdorff thicknesses and evaluate them in specific cases. 

**Nonlocal corrections to plasmons in spheres**: https://hackmd.io/@aligho/BJ8qUUMOgg

**Nonlocal corrections for SPPs in various configurations of flat metal-insulator boundaries**: https://hackmd.io/@aligho/HJdkkZS_xl

**Feibelman d-parameters**: https://hackmd.io/@aligho/BJKFkQdOgx

**Derivation of Feibelman d-parameters**: https://hackmd.io/@aligho/rJnJYnKixl

**Lowest order corrections to surface plasmon dispersions due to d-parameters and hydrodynamic pressure**: https://hackmd.io/@aligho/B1DdxSe3gg

**Mie scattering coefficients with Feibelman d-parameters**: https://hackmd.io/@aligho/Bke9op__lx

**CPA for graphene multilayers (prediction)**: https://hackmd.io/@aligho/HyMyvezclx 

**CPA sum rule in 2D**: https://hackmd.io/@aligho/BJCvem1hll A pdf of this set of notes is in **./pdfs_of_notes/**.  

**Cloacking for (long) cylindrical scatterers**: https://hackmd.io/@aligho/B1Gs5Cz2el

- Expressions derived in this set of notes are used in **./cylinders/cpa through finite surface impedance.ipynb**. In particular, this set of notes
finds both the general expressions for the scattering coefficients and also their large $a\omega/c$ asymptotic expansions. 

**Derivation of hydrodynamic equation for plasmons**: https://hackmd.io/@aligho/rk4PhV1jel (A pdf of this set of notes is in **./pdfs_of_notes/**).
    
- Includes discussion on the following papers/books: [The Hydrodynamic Approach for Plasmonics in Graphene
](https://www.proquest.com/docview/2917520241?%20Theses&fromopenview=true&pq-origsite=gscholar&sourcetype=Dissertations%20) (Master's thesis by **Pedro Passos**), [Unusual resonances in nanoplasmonic structures due to nonlocal response](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.84.121412?casa_token=LI3ua9Xq_tsAAAAA%3AU2TYIB471bO0JwfQ5mgmTD9A_FgWQBaRiu2ENBTQ0YHJfw3c_Vg-3fwBm-J93HGopKh3ZaIVHAPMcQ), [Electrodynamics of a Layered Electron Gas. I. Single Layer](https://www.sciencedirect.com/science/article/pii/0003491673901619) by **Alexander Fetter**, [Electromagnetic Surface Modes](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://ia601409.us.archive.org/12/items/in.ernet.dli.2015.148030/2015.148030.Electromagnetic-Surface-Modes.pdf&ved=2ahUKEwj-t4Pvs9aPAxXkD1kFHZ6oFk0QFnoECB4QAQ&usg=AOvVaw3lVFcvFjjy3p2Me4T824Kv) by **Boardman**, [Classical and Quantum Plasmonics in Graphene Nanodisks:
the Role of Edge States](https://link.aps.org/pdf/10.1103/PhysRevB.90.241414?casa_token=GwqXhy0kCv0AAAAA:C1i4xZyQE8U6sSKjdi09B3rh_8K0unbxdCOWhalyFgpAzlQbIvZ9I2nNmsKJxudWAzDroHfZi3uBclg) and [Plasma echoes in graphene](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.108.085404?casa_token=Iu4cXl8WMmAAAAAA%3AANPgfmVy5oppsL0fnSYtQstl3p-Sztr0tHxHWDJKuD45Ie5PYeAf0KLQngBwjXrs2z9HAEPZgoJPtok) by **Jablan**

**Modes of the universe approach**: https://hackmd.io/@aligho/rySmTBry-x

**Miscellaneous Notes**: Anisotropic dielectrics: https://hackmd.io/@aligho/BkfSXAi0xl (this set of notes primarily concerns a paper by **Eugene Mele**: [Screening of a point charge by an anisotropic medium: Anamorphoses in the method of images](https://pubs.aip.org/aapt/ajp/article-pdf/69/5/557/7529693/557_1_online.pdf); a pdf of this document is in **./pdfs_of_notes/**), https://hackmd.io/@aligho/SJ6BpiaCgx (a pdf of this document is in **./pdfs_of_notes/**).

