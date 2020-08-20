FROM trion/ng-cli:8.3.8 as build

COPY . /app

RUN npm install
RUN ng build --prod

FROM nginx:1.17.4

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/retail-analytics /usr/share/nginx/html