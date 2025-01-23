function initialize_HMF(ms, g_m, ϵ)
  u = zeros(length(ms))
  for m_ in eachindex(ms)
    u[m_] = ϵ*g_m[m_]
  end
  return u
end

function HMF_power_law_group!(du, u, p, t)
  ns, ms, p_n, g_m, δ, ν = p

  num, den = 0, 0
  for m_ in eachindex(ms)
    num += ms[m_]*u[m_]
    den += ms[m_]*g_m[m_]
  end
  q = num/den  # probability of drawing an infected node

  s_n = zeros(length(ns))
  for n_ in eachindex(ns)
    n = ns[n_]
    for i in 1:(n-1)
      s_n[n_] += binomial(n-1,i)* q^i * (1-q)^(n-1-i) * i^ν
    end
  end
  s = 0
  for n_ in eachindex(ns)
    s += p_n[n_]*s_n[n_]
  end

  for m_ in eachindex(ms)
    du[m_] = -u[m_] + (g_m[m_]-u[m_])*δ*ms[m_]*s
  end
end

function HMF_threshold_group!(du, u, p, t)
  ns, ms, p_n, g_m, δ, ν = p

  num, den = 0, 0
  for m_ in eachindex(ms)
    num += ms[m_]*u[m_]
    den += ms[m_]*g_m[m_]
  end
  q = num/den  # probability of drawing an infected node

  s_n = zeros(length(ns))
  for n_ in eachindex(ns)
    n = ns[n_]
    for i in (ν+1):(n-1)
      s_n[n_] += binomial(n-1,i)* q^i * (1-q)^(n-1-i) * i
    end
  end
  s = 0
  for n_ in eachindex(ns)
    s += p_n[n_]*s_n[n_]
  end

  for m_ in eachindex(ms)
    du[m_] = -u[m_] + (g_m[m_]-u[m_])*δ*ms[m_]*s
  end
end

function run_HMF_power_law_group(p, ms, g_m; ϵ = 0.001, t_max = 1000)
  u₀ = initialize_HMF(ms, g_m, ϵ)
  tspan = (1, t_max)

  prob = ODEProblem(HMF_power_law_group!, u₀, tspan, p)
  return solve(prob, Tsit5(), saveat = 0.1, reltol=1e-9, abstol=1e-9)
end

function run_HMF_threshold_group(p, ms, g_m; ϵ = 0.001, t_max = 1000)
  u₀ = initialize_HMF(ms, g_m, ϵ)
  tspan = (1, t_max)

  prob = ODEProblem(HMF_threshold_group!, u₀, tspan, p)
  return solve(prob, Tsit5(), saveat = 0.1, reltol=1e-9, abstol=1e-9)
end