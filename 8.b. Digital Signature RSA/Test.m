% http://www.mathaware.org/mam/06/Kaliski.pdf
% regarding the negative 'd' parameter: https://www2.informatik.uni-hamburg.de/wsv/teaching/sonstiges/EwA-Folien/Sohst-Paper.pdf

clc
clear
close all

%% membangkitkan hash md5 
Text            = 'Universitas Dian Nuswantoro, Udinus, Semarang, Jawa Tengah, ID';
hm = DataHash(Text,'hex','MD5','ascii');
Message         = int32(hm);

fprintf('-Input-\n')
fprintf('Original message:       ''%s''\n', Text)
fprintf('Digest Message (MD5) : %s\n',hm)
fprintf('Integer representation: %s\n', num2str(Message))

%% Generate Key Pair

[Modulus, PublicExponent, PrivateExponent] = GenerateKeyPair;

fprintf('\n-Key Pair- (Prima Random)\n')
fprintf('Modulus:                '), fprintf('%5d\n', Modulus)
fprintf('Public Exponent:        '), fprintf('%5d\n', PublicExponent)
fprintf('Private Exponent:       '), fprintf('%5d\n', PrivateExponent)

%% Encrypt / Decrypt

Ciphertext      = Encrypt(Modulus, PublicExponent, Message);
RestoredMessage	= Decrypt(Modulus, PrivateExponent, Ciphertext);

fprintf('\n-Encryption-\n')
fprintf('Signature:             %s [ %s ]\n', num2str(Ciphertext), char(Ciphertext))
fprintf('Restored Message:       ''%s''\n', char(RestoredMessage))

%% Sign / Validate

Signature       = Sign(Modulus, PublicExponent, Message);
IsVerified      = Verify(Modulus, PrivateExponent, Message, Signature);

fprintf('\n-Signing-\n')
fprintf('Signature:              %s [ %s ]\n', num2str(Signature), char(Signature))
fprintf('Is Verified:            %d\n', IsVerified)