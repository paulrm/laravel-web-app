# Laravel-web-app

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