# Laravel-web-app v3.0

- Este proyecto pretende para verificar como hacer el ci/cd de una webapp 

- para correr directo `php artisan serve`

- ciclo para ci/cd con Docker
```
docker build -t laravel-web-app .
docker run --rm -d -p 80:80 --hostname testing.com --name laravel-web-app laravel-web-app 
curl http://localhost\?code=OK
docker container logs laravel-web-app | grep "code=OK"
docker container stop laravel-web-app
docker image rm laravel-web-app
```

# Problem in working v3.0
    - [x] created a branch to develop in AWS
    - [x] test Gravitron instance creation
    - [ ] test deploy from github action to EC2 instance 🚧
        - Requiere crear un security-group y un VPC para acceder desde github por ssh 
        - Esto funciono ok en MM con SG y VPC ya creada, pero me esta haciendo sudar (e incrementando costo)
            - De manera que lo voy a dejar en suspenso un rato


## Log
- 4.0 Version starting testing automation with Cypress 
- 3.0 Version deploy in EC2 via AWS CLI
- 2.0 Version docker in github actions 
- 1.0 Version docker local