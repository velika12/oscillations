function err = error_k( dm, m, ddx, dx, dl_0_stat, l_0_stat, dl_0_din, l_0_din )
% ddx is delta(x) but not delta(dx)
err = sqrt( (dm./m).^2 + 2*(ddx./dx).^2 + (dl_0_stat/l_0_stat)^2 + (dl_0_din/l_0_din)^2 );

end

