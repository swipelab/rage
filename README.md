
```
---------- rage -----------
- rant  <-------->  ghost -
---------------------------
```

### Execute
```zsh
docker-compose up -d
```


### Travis Encrypt File
```sh

# copy the file to be encrypted into the current directory (eg: secret.json)
docker run -it -v $(pwd):/app ruby:2.3 sh
get install travis
travis login --pro
travis encrypt-file secret.json -r {github_username}/{github_repo} --pro
# follow the instructions
```