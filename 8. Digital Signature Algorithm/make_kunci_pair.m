p = 0;
q = 0;
h = 0;
g = 0;
x = 0;
y = 0;

%% pilih nilai p
p = input('\nMasukkan nilai p: ');


%% cari q
fprintf('Mencari nilai q, tekan ctrl+c untuk stop pencarian')
for z=1:p-1
    if mod(sym(p-1), sym(z)) == 0
        disp(z);
    end
end
%% pilih q
q = input('Pilih nilai q: ');

%% cari h
% for z=1:p-1
%     if mod(sym(z^((p-1)/q)),sym(p)) > 1
%         h = z;
%         disp(h)
%     end
% end
%% pilih h dan menghitung nilai g
h = input('Pilih nilai h: ');
g = mod(sym(h^((p-1)/q)),sym(p));

%% memilih nilai x (x < p)
x = input('Pilih nilai x: ');

%% mencari nilai y
y = mod(sym(g^x),sym(p))

%% tampilkan y dan x
fprintf('\nKunci Publik Y : %s\n',y)
fprintf('Kunci Private X : %s\n',(x))