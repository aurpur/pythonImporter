from keras.models import Sequential
from keras.layers import Dense
from keras.layers.convolutional import Convolution2D
from keras.layers.convolutional import MaxPooling2D

input_img_shape = (1, 28, 28)
model = Sequential()

#C1
# devrait être par exemple: model.add(Convolution2D(15, 3, 3, activation='relu', border_mode='same', input_shape=input_img_shape))
#Toujour commencer par le nombre de filtres spatial le plus petit
model.add(Convolution2D(15, 7, 7,
activation='relu',
border_mode='same',
input_shape=input_img_shape))
print("C1 shape: ", model.output_shape)

#S2
model.add(MaxPooling2D((2,2), border_mode='same'))
print("S2 shape: ", model.output_shape)
#...

#C5
model.add(Convolution2D(250, 5, 5, 
activation='relu', 
border_mode='same'))
print("C5 shape: ", model.output_shape)

#F6
model.add(Dense(50))