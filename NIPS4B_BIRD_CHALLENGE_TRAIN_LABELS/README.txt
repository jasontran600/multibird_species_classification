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

This 2 files contain (respectively to format csv and ascii) the same 687 x 89 matrix (lines x colums).
First column correspond to the number of a train file.
Each column from n°2 to n°88 inform by 0 or 1 respectively the absence or presence of a given species.
According to nips4b_birdchallenge_train_labels.* file,
-column n°2 correspond to the class labeled '1' ('Aegcau_call');
-column n°3 correspond to the class labeled '2' ('Alaarv_song');
..
-column n°88 correspond to the class labeled '87' ('Turphi_song').

Column n°89 indicates duration (in sec) of each training file.

%%%%%%%%%%%%%%%

nips4b_birdchallenge_espece_list.*

There are 87 classes present in the dataset. nips4b_birdchallenge_espece_list.* gives each a number from 1 to 87. 'Empty' is not a class. 'Empty' is used to indicate audio files that don't contain any animal's syllable (insects, amphibians, mammals, birds, alien ...).

nips4b_birdchallenge_espece_list.* also give the english name, the scientific name and the taxon corresponding to each class.
%%%%%%%%%%%%%%%
Submission format:

You can submit a maximum of 2 runs per day. You'll select up to 5 final submissions for final judging (before the deadline). The run format is .csv file (example of .csv submission file with random probabilities) . We combine the name of each test file with the number of the class we consider into a single "ID" column. The first line must be "ID,Probability".Thus, the format is:

ID,Probability
nips4b_birds_testfile0001.wav_classnumber_1,0.442
nips4b_birds_testfile0001.wav_classnumber_2,0.124
nips4b_birds_testfile0001.wav_classnumber_3,0.03214324
nips4b_birds_testfile0001.wav_classnumber_4,0.65436
nips4b_birds_testfile0001.wav_classnumber_5,0.321436
nips4b_birds_testfile0001.wav_classnumber_6,0.54677
nips4b_birds_testfile0001.wav_classnumber_7,0.733
...
nips4b_birds_testfile1000.wav_classnumber_87,0.004325

Each run will be named by as : nips4b_bird2013_teamname_numberoftherun.csv (without space nor special char). It will be sent to nips4b@gmail.com with at least 5 lignes of description of the method, subject the name of your run. You'll receive shortly your score and an update of the other team scores, on 33% of the test set. The 66% left will be used for the official final ranking. A submission website shall open soon also.
