package cis_1_2_21
import future.keywords.in
import future.keywords.every

violation[msg]{
    input.metadata.labels.component == "kube-apiserver"
    some container in input.spec.containers
    every name in container.command {
        name != "--profiling=false"
    }
    msg = sprintf("%v Ensure that the --profiling argument is set to false (Automated)",[container.name])

}
