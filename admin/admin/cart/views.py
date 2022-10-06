from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from admin.products.serializers import ProductSerializer

from .models import Order, OrderItem

from .serializers import (
    OrderSerializer,
    OrderItemSerializer
)



@api_view(['GET', 'POST'])
def shopping_cart(request):
    """
    List all code snippets, or create a new snippet.
    """
    
    if request.method == 'GET':
        querySet = Order.objects.all()
        serializer = OrderSerializer(querySet, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = ProductSerializer(data=request.data)
        print(f"in the view {serializer}")
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



@api_view(['GET', 'PUT', 'DELETE'])
def item_in_cart(request, pk):
    """
    Retrieve, update or delete a code snippet.
    """
    try:
        item = Order.objects.get(pk=pk)
    except item.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = OrderSerializer(item)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = OrderSerializer(item, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        item.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
