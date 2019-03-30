# cryptocoin-base-docker
Docker container Ubuntu:latest base and bitcoin PPA, berkeleyDB, miniupnp and GoSU

This container is used as a base for the many other cryptocurrency builds that fork from bitcoind (https://github.com/bitcoin/bitcoin).

Bitcoin depends on libdb (BerkelyDB 4.8), which isn't available on newer builds of Debian/Ubuntu and must be post installed

We install:
- ubuntu:latest
- Add the bitcoin PPA (add-apt-repository ppa:bitcoin/bitcoin)
- Install build dependencies required for building the cryptocoin libraries (libssl, libdb4.8, make, git, etc)
- Install miniupnp
- Install GoSU for docker entrypoint support (as the container runs)

Release Notes:
- 0.01 (17/08/2017)
  - initial build(s)
- 0.1 (19/09/2017)
  - moved cash from down stream
  - updated ubuntu base
- 0.2 (23/10/2017)
- 0.3 (11/02/2018)
  - updated ubuntu base
- 0.4 (17/11/2018)
  - updated ubuntu base
  - updated miniupnpnc
  - updated GoSU
- 0.5 (30/03/2019)
  - updating base
