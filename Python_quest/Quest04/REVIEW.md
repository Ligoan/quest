# AIFFEL Campus Code Peer Review Templete
> - 코더 : 김동규
> - 리뷰어 : 김주현
  
  
# PRT(Peer Review Template)
[O]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
* 완벽하게 동작하는 코드가 잘 작성되었습니다.
* 다만, main() 함수의 finally 섹션에서 while 문으로 이중 반복문을 구성하는 과정에서 isContinue 변수의 값이 'y'일 때 다시 main() 함수의 맨 처음으로 돌아가야 했는데, 이중 반복문을 한번에 빠져나오기가 어려워 그냥 다시 main() 함수를 호출하는 방식으로(재귀 호출) 작성되었습니다. 어쨌든 프로그램이 정상적으로 실행되기는 하지만 재귀 호출은 재귀 호출을 관리하기 위한 오버헤드가 추가로 들기 때문에 재귀 호출을 하지 않는 방식으로 수정하는 것이 더 좋을거 같아 다음과 같이 피드백을 드렸습니다.

  ```
  [원래 코드]
  #메인함수
  def main():
    isDone = True
    while isDone:
      try:
        number_list = numberInput()
        operator = operatorInput()
        result = operationDo(number_list, operator)
        if type(result) == bool:
          raise Exception
        else:
          print(result)
  
  
      except Exception:
        print("잘못된 연산 ///입력입니다.")
  
      finally:
        while True:
          isContinue = input("계속 하시겠습니까? y|n ")
  
          if(isContinue == 'y'):
            main()    # 재귀 호출
          elif(isContinue == 'n'):
            return
          else:
            print("잘못된 입력입니다. y|n으로 입력해주세요 ")


  [수정 제안한 코드]
  #메인함수
  def main():
    isDone = True
    while isDone:
      try:
        number_list = numberInput()
        operator = operatorInput()
        result = operationDo(number_list, operator)
        if type(result) == bool:
          raise Exception
        else:
          print(result)
  
  
      except Exception:
        print("잘못된 연산 ///입력입니다.")
  
      finally:
        while True:
          isContinue = input("계속 하시겠습니까? y|n ")
  
          if(isContinue == 'y'):
            # main()    # 재귀 호출 주석 처리하고, break 문으로 대체
            break
          elif(isContinue == 'n'):
            return
          else:
            print("잘못된 입력입니다. y|n으로 입력해주세요 ")
  ``` 
  
[O]  **2. 핵심적이거나 복잡하고 이해하기 어려운 부분에 작성된 설명을 보고 해당 코드가 잘 이해되었나요?**
* 프로그램 시작 부분에서 전체적인 구성을 이해할 수 있도록 주석이 잘 작성되어 있습니다.
  ```
  #숫자입력을 받는 부분입니다.
  '''
  기본적인 메커니즘은 아래와 같습니다.
  1. 숫자를 입력받는 함수와 연산자를 입력받는 함수, 연산하는 함수를 분리합니다.
  2. 분리된 각각의 함수에서 원하는 값이 나올때까지 반복시킵니다.
  
  3. 올바른 값을 입력받은뒤에는 연산할때의 문제를 추가적으로 입력받습니다.
  4. 위의과정을 반복합니다.
  '''
  ```
* 또한, 필요한 곳마다 주석이 적절하게 잘 작성되어 있습니다.
  ```
  def operationDo(listInputed,operatorInputed):
  
    #번외 : 연산을 처리할떄는 아래와 같은 예외가 존재합니다.
    '''
    1. 전자의 숫자가 '0'일때
      1. *,/는 무조건 결과값이 0이 됩니다.
      2. +라면 후자의 숫자가 결과값입니다.
      3. -라면 후자의 숫자의 -1을 곱한 것이 결과값입니다.
  
    2. 후자의 숫자가 '0'일때
      1. /는 에러를 발생시킵니다.
      2. *라면 무조건 결과값이 0이됩니다.
      3. +,-라면 전자의 숫자가 결과값입니다.
  
    3. 둘다 0일때
      1. /는 에러를 발생시킵니다.
    '''  
  ```
  
