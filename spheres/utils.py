from scipy.special import jv, hankel2, yv, spherical_jn, spherical_yn
from numpy import sqrt, heaviside, pi
import numpy as np

# Define some constants: 

alpha = 1/137
hbar = 6.58211957*1e-16 # hbar in eV*seconds
c = 2.99792458*1e17; # speed of light in nanometers per second

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

# Recursive model for the scattering coefficients of a multilayer, for the h_r=0 modes. epsilon1 is the dielectric constant of the inner layer, epsilon2 the dielectric constant of the outer layer, kR is the free space wavelength multiplied by the radius at which the inner layer meets the outer layer 
def e_r_recursive_cpa(previous_coefficients, l, epsilon1, epsilon2, kR):

    x = sqrt(epsilon2) * kR
    y = sqrt(epsilon1) * kR
    
    mat1_11 = hl1(l, y)
    mat1_12 = hl2(l, y)
    
    yhl1_prime = hl1(l, y) + y * hl1prime(l, y)
    yhl2_prime = hl2(l, y) + y * hl2prime(l, y)
    
    mat1_21 = epsilon2 * yhl1_prime
    mat1_22 = epsilon2 * yhl2_prime
    
    xhl1_prime = hl1(l, x) + x * hl1prime(l, x)
    xhl2_prime = hl2(l, x) + x * hl2prime(l, x)
    
    mat2_11 = epsilon1 * xhl2_prime
    mat2_12 = -hl2(l, x)
    
    mat2_21 = -epsilon1 * xhl1_prime
    mat2_22 = hl1(l, x)
    
    
    mat1 = np.array([[mat1_11, mat1_12], [mat1_21, mat1_22]])
    mat2 = np.array([[mat2_11, mat2_12], [mat2_21, mat2_22]])
    
    next_coefficients = np.einsum("ij..., jk..., k...->i...", mat2, mat1, previous_coefficients)

    return next_coefficients

# Same as the function above but for magnetic modes (E_r=0)
def h_r_recursive_cpa(previous_coefficients, l, epsilon1, epsilon2, kR):

    x = sqrt(epsilon2) * kR
    y = sqrt(epsilon1) * kR
    
    mat1_11 = hl1(l, y)
    mat1_12 = hl2(l, y)
    
    yhl1_prime = hl1(l, y) + y * hl1prime(l, y)
    yhl2_prime = hl2(l, y) + y * hl2prime(l, y)
    
    mat1_21 = yhl1_prime
    mat1_22 = yhl2_prime
    
    xhl1_prime = hl1(l, x) + x * hl1prime(l, x)
    xhl2_prime = hl2(l, x) + x * hl2prime(l, x)
    
    mat2_11 = xhl2_prime
    mat2_12 = -hl2(l, x)
    
    mat2_21 = -xhl1_prime
    mat2_22 = hl1(l, x)
    
    
    mat1 = np.array([[mat1_11, mat1_12], [mat1_21, mat1_22]])
    mat2 = np.array([[mat2_11, mat2_12], [mat2_21, mat2_22]])
    
    next_coefficients = np.einsum("ij..., jk..., k...->i...", mat2, mat1, previous_coefficients)

    return next_coefficients