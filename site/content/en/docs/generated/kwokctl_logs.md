## kwokctl logs

Logs one of [audit, etcd, kube-apiserver, kube-controller-manager, kube-scheduler, kwok-controller, prometheus]

```
kwokctl logs [command] [flags]
```

### Options

```
  -f, --follow   Specify if the logs should be streamed
  -h, --help     help for logs
```

### Options inherited from parent commands

```
  -c, --config stringArray   config path (default [~/.kwok/kwok.yaml])
      --name string          cluster name (default "kwok")
  -v, --v int                number for the log level verbosity
```

### SEE ALSO

* [kwokctl](kwokctl.md)	 - kwokctl is a tool to streamline the creation and management of clusters, with nodes simulated by kwok
