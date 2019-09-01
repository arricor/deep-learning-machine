FROM tensorflow/tensorflow:2.0.0rc0-gpu-py3-jupyter

RUN pip3 install \
  bs4==0.0.1    `# known good with 0.0.1`  \
  keras==2.2.4  `# known good with 2.2.4`  \
  nltk==3.4     `# known good with 3.4`    \
  theano==1.0.4 `# known good with 1.0.4`  \
  tqdm==4.30.0  `# known good with 4.30.0` \
  xlrd==1.2.0   `# known good with 1.2.0`
