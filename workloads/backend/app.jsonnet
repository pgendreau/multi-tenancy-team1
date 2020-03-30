local objects = import "../../jsonnet/templates/objects.libsonnet";

{
  backend: objects.app("backend") {
    deployment+: {
      spec+: {
        template+: {
          spec+: {
            containers_+: {
              podinfo+: {
                env_+: {
                  FOO: "boz",
                  TEST: "test",
                },
              },
            },
          },
        },
      },
    },
  },
}
