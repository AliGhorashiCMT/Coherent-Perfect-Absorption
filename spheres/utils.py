from scipy.special import jv, hankel2, yv, spherical_jn, spherical_yn
from numpy import sqrt, heaviside, pi
import numpy as np

alpha = 1/137

def hl2(n, x):
    return spherical_jn(n, x) - 1j * spherical_yn(n, x)

def hl2prime(n, x):
    hn = hl2(n, x)
    hn1 = hl2(n+1, x)
    return n/x * hn - hn1

def hl1(n, x):
    return spherical_jn(n, x) + 1j * spherical_yn(n, x)

def hl1prime(n, x):
    hn = hl1(n, x)
    hn1 = hl1(n+1, x)
    return n/x * hn - hn1


# We define g(omega) = i*sigma/(omega*epsilon_0*R) = i*[sigma/(x_0*c*epsilon_0)], where R is the radius of the sphere and sigma is the surface conductivity and x_0=R*(omega/c). 
# Functions that start with e_r correspond to TM modes (magnetic field has no radial component) 
def e_r_cpa_numerator(l, x, epsilon, g_omegas=0):
    m = sqrt(epsilon)
    y = x * m 
    
    xhl2_prime = hl2(l, x) + x * hl2prime(l, x)
    yjl_prime = spherical_jn(l, y) + y * spherical_jn(l, y, derivative=True)

    return epsilon * spherical_jn(l, y) * xhl2_prime - yjl_prime * hl2(l, x) + g_omegas * xhl2_prime * yjl_prime
    
def e_r_cpa_denominator(l, x, epsilon, g_omegas=0):
    m = sqrt(epsilon)
    y = x * m 

    xhl1_prime = hl1(l, x) + x * hl1prime(l, x)
    yjl_prime = spherical_jn(l, y) + y * spherical_jn(l, y, derivative=True)

    return -epsilon * spherical_jn(l, y) * xhl1_prime + yjl_prime * hl1(l, x) - g_omegas * xhl1_prime * yjl_prime
    
# We define h(omega) = g(omega) * x_0**2 = i*[(sigma*x_0)/(c*epsilon_0)], where x_0 is the R(omega/c)
# Functions that start with h_r correspond to TE modes (electric field has no radial component) 
def h_r_cpa_numerator(l, x, epsilon, h_omegas=0):
    m = sqrt(epsilon)
    y = x * m 

    xhl2_prime = hl2(l, x) + x * hl2prime(l, x)
    yjl_prime = spherical_jn(l, y) + y*spherical_jn(l, y, derivative=True)

    return -spherical_jn(l, y) * xhl2_prime + yjl_prime * hl2(l, x) - h_omegas * spherical_jn(l, y) * hl2(l, x)

def h_r_cpa_denominator(l, x, epsilon, h_omegas=0):
    m = sqrt(epsilon)
    y = x * m 

    xhl1_prime = hl1(l, x) + x * hl1prime(l, x)
    yjl_prime = spherical_jn(l, y) + y*spherical_jn(l, y, derivative=True)
    
    return spherical_jn(l, y) * xhl1_prime - yjl_prime * hl1(l, x) + h_omegas * spherical_jn(l, y) * hl1(l, x)

def e_r_cpa(l, x, epsilon, g_omegas=0): 
    return e_r_cpa_numerator(l, x, epsilon, g_omegas)/e_r_cpa_denominator(l, x, epsilon, g_omegas)

def h_r_cpa(l, x, epsilon, h_omegas=0): 
    return h_r_cpa_numerator(l, x, epsilon, h_omegas)/h_r_cpa_denominator(l, x, epsilon, h_omegas)

# Graphene-specific data

# Get the graphene conductivity in units of c*epsilon_0
# We pass in the Fermi energy (in eV), the frequency, by which we mean hbar*omega (in eV), and the scattering rate, hbar/tau in eV
def graphene_conductivity(epsilon_F, hbar_omega, gamma, include_interband=False):
    conductivity = 4j*alpha*epsilon_F/(hbar_omega+1j*gamma)
    if include_interband: 
        conductivity += alpha*pi*heaviside(hbar_omega-2*epsilon_F, 0.5) + 1j*alpha*np.log(np.abs(2*epsilon_F-hbar_omega)/np.abs(2*epsilon_F+hbar_omega))
    return conductivity 