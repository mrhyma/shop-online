from .models import (
    Brand,
    Category,
    Img,
    Product,
    Stock,
    ProductInventory,
    ProductType,
)
from rest_framework import serializers


class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ("name")
        read_only = True

class ProductTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductType
        fields = ("name")
        read_only = True


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ("name", "slug",)
        read_only = True


class MediaSerializer(serializers.ModelSerializer):
    img_url = serializers.SerializerMethodField()

    class Meta:
        model = Img
        fields = ("img_url", "alt_text",)
        read_only = True
        editable = False

    def get_img_url(self, obj):
        return obj.img_url


class ProductSerializer(serializers.ModelSerializer):
    product_type = ProductTypeSerializer(read_only=True)
    category = CategorySerializer(read_only=True)
    brand = BrandSerializer(read_only=True)
    image = MediaSerializer(source="product_image", many=True, read_only=True)

    class Meta:
        model = Product
        fields = [
            "product_type",
            "category",
            "brand",
            "image",
            "name",
             "web_id",
             "slug",
             "description"
             ]
        read_only = True
        editable = False


class ProductInventorySerializer(serializers.ModelSerializer):
    product = ProductSerializer(many=False, read_only=True)
    


    class Meta:
        model = ProductInventory
        fields = (
            "id",
            "product",
            "brand",
            "store_price",
            "is_active",
            "sale_price",            
            "weight",
        )
        read_only = True


class ProductInventorySearchSerializer(serializers.ModelSerializer):

    product = ProductSerializer(many=False, read_only=True)
    

    class Meta:
        model = ProductInventory
        fields = (
            "id",
            "sku",
            "store_price",
            "is_default",
            "product",
        )


class StockSerializer(serializers.ModelSerializer):

    inventory = image = ProductInventorySearchSerializer(many=True, read_only=False)
    class Meta:
        model = Stock
        fields = (
            "inventory",
            "last_checked",
            "units",
            "units_sold",
            )
