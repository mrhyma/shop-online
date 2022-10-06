from django.shortcuts import render
from .serializers import (
    CategorySerializer,
    ProductInventorySerializer,
    ProductSerializer,
    MediaSerializer,
)
from .models import Category, Product, ProductInventory, Img
from rest_framework.response import Response
from rest_framework.views import APIView


class CategoryList(APIView):
    """
    Return list of all categories
    """

    def get(self, request):
        queryset = Category.objects.all()
        serializer = CategorySerializer(queryset, many=True)
        return Response(serializer.data)

class ProductList(APIView):
    """
    Return list of products
    """

    def get(self, request, query=None):
        queryset = Product.objects.all()
        serializer = ProductSerializer(queryset, many=True)
        return Response(serializer.data)

class ProductByCategory(APIView):
    """
    Return product by category
    """

    def get(self, request, query=None):
        queryset = Product.objects.filter(category__slug=query)
        serializer = ProductSerializer(queryset, many=True)
        return Response(serializer.data)


class ImageFromAProduct(APIView):
    """
    Return product by category
    """

    def get(self, request, query=None):
        queryset = Img.objects.filter(category__slug=query)
        serializer = MediaSerializer(queryset, many=True)
        return Response(serializer.data)


class ProductInventoryByWebId(APIView):
    """
    Return Sub Product by WebId
    """

    def get(self, request, query=None):
        queryset = ProductInventory.objects.all()
        serializer = ProductInventorySerializer(queryset, many=True)
        return Response(serializer.data)
