import numpy as np
import matplotlib.pyplot as plt


def frame_show(label, Point_A, Point_B, ax, size):
    R90 = np.array([[0, -1], [1, 0]])
    Line_AB = Point_B - Point_A
    norm_Line_AB = np.linalg.norm(Line_AB)
    if norm_Line_AB != 1:
        Line_AB = Line_AB / norm_Line_AB * size
    ax.arrow(Point_A[0], Point_A[1], Line_AB[0], Line_AB[1], head_width=0.5, length_includes_head=True, color="red")
    R90 = np.array([[0, -1], [1, 0]])  # 旋转公式
    Line_AB_Rot90 = R90.dot(Line_AB)  # 点乘
    ax.arrow(Point_A[0], Point_A[1], Line_AB_Rot90[0], Line_AB_Rot90[1], head_width=0.5, length_includes_head=True,
             color="green")
    plt.scatter(Point_A[0], Point_A[1])
    label = "{" + str(label) + "}"
    plt.text(Point_A[0], Point_A[1], label)


def Rot_func(angle):
    angle = np.deg2rad(angle)
    R90 = np.array([[0, -1], [1, 0]])
    elem_sim = lambda elem: np.around(elem, 0) if (elem - np.around(elem, 0)) < 1e-10 else elem
    A11 = elem_sim(np.cos(angle))
    A12 = elem_sim(-np.sin(angle))
    A21 = elem_sim(np.sin(angle))
    A22 = A11
    Rot = np.array([[A11, A12], [A21, A22]])
    return Rot


def frame_show_angle_center(label, center, angle, ax, size):
    Rot = Rot_func(angle)
    x = np.array([1, 0])
    x = Rot.dot(x)
    frame_show(label, center, x + center, ax, size)
    print("center" + str(center))
    print("center+edge" + str(x + center))