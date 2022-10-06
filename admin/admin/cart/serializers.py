from admin.products.serializers import ProductSerializer
from .models import (
    Customer,
    Order,
    OrderItem,
    ShippingAddress
)
from rest_framework import serializers


class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = (
            "user",
            "name",
            "email",
            )
        read_only = True


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = (
            "customer",
            "date_ordered",
            "transaction_id"
            )
        read_only = True


class OrderItemSerializer(serializers.ModelSerializer):
    product = ProductSerializer(many=True, read_only=True)
    order = OrderSerializer(many=False, read_only=True)
    class Meta:
        model = OrderItem
        fields = (
            "product",
            "order",
            "quantity",
            "date_added", 
            )
        read_only = True


class ShippingAddressSerializer(serializers.ModelSerializer):
    customer = CustomerSerializer(many=False)
    order = OrderSerializer(many=False, read_only=True)
    class Meta:
        model = ShippingAddress
        fields = (
            "address",
            "city",
            "state",
            "zipcode",
            "date_added"
        )
        read_only = True