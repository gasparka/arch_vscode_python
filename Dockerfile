FROM archlinux/base

RUN pacman -Syu --noconfirm code python python-pip python-pytest python-jedi python-isort flake8 mypy bandit ctags yapf jupyter jupyter-notebook firefox fish

RUN useradd -m coder 
ADD [".bashrc", "/home/coder/"]
ADD ["settings.json", "/home/coder/.config/Code - OSS/User/"]
RUN chown -R coder /home/coder
USER coder
RUN mkdir /home/coder/src

RUN code --install-extension ms-python.python 
RUN code --install-extension peterjausovec.vscode-docker
RUN code --install-extension brainfit.vscode-importmagic
RUN code --install-extension yzhang.markdown-all-in-one
RUN code --install-extension malvery.darcula-pycharm-dimmed