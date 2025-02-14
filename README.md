# BHGHInfrastructure

Infrastructure for BHGH project.

## Structure: 

├── README.md
├── access
├── bhghservice
│   ├── main.tf
│   └── variables.tf
├── common
├── modules
│   ├── app-service-linux
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── app-service-win
│   │   ├── main.tf
│   │   └── variables.tf
│   └── storage-account-ui
│       ├── main.tf
│       └── variables.tf
└── shared

## Components: 

### Shared 

`shared` contains infrastructure shared across environment, splitted as non-prod and prod. It contains: app insights, service bus, APIM instance, Front Door (?)

### Common 

`common` is environment specific infrastructure that is shared betwee microservices, but needs to be separated per environment

### Access
############################# make sure that makes sense to separate it out from common ###########################

`access` has all details related to MI and RBAC (it can be app to app but it can be user to app)

### APPS 

APIs includedi in this Infrastructure: 
-  `bhghservice`


## How to run: 

