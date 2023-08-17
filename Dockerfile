FROM klakegg/hugo:0.100.2-ext-alpine AS build

WORKDIR /blog
COPY . .
RUN mv /blog/data/_override.scss /blog/themes/LoveIt/assets/css/_override.scss && \
	mv /blog/data/_cookieconsent.scss /blog/themes/LoveIt/assets/css/_partial/_cookieconsent.scss && \
	mv /blog/data/index.html /blog/themes/LoveIt/layouts/index.html && \
	mv /blog/data/comment.html /blog/themes/LoveIt/layouts/partials/comment.html && hugo

FROM nginx
COPY --from=build /blog/public /usr/share/nginx/html
EXPOSE 80