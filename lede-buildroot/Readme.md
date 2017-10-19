# Docker container for building LEDE firmwares

Mount a volume to /home/lede/source and if empty then it will get populated with LEDE source code.

# Example for TL-WR841ND
docker run --rm -it --name lede -v tlwr841nd:/home/lede/source jokke/lede-buildroot

# Check docs from LEDE project wiki on how to use the build system.

https://lede-project.org/docs/guide-developer/use-buildsystem
