# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class TblAccess(models.Model):
    num_access = models.AutoField(primary_key=True)
    access = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'tbl_access'


class TblAction(models.Model):
    num_action = models.AutoField(primary_key=True)
    action_name = models.CharField(unique=True, max_length=20)

    class Meta:
        managed = False
        db_table = 'tbl_action'


class TblAuth(models.Model):
    num_auth = models.AutoField(primary_key=True)
    num_user = models.OneToOneField('TblUser', models.DO_NOTHING, db_column='num_user')
    num_rol = models.ForeignKey('TblRol', models.DO_NOTHING, db_column='num_rol')

    class Meta:
        managed = False
        db_table = 'tbl_auth'


class TblAuthLogin(models.Model):
    num_login = models.AutoField(primary_key=True)
    num_user = models.OneToOneField('TblUser', models.DO_NOTHING, db_column='num_user')
    name_user = models.CharField(max_length=16)
    password_user = models.CharField(max_length=255)
    date_login = models.DateField()
    last_date_login = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_auth_login'


class TblAuthor(models.Model):
    num_author = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    birthdate = models.DateField()
    nationality = models.CharField(max_length=120)
    gender_author = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_author'


class TblBook(models.Model):
    num_book = models.AutoField(primary_key=True)
    title_book = models.CharField(max_length=40)
    gender = models.ForeignKey('TblCategory', models.DO_NOTHING, db_column='gender')
    author = models.ForeignKey(TblAuthor, models.DO_NOTHING, db_column='author')
    edition_book = models.CharField(max_length=8)
    publication_date = models.DateField()
    editorial = models.ForeignKey('TblEditorial', models.DO_NOTHING, db_column='editorial')
    descriptions = models.CharField(max_length=255, db_collation='utf8mb3_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_book'


class TblBooking(models.Model):
    num_booking = models.AutoField(primary_key=True)
    num_book = models.ForeignKey(TblBook, models.DO_NOTHING, db_column='num_book')
    num_user = models.ForeignKey('TblUser', models.DO_NOTHING, db_column='num_user')
    date_booking = models.DateField()

    class Meta:
        managed = False
        db_table = 'tbl_booking'


class TblCategory(models.Model):
    num_category = models.AutoField(primary_key=True)
    gender = models.CharField(unique=True, max_length=40)

    class Meta:
        managed = False
        db_table = 'tbl_category'


class TblEditorial(models.Model):
    num_editorial = models.AutoField(primary_key=True)
    name_editorial = models.CharField(max_length=40)
    address_editorial = models.CharField(max_length=255)
    email_editorial = models.CharField(max_length=255, blank=True, null=True)
    phone_number = models.CharField(max_length=16, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tbl_editorial'


class TblLoan(models.Model):
    num_loan = models.AutoField(primary_key=True)
    num_book = models.ForeignKey(TblBook, models.DO_NOTHING, db_column='num_book')
    num_user = models.ForeignKey('TblUser', models.DO_NOTHING, db_column='num_user')
    loan_date = models.DateField()
    expected_return_date = models.DateField()
    actual_return_date = models.DateField()
    access = models.ForeignKey(TblAccess, models.DO_NOTHING, db_column='access')

    class Meta:
        managed = False
        db_table = 'tbl_loan'


class TblPermission(models.Model):
    num_permission = models.AutoField(primary_key=True)
    num_rol = models.ForeignKey('TblRol', models.DO_NOTHING, db_column='num_rol')
    num_resource = models.ForeignKey('TblResource', models.DO_NOTHING, db_column='num_resource')
    num_action = models.ForeignKey(TblAction, models.DO_NOTHING, db_column='num_action')

    class Meta:
        managed = False
        db_table = 'tbl_permission'


class TblResource(models.Model):
    num_resource = models.AutoField(primary_key=True)
    resource_name = models.CharField(unique=True, max_length=40)

    class Meta:
        managed = False
        db_table = 'tbl_resource'


class TblReviews(models.Model):
    num_reviews = models.AutoField(primary_key=True)
    num_user = models.ForeignKey('TblUser', models.DO_NOTHING, db_column='num_user')
    num_book = models.ForeignKey(TblBook, models.DO_NOTHING, db_column='num_book')
    reviews = models.CharField(max_length=255, blank=True, null=True)
    score = models.FloatField()

    class Meta:
        managed = False
        db_table = 'tbl_reviews'


class TblRol(models.Model):
    num_rol = models.AutoField(primary_key=True)
    name_rol = models.CharField(unique=True, max_length=40)

    class Meta:
        managed = False
        db_table = 'tbl_rol'


class TblUser(models.Model):
    num_user = models.AutoField(primary_key=True)
    user_card = models.CharField(unique=True, max_length=12)
    first_name = models.CharField(max_length=80)
    last_name = models.CharField(max_length=80)
    address_user = models.CharField(max_length=255)
    cell_phone = models.CharField(max_length=20)
    email_user = models.CharField(unique=True, max_length=255)

    class Meta:
        managed = False
        db_table = 'tbl_user'
