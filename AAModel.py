import math
import numpy as np

n = 50
beta = 610 / n
r = math.pi * np.random.uniform(0, 1, 100)
phi = np.mean(r)
As = np.arange(0, 8, 0.1)
Ys = np.zeros(81)
L = np.zeros([81, n])

for k in range(1, n):
    for A in range(0, 80, 1):
        M = np.zeros([n, n])
        for i in range(1, n):
            for j in range(1, n):
                if i == j:
                    M[i, j] = (A * np.cos(2 * math.pi * beta * i + phi)) / 10.0
                if (i == j + 1 or i == j - 1) or ((i == n and j == 1) or (j == n and i == 1)):
                    M[i, j] = -1
                # if (i == n and j == 1) or (j == n and i == 1):

[V, D] = np.linalg.eig(M)
Ys_ind = np.round(10 * As + 1)
