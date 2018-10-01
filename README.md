# firstservltproject
遇到的困难
    idea中push项目报错：Push rejected: Push to origin/master was rejected
解决办法
    需要从VCS中的git中pull一下你github中初始化的空仓库
    $ git pull origin master --allow-unrelated-histories
