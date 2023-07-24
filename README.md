This is a setup for demo-application along with Jaeger to run on Minikube:

- Start minikube with 

```
minikube start 
```

- In the current directory apply all the files to deploy setup:

```
kubectl apply -f kubernetes-resources    
```

- Portforward jaeger

```
kubectl port-forward svc/jaeger 16686:16686
```

- You can access the application at 

```
http://192.168.49.2:30080/api/v1/names/random
```

- To watch the dependencies:
```
http://localhost:16686/api/dependencies?endTs=1690189974936&lookback=604800000
```

*endTs*=1690189974936

*Value*: 1690189974936
Unit: This value represents a timestamp in milliseconds since January 1, 1970 (Unix timestamp in milliseconds).

*lookback*=604800000

*Value*: 604800000
Unit: This value represents a duration in milliseconds. The lookback parameter is used to specify the time range for which the dependencies graph will be fetched. In this case, the value 604800000 corresponds to a lookback period of 604,800,000 milliseconds, which is equivalent to 7 days.