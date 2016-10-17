# dc-law-xml

District of Columbia law (statutes and code) in XML format.

_master_: [![Build status](https://ci.appveyor.com/api/projects/status/i8nm5au85u2wufld/branch/master?svg=true)](https://ci.appveyor.com/project/oll-bot/dc-law-xml/branch/master)

_development_: [![Build status](https://ci.appveyor.com/api/projects/status/i8nm5au85u2wufld/branch/development?svg=true)](https://ci.appveyor.com/project/oll-bot/dc-law-xml/branch/development)


# Branches

The _master_ branch is the ultimate source for [https://beta.code.dccouncil.us/dc/council/code/](https://beta.code.dccouncil.us/dc/council/code/).

The _development_ branch is the branch that developers use to make and test changes.


# Building

To build HTML from this, you'll need to use the [_dc-law-tools_](https://github.com/openlawlibrary/dc-law-tools)
(Python 3) repository. You should also use [the latest `xcore` binary](https://github.com/openlawlibrary/xcore/releases)
to check the XML for errors. See the [appveyor.yml](appveyor.yml) file for up
to date instructions.

- Clone the [_dc-law-tools_](https://github.com/openlawlibrary/dc-law-tools)
  repository in a sibling directory to _dc-law-xml_.
- Create another empty sibling directory named _dc-law-html_ (or clone the
  [_dc-law-html_](https://github.com/dccouncil/dc-law-html) repository.
- From the _dc-law-xml_ directory, run this command:
  - `python3 build html all`
- To deploy, commit the changes in _dc-law-html_ and `git push`.
