function kube-logs --description 'shows logs of any running pod'
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

    kubectl logs -n $namespace $pod --tail=50 --follow
end
