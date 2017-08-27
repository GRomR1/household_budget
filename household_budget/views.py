from django.shortcuts import get_object_or_404, get_list_or_404, render
from django.http import HttpResponseRedirect, HttpResponse, Http404, JsonResponse
from django.views import generic
from django.utils import timezone
from datetime import datetime, date, time
from dateutil.tz import tzutc, tzlocal
import pytz
import json
from django.views.decorators.csrf import csrf_exempt
from django.utils.translation import ugettext_lazy as _
from django import forms 
from django.forms import ModelForm, DateField, SelectDateWidget
from django.contrib.auth import authenticate
from django.db.models import Q

from .models import  Kind, Estimate, Item




# def report(request):
    # user = authenticate(username='john', password='secret')
    # if user is not None:
    #     # the password verified for the user
    #     if user.is_active:
    #         print("User is valid, active and authenticated")
    #     else:
    #         print("The password is valid, but the account has been disabled!")
    # else:
    #     # the authentication system was unable to verify the username and password
    #     print("The username and password were incorrect.")
    # return HttpResponse("You're looking at index : %s." % request)



# def results(request, question_id):
#     question = get_list_or_404(Question)
#     return render(request, 'polls/results.html', {'question': question})

class ResultsView(generic.ListView):
    template_name = 'results.html'
    context_object_name = 'estimate_list'

    def get_queryset(self):
        print(type(Estimate.objects))
        print(Estimate.objects)
        return Estimate.objects

# def get_kind_set():
#     return Kind.objects.all()

# def get_kind_set_list():
#     return list(map(lambda k: k[0], get_kind_set().values_list('name')))

# def estimates(request):
#     estimate_list = get_list_or_404(Estimate.objects)
#     return render(request, 'results.html', {'estimate_list': estimate_list})

def items(request, idkind):
    if request.user.is_authenticated():
        # Do for authenticated users.
        # items_list = list(Item.objects.filter(kind_id=idkind, closing_date__isnull=True).values('id', 'name', 'plan'))
        items_list = list(Item.objects.filter(Q(closing_date__gte=timezone.now()) | Q(closing_date__isnull=True) , kind_id=idkind).values('id', 'name', 'plan'))
        if items_list:
            return JsonResponse({"status": 200, "statusText": "OK", "content": items_list})
        else:
            return JsonResponse({"status": 404, "statusText": "Not found", "content": []})
    else:
        # Do for anonymous users.
        return JsonResponse({"status": 502, "statusText": "Not authorized"})

class ArticlesOutlayView(generic.ListView):
    template_name = 'articles.html'
    context_object_name = 'articles_list'
 
    def get_queryset(self):
        id_kind = Kind.objects.filter(
            name=u'Расход'
        ).first().id
        items = get_list_or_404(Item, kind_id=id_kind) 
        return Item.objects.filter(
            kind_id=id_kind
        )

class ArticlesIncomeView(generic.ListView):
    template_name = 'articles.html'
    context_object_name = 'articles_list'
 
    def get_queryset(self):
        id_kind = Kind.objects.filter(
            name='Доход'
        ).first().id
        items = get_list_or_404(Item, kind_id=id_kind) 
        return Item.objects.filter(
            kind_id=id_kind
        )


class ItemForm(ModelForm):
    class Meta:
        model = Item
        fields = ('kind', 'name', 'plan' ,'closing_date')
        labels = {
            'name': _('Название статьи'),
            'plan': _('План, руб.'),
            'closing_date': _('Дата закрытия'),
            'kind': _(''),
        }
        widgets = {
            'kind': forms.Select(attrs={'required': True, 'class': 'form-control'}),
            'plan': forms.TextInput(attrs={'required': True, 'class': 'form-control'}),
            'name': forms.TextInput(attrs={'required': True, 'class': 'form-control'}),
            'closing_date': forms.DateTimeInput(
                attrs={'required': False, 'class': 'form-control', 'placeholder':"Не обязательно", 'id':'datetimepicker'}
                # , format='%d.%m.%Y'
                ),
        }
        error_messages = {
            'closing_date': {
                'invalid': _("Введите дату в правильном формате."),
            },
        }

