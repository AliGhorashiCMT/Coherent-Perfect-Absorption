from scipy.special import jv, hankel2, hankel1, yv, jvp
from numpy import conj, sqrt, pi, exp

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
