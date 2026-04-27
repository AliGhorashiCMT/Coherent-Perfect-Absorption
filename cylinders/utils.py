from scipy.special import jv, hankel2, hankel1, yv, jvp
from numpy import conj, sqrt, pi, exp
import numpy as np

def hl2_prime(n, z):
    return (n / z) * hankel2(n, z) - hankel2(n + 1, z) # derivative for hankel function of second kind

def hl1_prime(n, z):
    return (n / z) * hankel1(n, z) - hankel1(n + 1, z) # derivative for hankel function of first kind

def hl1_asymptotic(n, z):
    return sqrt(1/(pi*z))*(1-1j)*exp(1j*z)*(-1j)**n # Asymptotic (large argument) Hankel function 

def hl2_asymptotic(n, z):
    return conj(hl1_asymptotic(n, z)) # Note that z has to be real 

# We define g(omega) = -i*sigma/(c*epsilon_0) = i/(Z_s*c*epsilon_0)
def h_z_cpa_numerator(l, x, epsilon, g_omegas=0):
    m = sqrt(epsilon)
    y = x * m
    return m * jv(l, y) * hl2_prime(l, x) - jvp(l, y, 1) * hankel2(l, x) - g_omegas*jvp(l, y, 1)*hl2_prime(l, x)

def h_z_cpa_denominator(l, x, epsilon, g_omegas=0):
    m = sqrt(epsilon)
    y = x * m
    return jvp(l, y, 1) * hankel1(l, x) - m * jv(l, y) * hl1_prime(l, x) + g_omegas*jvp(l, y, 1)*hl1_prime(l, x) 

def h_z_cpa(l, x, epsilon, g_omegas=0): 
    return h_z_cpa_numerator(l, x, epsilon, g_omegas)/h_z_cpa_denominator(l, x, epsilon, g_omegas)

# As with the h_z modes, defined above, we define g(omega) = -i*sigma/(c*epsilon_0)
def e_z_cpa_numerator(l, x, epsilon, g_omegas=0):
    m = sqrt(epsilon)
    y = x * m
    return jv(l, y) * hl2_prime(l, x) - m * jvp(l, y, 1) * hankel2(l, x) - g_omegas*jv(l, y)*hankel2(l, x) 

def e_z_cpa_denominator(l, x, epsilon, g_omegas=0):
    m = sqrt(epsilon)
    y = x * m
    return -jv(l, y) * hl1_prime(l, x) + m * jvp(l, y, 1) * hankel1(l, x) + g_omegas*jv(l, y)*hankel1(l, x) 

def e_z_cpa(l, x, epsilon, g_omegas=0): 
    return e_z_cpa_numerator(l, x, epsilon, g_omegas)/e_z_cpa_denominator(l, x, epsilon, g_omegas)

# Recursive cpa method for h_z modes 
def h_z_recursive_cpa(previous_coefficients, l, epsilon1, epsilon2, kR):
    n1 = sqrt(epsilon1); n2 = sqrt(epsilon2)
    x = n2 * kR
    y = n1 * kR
    
    mat1_11 = hankel1(l, y)
    mat1_12 = hankel2(l, y)
        
    mat1_21 = n2 * hl1_prime(l, y)
    mat1_22 = n2 * hl2_prime(l, y)
        
    mat2_11 = n1 * hl2_prime(l, x)
    mat2_12 = -hankel2(l, x)
    
    mat2_21 = -n1 * hl1_prime(l, x)
    mat2_22 = hankel1(l, x)
    
    mat1 = np.array([[mat1_11, mat1_12], [mat1_21, mat1_22]])
    mat2 = np.array([[mat2_11, mat2_12], [mat2_21, mat2_22]])
    
    next_coefficients = np.einsum("ij..., jk..., k...->i...", mat2, mat1, previous_coefficients)

    return next_coefficients

# Recursive cpa method for e_z modes 
def e_z_recursive_cpa(previous_coefficients, l, epsilon1, epsilon2, kR):
    n1 = sqrt(epsilon1); n2 = sqrt(epsilon2)
    x = n2 * kR
    y = n1 * kR
    
    mat1_11 = hankel1(l, y)
    mat1_12 = hankel2(l, y)
        
    mat1_21 = n1 * hl1_prime(l, y)
    mat1_22 = n1 * hl2_prime(l, y)
        
    mat2_11 = n2 * hl2_prime(l, x)
    mat2_12 = -hankel2(l, x)
    
    mat2_21 = -n2 * hl1_prime(l, x)
    mat2_22 = hankel1(l, x)
    
    mat1 = np.array([[mat1_11, mat1_12], [mat1_21, mat1_22]])
    mat2 = np.array([[mat2_11, mat2_12], [mat2_21, mat2_22]])
    
    next_coefficients = np.einsum("ij..., jk..., k...->i...", mat2, mat1, previous_coefficients)

    return next_coefficients

alpha = 1/137
hbar = 6.58211957*1e-16 # hbar in eV*seconds
c = 2.99792458*1e17; # speed of light in nanometers per second

