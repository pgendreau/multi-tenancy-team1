local objects = import "../../jsonnet/templates/objects.libsonnet";

{
  frontend: objects.app("frontend") {
    deployment+: {
      spec+: {
        template+: {
          spec+: {
            containers_+: {
              podinfo+: {
                env_+: {
                  FOO: "bar",
                },
                args_+: {
                  'backend-url': 'http://backend:9898/echo',
                },
              },
            },
          },
        },
      },
    },
  },
}
