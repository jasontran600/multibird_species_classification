Note to participants:

This README file provides a short description of each file of NIPS4B_BIRD_CHALLENGE_TRAIN_LABELS folder.

%%%%%%%%%%%%%%%
Kaggle_BIRD_challenge_NIPS_MFCCcomputation.m

This matlab script has been used to compute cepstra from wav files. Cestra can be downloaded to: 
sabiod.univ-tln.fr/nips4b/media/birds/NIPS4B_BIRD_CHALLENGE_TRAIN_TEST_MFCC.tar.gz

%%%%%%%%%%%%%%%
nips4b_birdchallenge_train_labels.*

is a more aesthetic and complete version of numero_file_train.csv.

%%%%%%%%%%%%%%%
numero_file_train.csv
numero_file_train.txt

This 2 files contain (respectively to format csv and ascii) the same 687 x 88 matrix (lines x colums).
First column correspond to the number of a train file.
Each column from n°2 to n°88 inform by 0 or 1 respectively the absence or presence of a given species.
According to nips4b_birdchallenge_train_labels.* file,
-column n°2 correspond to the class labeled '1' ('Aegcau_call');
-column n°3 correspond to the class labeled '2' ('Alaarv_song');
..
-last colum correspond to the class labeled '87' ('Turphi_song').


%%%%%%%%%%%%%%%

nips4b_birdchallenge_espece_list.*

There are 87 classes present in the dataset. nips4b_birdchallenge_espece_list.* gives each a number from 1 to 87. 'Empty' is not a class. 'Empty' is used to indicate audio files that don't contain any animal's syllable (insects, amphibians, mammals, birds, alien ...).

nips4b_birdchallenge_espece_list.* also give the english name, the scientific name and the taxon corresponding to each class.
