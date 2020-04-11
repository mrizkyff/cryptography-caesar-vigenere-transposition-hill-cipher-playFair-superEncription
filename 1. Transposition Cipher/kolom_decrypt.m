function [plain] = kolom_decrypt(kunci, ciphertext)
% dekripsi
% kunci = 'A11.2017.10492'
% ciphertext ='AFmBN41IAnae3.ABahAB5K^bjF-7UAtAd-4HRaMa7.DRh_n3.ZN_nl49MEbA_-2AD_G71xY-EaCDxRIiPg-9F^nn-BxMJit_71'
plaintext = []
column = []
flag = 1

% cek kunci ada yang sama atau tidak
kunci_dec = double(kunci)
inc = 0.01
flg = 0
for i = 1:length(kunci)
    for j = i:length(kunci)
        disp('----------')
        if(kunci_dec(j) == kunci_dec(i))
            kunci_dec(i) = kunci_dec(i) + inc
            inc = inc + 0.1
        end
    end
end

% menambahkan setiap karakter di dalam plaintext ke dalam column
for x = 1:length(kunci)
     for y = 1:ceil(length(ciphertext)/length(kunci))
         column(y,x) = (ciphertext(flag))
         flag = flag+1
     end
end
disp(char(column))


panjang_kunci = length(kunci)
for i = 1:panjang_kunci
    
%     mencari nilai minimum dari kunci untuk urutan pengambilan kolom
    minimum = min(kunci_dec)
%     seti nilai minimum yang dilewati agar menjadi maks supaya tidak
%     dihitung lagi
    maximum = max(kunci_dec)
%     mencari index nilai minimum
    index = find(kunci_dec==min(kunci_dec))
    
%     menampung kolom yang diambil didalam variable ciphertext
    for a = 1:ceil(length(ciphertext)/panjang_kunci)
%        (a, index) harus sama dengan (a,i) agar kembali sperti
%        plaintext. a, i adalah yang berubah secara increment itu kolom 1,2
%        dst. kalau a, index itu sesuai urutan kunci
            plaintext(a,index) = column(a,i)
    end
    
%     menambah nilai minimum jadi maximum+1
    kunci_dec(index) = [maximum+maximum]
end
char(plaintext)

% menata matriks plaintext menjadi baris plaintext
flag = 1
plain = []
disp(char(plaintext))
for a = 1:length(ciphertext)/panjang_kunci
    for b = 1:panjang_kunci
%         plaintext(a,b) = flag
        plain(flag) = plaintext(a,b)
        flag = flag+1
    end
end

disp(char(plain))