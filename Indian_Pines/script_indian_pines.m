% pca ---------------------------
load out_pca
s = [];
for i = nbands+1:nbands*2
    s = [ s; sum(mat(i,:)) ];
end
amcc_pca = [];
for i = 1 : nbands
    t = 0.0;
    for j = 1 : columns(mat)
	t += mat(i, j) * mat(i+nbands, j);
    end
    amcc_pca = [amcc_pca; t/s(i)];
end

s_r = [];
for i = nratios+1:nratios*2
    s_r = [ s_r; sum(mat2(i,:)) ];
end
amcc_pca_r = [];
for i = 1 : nratios
    t = 0.0;
    for j = 1 : columns(mat2)
	t += mat2(i, j) * mat2(i+nratios, j);
    end
    amcc_pca_r = [amcc_pca_r; t/s_r(i)];
end
%  
% mrmr --------------------------------

load out_mrmr
s = [];
for i = nbands+1:nbands*2
    s = [ s; sum(mat(i,:)) ];
end

amcc_mrmr = [];
for i = 1 : nbands
    t = 0.0;
    for j = 1 : columns(mat)
	t += mat(i, j) * mat(i+nbands, j);
    end
    amcc_mrmr = [amcc_mrmr; t/s(i)];
end

s_r = [];
for i = nratios+1:nratios*2
    s_r = [ s_r; sum(mat2(i,:)) ];
end
amcc_mrmr_r = [];
for i = 1 : nratios
    t = 0.0;
    for j = 1 : columns(mat2)
	t += mat2(i, j) * mat2(i+nratios, j);
    end
    amcc_mrmr_r = [amcc_mrmr_r; t/s_r(i)];
end

aber_mrmr = [];
for i = 1 : nbands
    t = 0.0;
    for j = 1 : columns(mat3)
	t += mat3(i, j) * mat3(i+nbands, j);
    end
    aber_mrmr = [aber_mrmr; t/s(i)];
end

aber_mrmr_r = [];
for i = 1 : nratios
    t = 0.0;
    for j = 1 : columns(mat4)
	t += mat4(i, j) * mat4(i+nratios, j);
    end
    aber_mrmr_r = [aber_mrmr_r; t/s_r(i)];
end



% jmi --------------------------------

load out_jmi
s = [];
for i = nbands+1:nbands*2
    s = [ s; sum(mat(i,:)) ];
end

amcc_jmi = [];
for i = 1 : nbands
    t = 0.0;
    for j = 1 : columns(mat)
	t += mat(i, j) * mat(i+nbands, j);
    end
    amcc_jmi = [amcc_jmi; t/s(i)];
end

s_r = [];
for i = nratios+1:nratios*2
    s_r = [ s_r; sum(mat2(i,:)) ];
end
amcc_jmi_r = [];
for i = 1 : nratios
    t = 0.0;
    for j = 1 : columns(mat2)
	t += mat2(i, j) * mat2(i+nratios, j);
    end
    amcc_jmi_r = [amcc_jmi_r; t/s_r(i)];
end

aber_jmi = [];
for i = 1 : nbands
    t = 0.0;
    for j = 1 : columns(mat3)
    t += mat3(i, j) * mat3(i+nbands, j);
    end
    aber_jmi = [aber_jmi; t/s(i)];
end

aber_jmi_r = [];
for i = 1 : nratios
    t = 0.0;
    for j = 1 : columns(mat4)
    t += mat4(i, j) * mat4(i+nratios, j);
    end
    aber_jmi_r = [aber_jmi_r; t/s_r(i)];
end

% cmim --------------------------------
%  
%  load out_cmim
%  s = [];
%  for i = nbands+1:nbands*2
%      s = [ s; sum(mat(i,:)) ];
%  end
%  
%  amcc_cmim = [];
%  for i = 1 : nbands
%      t = 0.0;
%      for j = 1 : columns(mat)
%  	t += mat(i, j) * mat(i+nbands, j);
%      end
%      amcc_cmim = [amcc_cmim; t/s(i)];
%  end
%  
%  s_r = [];
%  for i = nratios+1:nratios*2
%      s_r = [ s_r; sum(mat2(i,:)) ];
%  end
%  amcc_cmim_r = [];
%  for i = 1 : nratios
%      t = 0.0;
%      for j = 1 : columns(mat2)
%  	t += mat2(i, j) * mat2(i+nratios, j);
%      end
%      amcc_cmim_r = [amcc_cmim_r; t/s_r(i)];
%  end

