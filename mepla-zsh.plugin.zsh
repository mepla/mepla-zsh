######################## GIT ########################

alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gc='git commit -v'
alias gcm='git commit -v -m'
alias gca='git commit -v --no-edit --amend'

alias gco='git checkout'
alias gcl='git clone'

alias grh='git reset --hard'

alias gd='git diff'

alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"

alias gp='git pull'
alias gpu='git push'
alias gpuf='git push --force'

alias grv='git remote -v'

alias gs='git status -s'

export function gap() {
  gs || return 1
  read "cont?Are you sure? (y/N): " 
  [[ "$cont" == "y" ]] && echo && ga . && gca && gpuf
}

export function gcp() {
  gs || return 1

  echo  
  echo "Commit message: $1"
  echo

  read "cont?Are you sure? (y/N): " 
  if [[ $# == 1 ]]
    then
      [[ "$cont" == "y" ]] && echo && ga . && gcm "$1" && gpu
    else
      [[ "$cont" == "y" ]] && echo && ga . && gc && gpu
  fi
}

######################## FLUTTER #######################

alias fbr='flutter pub run build_runner build --delete-conflicting-outputs'


export function fcm() {
class_body="
import 'package:json_annotation/json_annotation.dart';
part '%FILENAME%.g.dart';

@JsonSerializable()
class %CLASSNAME%  {
  final String id;
  final String name;

  %CLASSNAME% ({this.id = "", this.name = ""});

  factory %CLASSNAME% .fromJson(Map<String, dynamic> json) => _$%CLASSNAME% FromJson(json);
  Map<String, dynamic> toJson() => _$%CLASSNAME% ToJson(this);
}
"

echo "$class_body" | sed -e "s/%FILENAME%/$1/g" | sed -e "s/%CLASSNAME% /$2/g" > $1.dart 
}
