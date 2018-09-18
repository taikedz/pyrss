import urllib.request

def pull(url):
    try:
        with urllib.request.urlopen(url) as res:
            status = res.status
            mime = res.getheader("Content-Type")
            pagedata = res.read()

            return status, mime, pagedata
    except Exception as e:
        return 500, "text/plain", "Internal error"

