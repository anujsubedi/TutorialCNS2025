function rls_train_output(ti, p, r, z_targ, P_out, w_out)

    # Extract network state at current timestep
    rtrim = r[ti, :]

    # Update inverse correlation matrix (Sherman-Morrison)
    k     = P_out * rtrim
    vPv   = rtrim' * k
    den   = 1.0 / (1.0 + vPv[1])
    P_out = P_out - k * (k' * den)

    # Compute error between output and scalar target
    e  = w_out' * rtrim - z_targ[ti]

    # Update output weights
    dw    = -e[1] * k * den
    w_out = w_out + dw

    return w_out, P_out

end
