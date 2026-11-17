function kc --wraps='kubectl config use-context' --description 'alias kubecontext=kubectl config use-context'
    if test (count $argv) -gt 0
        kubectl config use-context $argv[1]
        return
    end

    set -l context (kubectl config get-contexts -o name | string split \n | fzf)

    if test -n "$context"
        kubectl config use-context $context
    end    
end
