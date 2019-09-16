# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export CMF_ROOT1=$HOME/cmf
export CMF_ROOT5=$HOME/work/cmf
export CMF_ROOT=$CMF_ROOT1
export CMF_PATH=$CMF_ROOT1/web/target/classes
export CM_MAVEN_OPTS="-server -XX:PermSize=512m -XX:MaxPermSize=512m -Xmx3072m -Dcmf.schema.dir=$CMF_ROOT/libs/model/schema -Dcmf.log.dir=/var/log/cloudera-scm-server -Dcmf.log.file=cloudera-scm-server.log -Dcmf.root.logger=INFO,LOGFILE,CONSOLE -Dlog4j.configuration=file:$CMF_ROOT/web/src/main/resources/log4j.properties -Dpython.home=$CMF_ROOT/web/target/classes/python/ -DjavaVersion=1.8 -Dmaven.javadoc.skip=true"
# -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000"

alias cmf_db_start='pushd $CMF_ROOT/web; MAVEN_OPTS=$CM_MAVEN_OPTS mvn -e compile exec:java -Dexec.mainClass="com.cloudera.server.cmf.Main" -Dexec.args="-d src/main/jamon -l $CMF_ROOT/web/dev_configs/test-license.txt.asc";popd'
alias cmf_ex_start='pushd $CMF_ROOT/web; MAVEN_OPTS=$CM_MAVEN_OPTS mvn -e compile exec:java -Dexec.mainClass="com.cloudera.server.cmf.Main" -Dexec.args="-d src/main/jamon";popd'
alias cmf_db_start2='pushd $CMF_ROOT/web; MAVEN_OPTS=$CM_MAVEN_OPTS mvn -e compile -X exec:java -Dexec.mainClass="com.cloudera.server.cmf.Main" -Dexec.args="-l $CMF_ROOT/web/dev_configs/test-license.txt.asc";popd'
alias cmf_ex_start2='pushd $CMF_ROOT/web; MAVEN_OPTS=$CM_MAVEN_OPTS mvn -e compile -X exec:java -Dexec.mainClass="com.cloudera.server.cmf.Main" -Dexec.args="";popd'
alias cmf_rsync='pushd $CMF_ROOT/web; while true; do sleep 5; echo "rsync"; rsync -vaz static/cms target/classes/webapp/static; rsync -vaz static/js target/classes/webapp/static; done; popd;popd'
alias cmf_mock='pushd $CMF_ROOT/web; mvn -e compile exec:java -Dexec.mainClass=com.cloudera.server.cmf.AgentMock -Dexec.args="-c 25 -v 5 -e \"CDH 6.x.0\" " -DjavaVersion=1.8'
alias cmf_mock5='pushd $CMF_ROOT/web; mvn -e compile exec:java -Dexec.mainClass=com.cloudera.server.cmf.AgentMock -Dexec.args="-c 25 -v 5 -e \"CDH 5.14.0\" " -DjavaVersion=1.8'
alias cmf_mock1000='pushd $CMF_ROOT/web; mvn -e compile exec:java -Dexec.mainClass=com.cloudera.server.cmf.AgentMock -Dexec.args="-c 1000 -v 6 -e \"CDH 6.9999.0\" " -DjavaVersion=1.8'
alias cmf_mock2000='pushd $CMF_ROOT/web; mvn -e compile exec:java -Dexec.mainClass=com.cloudera.server.cmf.AgentMock -Dexec.args="-c 2000 -v 5 -e \"CDH 5.14.0\" " -DjavaVersion=1.8'
alias cmf_mock200='pushd $CMF_ROOT/web; mvn -e compile exec:java -Dexec.mainClass=com.cloudera.server.cmf.AgentMock -Dexec.args="-c 200 -v 6 -e \"CDH 6.9999.1\" " -DjavaVersion=1.8'

