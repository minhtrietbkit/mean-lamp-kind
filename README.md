## Deploy MEAN / LAMP Stack on KIND Cluster

### Steps

1. Create cluster
2. Deploy MEAN app or LAMP app
3. Stop app
4. Remove cluster

### 1. Create Cluster

```Bash
bash create-cluster.sh
```

You will now have a kind cluster with one node.

### 2. Deploy MEAN App or LAMP App

**MEAN APP**

_Note_: The MEAN app's source is [here](https://github.com/SinghDigamber/mean-stack-angular-7-crud-app-example). I simply changed it a bit to suit the purpose of this demo.

```Bash
bash start-app.sh mean
```

**LAMP APP**

_Note_: The LAMP app's source is [here](https://github.com/taniarascia/pdo). I simply changed it a bit to suit the purpose of this demo.

```Bash
bash start-app.sh lamp
```

### 3. Stop App

**MEAN APP**

```Bash
bash stop-app.sh mean
```

**LAMP APP**

```Bash
bash stop-app.sh lamp
```

### 4. Remove Cluster

```Bash
bash remove-cluster.sh
```
