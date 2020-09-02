FROM python:3.7-alpine3.9

RUN apk update
RUN apk add --no-cache \
   udev \
   chromium \
   chromium-chromedriver \
   xvfb \ 
   curl


RUN pip install --no-cache-dir \
    attrs==19.3.0\
    bcrypt==3.2.0 \
    certifi==2020.6.20\
    cffi==1.14.2\
    chardet==3.0.4\
    cryptography==3.1\
    decorator==4.4.2\
    docutils==0.16\
    Faker==4.1.1\
    geckodriver-autoinstaller==0.1.0\
    idna==2.10\
    kitchen==1.2.6\
    paramiko==2.7.2\
    pip==20.1.1\
    pluggy==0.13.1\
    pycparser==2.20\
    PyNaCl==1.4.0\
    python-dateutil==2.8.1\
    requests==2.24.0\
    robotframework==3.2.1\
    robotframework-appiumlibrary==1.5.0.6\
    robotframework-faker==5.0.0\
    robotframework-pythonlibcore==2.1.0\
    robotframework-requests==0.7.1\
    robotframework-selenium2library==3.0.0\
    robotframework-seleniumlibrary==4.5.0\
    robotframework-sshlibrary==3.4.0\
    scp==0.13.2\
    selenium==3.141.0\
    setuptools==49.2.0\
    six==1.15.0\
    text-unidecode==1.3\
    urllib3==1.25.10\
    wheel==0.34.2\
    wrapt==1.12.1




# Chrome requires docker to have cap_add: SYS_ADMIN if sandbox is on.
# Disabling sandbox and gpu as default.
RUN sed -i "s/self._arguments\ =\ \[\]/self._arguments\ =\ \['--no-sandbox',\ '--disable-gpu'\]/" $(python -c "import site; print(site.getsitepackages()[0])")/selenium/webdriver/chrome/options.py;


ENV SCREEN_WIDTH 1280
ENV SCREEN_HEIGHT 720
ENV SCREEN_DEPTH 16
