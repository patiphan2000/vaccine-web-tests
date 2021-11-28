# vaccine-web-tests :adhesive_bandage:
use robot framework to test reservation feature on 3AM group

### System under test
```
https://vaccine-haven.herokuapp.com
```

## Prerequisite

#### robot framwork:robot:
install robot framework:
```
pip install robotframework
```
install selenium2library
```
pip install robotframework-selenium2library
```
```
robot .\test\registration_test.robot
```

#### chromedriver
download chromedriver that match your chrome version in `%PATH%` at [download chromedriver](https://chromedriver.chromium.org/downloads)

## Final thoughts
I think robot framework is easy to use but it also lack of functionality to test more complex function. So I perfer another JS framework more than robot framwork especially since frontend development is mostly based on JS frameworks like Angular, React or Vue.