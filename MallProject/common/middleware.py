class ShopMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response
        print('Middleware Loading...')

    def __call__(self, request):
        response = self.get_response(request)
        print('calling...')
        return response
