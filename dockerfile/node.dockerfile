FROM codercom/code-server:latest

USER root

RUN echo "thsi is node"
# # Install packages
# RUN apt-get update 
# RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# RUN apt-get update && apt-get install -y --fix-missing\
#     nodejs \ 
#     npm  
#     # python3  \
# #     python3-pip \
# #     jq \
# #     && rm -rf /var/lib/apt/lists/*
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# RUN . ~/.bashrc
# RUN #!/bin/bash
# RUN nvm install node

# RUN apt-get update && sudo apt-get install -y ca-certificates curl gnupg
# RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
# RUN NODE_MAJOR=21
# RUN echo "https://deb.nodesource.com/node_$NODE_MAJOR.x" | sudo tee /etc/apt/sources.list.d/nodesource.list
# RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | sh -
# RUN sudo apt-get update && sudo apt-get install nodejs -y
# RUN node -v
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    # open-ssl \
    curl \ 
    wget \
    git \
    gnupg 
    # more stuff


RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs \
    build-essential && \
    node --version && \ 
    npm --version

# # You could also use pip or another package manager depending on your needs
# #RUN echo ' {"workbench.colorTheme": "Monokai"}' >> /root/.local/share/code-server/User/settings.json


# RUN pip3 install matplotlib numpy pandas notebook scipy ipywidgets IPython jupyter h5py


# RUN code-server --install-extension ms-python.python \
#  && code-server --install-extension ms-toolsai.jupyter

# # Continue with any other setup you need...

USER root
