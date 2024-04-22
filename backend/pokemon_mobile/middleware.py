class CorsMiddleware:

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        response['Access-Control-Allow-Origin'] = 'http://pokemonko.com'
        response['Access-Control-Allow-Credentials'] = 'true'
        response['Access-Control-Allow-Headers'] = 'Content-Type, Authorization'
        response["Access-Control-Allow-Methods"] = "DELETE, POST, GET, OPTIONS"
        if request.method == "OPTIONS":
            response.status_code = 200
        return response