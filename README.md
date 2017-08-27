# household_budget

This simple project is based on [Django framework](https://www.djangoproject.com/) and is used to manage and planning budget of a family. It demonstrates some features of the framework such as authorization function, store data in DB, asynchronous requests with jQuery, dynamic forms with Bootstrap CSS and etc.

![MainScreen](images/main.png)

Web interface of the project has been translated only to Russian.

Russian description of it available in [README.txt](README.txt).  

## Getting Started

### Configure database access

The project uses MySQL database. Tests and deployment it will become easy with [PythonAnywhere](https://pythonanywhere.com) service. 
View [official](https://help.pythonanywhere.com/pages/) docs about these processes for addition information.
If you want to use your local DB instance or SQLite database, you should find in [settings.py](household_budget/settings.py) file next strings:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'GRomR1$household_budget',
        'USER': 'GRomR1',
        'PASSWORD': 'passw0rd',
        'HOST': 'GRomR1.mysql.pythonanywhere-services.com'
    }
}
```

Edit this to correct config data about your host, username and etc. Or use SQLite:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

## How do I run this project locally?

### 1. Install required packets:

	pip install -r requirements.txt

### 2. Clone the repository:

    git clone https://github.com/GRomR1/household_budget.git

### 3. Tell Django that you’ve new models:

    python manage.py makemigrations
	
### 4. Run migrations:

    python manage.py migrate
	
### 5. Load minimal data:

    python manage.py loaddata dump\dump_min

### 6. Create a user:

    python manage.py createsuperuser

### 7. Run the server:

    python manage.py runserver

### 8. And open [127.0.0.1:8000](http://127.0.0.1:8000) in your web browser.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details