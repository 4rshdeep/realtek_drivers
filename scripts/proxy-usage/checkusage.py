import os
import requests
import warnings
import sys
from getpass import getpass
from bs4 import BeautifulSoup
from tabulate import tabulate

client_id = 'C7o6R5kXQxjshCLt1bFkU9YOnIKMbyzN'
cwd = '/home/ad/scripts/proxy-usage'
os.environ['REQUESTS_CA_BUNDLE'] = cwd + '/CCIITD-CA.crt'

def proxyusage(username, password):
    """Returns the IITD proxyusage data.

    Parameters
    ----------
    username: str, Kerberos ID
    password: str, Kerberos Password

    Returns
    -------
    dict
        dict with proxyusage data. The keys of this dict are 'yesterday', 'week', 'month' and 'year'.
    """

    data = {'username': username, 'password': password, 'submit': ''}
    params = {'response_type': 'code', 'client_id': client_id, 'state': 'xyz'}
    headers = {
        'Referer': 'https://oauth.iitd.ac.in/login.php?response_type=code&client_id={}&state=xyz'.format(client_id),
    }

    session = requests.Session()

    r = session.post('https://oauth.iitd.ac.in/authorize.php', data=data, params=params, headers=headers,
                     allow_redirects=False)
    redirect = r.headers['Location']
    try:
        r = session.get(redirect, allow_redirects=False)
    except requests.exceptions.MissingSchema:
        return False

    page = session.get('https://track.iitd.ac.in/data_usage.php')
    soup = BeautifulSoup(page.text, 'html.parser')
    elems = soup.select('td[align="right"]')[4:]

    return {'yesterday': elems[0].text, 'week': elems[1].text, 'month': elems[2].text, 'year': elems[3].text}


def main():
    option = input('Are you cs5160625? [y]/n: ')
    # username = os.getenv('USERNAME')
    
    if option!='n':
        username = 'cs5160625'
    else:
        username = 'cs5160392'
        # username = input('Enter username: ')
    # password = getpass('Enter password: ')
    password = sys.argv[1]
    # print(password)
    with warnings.catch_warnings():
        warnings.simplefilter("ignore")
        usage = proxyusage(username, password)

    if not usage:
        print('Invalid credentials!')
        sys.exit()

    print('\nData Usage for {}\n'.format(username.upper()))
    print(tabulate([['Yesterday', usage['yesterday'], "Assigned Quota"], ['Week', usage['week'], "10240MB"], ['Month', usage['month'],"40960MB"],
                    ['Year', usage['year'], "532480MB"]]))


if __name__ == '__main__':
    main()
