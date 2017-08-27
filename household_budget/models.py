import datetime
from django.db import models
from django.utils import timezone

class Kind(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class Item(models.Model):
    name = models.CharField(max_length=200)
    plan = models.IntegerField(default=0)
    closing_date = models.DateField('Сlosing date', null=True, blank=True)
    kind = models.ForeignKey(Kind, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
        
class Estimate(models.Model):
    date = models.DateTimeField('Date')
    value = models.IntegerField(default=0)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)

    def __str__(self):
        return "{}:{}".format(self.item.name, self.value)