# This act on andyao-1.gce.cloudera.com, master
alias cmf_jamon1m='pushd $CMF_ROOT1/web/src/main; rsync -vaz jamon root@andyao-1.gce.cloudera.com:/opt/cloudera/cm; popd'
alias cmf_static1m='pushd $CMF_ROOT1/web/target/classes/webapp; rsync -vaz static root@andyao-1.gce.cloudera.com:/opt/cloudera/cm/webapp; popd'
alias cmf_rs1m='while true; do sleep 5; cmf_jamon1m && cmf_static1m; done'
alias cmf_test1m='pushd $CMF_ROOT1/web; node_modules/.bin/grunt test; popd'
alias cmf_coverage1m='pushd $CMF_ROOT1/web; node_modules/.bin/grunt coverage; popd'
alias cmf_lint1m='pushd $CMF_ROOT1/web; node_modules/.bin/grunt lint; popd'
alias make1m='make server DIST_TARGET=redhat7 MVN_ARGS="-U -Dmaven.javadoc.skip=true -DskipFrontend=true -Dnot-dist-build=true"'
alias make2m='make cm-server DIST_TARGET=redhat7 MVN_ARGS="-Dmaven.javadoc.skip=true -rf"'
alias cmf_server_jar1m='scp $CMF_ROOT1/web/target/server-7.x.0.jar root@andyao-1.gce.cloudera.com:/opt/cloudera/cm/lib';
alias cmf_common_jar1m='scp $CMF_ROOT1/libs/common/target/common-7.x.0.jar root@andyao-1.gce.cloudera.com:/opt/cloudera/cm/lib';
alias cmf_model_jar1m='scp $CMF_ROOT1/libs/model/target/model-7.x.0.jar root@andyao-1.gce.cloudera.com:/opt/cloudera/cm/lib';
alias cmf_properties_1m='scp $CMF_ROOT1/web/src/main/resources/*.properties root@andyao-1.gce.cloudera.com:/opt/cloudera/cm';
alias cmf_restart1m='ssh andyao-1.gce.cloudera.com "bash -s" < ~/scripts/restart_cm.sh';

alias cmf_watch='pushd $CMF_ROOT/web; node_modules/.bin/grunt watch; popd'

alias glo='git log --oneline --decorate'
alias grocm='git rebase -i origin/cdpd-master'
alias grom='git rebase -i origin/master'
alias gcm='git commit -m "WIP"'
alias gca='git commit --amend'
alias gfo='git fetch origin'
alias grc='git rebase -i --continue'
alias gra='git rebase --abort'
alias gs='git status'
alias gg='git grep'
alias gd='git diff'
alias gds='git diff --staged'
alias review-board='$HOME/github.sf/shawn/issue_manager/bin/review-board.rb'
alias ls='ls -G'
alias sb='source $HOME/.bashrc'
alias cdweb='cd $CMF_ROOT/web/src/main/jamon/com/cloudera/server/web'
alias cdwebj='cd $CMF_ROOT/web/src/main/java/com/cloudera/server/web'
alias cdstatic='cd $CMF_ROOT/web/static'
alias cui-cmf='pushd $CMF_ROOT/web; npm install && cmf_grunt1m && cmf_static1m'
alias nrc='pushd $CMF_ROOT/web; npm run clean';
alias nrb='pushd $CMF_ROOT/web; npm run build';
alias nrp='pushd $CMF_ROOT/web; npm run package';
alias cbp='nrc && nrb && nrp';
alias gitwa='git diff --word-diff=porcelain origin/master | grep -e "^+[^+]" | wc -w | xargs'
alias gitwd='git diff --word-diff=porcelain origin/master | grep -e "^-[^-]" | wc -w | xargs'
alias gitw='echo $(($(gitwa) - $(gitwd)))'

# alias mist5='pushd $CMF_ROOT5/web; mvn install -DskipTests=true -Dmaven.javadoc.skip=true; cmf_scp5; popd'

