
from keras.layers.convolutional import Convolution2D
from keras.layers import Flatten, Activation, AveragePooling2D, BatchNormalization
from keras.models import Model
from keras.layers import Input

nb_classes = 10
input_img = Input(shape=(28,28,1))
#... (previous layers)
conv6 = Convolution2D(192, 3, strides=(2,2), padding='valid')(relu5)
## add bn2
bn2 = BatchNormalization()(conv6)
relu6 = Activation('relu')(bn2)
conv7 = Convolution2D(192, 3, padding='same')(relu6)
relu7 = Activation('relu')(conv7)
## replace fc to 1x1 convolution
conv8 = Convolution2D(192, 1, padding='valid')(relu7)
relu8 = Activation('relu')(conv8)

conv9 = Convolution2D(nb_classes, 1, padding='valid')(relu8)
relu9 = Activation('relu')(conv9)
## add global average pooling
# L'utilisation de AveragePooling2D (ou GlobalAveragePooling2D) est une mauvaise pratique, il faut utiliser maxpooling ou strided convolution superieure à 1
gap = AveragePooling2D(pool_size=(7,7))(relu9) # gap = MaxPooling2D(pool_size=(7,7))(relu9) est mieux.
flt = Flatten()(gap)
sftm = Activation('softmax')(flt)
model = Model(input=input_img, output=sftm)