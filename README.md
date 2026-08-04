# Coherent-Perfect-Absorption

### If you are here for code relevant to [Plasmonic coated scatterers for tunable coherent perfect absorption](https://arxiv.org/abs/2606.27218) (Submitted manuscript):

Detailed descriptions of all relevant code/figures is in **./spheres/** and **./cylinders/**.

### Otherwise, if you are not here for the paper code: 

Enjoy everything else in this repo :) and email ali.ghorashi@yale.edu if you have any questions. 

**Void and sphere plasmons (and their radiative decay)**: https://hackmd.io/@aligho/BJK40peuxl. 
- This set of notes concerns the paper [Radiative decay of plasmons in a metallic nanoshell](https://link.aps.org/pdf/10.1103/PhysRevB.69.155402?casa_token=ysrofqx3MhMAAAAA:PO2xtgoR8T6w5glk_0FlmUHMIk5X6qtD1tdgkH6TqaDN3p0EXLMs_s-OFhfZkDREXNWQ3-83KUphDw) by **Teperik, Popov and de Abajo**. 
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 
- For code, see **./spheres/Void Plasmon Decay.ipynb** where we verify the dispersion and radiative loss for the $H=0.4, 0.8, 1.2, q=1$ dipolar sphere-like and void-like modes in the range $2<R<7$, corresponding **Figure 1** of the paper.
- Additionally, in **./spheres/Void Plasmon Surface Scattering.ipynb**, we verify **Figure 7** of the paper. In particular, for the fundamental dipolar mode, we calculate the plasmon loss with and without (diffuse) surface scattering.
- Notes on surface scattering: https://hackmd.io/@aligho/BkLmTZFubx (A pdf of this set of notes is in **./pdfs_of_notes/**). The last figure in the paper above denotes the impact of surface scattering in nanoshells. Unfortunately, the formula used has a typo. In this set of notes, we derive the correct formula. 

**Graphene coated nanospheres**: https://hackmd.io/@aligho/ByRl-iJ_ge. 
- This set of notes concerns the paper [Localized plasmons in graphene-coated nanospheres](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.91.125414) by **Christensen et al**.
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 
- Includes derivation of TM (no radial magnetic field) and TE (no radial electric field) scattering coefficients in the presence of finite surface conductivity.
- Includes a derivation of nonlocal hydrodynamic corrections for the surface layer.
- For nonlocal hydrodynamic corrections in the retarded regime, see: https://hackmd.io/@aligho/HJVZ9Dhn-g 
- For numerical validation, see **./spheres/graphene coating.ipynb**

**Derivation of non-retarded multipolar polarizability for finite surface impedance**: https://hackmd.io/@aligho/ByCdz6A3ex
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 
- Includes derivation of TM plasmon modes in the quasistatic approximation and demonstrates equivalence with the general, retarded, result in the small sphere (as compared to wavelength) limit.
- For numerical comparisons between the quasistatic and fully retarded expressions for nanospheres, see **./spheres/radiative_losses.ipynb**
- The TE plasmon dispersion is also calculated for small spheres (Relevant if the imaginary part of the conductivity can be negative).
- The plasmon dispersions are used implicitly in **./spheres/cpa through finite surface impedance.ipynb**
- For a discussion on **Kramers-Kronig** relations for multipolar polarizabilities: https://hackmd.io/@aligho/SkebhByH-g (notes on the paper [Causality relations in the homogenization of metamaterials](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.84.054305?casa_token=4f21nymi9rIAAAAA%3AFQXPLXASOiUj-PXAmIum1JlwFggxSD5gFvi7e0Wx836uvSvYz3iwo8bwIpZZoSLACPKvtWAog3tjyg)) by **Andrea Alu**. A pdf of this set of notes is in **./pdfs_of_notes/**.
    - For numerical validation see **./spheres/Generalized Kramers Kronig.ipynb** in which we reproduce **Figures 1, 2, and 3** of the paper by **Andrea Alu**.
- For a discussion on using the polarizability (with radiation losses included) to model coupled plasmonic chains: https://hackmd.io/@aligho/Skwq_uHH-e. A pdf of this set of notes is in **./pdfs_of_notes/**.
- Couplied dipole model for a lattice of cylinders: https://hackmd.io/@aligho/HJXva_Dv-e
    - For posterity, a pdf of this is in **./pdfs_of_notes/**.
    - Includes notes on the paper: [Extraordinary optical reflection from sub-wavelength cylinder arrays](https://opg.optica.org/directpdfaccess/87a6fce8-e489-4bee-bbbfeae2114ce881_89577/oe-14-9-3730.pdf?da=1&id=89577&seq=0&mobile=no)
        - For p-polarized lattice sum: https://hackmd.io/@aligho/HkV5TZzWMg. A pdf of this is in **./pdfs_of_notes/**.
- A potpourri of important identities/proofs related to the electrodynamics of lattices of multipoles: https://hackmd.io/@aligho/HkWVQPID-x
    - For posterity, a pdf of this is in **./pdfs_of_notes/**.
    - For proof of Weyl identity: https://hackmd.io/@aligho/rkQCcsAOZg and the Sommerfeld identity: https://hackmd.io/@aligho/SJmejWQ2Zg
        - For posterity, pdfs of both of these documents are in **./pdfs_of_notes/**.
    - Includes notes on the following papers: [Metasurfaces with Electric Quadrupole and Magnetic Dipole Resonant Coupling](https://pubs.acs.org/doi/pdf/10.1021/acsphotonics.7b01520?casa_token=v04BC17EN1UAAAAA:rnwHOYYYx3r5GktBJd6xuvCDCUcEA9GfVKDMCcOtKI6fIYkbz4y1dhSyHuZg-VkLFQ-OJosvvp2ULT4) by **Babicheva and Andrey B. Evlyukhin**, [Optical response features of Si-nanoparticle arrays](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.82.045404) by **Evlyukhin et al**, and [Colloquium: Light scattering by particle and hole arrays](https://journals.aps.org/rmp/pdf/10.1103/RevModPhys.79.1267), which is a review paper by **de Abajo**.

**Non-retarded surface plasmons for cylinders**: https://hackmd.io/@aligho/rk6siaGTeg
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 
- Demonstrates equivalence of the fully retarded and quasistatic TM plasmon dispersions for small cylinders.
- The TE plasmon dispersion for small cylinders is also calculated.
- For numerical validation, see **./cylinders/surface_plasmons.ipynb**
- The TE and TM plasmon dispersions are used for the small radius limits of CPA in **./cylinders/cpa through finite surface impedance.ipynb**

**Formalism for radiative decay for spheres with finite surface impedance**: https://hackmd.io/@aligho/r1OqhOxpgl 

**Demonstration that radiative decay rates through two different methods are equivalent**: 
- For bulk permittivities: https://hackmd.io/@aligho/Bkq90Xxybx
    - For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 
    - This set of notes also involves some discussion of the following papers by **Jacob Khurgin**: [Electroluminescence efficiency enhancement using metal nanoparticles](https://pubs.aip.org/aip/apl/article/93/2/021120/336422) and [Impact of high-order surface plasmon modes of metal nanoparticles on enhancement of optical emission](https://pubs.aip.org/aip/apl/article/95/17/171103/321136).
- For finite surface impedance: https://hackmd.io/@aligho/HyiKTnQkbe
    - For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 

**Radiative decay for photonic crystal leaky modes**: https://hackmd.io/@aligho/rJXEdoObbg 
- This set of notes contains explanations on the paper [Nearly free-photon approximation for two-dimensional photonic crystal slabs
](https://link.aps.org/pdf/10.1103/PhysRevB.64.045108?casa_token=KEHf3djAdGMAAAAA:T_xApBgLfdw8dMs1SKbaoDatljLS4qbNSl_k91XndY0hHcei7Kwbaoh-BZcaJvc8BsrRIJHwgUct-Gk) by **Ochiai and K. Sakoda** as well as the paper [Photonic-crystal slabs with a triangular lattice of triangular holes investigated using a guided-mode expansion method](https://link.aps.org/pdf/10.1103/PhysRevB.73.235114?casa_token=arXRw1d3YfsAAAAA:05tQftGqAnJrkoZ59fKwfWk-kJL2CrXv1deid7L_wJ2tJLm_ejEt0MUHdDuf5HkllnXpGueTJReF4DE) by **Andreani and Gerace**
- CPA with a Fermi energy grating: https://hackmd.io/@aligho/rJJSJHzYZe 

**CPA for thin films, cylinders and spheres**: https://hackmd.io/@aligho/SymTGLcPxg 
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.
- Includes a discussion on the paper: [Ultrathin broadband nearly perfect absorber with symmetrical coherent illumination](https://opg.optica.org/viewmedia.cfm?seq=0&uri=oe-20-3-2246) by **Pu et al**. 
- Includes a discussion on the paper: [Perfect coupling of light to surface plasmons by coherent absorption](https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.108.186805) by **Noh et al**. 

**CPA for isolated nanoparticles suspended over a PEC substrate**: https://hackmd.io/@aligho/H1iiWa2Jfx 
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.
- Includes a discussion on the paper: [Coherent perfect absorption by a single nanoparticle](https://www.spiedigitallibrary.org/conference-proceedings-of-spie/12131/121310P/Coherent-perfect-absorption-by-a-single-nanoparticle/10.1117/12.2621039.short)
- Relatedly, for azimuthally symmetric incident fields (see [Perfect absorption of a focused light beam by a single nanoparticle](https://onlinelibrary.wiley.com/doi/abs/10.1002/lpor.202000430?casa_token=Wc0i7Q2Kf9EAAAAA:eyrI3Zs-eBJDO36d_QvW7vMngLaB3btUd770cWKkcJDdmKKg9fYZM8bLoQhAQDklaAB8OQwj7efc-Tw) (**Laser and Photonics Reviews, 2021**)): https://hackmd.io/@aligho/rkw1eEZxfl
  - For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.
  
**CPA at large $\omega a/c$ (large radius as compared to wavelength) for spheres with finite surface impedance**: https://hackmd.io/@aligho/HkO2bPW6ex 
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. This is also section **S3** of the SI of the paper. 
- For numerical validation, see **./spheres/cpa through finite surface impedance.ipynb**

**Conservation of energy for CPA in thin films**: https://hackmd.io/@aligho/rkFKOwoFgg 
- Includes discussion on the paper: [Ultrathin broadband nearly perfect absorber with symmetrical coherent illumination](https://opg.optica.org/viewmedia.cfm?seq=0&uri=oe-20-3-2246) by **Pu et al**. 
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 
- Also includes a discussion on scaling of scattering time/plasma frequency for doped semiconductors. 
- In addition, we discuss the plasma and Woltersdorff thicknesses and evaluate them in specific cases. 

**Nonlocal corrections to plasmons in spheres**: https://hackmd.io/@aligho/BJ8qUUMOgg
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.
- Includes notes on the papers: [Nonlocal Response of Metallic Nanospheres Probed by Light, Electrons, and Atoms](https://pubs.acs.org/doi/10.1021/nn406153k) and [Spatial Nonlocality in the Optical Response of Metal Nanoparticles](https://pubs.acs.org/doi/10.1021/jp204261u)
    - For notes on longitudinal resonances engendered by nonlocality: https://hackmd.io/@aligho/B1VohJBbGx. A pdf of this set of notes is in **./pdfs_of_notes/**.
    - For relevant code, see **./spheres/bulk plasmon cpa.ipynb**.

**Nonlocal corrections for SPPs in various configurations of flat metal-insulator boundaries**: https://hackmd.io/@aligho/HJdkkZS_xl 
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 
- Includes a discussion on the following paper: [Nonlocal response in thin-film waveguides: Loss versus nonlocality and breaking of complementarity](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.88.115401) by **Raza, Christensen, et al**
- For numerical calculations related to nonlocal corrections in these configurations see **./thin_films/nonlocal_anistropic_brewster.ipynb**.
- For discussion on the **Bennett mode**, see https://hackmd.io/@aligho/B1pSVgTrfg
    - This set of notes follows the following paper by **Bennett**: [Influence of the Electron Charge Distribution on Surface-Plasmon Dispersion](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.1.203)
    - a pdf of this set of notes is in **./pdfs_of_notes/**. 

**Specular reflection model for the polarizability**: https://hackmd.io/@aligho/ryN4ny8Wzl
- Includes notes on the paper [Polarizability of a small sphere including nonlocal effects](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.24.554) by **Dasgupta and Fuchs**.
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.
- For higher multipoles: https://hackmd.io/@aligho/Sk2W0GlVMg
    - For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.

**Feibelman d-parameters**: https://hackmd.io/@aligho/BJKFkQdOgx
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.
- Includes notes on the following papers:
    - [Quantum Corrections in Plasmonics and Plasmon–Emitter Interactions](https://link.springer.com/chapter/10.1007/978-3-030-38291-9_8) 
    - [A general theoretical and experimental framework for nanoscale electromagnetism](https://www.nature.com/articles/s41586-019-1803-1#MOESM1) 
    - [Plasmon–emitter interactions at the nanoscale](https://www.nature.com/articles/s41467-019-13820-z#MOESM2) 

**Derivation of Feibelman d-parameters**: https://hackmd.io/@aligho/rJnJYnKixl
- Includes discussion on the following papers: 
    - [DIFFERENTIAL REFLECTION SPECTROSCOPY OF VERY THIN SURFACE FILMS](https://www.sciencedirect.com/science/article/pii/003960287190272X) by **McIntyre and Aspnes**, 
    - [Quantum Corrections in Nanoplasmonics: Shape, Scale, and Material](https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.118.157402#supplemental) by **Christensen**, 
    - [Surface Electromagnetic Fields](https://www.sciencedirect.com/science/article/pii/0079681682900016) and [Exact microscopic theory of surface contributions to the reflectivity of a jellium solid](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.14.762) both by **Feibelman**, 
    - [Modeling photomolecular effect using generalized boundary conditions for Maxwell equations](https://www.nature.com/articles/s42005-024-01826-z.pdf) by **Chen** and, lastly, 
    - [Plasmonics and Light–Matter Interactions in Two-Dimensional Materials and in Metal Nanostructures](https://link.springer.com/book/10.1007/978-3-030-38291-9) by **Goncalves** (a PhD thesis which covers similar ground as the paper by **Christensen**).

**Lowest order corrections to surface plasmon dispersions due to d-parameters and hydrodynamic pressure**: https://hackmd.io/@aligho/B1DdxSe3gg
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 

**Mie scattering coefficients with Feibelman d-parameters**: https://hackmd.io/@aligho/Bke9op__lx
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 

**CPA for graphene multilayers (prediction)**: https://hackmd.io/@aligho/HyMyvezclx 

**CPA sum rule in 2D**: https://hackmd.io/@aligho/BJCvem1hll 
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 

**Cloacking for (long) cylindrical scatterers**: https://hackmd.io/@aligho/B1Gs5Cz2el
- Expressions derived in this set of notes are used in **./cylinders/cpa through finite surface impedance.ipynb**.
- In particular, in this set of notes, we derive both the general expressions for the scattering coefficients and also their large $a\omega/c$ asymptotic expansions. 

**Derivation of hydrodynamic equation for plasmons**: https://hackmd.io/@aligho/rk4PhV1jel
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.    
- Includes discussion on the following papers/books: [The Hydrodynamic Approach for Plasmonics in Graphene
](https://www.proquest.com/docview/2917520241?%20Theses&fromopenview=true&pq-origsite=gscholar&sourcetype=Dissertations%20) (Master's thesis by **Pedro Passos**), [Unusual resonances in nanoplasmonic structures due to nonlocal response](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.84.121412?casa_token=LI3ua9Xq_tsAAAAA%3AU2TYIB471bO0JwfQ5mgmTD9A_FgWQBaRiu2ENBTQ0YHJfw3c_Vg-3fwBm-J93HGopKh3ZaIVHAPMcQ), [Electrodynamics of a Layered Electron Gas. I. Single Layer](https://www.sciencedirect.com/science/article/pii/0003491673901619) by **Alexander Fetter**, [Electromagnetic Surface Modes](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://ia601409.us.archive.org/12/items/in.ernet.dli.2015.148030/2015.148030.Electromagnetic-Surface-Modes.pdf&ved=2ahUKEwj-t4Pvs9aPAxXkD1kFHZ6oFk0QFnoECB4QAQ&usg=AOvVaw3lVFcvFjjy3p2Me4T824Kv) by **Boardman**, [Classical and Quantum Plasmonics in Graphene Nanodisks:
the Role of Edge States](https://link.aps.org/pdf/10.1103/PhysRevB.90.241414?casa_token=GwqXhy0kCv0AAAAA:C1i4xZyQE8U6sSKjdi09B3rh_8K0unbxdCOWhalyFgpAzlQbIvZ9I2nNmsKJxudWAzDroHfZi3uBclg) and [Plasma echoes in graphene](https://journals.aps.org/prb/pdf/10.1103/PhysRevB.108.085404?casa_token=Iu4cXl8WMmAAAAAA%3AANPgfmVy5oppsL0fnSYtQstl3p-Sztr0tHxHWDJKuD45Ie5PYeAf0KLQngBwjXrs2z9HAEPZgoJPtok) by **Jablan**

**Modes of the universe approach**: https://hackmd.io/@aligho/rySmTBry-x

**Notes on the effect of anisotropicity**: 
- Image charges for anisotropic dielectrics: https://hackmd.io/@aligho/BkfSXAi0xl 
- This set of notes primarily concerns a paper by **Eugene Mele**: [Screening of a point charge by an anisotropic medium: Anamorphoses in the method of images](https://pubs.aip.org/aapt/ajp/article-pdf/69/5/557/7529693/557_1_online.pdf))
    - For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.  
-  Connection between the density response and the local, anistoropic dielectric function: https://hackmd.io/@aligho/SJ6BpiaCgx
    - For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**. 

**Graphene nanoribbons**: https://hackmd.io/@aligho/HJPmohXeMx
- Concerns the following papers: [Radiative corrections to the polarizability tensor of an electrically small anisotropic dielectric particle](https://opg.optica.org/directpdfaccess/3b008e82-9061-4bcb-97aba5de6456a2e6_195394/oe-18-4-3556.pdf?da=1&id=195394&seq=0&mobile=no) by **S. Albaladejo, R. Gomez-Medina, et al** (2010), [Adaptive multi-spectral mimicking with 2D-material nanoresonator networks](https://iopscience.iop.org/article/10.1088/2040-8986/ad4722/pdf), and [Tunable mid-infrared coherent perfect absorption in a graphene meta-surface](https://www.nature.com/articles/srep13956.pdf)
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.

**CPA exceptional points in the time domain**: https://hackmd.io/@aligho/HJjNYP_Wze 
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.

**Incoherent perfect absorption**: [https://hackmd.io/@aligho/HydOG6yHGe](https://hackmd.io/@aligho/HydOG6yHGe)
- Concerns the following paper by **Narimanov**: [Incoherent perfect absorption in lossy
anisotropic materials](https://opg.optica.org/directpdfaccess/6449ade9-eba9-401c-a5819297fdace333_407520/oe-27-7-9561.pdf?da=1&id=407520&seq=0&mobile=no) 
- For posterity, a pdf of this set of notes is in **./pdfs_of_notes/**.
- For code verifying the figures in this paper, see **./thin_films/nonlocal_anistropic_brewster.ipynb**. 

