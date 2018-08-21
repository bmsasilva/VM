#!/bin/bash

# system
sudo apt-get update
sudo apt-get --assume-yes install gdebi-core

# R
sudo apt-get --assume-yes install libtiff-dev libtiff-doc libfftw3-dev libfftw3-doc libsndfile1-dev libxml2 libxml2-dev libcairo2-dev libssl-dev libcurl4-openssl-dev r-base r-base-dev

# set locale
sudo locale-gen pt_PT.UTF-8
#export LC_ALL=C

# Tensorflow e Keras
sudo apt-get --assume-yes install python-pip python-dev python-virtualenv
sudo apt-get --assume-yes install python3-numpy python3-dev python3-wheel
sudo apt-get --assume-yes install libhdf5-dev
#pip install --user tensorflow #should be the option to use becaus of security risks but still gives permission error
#pip install --user keras #should be the option to use becaus of security risks but still gives permission error
#pip install --user h5py #should be the option to use becaus of security risks but still gives permission error
sudo -H pip install tensorflow
sudo -H pip install keras
sudo -H pip install h5py
sudo su - -c "R -e \"install.packages('signal', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"source('https://bioconductor.org/biocLite.R'); biocLite('EBImage')\""
sudo su - -c "R -e \"install.packages('tuneR', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('zoo', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('seewave', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('keras', repos='http://cran.rstudio.com/')\"" # keras
sudo su - -c "R -e \"library(keras); install_keras()\"" #tensorflow from within R

# Rstudio server
wget https://download2.rstudio.org/rstudio-server-1.1.423-amd64.deb
sudo gdebi --non-interactive rstudio-server-1.1.423-amd64.deb

# Shiny server
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.6.875-amd64.deb
sudo gdebi --non-interactive shiny-server-1.5.6.875-amd64.deb
