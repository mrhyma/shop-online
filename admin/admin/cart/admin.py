from django.contrib import admin

from .models import (
    Customer,
    Order,
    OrderItem,
    ShippingAddress,    
)


class OrderInline(admin.TabularInline):
    model = Order

class ShippingAddressInline(admin.TabularInline):
    model = ShippingAddress

class OrderItemInline(admin.TabularInline):
    model = OrderItem


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    inlines = [
        OrderItemInline
    ]


@admin.register(Customer)
class ProductAdmin(admin.ModelAdmin):
    inlines = [
        OrderInline,
        ShippingAddressInline

    ]
