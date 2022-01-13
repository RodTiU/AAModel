using LinearAlgebra
using Plots

# Presets
n = 987
ϕ = π / 5
A = 2

function modelAA(A = A, n = n, randomPsi = false, ϕ = ϕ)
    # Create Hamiltonian Matrix structure
    β = 610 / n
    M = zeros(n, n)
    for i = 1:n, j = 1:n
        if i == j
            M[i, j] = A * cos(2 * π * β * i + ϕ)
        end
        if i == j + 1 || j == i + 1
            M[i, j] = -1
        end
        if (i == n && j == 1) || (j == n && i == 1)
            M[i, j] = -1
        end
    end

    # EigenVectors and EigenValues
    V = eigvecs(M)
    D = eigvals(M)

    # Add random solution if you prefer
    X = 1:n
    if randomPsi == true
        ψ² = map(x -> x^2, V[:, rand(1:n)])
    else
        ψ² = map(x -> x^2, V[:, 1])
    end

    # Y-limits plot
    Ymin = 0
    Ymax = 1.3 * maximum(ψ²)

    # Summation ψ²
    sum = 0
    for value in ψ²
        sum += value
    end

    # Output results
    println("∑|ψ|²=", sum)
    return V,
    D,
    ψ²,
    plot(X, ψ², title = "Mis gráficos", label = "|ψᵢ|²", ylims = (Ymin, Ymax))
end