[O]  **3. 에러가 난 부분을 디버깅하여 “문제를 해결한 기록”을 남겼나요? 또는 “새로운 시도 및 추가 실험”을 해봤나요?**
* 한 가지 접근 방식이 아니라 또 다른 접근 방식으로 작성한 '김동규님의 어나더 코드'가 있어서 여러가지 방식을 시도하고 실험하였음을 잘 알 수 있었습니다. 
* 특히, 첫번째 코드는 가급적 세분화된 함수로 나누어 작성하려는 접근 방식을 취했고, 두번째 코드에서는 함수로 나누지는 않았지만 match ~ case 문 등을 활용해 좀 더 간결하면서 효율적인 코드를 작성하기 위해 노력한 모습을 확인할 수 있었습니다. 
  ```
  [김동규님의 어나더 코드]
  from math import pow
  #from calc import *
  
  operands = input('두 정수 입력: ').split(' ')
  
  print(operands)
  #assert int(float(operands[0])) == float(operands[0]), '입력한 수는 정수가 아닙니다.'
  #assert int(float(operands[1])) == float(operands[1]), '입력한 수는 정수가 아닙니다.'
  
  for num in operands:
    if len(operands) == 2 and (int(float(num)) == float(num)):
        pass
    else:
      raise ValueError('입력한 {operands} 중 정수아닌 수가 포함되어 있습니다.')
  
  operator = input('연산자: ')
  match operator:
      case '+': (lambda a, b: print(f'{a} + {b} = {a + b}', end ='\n\n'))(int(float(operands[0])), int(float(operands[1])))
      case '-': (lambda a, b: print(f'{a} - {b} = {a - b}', end ='\n\n'))(int(float(operands[0])), int(float(operands[1])))
      case '*': (lambda a, b: print(f'{a} * {b} = {a * b}', end ='\n\n'))(int(float(operands[0])), int(float(operands[1])))
      case '**': (lambda a, b: print(f'{a}^{b} = {pow(a, b)}', end ='\n\n'))(int(float(operands[0])), int(float(operands[1])))
      case '/':
        try:
          (lambda a, b: print(f'{a}/{b} = {a/b)}', end ='\n\n'))(int(float(operands[0])), int(float(operands[1])))
        except ZeroDivisionError:
          print('0으로 나눌 수 없습니다.')
      case _:   print('지원하지 않는 연산입니다.')
  ```
    
[O]  **4. 회고를 잘 작성했나요?**
* 두 가지 접근 방식의 차이에 대한 논의와 함께 어는 방식이 좀 더 효율적이었을지에 대한 내용이 회고에 잘 담겨 있습니다. 
  ```
  [회고] 김진서 함수별로 기능을 분화하여 작성하는것을 목표로 했었습니다. 하지만 동규님 코드가 되게 기능적으로도 깔끔하셔서 굳이 함수로 나눌필요는 없다는걸 깨닫게 되는 시간이였습니다.
  ``` 
  
[O]  **5. 코드가 간결하고 효율적인가요?**
* 세분화된 단위 기능별로 각각 함수로 세분화해서 구성하고자 하는 방식 자체가 좀 더 효율적인 코드를 위한 시도였다고 생각합니다.
* 이번 퀘스트가 아주 복잡한 것은 아니었어서 너무 세분화한 구성이 오히려 복잡도를 증가시킨 측면도 있지만 조금만 복잡한 코드에서는 이와 같은 접근 방식이 훨씬 가독성도 높이고 프로그램 오류 시 디버깅에도 유리하다고 할 수 있습니다.
* 다만, 언제나 그렇듯이 지나친 세분화도 있을 수 있으므로 항상 적정선이 어디까지일지를 고려하는 것 역시 중요할 것으로 생각됩니다.
* 마지막으로 연산자 유효성을 체크하는 함수 operatorInput() 에서 좀 더 간결하게 작성할 수 있는 방법이 있어서 다음과 같이 추천드렸습니다. 
  ```
  [원래 코드]
  operator = input("연산자를 입력해주세요 [+,-,*,-,**]")

  if operator == '+':
    return '+'

  if operator == '-':
    return '-'

  if operator == '*':
    return '*'

  if operator == '/':
    return '/'

  if operator == '**':
    return '**'

  else:
    raise Exception


  [수정 제안한 코드]
  operator = input("연산자를 입력해주세요 [+,-,*,-,**]")

  # 좀 더 간결하게 작성하는 방법
  operator_list = ['+', '-', '*', '/', '**']
  if operator in operator_list:
    return operator
  else:
    raise Exception
  ```

  
# 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
