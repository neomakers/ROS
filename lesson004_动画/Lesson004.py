import frameworks as fm
import time
# 进一步将类的封装定义在frameworks当中
import numpy as np
import matplotlib.pyplot as plt

prev = fm.frame2D()
tmp_list = []
step = 1
for i in range(0, 90, step):
    tmp_list.append(fm.frame2D())
    tmp_list[i].angle = i
# run_time_max = 0
# run_time_max_index = 0
for i in range(0, 90, step):
    plt.clf()
    ax = plt.axes()
    xlimit = 10
    ylimit = 10
    plt.axis('equal')  # 等轴

    plt.xlim([-xlimit, xlimit])
    plt.ylim([-ylimit, ylimit])
    # start_time = time.time()
    tmp_list[i].show(ax, "A", 2, "red")
    # end_time = time.time()
    # run_time = end_time - start_time
    # print(str(i) + ":" + str(run_time))
    # debug
    # if run_time_max < run_time:
    #     run_time_max = run_time
    #     run_time_max_index = i

    plt.pause(0.1)
# print(run_time_max)
# print(run_time_max_index)
# plt.show()