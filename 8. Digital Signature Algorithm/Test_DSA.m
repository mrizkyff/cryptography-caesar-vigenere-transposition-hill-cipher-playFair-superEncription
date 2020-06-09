%% optional untuk membantu mencari q
% fprintf('Mencari nilai q, tekan ctrl+c untuk stop pencarian')
% for z=1:p-1
%     if mod(sym(p-1), sym(z)) == 0
%         disp(z);
%     end
% end
%% optional untuk membantu mencari h
% for z=1:20
%     if mod(sym(z^((p-1)/q)),sym(p)) > 1
%         h = z;
%         disp(h)
%     end
% end
%% Menentukan nilai p, q, h dan x
clc;
clear;
fprintf('----> Menentukan nilai p, q, h dan x\n')
p = 59419;
q = 3301;
h = 100;

% cek nilai h 
if mod(sym(h^((p-1)/q)),sym(p)) > 1
    fprintf('h ok!\n')
else
    fprintf('h tidak oke!\n')
    h = 0;
end

x = 3223;

%% Menghitung g dan sepasang kunci x (rahasia), y (publik)
[g, y] = make_kunci_pair(p, q, h, x);

fprintf('----> Menghitung g dan sepasang kunci\n');
fprintf('Kunci Rahasia : %s\n', sym(x));
fprintf('Kunci Public  : %s\n', y);
%% Pembentukan Sidik Digital (Signing)
hm = 4321;
k = 997;

[r, s] = signing(hm, k, q, p, g, x);
fprintf('----> Pembentukan Sidik Digital (Signing)\n');
fprintf('Nilai R : %s',r);
fprintf('\nNilai S : %s\n',s);
%% Verifikasi Sidik Digital
v = verifikasi(hm, r, s, p, q, g, y);
fprintf('----> Verifikasi Sidik Digital\n');
fprintf('Nilai V : %s\n', v);
if (v == r)
    fprintf('v == r\n')
    fprintf('Alhamdulillah sah!\n');
else
    fprintf('Verifikasi gagal, tidak sah!\n');
end
g = double(g);
r = double(r);
s = double(s);
v = double(v);
y = double(y);