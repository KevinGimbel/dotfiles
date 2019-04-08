#!/bin/bash

__powerline_cwd_short_prompt() {
  result=${PWD##*/}
  echo "${result}|${CWD_THEME_PROMPT_COLOR}"
}

# Displays kubernetes context if $PS1_KUBECTL is set
__powerline_kubectl_context_prompt() {
  if [ ! -z "$PS1_KUBECTL" ]; then
    result="$(kubectl config current-context)"
    name="$(echo $result | awk -F'/' '{ print $2 }')"
    icon="${KUBECTL_PS1_ICON}"
    echo "${icon}${name}|${RUBY_THEME_PROMPT_COLOR}"
  fi
}
