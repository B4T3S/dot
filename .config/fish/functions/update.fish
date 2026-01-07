function update --description 'alias update sudo dnf update'
  sudo dnf update $argv
  brew upgrade
end
