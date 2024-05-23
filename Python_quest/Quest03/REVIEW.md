# AIFFEL Campus Code Peer Review Templete
> - 코더 : 김동규
> - 리뷰어 : 김주현
  
  
# PRT(Peer Review Template)
[O]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
* 두 퀘스트 모두 적합한 코드가 잘 작성되었으며, 특히 라인 수를 줄이기 위한 노력까지 있었습니다. 
  ```
  [라인 수를 줄이기 위한 노력]
    # 만약 num 값이 min_value보다 작다면 min_value를 num 값으로 변경
    if num < min_value: min_value = num

    # 만약 num 값이 max_value보다 크다면 max_value를 num 값으로 변경
    if num > max_value: max_value = num

  # numbers 리스트의 모든 값을 순환하며 최댓값과 최솟값 업데이트
  for num in numbers: update_min_max(num)

  # 최솟값을 반환하는 내부함수
  def get_min(): return min_value

  # 최댓값을 반환하는 내부함수
  def get_max(): return max_value
  ``` 
* 특히, 두번째 퀘스트에서 'func.__name__' 속성을 활용해 데코레이티드된 함수에 따라 출력문의 내용이 변경되도록 작성하여서 say_hello() 함수 외에 다른 함수에서도 해당 데코레이터를 사용했을 때 유연하게 동작하도록 작성되었습니다.
  ```
  def wrapper():
    nonlocal count    # wrapper에서 count에 접근 허용

    func()
    count += 1        # func() 호출 시 count 값 1 증가
    print(f'{func.__name__} 실행 횟수: {count}') # {함수 이름} 실행 횟수: count 번 형식으로 출력  
  ```
  
[O]  **2. 핵심적이거나 복잡하고 이해하기 어려운 부분에 작성된 설명을 보고 해당 코드가 잘 이해되었나요?**
* 필요한 곳마다 주석이 적절하게 잘 작성되어 있습니다.
* 또한, 모든 함수 정의의 시작 부분에 """로 감싼 docstring을 작성해 두어 해당 함수에 대한 핵심 정보를 확인할 수 있도록 정리해둔 부분이 특히 인상적이었습니다.
  ```
  def find_min_max(numbers):
  """
     iterable(list, iterator, or generator) 에서 최댓값과 최솟값을 찾는다.

     Parameters:
         numbers (iterable): 검토(비교 등) 대상을 포함한 iterable.

     Returns:
         tuple: 두 함수를 요소로 갖는 tuple
             get_min(): iterable에서 최솟값을 찾아 반환
             get_max(): iterable에서 최댓값을 찾아 반환
  """


  # min_value와 max_value 변수를 초기화
  # min_value는 양의 무한대(float('inf'))로 초기화하여 어떤 숫자보다도 큰 값으로 설정
  min_value = float('inf')
  # max_value는 음의 무한대(float('-inf'))로 초기화하여 어떤 숫자보다도 작은 값으로 설정
  max_value = float('-inf')
  ```
  
[O]  **3. 에러가 난 부분을 디버깅하여 “문제를 해결한 기록”을 남겼나요? 또는 “새로운 시도 및 추가 실험”을 해봤나요?**
* 회고 영역에도 작성되어 있지만 클로저, 데코레이터의 동작 과정과 최종 리턴 타입을 정확하게 파악하기 위해 python tutor 페이지를 적극적으로 활용해 가면서 노력하였습니다.
* 또한, 중간 중간 현재 시점의 메모리 주소와 타입을 직접 확인하기도 하는 등 단순히 코드 동작 여부만이 아니라 해당 코드가 동작하는 프로세스와 타입 변화 등까지 정확하게 파악하기 위해 노력하였습니다. 
  ```
  #print(id(wrapper))
  #print(type(wrapper))
  ```
  
[O]  **4. 회고를 잘 작성했나요?**
* python tutor를 적극적으로 사용해 가면서 클로저와 데코레이터의 동작 과정을 정확히 파악하기 위해 노력하였습니다.
* 그럼에도 불구하고 아직 클로저의 필요성이 완전히 체감되지 않는 상황과 앞으로의 기대 역시 잘 작성되었습니다.
  ```
  - python tutor를 통해 데코레이터를 사용하여 함수 호출 시 메모리에 어떻게 저장되는지 보면서 작동 원리를 대강 파악할 수 있었다. 좋은 도구다.
  - 그런데 퍼실님이 제시하신 문제가 아니면 아직까지 이렇게 클로저를 설계해서 써야할 상황을 잘 모르겠습니다.
  - 그런 상황이 와서 아! 하는 순간이 있기를 바랍니다.  
  ``` 
  
[O]  **5. 코드가 간결하고 효율적인가요?**
* 앞에서도 작성했듯이 기본 코드 역시 간결할 뿐 아니라 라인 수를 줄이기 위한 노력까지 병행하였습니다.
* 'func.__name__' 속성을 활용해 향후 다른 함수에서도 동일한 데코레이터를 사용할 수 있도록 유연성 있는 코드를 작성하였습니다. 
  ```
  [라인 수를 줄이기 위한 노력]
    # 만약 num 값이 min_value보다 작다면 min_value를 num 값으로 변경
    if num < min_value: min_value = num

    # 만약 num 값이 max_value보다 크다면 max_value를 num 값으로 변경
    if num > max_value: max_value = num

  # numbers 리스트의 모든 값을 순환하며 최댓값과 최솟값 업데이트
  for num in numbers: update_min_max(num)

  # 최솟값을 반환하는 내부함수
  def get_min(): return min_value

  # 최댓값을 반환하는 내부함수
  def get_max(): return max_value


  [유연성을 높인 부분]
  def wrapper():
    nonlocal count    # wrapper에서 count에 접근 허용

    func()
    count += 1        # func() 호출 시 count 값 1 증가
    print(f'{func.__name__} 실행 횟수: {count}') # {함수 이름} 실행 횟수: count 번 형식으로 출력  
  
  ```

  
# 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
