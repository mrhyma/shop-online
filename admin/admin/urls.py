"""admin URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

# from .my_router import router_urlpatterns

from admin.products.views import (
    CategoryList,
    ProductByCategory,
    ProductList,
    ProductInventoryByWebId,
)
from admin.cart import views as cart

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/inventory/category/all/", CategoryList.as_view()),
    path(
        "api/inventory/products/category/<str:query>/",
        ProductByCategory.as_view(),
    ),
    path("api/products/", ProductList.as_view()),
    path("api/inventory/", ProductInventoryByWebId.as_view()),
    path("api/cart/",  cart.shopping_cart),
    path('api/cart/<int:pk>/', cart.item_in_cart),
    
]
# path(r"api/", include(router_urlpatterns))
    # path("api/search/<str:query>/", SearchProductInventory.as_view()),