% mcm --------------------------------

load out_mcm
s = [];
for i = nbands+1:nbands*2
    s = [ s; sum(mat(i,:)) ];
end

amcc_mcm = [];
for i = 1 : nbands
    t = 0.0;
    for j = 1 : columns(mat)
	t += mat(i, j) * mat(i+nbands, j);
    end
    amcc_mcm = [amcc_mcm; t/s(i)];
end

s_r = [];
for i = nratios+1:nratios*2
    s_r = [ s_r; sum(mat2(i,:)) ];
end
amcc_mcm_r = [];
for i = 1 : nratios
    t = 0.0;
    for j = 1 : columns(mat2)
	t += mat2(i, j) * mat2(i+nratios, j);
    end
    amcc_mcm_r = [amcc_mcm_r; t/s_r(i)];
end

aber_mcm = [];
for i = 1 : nbands
    t = 0.0;
    for j = 1 : columns(mat3)
    t += mat3(i, j) * mat3(i+nbands, j);
    end
    aber_mcm = [aber_mcm; t/s(i)];
end

aber_mcm_r = [];
for i = 1 : nratios
    t = 0.0;
    for j = 1 : columns(mat4)
    t += mat4(i, j) * mat4(i+nratios, j);
    end
    aber_mcm_r = [aber_mcm_r; t/s_r(i)];
end

% relief --------------------------------

load out_relief
s = [];
for i = nbands+1:nbands*2
    s = [ s; sum(mat(i,:)) ];
end

amcc_relief = [];
for i = 1 : nbands
    t = 0.0;
    for j = 1 : columns(mat)
	t += mat(i, j) * mat(i+nbands, j);
    end
    amcc_relief = [amcc_relief; t/s(i)];
end

s_r = [];
for i = nratios+1:nratios*2
    s_r = [ s_r; sum(mat2(i,:)) ];
end
amcc_relief_r = [];
for i = 1 : nratios
    t = 0.0;
    for j = 1 : columns(mat2)
	t += mat2(i, j) * mat2(i+nratios, j);
    end
    amcc_relief_r = [amcc_relief_r; t/s_r(i)];
end

aber_relief = [];
for i = 1 : nbands
    t = 0.0;
    for j = 1 : columns(mat3)
    t += mat3(i, j) * mat3(i+nbands, j);
    end
    aber_relief = [aber_relief; t/s(i)];
end

aber_relief_r = [];
for i = 1 : nratios
    t = 0.0;
    for j = 1 : columns(mat4)
    t += mat4(i, j) * mat4(i+nratios, j);
    end
    aber_relief_r = [aber_relief_r; t/s_r(i)];
end


%plot = [5;10;15;20;25;30;35;40;45;50;70;90;110;130;150];
%plot = [plot, amcc_pca, amcc_mrmr, amcc_jmi, amcc_cmim, amcc_mcm, amcc_relief];
plot = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 13; 15; 20; 25; 30; 35; 40; 45; 50; ] ; % 70;90;100];
plot_mcc = [plot, amcc_mrmr, amcc_jmi, amcc_mcm, amcc_relief, amcc_pca];
save -ascii 'plot_data_mcc' plot_mcc

plot_ber = [plot, aber_mrmr, aber_jmi, aber_mcm, aber_relief];
save -ascii 'plot_data_ber' plot_ber

plot_r = [0.7; 0.75; 0.8; 0.85; 0.9;];
%plot_r = [plot_r, amcc_pca_r, amcc_mrmr_r, amcc_jmi_r, amcc_cmim_r, amcc_mcm_r, amcc_relief_r];
plot_r_mcc = [plot_r, amcc_mrmr_r, amcc_jmi_r, amcc_mcm_r, amcc_relief_r, amcc_pca_r];
save -ascii 'plot_data_r_mcc' plot_r_mcc

plot_r_ber = [plot_r, aber_mrmr_r, aber_jmi_r, aber_mcm_r, aber_relief_r];
save -ascii 'plot_data_r_ber' plot_r_ber
