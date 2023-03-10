import framelib
import numpy as np
import matplotlib.pyplot as plt
class frame2D:
    def __init__(self):
        self.center=np.array([0,0])
        self.x_axis=np.array([1,0])
        self.y_axis=np.array([0,1])
        self.angle=0
    def show(self,ax,label,size,color):
        framelib.frame_show_angle_center(label,self.center,self.angle,ax,size)