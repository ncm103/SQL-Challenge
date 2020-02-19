#!/usr/bin/env python
# coding: utf-8

# In[1]:


#Create connection to SQLalchemy
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine


# In[2]:


#Create engine
postgresStr = ("postgresql://postgres:password@localhost:5432/SQL-Challenge")
engine = create_engine(postgresStr)

