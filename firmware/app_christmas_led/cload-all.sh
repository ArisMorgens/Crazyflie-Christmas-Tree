#!/usr/bin/env bash
# Reset
COLOR_RESET='\033[0m'       # Text Reset
YELLOW='\033[0;33m'         # Yellow
RED='\033[0;31m'            # Red
flags = $1
make cf21bl_defconfig

flags=""
for arg in "$@"; do
    flags="$flags $arg"
done

# define array of uris
uris=(
    "radio://0/30/2M/BADBADBAD1"
    "radio://0/30/2M/BADBADBAD2"
    "radio://0/30/2M/BADBADBAD3"
    "radio://1/55/2M/BADBADBAD4"
    "radio://1/55/2M/BADBADBAD5"
    "radio://1/55/2M/BADBADBAD6"
    "radio://2/70/2M/BADBADBAD7"
    "radio://2/70/2M/BADBADBAD8"

)

make -j $(nproc) $flags BRUSHLESS=1

for uri in "${uris[@]}" ; do
    printf "${YELLOW}Flashing ${RED}CF BRUSHLESS${YELLOW} ${uri}${COLOR_RESET}\n"
    CLOAD_CMDS="-w ${uri}" make cload
done

#!/usr/bin/env bash
# Reset

# #Flash CF2.1+
# make cf2_defconfig

# make -j 8 $flags 
# # Bash ranges can be continious like in {1..9} or non continious like in 2 {4..5}
# # Change the defconfig to match the platform
# for i in {7..9}; do
#     printf "${YELLOW}Flashing ${RED}CF ${YELLOW} 0${i}${COLOR_RESET}\n"
#     CLOAD_CMDS="-w radio://0/80/2M/ABAD1DEA0${i}" make cload
# done