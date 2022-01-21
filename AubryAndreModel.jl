module AubryAndreModel

using LinearAlgebra
using Plots

function hamiltonianMatrix(A = 2, n = 987, ϕ = π / 5)
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
    return M
end

function eigenVectors(hamiltonianMatrix)
    return eigvecs(hamiltonianMatrix)
end

function eigenValues(hamiltonianMatrix)
    return eigvals(hamiltonianMatrix)
end

function densityProfileVsLatticeIndexPlot(eigenVectors, randomψᵢ = false)
    latticeIndex = 1:size(eigenVectors, 1)
    if randomψᵢ == true
        ψ² = map(x -> x^2, eigenVectors[:, rand(1:size(eigenVectors, 1))])
    else
        ψ² = map(x -> x^2, eigenVectors[:, 1])
    end
    Ymin = 0
    Ymax = 1.3 * maximum(ψ²)
    plot(
        latticeIndex,
        ψ²,
        xlabel = "i",
        ylabel = "|ψ²|",
        label = "|ψᵢ|²",
        ylims = (Ymin, Ymax),
    )
end

end
