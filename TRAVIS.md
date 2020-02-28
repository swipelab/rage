#### Travis Encrypt File
```sh
# copy the file to be encrypted into the current directory (eg: secret.json)
docker run -it -v $(pwd):/app ruby:2.3 sh
gem install travis
travis login --pro
travis encrypt-file co-swipelab-rage-travis.json -r swipelab/rage --pro
# follow the instructions
```
