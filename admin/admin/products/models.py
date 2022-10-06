from django.db import models
# TODO for language selection 
from django.utils.translation import gettext_lazy as _


class Category(models.Model):
    """
    Inventory Category table
    """

    name = models.CharField(
        max_length=100,
        unique=True,
        blank=False,
        verbose_name=_("category name"),
    )
    slug = models.SlugField(
        max_length=150,
        unique=True,
        blank=False,
        verbose_name=_("slug"),
       
    )
    is_active = models.BooleanField(
        default=False,
    )


    class Meta:
        verbose_name = _("product category")
        verbose_name_plural = _("product categories")

    def __str__(self):
        return self.name




class Product(models.Model):
    """
    Product details table
    """

    web_id = models.CharField(
        max_length=50,
        unique=True,
        blank=False,
        verbose_name=_("product website ID"),
    )
    slug = models.SlugField(
        max_length=255,
        unique=True,
        blank=False,
        verbose_name=_("slug"),
       
    )
    name = models.CharField(
        max_length=255,
        unique=True,
        blank=False,
        verbose_name=_("product name"),
    )
    description = models.TextField(
        unique=False,
        blank=False,
        verbose_name=_("product description"),
    )
    category = models.ForeignKey(
        Category,
        on_delete=models.PROTECT,
        related_name="category",
    )
    is_active = models.BooleanField(
        verbose_name=_("product visibility"),
    )
    created_at = models.DateTimeField(
        auto_now_add=True,
        editable=False,
        verbose_name=_("date product created"),
    )
    updated_at = models.DateTimeField(
        auto_now=True,
        verbose_name=_("date product last updated"),
    )

    def __str__(self):
        return self.name


class ProductType(models.Model):
    """
    Product type table
    """

    the_product = models.ForeignKey(
        Product,
        on_delete=models.PROTECT,
        related_name="the_product",
    )

    name = models.CharField(
        max_length=255,
        unique=True,
        blank=False,
        verbose_name=_("type of product"),
    )

    def __str__(self):
        return self.name


class Brand(models.Model):
    """
    Product brand table
    """

    name = models.CharField(
        max_length=255,
        unique=True,
        blank=False,
        verbose_name=_("brand name"),
    )

    product = models.ForeignKey(
        Product, related_name="product_brand", on_delete=models.PROTECT
    )

    def __str__(self):
        return self.name


class Stock(models.Model):
    
    last_checked = models.DateTimeField(
        unique=False,
        verbose_name=_("inventory stock check date"),
    )
    units = models.IntegerField(
        default=0,
        verbose_name=_("units/qty of stock"),
    )
    units_sold = models.IntegerField(
        default=0,
        verbose_name=_("units sold to date"),
    )

    def __str__(self):
        return str(self.product_inventory)



class ProductInventory(models.Model):
    """
    Product inventory table
    """
    stock = models.OneToOneField(
        Stock,
        related_name="product_inventory",
        on_delete=models.PROTECT,
    )
   
    product = models.ForeignKey(
        Product, related_name="product", on_delete=models.PROTECT
    )
   
    is_active = models.BooleanField(
        default=True,
        verbose_name=_("product visibility"),
    )
    
    store_price = models.DecimalField(
        max_digits=5,
        decimal_places=2,
        unique=False,
        blank=False,
        verbose_name=_("regular store price"),
        error_messages={
            "name": {
                "max_length": _("the price must be between 0 and 999.99."),
            },
        },
    )
    sale_price = models.DecimalField(
        max_digits=5,
        decimal_places=2,
        unique=False,
        blank=False,
        verbose_name=_("sale price"),
        error_messages={
            "name": {
                "max_length": _("the price must be between 0 and 999.99."),
            },
        },
    )
    weight = models.FloatField(
        unique=False,
        null=False,
        blank=False,
        verbose_name=_("product weight"),
    )
    created_at = models.DateTimeField(
        auto_now_add=True,
        editable=False,
        verbose_name=_("date sub-product created"),
        help_text=_("format: Y-m-d H:M:S"),
    )
    updated_at = models.DateTimeField(
        auto_now=True,
        verbose_name=_("date sub-product updated"),
        help_text=_("format: Y-m-d H:M:S"),
    )

    def __str__(self):
        return self.product.name


class Img(models.Model):
    """
    The product image table.
    """
 
    product = models.ForeignKey(
        Product, related_name="product_image", on_delete=models.PROTECT
    )  

    img_url = models.CharField(
        max_length=255,
        unique=False,
        null=False,
        blank=False,
        verbose_name=_("image url"),
    )
    alt_text = models.CharField(
        max_length=255,
        unique=False,
        null=False,
        blank=False,
        verbose_name=_("alternative text"),
        help_text=_("format: required, max-255"),
    )
    is_feature = models.BooleanField(
        default=False,
        verbose_name=_("product default image"),
        help_text=_("format: default=false, true=default image"),
    )
    created_at = models.DateTimeField(
        auto_now_add=True,
        editable=False,
        verbose_name=_("product visibility"),
        help_text=_("format: Y-m-d H:M:S"),
    )
    updated_at = models.DateTimeField(
        auto_now=True,
        verbose_name=_("date sub-product created"),
        help_text=_("format: Y-m-d H:M:S"),
    )
        

    class Meta:
        verbose_name = _("product image")
        verbose_name_plural = _("product images")
