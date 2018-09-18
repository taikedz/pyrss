from lxml.html import parse as parseHTML
import io

def fix(pagedata, url):
    dom = parseHTML(io.StringIO(pagedata) ).getroot()

    for element_name in ["link", "a"]:
        adjust(element_name, "href", url)

    for element_name in ["img", "script", "object"]:
        adjust(element_name, "src", url)

    return str(dom)

def adjust(element_name, attribute, url):
    elements = dom.get_elements_by_name(element_name)

    for elem in elements:
        path = elem[attribute] # FIXME
        if re.match("^/", path):
            path = urlresolve(url, path)
        elem[atribute] = serverurl+path # FIXME
