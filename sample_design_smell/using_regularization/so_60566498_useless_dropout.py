import numpy as np;
import matplotlib.pyplot as plt;
import os;
import cv2;
import random;
import pickle;
import tensorflow as tf;
from tensorflow.keras.models import Sequential;
from tensorflow.keras.layers import Dense, Dropout, Activation, Flatten, Conv2D, MaxPooling2D, BatchNormalization;
from tensorflow.keras.callbacks import TensorBoard, ModelCheckpoint, EarlyStopping;
from tensorflow.keras.utils import to_categorical;
from sklearn.model_selection import train_test_split;
from sklearn.preprocessing import LabelEncoder;
from sklearn.preprocessing import OneHotEncoder;
from sklearn.metrics import ConfusionMatrixDisplay;
from sklearn.metrics import PrecisionRecallDisplay;


DATADIR = "CNN_Model_Rebuilt/data";
CATEGORIES = ["covid", "normal", "pneumonia"];
IMG_SIZE = 224;
training_data = [];
X = [];
y = [];
NAME   = "CNN_Model_Rebuilt";

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1)

model = Sequential()

# filters, kernel size, input size
model.add(Conv2D(256, (3, 3), input_shape=X.shape[1:], padding='same'))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2), strides=2))
model.add(Dropout(0.2))

model.add(Conv2D(256, (3, 3), padding='same'))
model.add(Dropout(0.2))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2), strides=2))

model.add(Conv2D(256, (3, 3), padding='same'))
model.add(Dropout(0.25))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2), strides=2))

model.add(Conv2D(256, (3, 3), padding='same'))
## Dropout aide à eviter l'overfitting, mais l'utiliser avant la couche de down sampling 
## (MaxPooling2D) est une mauvaise pratique, car cela contrebalance/neutralise son effet.
model.add(Dropout(0.25))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2), strides=2))

model.add(Flatten())
model.add(Dense(256))
model.add(BatchNormalization())
model.add(Activation('relu'))

model.add(Dropout(0.8))
model.add(Dense(3))
model.add(Activation('softmax'))

tensorboard = TensorBoard(log_dir="CNN_Model_Rebuilt/logs/{}".format(NAME))

augmented_checkpoint = ModelCheckpoint(
                'CNN_Model_Rebuilt/best model/normalization-best.h5',
                monitor='val_loss', verbose=0,
                save_best_only=True, mode='auto')

es = EarlyStopping(monitor='val_loss',
                   min_delta=0,
                   patience=20,
                   verbose=0, mode='auto')

model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])

model.fit(X_train, to_categorical(y_train), batch_size=32, epochs=100,
                      validation_data=(X_test, to_categorical(y_test)), 
                      callbacks=[augmented_checkpoint, tensorboard, es], verbose=2)