function parse_git_branch
{
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

parse_svn_revision() {
        local DIRTY REV=$(svn info 2>/dev/null | grep Revision | sed -e 's/Revision: //')
        [ "$REV" ] || return
        [ "$(svn st)" ] && DIRTY=' *'
        echo "(r$REV$DIRTY)"
}

function fn {
    find . -name "$1"
}

function vf {
    if [ $# -lt 1 ]; then
        echo "Usage: vf filenames ...";
        return;
    fi;
    FILE=$1;
    gvim `find . -name "$1"`
}

function gdh3 {
    if [ $# -lt 1 ]; then
        echo "Usage; gdh3 revision";
        return;
    fi;
    REV=$1;
    git diff --full-index $REV^..$REV >~/Documents/1diff;
}

function wdiff {
    REV=$1;
    git diff --word-diff=porcelain $REV^..$REV | grep -e "^+[^+]" | wc -w | xargs
    git diff --word-diff=porcelain $REV^..$REV | grep -e "^-[^-]" | wc -w | xargs
}

function gdh4 {
    if [ $# -lt 2 ]; then
        echo "Usage; gdh4 revision reviewNumber";
        return;
    fi;
    REV=$1;
    RBN=$2;
    git diff --full-index origin/master..$REV^ >~/Documents/2diff;
    git diff --full-index $REV^..$REV >~/Documents/1diff;
    post-review --diff-filename=/Users/andyao/Documents/1diff --parent=$REV^ -r $RBN;
}

function myreplace {
    if [ $# -lt 2 ]; then
        echo "usage; myreplace old new";
        return;
    fi;
    OLD=$1;
    NEW=$2;
    OUTPUT1=~/tmp/my-replace1.txt;
    OUTPUT2=~/tmp/my-replace2.txt;

    git grep --name-only "$OLD" > $OUTPUT1;
    for file in `cat $OUTPUT1`
    do
        echo $file;
        sed "s|$OLD|$NEW|g" $file > $OUTPUT2;
        cp $OUTPUT2 $file;
    done

}

function myi18nReplace {
    if [ $# -lt 2 ]; then
        echo "usage; myi18nreplace old new";
        return;
    fi;
    OLD=$1;
    NEW="{{#i18n}}$2{{/i18n}}";

    myreplace $1 $NEW;
}

function mysort {
    if [ $# -lt 1 ]; then
        echo "usage: mysort filename";
        return;
    fi;
    sort $1 > ~/tmp/mysort.txt

    mv ~/tmp/mysort.txt $1
}

PS1='\u@\h:\w $(parse_git_branch)$(parse_svn_revision)\$ '

function cmf-review {
    if [ $# -lt 1 ]; then
        echo "Usage: cmf-review rev-list reviewer ...";
        return;
    fi;
    REVLIST=$1^..$1;
    REVIEWER="jayesh, herman, dlo, vivek, mfox";
    shift 2;
    rbt post --target-groups=cmf --repository-url cmf --target-people="$REVIEWER" --diff-filename=<(git diff --full-index "$REVLIST") --summary="`git log --pretty=%s $REVLIST`" --description="`git log $REVLIST`" $@
    gdh3 $1;
}

function cmf-ui-review {
    if [ $# -lt 1 ]; then
        echo "Usage: cmf-ui-review rev-list reviewer ...";
        return;
    fi;
    REVLIST=$1^..$1;
    REVIEWER="suhai.yehuza,hua,tai,atkach"
    shift 2;
    rbt post --target-groups=cmf-ui --repository-url cmf --target-people="$REVIEWER" --diff-filename=<(git diff --full-index "$REVLIST") --summary="`git log --pretty=%s $REVLIST`" --description="`git log $REVLIST`" $@
    gdh3 $1;
}

function ui-review {
    if [ $# -lt 1 ]; then
        echo "Usage: ui-review rev-list reviewer ...";
        return;
    fi;
    REVLIST=$1^..$1;
    REVIEWER="atkach,hua";
    shift 2;
    rbt post --target-groups=cloudera-ui --repository-url cloudera-ui --target-people="$REVIEWER" --diff-filename=<(git diff --full-index "$REVLIST") --summary="`git log --pretty=%s $REVLIST`" --description="`git log $REVLIST`" $@
    gdh3 $1;
}

function doc-review {
    if [ $# -lt 1 ]; then
        echo "Usage: doc-review rev-list reviewer ...";
        return;
    fi;
    REVLIST=$1^..$1;
    REVIEWER="erawlings";
    shift 2;
    rbt post --target-groups=docs --repository-url cloudera-ui --target-people="$REVIEWER" --diff-filename=<(git diff --full-index "$REVLIST") --summary="`git log --pretty=%s $REVLIST`" --description="`git log $REVLIST`" $@
    gdh3 $1;
}


function tui-review {
    if [ $# -lt 1 ]; then
        echo "Usage: ui-review rev-list reviewer ...";
        return;
    fi;
    REVLIST=$1^..$1;
    REVIEWER="hayro,jheyming";
    shift 2;
    rbt post --target-groups=thunderhead --repository-url thunderhead --target-people="$REVIEWER" --diff-filename=<(git diff --full-index "$REVLIST") --summary="`git log --pretty=%s $REVLIST`" --description="`git log $REVLIST`" $@
    gdh3 $1;
}


function lp-review {
    if [ $# -lt 1 ]; then
        echo "Usage: lp-review rev-list reviewer ...";
        return;
    fi;
    REVLIST=$1^..$1;
    REVIEWER="jheyming";
    shift 2;
    rbt post --target-groups=launchpad --repository-url launchpad --target-people="$REVIEWER" --diff-filename=<(git diff --full-index "$REVLIST") --summary="`git log --pretty=%s $REVLIST`" --description="`git log $REVLIST`" $@
    gdh3 $1;
}

function cm6-gerrit {
  if [ $# -lt 1 ]; then
    echo "Usage cm6-gerrit rev-list";
    return;
  fi;

  REVLIST=$1;

  git push cauldron $1:refs/for/cm6-6.x%ready
}


function cm6-gerrit-wip {
  if [ $# -lt 1 ]; then
    echo "Usage cm6-gerrit rev-list";
    return;
  fi;

  REVLIST=$1;

  git push cauldron $1:refs/for/cm6-6.x%wip
}

function cm7-gerrit-wip {
  if [ $# -lt 1 ]; then
    echo "Usage cm7-gerrit rev-list";
    return;
  fi;

  REVLIST=$1;

  git push cauldron $1:refs/for/cdpd-master%wip
}

function cm7-gerrit {
  if [ $# -lt 1 ]; then
    echo "Usage cm7-gerrit rev-list";
    return;
  fi;

  REVLIST=$1;

  git push cauldron $1:refs/for/cdpd-master%ready
}

unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]]; then
    export PATH=/usr/local/bin:/usr/local/mysql-5.5.39-osx10.6-x86_64/bin:/opt/local/bin:/opt/local/sbin:$PATH
    function gvim { /Applications/MacVim.app/Contents/MacOS/Vim -g $*; }
    function chrome-dev { /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  --enable-extension-timeline-api; }
fi

# export MAVEN_OPTS="-server -XX:PermSize=512m -XX:MaxPermSize=512m -Xmx3072m -Dcmf.schema.dir=$CMF_ROOT/libs/model/schema -Dcmf.log.dir=/var/log/cloudera-scm-server -Dcmf.log.file=cloudera-scm-server.log -Dcmf.root.logger=INFO,LOGFILE,CONSOLE -Dlog4j.configuration=file:$CMF_ROOT/web/src/main/resources/log4j.properties -Dpython.home=$CMF_ROOT/web/target/classes/python/ -DjavaVersion=1.8 -Dmaven.javadoc.skip=true -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000"
# -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=4000,suspend=n -DjavaVersion=1.7"
export LSCOLORS=Gxfxbxdxcxegedabagacad
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/

export LDFLAGS=-L/usr/local/opt/openssl/lib && export CPPFLAGS=-I/usr/local/opt/openssl/include

PATH="/usr/local/Cellar/vim/8.1.1700/bin/:/usr/local/Cellar/python/3.7.4/bin:/Library/TeX/texbin/:${PATH}"
export PATH

export PYTHONPATH=/usr/local/Cellar/python/3.7.4/site-packages

export NVM_DIR="/Users/andyao/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias python=/usr/local/bin/python3
