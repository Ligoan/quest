#from google.colab         import files
from cv2                  import resize
from IPython.display      import HTML
from IPython.display      import display
#from tqdm                 import tqdm_notebook
from PIL                  import Image
import numpy                  as np
import matplotlib.pyplot      as plt
import matplotlib.animation   as animation


# 이미지 업로드
#files.upload().keys()


rengoku_img = Image.open('렌고쿠.jpg')
tanjiro_img = Image.open('탄지로.jpg')


# rengoku, tanjuro 이미지 행렬 변환
rengoku_arr = np.array(rengoku_img)
tanjiro_arr = np.array(tanjiro_img)


# rengoku 행렬을 tanjiro 행렬과 같은 꼴로
row, col, _ = tanjiro_arr.shape
rengoku_arr = resize(rengoku_arr, dsize = (col, row))
            # np.array(rengoku_img.crop((0, 0, 468, 703)))


rengoku_arr = rengoku_arr / 255.0      # rengoku 이미지 dtype 변환
tanjiro_arr = tanjiro_arr / 255.0      # tanjiro 이미지 dtype 변환
'''
   이상치 확인 목적

   min_tanjiro = np.min(tanjiro_arr)
   max_tanjiro = np.max(tanjiro_arr)

   min_rengoku = np.min(rengoku_arr_normalized)
   max_rengoku = np.max(rengoku_arr_normalized)

   print("Tanjiro min:", min_tanjiro, "max:", max_tanjiro)
   print("Rengoku min:", min_rengoku, "max:", max_rengoku)

'''


NUM_OF_FRAMES = 100     # 프레임 수
img_frames = []         # 프레임 목록


fig = plt.figure()      # 캔버스 개방
plt.axis('off')         # 축 제거


# 가중치 alpha에 따른 이미지 합성, 프레임 생성 및 프레임 목록 갱신
for i in range(NUM_OF_FRAMES + 1):

  # 가중치 설정
  alpha = i / NUM_OF_FRAMES

  # 이미지 합성
  composite_image_arr = (alpha * rengoku_arr + \
                        (1 - alpha) * tanjiro_arr)

  # 이미지 프레임 생성
  img_frame = [plt.imshow(composite_image_arr, animated = True)]

  # 프레임 목록에 갱신
  img_frames.append(img_frame)

plt.close()      # 캔버스 폐쇄


# Overlap 애니메이션 생성
overlap_animation = animation.ArtistAnimation(fig, img_frames, interval = 40, blit = True)


# Overlap 애니메이션 html로 저장
overlap_animation.save('overlap animation.html', writer = 'html', fps = 40)
