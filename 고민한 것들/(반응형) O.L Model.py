from google.colab         import files
from cv2                  import resize
from IPython.display      import HTML
from tqdm                 import tqdm_notebook
from PIL                  import Image
import numpy                as np
import matplotlib.pyplot    as plt
import matplotlib.animation as animation


# 이미지 파일 업로드
files.upload().keys()


rengoku_img = Image.open('/content/렌고쿠.jpg')
tanjiro_img = Image.open('/content/탄지로.jpg')

NUM_OF_FRAMES = 100
img_frames = []


rengoku_arr = np.array(rengoku_img) / 255.0      # rengoku 이미지 행렬로 변환
tanjiro_arr = np.array(tanjiro_img) / 255.0      # tanjiro 이미지 행렬로 변환


'''
min_tanjiro = np.min(tanjiro_arr)
max_tanjiro = np.max(tanjiro_arr)

min_rengoku = np.min(rengoku_arr_normalized)
max_rengoku = np.max(rengoku_arr_normalized)

print("Tanjiro min:", min_tanjiro, "max:", max_tanjiro)
print("Rengoku min:", min_rengoku, "max:", max_rengoku)
'''


r, c, _ = tanjiro_arr.shape
rengoku_arr = resize(rengoku_arr, dsize = (c, r))
# rengoku_arr = np.array(rengoku_img.crop((0, 0, 468, 703)))


fig = plt.figure()
plt.axis('off')


for t in tqdm_notebook(range(NUM_OF_FRAMES + 1)):
  alpha = t / NUM_OF_FRAMES
  composite_image_arr = (tanjiro_arr * alpha + \
                           rengoku_arr * (1 - alpha))
  img_frame = [plt.imshow(composite_image_arr, animated = True)]
  img_frames.append(img_frame)

plt.close()


ani = animation.ArtistAnimation(fig, img_frames, interval = 40, blit = True)
HTML(ani.to_jshtml())
