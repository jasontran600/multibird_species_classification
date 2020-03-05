% This octave / matlab computes the MFCC from the wav files. The parameters where optimized to get the minimal error in the signal reconstruction from the MFCC, in average on all the challenge bird species. It may not be optimal species by species...
% The feature format is a matrix 17xN: 17 cepstral coefficients x N
frames, frame size 11.6 ms, frame shift 3.9 ms, one line per frame.
If wished, you can compute their speed and acceleration by simple line
differences.
% We firt compute 2 different 16 coefficients cepstra and then we concatene 1st line of cepstra(/val_useenergy=[1]) to all lines of cepstra(/val_useenergy=[0])
% we use the Rosa Lab / Dan Ellis melfcc.m library for this computation (http://labrosa.ee.columbia.edu/matlab/rastamat/melfcc.m)
% authors : Dufour and Glotin 2013
%    'wintime' : window length in sec
%    'hoptime' : step between successive windows in sec
% sr = 44 100 Hz for all files.


clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CEPSTRA COMPUTATION
%%%%%%%%%%%%%%%%%%%%%%%%%%val_useenergy=[0];

cd WAV

fichiers=dir('*.wav');
for fich=1:length(fichiers)

        nom_act=fichiers(fich).name;
        
        disp(nom_act);
        [samples,sr,nbit]=wavread(nom_act);
		window=[512];
		val_fbtype='mel';
		val_broaden=0;
		val_maxfreq=sr/2;
		val_minfreq=0;
		val_wintime=window/sr;
		val_hoptime=val_wintime/3;
		val_numcep=[16];
		val_usecmp=[0];	
		val_dcttype=[3];
		val_nbands=[32];
		val_dither=[0];
		val_lifterexp=[0];
		val_sumpower=[1];
		val_preemph=[0];
		val_modelorder=0;
		val_bwidth=[1];
		val_useenergy=[0];

        	cd RASTAMAT/
		[cepstra,aspectrum,pspectrum] = melfcc(samples, sr,'wintime',val_wintime,'hoptime',val_hoptime,'numcep',val_numcep,'lifterexp',val_lifterexp,'sumpower',val_sumpower,'preemph',val_preemph,'dither',val_dither,'minfreq',val_minfreq,'maxfreq',val_maxfreq,'nbands',val_nbands,'bwidth',val_bwidth,'dcttype',val_dcttype,'fbtype',val_fbtype,'usecmp',val_usecmp,'modelorder',val_modelorder,'broaden',val_broaden,'useenergy',val_useenergy);
			
		cd MFCC_UseE0/

		nom_de_base=[num2str(nom_act(1:end-4))];

	nomcepstra=['cepst_',nom_de_base,'.asc'];
	eval(['save ' nomcepstra ' cepstra -ascii;']);


cd WAV
end




%%%%%%%%%%%%%%%%%%%%%%%%%%val_useenergy=[1];
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%

cd WAV

fichiers=dir('*.wav');

for fich=1:length(fichiers)

        nom_act=fichiers(fich).name;
        
        disp(nom_act);
        [samples,sr,nbit]=wavread(nom_act);
	

		window=[512];
		val_fbtype='mel';
		val_broaden=0;
		val_maxfreq=sr/2;
		val_minfreq=0;
		val_wintime=window/sr;
		val_hoptime=val_wintime/3;
		val_numcep=[16];
		val_usecmp=[0];	
		val_dcttype=[3];
		val_nbands=[32];
		val_dither=[0];
		val_lifterexp=[0];
		val_sumpower=[1];
		val_preemph=[0];
		val_modelorder=0;
		val_bwidth=[1];
		val_useenergy=[1];
        	cd RASTAMAT/
		[cepstra,aspectrum,pspectrum] = melfcc(samples, sr,'wintime',val_wintime,'hoptime',val_hoptime,'numcep',val_numcep,'lifterexp',val_lifterexp,'sumpower',val_sumpower,'preemph',val_preemph,'dither',val_dither,'minfreq',val_minfreq,'maxfreq',val_maxfreq,'nbands',val_nbands,'bwidth',val_bwidth,'dcttype',val_dcttype,'fbtype',val_fbtype,'usecmp',val_usecmp,'modelorder',val_modelorder,'broaden',val_broaden,'useenergy',val_useenergy);
			
		cd MFCC_UseE1/

		nom_de_base=[num2str(nom_act(1:end-4))];



cd WAV
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CONCATENATION OF CEPSTRA 
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%% 1st line of CEPSTRA(/USEENERGY=1) is concatenated to all lines of CEPSTRA(/USEENERGY=1)
cd MFCC_UseE0/
fichiers=dir('cepst*');
for fich=1:length(fichiers)


        nom_mat_useE0=fichiers(fich).name;
        
        disp(nom_mat_useE0);
        toto=load(nom_mat_useE0);

cd MFCC_UseE1/
	fichiers2=dir('cepst*');
	nom_mat_useE1=fichiers2(fich).name;
        
        disp(nom_mat_useE1);
        tata=load(nom_mat_useE1);
	tata=tata(1,:);

	%concatenation tata sur toto
	cepstra=[tata;toto];
	clear tata toto

cd MFCC_UseE01/
	%sauver cepstra reconstitué	
	nomcepstra=['cepst_conc_',nom_mat_useE0];
	eval(['save ' nomcepstra ' cepstra -ascii;'])
	clear cepstra 
cd MFCC_UseE0/

end


