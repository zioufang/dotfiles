# fzf dir jump
function jj {
    # CODE_DIR defined in zshrc
    prefix=$CODE_DIR
    # cd $(autojump -s | grep -v '^0.0' | grep $prefix | sed '1!G;h;$!d' | awk '{print $2}' | sed -e "s|^$prefix||" | fzf --height=20% --reverse | xargs -I % echo ${prefix}%)
    output=$(autojump -s | grep -v '^0.0' | grep $prefix | sed '1!G;h;$!d' | awk '{print $2}' | sed -e "s|^$prefix||" | fzf --height=30% --reverse)
    cd $prefix$output
}

# nvim into dir
function v {
if [ -z "$1" ]; then
    prefix=$CODE_DIR
    output=$(autojump -s | grep -v '^0.0' | grep $prefix | sed '1!G;h;$!d' | awk '{print $2}' | sed -e "s|^$prefix||" | fzf --height=30% --reverse)
    nvim $prefix$output
else
    nvim $1
fi
}

# bspc rename current ws
function ws {
    ws_current=$(bspc query -D -d focused --names);
    if [ -z "$1" ]; then
        ws_name=`echo $ws_current | cut -c1-1`;
    else
        ws_name=${ws_current}_$1;
    fi
    bspc desktop -n $ws_name
    echo "changing ws name to $ws_name"
}

# vscode
function c { if [[ $# -eq 1 ]]; then code "$1"; else code .; fi }

# immediate tmux after ssh
function ssht { /usr/bin/ssh -t $@ "tmux attach || tmux new"; }

# check dir for the mk functions
function checkdir {
    if [ -n "$1" ]; then
        if [ ! -d "$1" ]; then
            return 0
        else
            echo "project already exists"
        fi
    else
        echo "need an project name"
    fi
    return 1
}

# create dir strucutre for python
function mkpy {
    checkdir $1
    if [ $? = 0 ]; then
        mkdir -p "./$1/$1"
        touch "./$1/README.md"
        touch "./$1/requirements.txt"
        touch "./$1/.gitignore"
        touch "./$1/$1/__init__.py"
    fi
    return 0
}

# create dir strucutre for spark scala
function mkspark {
    checkdir $1
    if [ $? = 0 ]; then
        mkdir -p "./$1"
        touch "./$1/README.md"
        touch "./$1/.gitignore"
        # build.sbt for spark
        echo 'import scala.sys.process._

name := <TODO>

version := "0.1"

scalaVersion := "2.11.8"

val sparkVersion = "2.3.3"
val log4jVersion = "2.11.2"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % sparkVersion % "provided",
  "org.apache.spark" %% "spark-sql" % sparkVersion % "provided",
  "org.apache.logging.log4j" % "log4j-api" % log4jVersion % "provided",
  "org.apache.logging.log4j" % "log4j-core" % log4jVersion % "provided",
  "com.typesafe" % "config" % "1.3.3"
)


val deploy = taskKey[Unit]("Copy packaged JAR to remote server")

deploy := {
  val remoteServer = <TODO>
  val srcPath = <TODO>
  val remoteFile = <TODO>
  val remotePath = remoteServer + ":" + remoteFile
  val keyfile = <TODO>
  println(s"Copying: '$srcPath' to $remotePath")
  s"scp -i $keyfile $srcPath $remotePath" !
}
' > "./$1/build.sbt"

        # sbt-assembly plugin
        mkdir -p "./$1/project"
        echo  '\
    addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.9")
    ' > "./$1/project/assembly.sbt"

        # source code structure
        mkdir -p "./$1/src/main/resources"
        mkdir -p "./$1/src/main/scala"
        mkdir -p "./$1/src/test"
    fi

    return 0
}
