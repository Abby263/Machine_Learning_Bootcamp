
# coding: utf-8

# In[ ]:


#Load libraries
import os
import pandas as pd
import numpy as np
from sklearn.cross_validation import train_test_split


# In[ ]:


#Set working directory
os.chdir("E:\Others\Edwisor\ContentRevamp\MarketingCampaign")


# In[ ]:


#Load data
df = pd.read_csv("df.csv")


# In[ ]:


#Divide data into train and test
train, test = train_test_split(df, test_size=0.2)





# ## Linear Regression

# In[ ]:


#Import libraries for LR
import statsmodels.api as sm

# Train the model using the training sets
model = sm.OLS(train.iloc[:,9], train.iloc[:,0:9]).fit()


# In[ ]:


# Print out the statistics
model.summary()


# In[ ]:


# make the predictions by the model
predictions_LR = model.predict(test.iloc[:,0:9]) 


# In[ ]:

#Calculate MAPE
def MAPE(y_true, y_pred): 
    mape = np.mean(np.abs((y_true - y_pred) / y_true))*100
    return mape
#Calculate MAPE
MAPE(test.iloc[:,9], predictions_LR)


# In[ ]:


#Error = 19.06

