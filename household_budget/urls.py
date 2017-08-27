"""household_budget URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.views.generic.base import TemplateView

from . import views


app_name = 'household_budget'
urlpatterns = [
    url(r'^$', TemplateView.as_view(template_name='home.html'), name='home'),
    url(r'^admin/', admin.site.urls),
    # url(r'^login/$', auth_views.login, name='login'),
    url(r'^login/$', auth_views.login, {'template_name': 'login.html'}, name='login'),
    url(r'^logout/$', auth_views.logout, {'template_name': 'logged_out.html'}, name='logout'),
    url(r'^contacts/$', TemplateView.as_view(template_name='contacts.html'), name='contacts'),
    # url(r'^results/$', views.ResultsView.as_view(), name='results'),
    # url(r'^estimates/$', views.estimates, name='estimates'),
    url(r'^report/$', TemplateView.as_view(template_name='report.html'), name='report'),
    url(r'^report_result/$', views.report_result, name='report_result'),
    url(r'^article/form/$', views.new_article, name='new_article'),
    url(r'^articles/outlay/$', views.ArticlesOutlayView.as_view(), name='outlays'),
    url(r'^articles/income/$', views.ArticlesIncomeView.as_view(), name='incomes'),

    url(r'^api/items/(?P<idkind>[0-9]+)/$', views.items, name='items'), #get all items whith selected <idkind> [REST API: GET]
    url(r'^api/estimate/(?P<idestimate>[0-9]+)/$', views.estimate, name='estimate'), #delete selected estimate (when onDelete is called) [REST API: DELETE]
    url(r'^api/item/(?P<iditem>[0-9]+)/$', views.item, name='item'), #change closing date for the item with <iditem> (when onClose is called) [REST API: POST]
    url(r'^api/estimate/new/$', views.estimate_new, name='estimate_new'), #add new estimate after form is submitted 
]
