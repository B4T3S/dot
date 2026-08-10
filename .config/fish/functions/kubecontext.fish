function kubecontext --wraps='kubectl config use-context' --description 'alias kubecontext=kubectl config use-context'
    kubectl config use-context $argv
end
