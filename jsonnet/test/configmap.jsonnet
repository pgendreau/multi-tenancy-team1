local kube = import "../lib/kube.libsonnet";

{
  configmap: kube.ConfigMap("test") {
    data: {
      "foo": "bar"
    }
  }
}
