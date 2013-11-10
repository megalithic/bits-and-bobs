# # rehash shims
# rvm rehash 2>/dev/null

# # shell thing
# rvm() {
#   command="$1"
#   if [ "$#" -gt 0 ]; then
#     shift
#   fi

#   case "$command" in
#   shell)
#     eval `rvm "sh-$command" "$@"`;;
#   *)
#     command rvm "$command" "$@";;
#   esac
# }
