function generate_output_target(p)
    z_targ = zeros(p.Nsteps)
    t  = collect(1:p.Nsteps)
    T1 = 1000
    z_targ .= sin.(t .* (2*pi/T1)) .+ 1
    z_targ[1:Int(p.stim_off/p.dt)] .= 0
    return z_targ
end
