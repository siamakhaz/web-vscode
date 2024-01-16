FROM codercom/code-server:latest

USER root

# Install packages
RUN apt-get update && apt-get install -y \
    python3  \
    python3-pip \
    jq \
    && rm -rf /var/lib/apt/lists/*

# You could also use pip or another package manager depending on your needs
#RUN echo ' {"workbench.colorTheme": "Monokai"}' >> /root/.local/share/code-server/User/settings.json


RUN pip3 install matplotlib numpy pandas notebook scipy ipywidgets IPython jupyter h5py


RUN code-server --install-extension ms-python.python \
 && code-server --install-extension ms-toolsai.jupyter

# Continue with any other setup you need...

USER root