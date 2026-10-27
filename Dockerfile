FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY src/ /usr/share/nginx/html/
ARG GIT_COMMIT=dev
RUN echo "$GIT_COMMIT" > /usr/share/nginx/html/version.txt
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD wget -qO- http://localhost/ >/dev/null || exit 1