def new_article(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = ItemForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            # print("form is valid")
            name = form.cleaned_data['name']
            kind = form.cleaned_data['kind']
            # kind_id = form.cleaned_data['kind_id']
            closing_date = form.cleaned_data['closing_date']
            # print(name, kind, closing_date, kind.__str__(), type(kind.__str__()))
            form.save()
            if kind.__str__() == "Доход":
                url = "/articles/income/"
            else:
                url = "/articles/outlay/"
            return HttpResponseRedirect(url)

    # if a GET (or any other method) we'll create a blank form
    else:
        form = ItemForm()

    return render(request, 'article_form.html', {'form': form})

def item(request, iditem):
    # print("item(request, iditem):")
    if request.user.is_authenticated():
        if request.method == 'POST':
            cdate=request.POST.get('closing_date','') #21.08.2017
            # print("dt {} iid {}".format(cdate, iditem))
            datetime.strptime(cdate, "%d.%m.%Y").date()
            if cdate and iditem:
                item = get_object_or_404(Item, pk=iditem)
                item.closing_date = datetime.strptime(cdate, "%d.%m.%Y").date()
                item.save() # TODO: need try ecept
                # print("id {}".format(item.id)) 
                return JsonResponse({"status": 200, "statusText": "OK", "content": {"id": item.id, "closing_date": cdate}})
            else:
                return JsonResponse({"status": 502, "statusText": "Bad data"})
        else:
            return JsonResponse({"status": 404, "statusText": "Not found"})
    else:
        # Do for anonymous users.
        return JsonResponse({"status": 502, "statusText": "Not authorized"})

def new():
    return

@csrf_exempt
def estimate(request, idestimate=None):
    if request.user.is_authenticated():
        # Do for authenticated users.
        if request.method == 'DELETE':
            # del object
            try:
                e = Estimate.objects.get(pk=idestimate)
            except:
                return JsonResponse({"status": 502, "statusText": "Some error occured"})
            else:
                e.delete()
                return JsonResponse({"status": 200, "statusText": "OK", "content": idestimate})
        else:
            return JsonResponse({"status": 404, "statusText": "Not found"})
    else:
        # Do for anonymous users.
        return JsonResponse({"status": 502, "statusText": "Not authorized"})

def estimate_new(request, idestimate=None):
    if request.user.is_authenticated():
        if request.method == 'POST':
            dtime=request.POST.get('datetime','') #21.08.2017 17:07
            item_id=request.POST.get('item_id','')
            value=request.POST.get('value','')
            # print("dt {} iid {} v {}".format(dtime, item_id, value))
            if dtime and item_id and value:
                dtime=pytz.timezone('Asia/Yekaterinburg').localize(datetime.strptime(dtime, "%d.%m.%Y %H:%M"))
                try:
                    e = Estimate(date=dtime, item_id=item_id, value=value)
                except (KeyError, Item.DoesNotExist):
                    # Redisplay the question voting form.
                    return JsonResponse({"status": 502, "statusText": "Bad data"})
                else:
                    e.save()
                    # print("eid {}".format(e.id)) 
                    return JsonResponse({"status": 200, "statusText": "OK", "content": e.id})
            else:
                return JsonResponse({"status": 502, "statusText": "Bad data"})
        else:
            return JsonResponse({"status": 404, "statusText": "Not found"})
    else:
        # Do for anonymous users.
        return JsonResponse({"status": 502, "statusText": "Not authorized"})


@csrf_exempt
def report_result(request):
    kind_list = list(Kind.objects.all().values('name', 'id'))
    start_date=None
    end_date=None
    try:
        if request.method == 'GET': 
            start_date=request.GET.get('start_date','') #21.08.2017 17:07
            end_date=request.GET.get('end_date','')
            if len(start_date) == 0 or len(end_date) == 0:
                estimates = get_list_or_404(Estimate.objects.order_by('date'))
            else:
                # print("ss {} ee {}".format(start_date, end_date))
                ds = pytz.timezone('Asia/Yekaterinburg').localize(datetime.strptime(start_date, "%d.%m.%Y %H:%M"))
                de = pytz.timezone('Asia/Yekaterinburg').localize(datetime.strptime(end_date, "%d.%m.%Y %H:%M"))
                # print("ds {} de {}".format(ds, de))
            # if ds and de:
                # print("run search")
                estimates = get_list_or_404(Estimate.objects.filter( date__gte=ds, date__lt=de).order_by('date'))
            # else:
                # estimates = get_list_or_404(Estimate.objects.order_by('date'))
            return render(request, 'report_res.html', {'estimate_list': estimates, 'ds': start_date, 'de': end_date, 'kind_list': kind_list})
        else:
            estimates = get_list_or_404(Estimate.objects.order_by('date'))
            return render(request, 'report_res.html', {'estimate_list': estimates, 'kind_list': kind_list})
    except Http404:
        return render(request, 'report_res.html', {'estimate_list': [], 'ds': start_date, 'de': end_date, 'kind_list': kind_list})
    except ValueError:
        return render(request, 'report_res.html', {'estimate_list': [], 'ds': start_date, 'de': end_date, 'kind_list': kind_list})
