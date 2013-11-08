from bs4 import BeautifulSoup
from bs4.element import NavigableString
import codecs, sys, re, json

# Change this to the actual file path (should probably loop through all
# the files later)
FILE_PATH = 'blog_posts/blog-25186.html'

soup = BeautifulSoup(open(FILE_PATH, 'r'))
post_body = soup.find_all('div', class_='blog_content')[0]

# Put the title, locations, and post body text in a dictionary
result = {}
result['title'] = soup.h1.text

breadcrumbs = soup.find_all('div', class_='blog_header')[0].contents[-1]
result['locations'] = [elem.replace('-', ' ') for elem in re.split('/', breadcrumbs['href']) if elem]

# Get only the text nodes, we don't want all the extra advertisement
# divs, photos, etc
result['body'] = [unicode(elem) for elem in post_body.contents if isinstance(elem, NavigableString)]

# Write JSON output to a file
file = open('output.json', 'w')
file.write(json.dumps(result))