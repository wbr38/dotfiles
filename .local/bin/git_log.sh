#!/usr/bin/env bash

LF="%C(auto)"

# short hash
LF+="%h"

# subject
LF+=" "
LF+="%<(90,trunc)"
LF+="%s"

# author name
LF+=" "
LF+="%C(#666666)"
LF+="%<(16,trunc)"
LF+="%an"
LF+="%C(auto)"

# relative date
LF+=" "
LF+="%C(#569cd6)"
LF+="%<(14,trunc)"
LF+="%ar"
LF+="%C(auto)"

# ref names
LF+=" "
LF+="%D"

git log --pretty=format:"$LF"
