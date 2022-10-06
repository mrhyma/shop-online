from django import forms
from django.contrib import admin

from .models import (
    Brand,
    Category,
    Img,
    Product,
    Stock,
    ProductInventory,
    ProductType,
)


admin.site.register(Category)
admin.site.register(Brand)
admin.site.register(Stock)
admin.site.register(ProductInventory)



class ProductImageInline(admin.TabularInline):
    model = Img    

class BrandInline(admin.TabularInline):
    model = Brand

class ProductTypeInline(admin.TabularInline):
    model = ProductType


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    inlines = [
        BrandInline,
        ProductTypeInline,
        ProductImageInline
    ]
