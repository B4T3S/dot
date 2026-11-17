function kube-shell --description 'opens a shell into any pod'
    set -l namespace (kubectl get namespaces -o=jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' | string split \n | fzf)
    if test -z "$namespace"
       echo "No namespace selected! Aborting!"
       return 1
    end

    set -l pod (kubectl get pods -n $namespace -o=jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' | string split \n | fzf)

    if test -z "$pod"
        echo "No pod selected! Aborting!"
        return 1
    end

    set -l target_shell (echo "auto bash sh" | string split " " | fzf)

    # Try specifically with the shell the user requested.
    if test $target_shell != "auto"
        kubectl exec -n $namespace -it $pod -- $target_shell
    end

    # If the user picked "auto", automatically determine if bash exists. Otherwise fall back to sh
    if kubectl exec -n $namespace $pod -- which bash >/dev/null 2>&1
        kubectl exec -n $namespace -it $pod -- bash
    else
        kubectl exec -n $namespace -it $pod -- sh
    end
end
