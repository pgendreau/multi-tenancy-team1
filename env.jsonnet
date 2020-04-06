local appgroup = std.extVar("appgroup");
local zone = std.extVar("zone");
local env = std.extVar("env");

local namespace = std.join('-', [appgroup, zone, env]);

local backend = import "workloads/backend/app.jsonnet";
local frontend = import "workloads/frontend/app.jsonnet";



{
  backend: backend.backend {
    deployment+: {
      metadata+: {
        namespace: namespace,
        labels+: {
          env: env,
          appgroup: appgroup,
          zone: zone,
        },
      },
    },
    service+: {
      metadata+: {
        namespace: namespace,
        labels+: {
          env: env,
          appgroup: appgroup,
          zone: zone,
        },
      },
    },
  },
  frontend: frontend.frontend {
    deployment+: {
      metadata+: {
        namespace: namespace,
        labels+: {
          env: env,
          appgroup: appgroup,
          zone: zone,
        },
      },
    },
    service+: {
      metadata+: {
        namespace: namespace,
        labels+: {
          env: env,
          appgroup: appgroup,
          zone: zone,
        },
      },
    },
  },
}
