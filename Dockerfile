FROM python:3.7-alpine3.9

RUN apk update
RUN apk add --no-cache \
   udev \
   chromium \
   chromium-chromedriver \
   xvfb \ 
   curl

COPY requirements.txt /tmp/requirements.txt

RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Chrome requires docker to have cap_add: SYS_ADMIN if sandbox is on.
# Disabling sandbox and gpu as default.
RUN sed -i "s/self._arguments\ =\ \[\]/self._arguments\ =\ \['--no-sandbox',\ '--disable-gpu'\]/" $(python -c "import site; print(site.getsitepackages()[0])")/selenium/webdriver/chrome/options.py;


ENV SCREEN_WIDTH 1280
ENV SCREEN_HEIGHT 720
ENV SCREEN_DEPTH 16
