# Installing Packer For Image Creation
#meta sort 2019-07-03
#meta tags[] chef devops aws
### June 19, 2019

After you install [Golang](https://golang.org/), it's
easy to [install Packer from source](https://www.packer.io/intro/getting-started/install.html#compiling-from-source).

```
mkdir -p ~/src && \
  cd ~/src && \
  git clone https://github.com/hashicorp/packer.git && \
  cd packer && \
  make dev
```