import numpy as np
from PIL import Image
#from IPython.display import display
import matplotlib.pyplot as plt
from time import sleep


t = 0       # 가중치
rengoku_img = Image.open('렌고쿠.jpg')
tanjiro_img = Image.open('탄지로.jpg')


rengoku_arr = np.array(rengoku_img)      # rengoku 이미지 행렬로 변환
tanjiro_arr = np.array(tanjiro_img)      # tanjiro 이미지 행렬로 변환


# rengoku 행렬을 tanjiro 행렬과 같은 꼴로
rengoku_arr = np.array(rengoku_img.crop((0, 0, 468, 703)))


''' Resizing 결과 확인 '''
#print(rengoku_arr.shape)
#print(tanjiro_arr.shape)


# 행렬 합성
composite_img_arr = (t * rengoku_arr + (1 - t) * tanjiro_arr)


# dtype 변환
composite_img_arr = composite_img_arr.astype(np.uint8)


# 가중치에 따른 합성 이미지 출력 기능
for i in range(11):
  composite_img_arr = t * rengoku_arr + (1 - t) * tanjiro_arr
  composite_img_arr = composite_img_arr.astype(np.uint8)
  composite_img = Image.fromarray(composite_img_arr)      # 행렬을 이미지로 변환
  #composite_img.show()
    
  # Display the composite image using matplotlib
  plt.imshow(composite_img)
  plt.axis('off')  # Hide axes
  plt.title(f'Weight: {t:.1f}')
  plt.show()
  plt.savefig(f'Weight: {t:.1f}.png')
  t += 0.1
  #sleep(1)
