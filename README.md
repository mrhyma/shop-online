# shop-online
# Project Description

This project is an Ecommerce Store will allow companies and individuals to buy and sell goods and services over the Internet. Ecommerce operates in four major market segments and can be conducted over computers, tablets, smartphones, and other smart devices. This project comprises
 a PostGresSQL DataBase ,a Django backend and a flutter frontent connected via API.


# to install the server
cd into admin folder then run: 
`docker-compose up` or 
`sudo docker-compose up` (only if you have problems starting it the first time)
`docker-compose run web python manage.py makemigrations`
`docker-compose run web python manage.py migrate`
`docker-compose run web python manage.py createsuperuser`

# to install the app

cd into my_app folder then run 
`flutter build apk --build-name='name of your app' --build-number='app version'`

or install the apk file that is in the apk folder to your
android device
