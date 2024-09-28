#!/usr/bin/bash
set +e # Exit on error, makes debugging easier

url=$1 # The URL provided as the first argument
user_agent='Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0' # The user agent
working_dir="~/Documents/yourfolderhere" # Directory to download to

cd "$working_dir" # If a working directory was provided, and it's a directory, go to it

set -e # From here on out don't exit on error

while true; do
echo -e "\e[33mDownloading file with WGET!\e[0m"
wget -c "$url" --user-agent "$user_agent";
if [ $? -eq 0 ]; then break; fi # If wget was successful the leave the loop
echo -e "\e[31mWGET failed to download file, trying again!\e[0m"
done

cd - # If a working directory was provided, and it's a directory, exit from it