import pathlib
import textwrap

import google.generativeai as genai

from IPython.display import display
from IPython.display import Markdown

import PIL.Image


with open(r'C:\Users\ligoan\OneDrive\바탕 화면\I\Programing\Python\fastAPI\Gemini API Key.txt', 'r') as key:
    API_KEY = key.read()


def to_markdown(text):
  text = text.replace('•', '  *')
  return Markdown(textwrap.indent(text, '> ', predicate=lambda _: True))

#genai.configure(api_key=os.environ["API_KEY"])
genai.configure(api_key=API_KEY)