

RECURSE(
    asttokens
    atomicwrites
    attrs
    backcall
    colorama
    contextlib2
    dateutil
    decorator
    executing
    filelock
    funcsigs
    graphviz
    importlib-metadata
    iniconfig
    ipdb
    ipython
    ipython-genutils
    jedi
    Jinja2
    joblib
    MarkupSafe
    matplotlib-inline
    more-itertools
    mypy-protobuf
    numpy
    packaging
    pandas
    parso
    pathlib2
    pexpect
    pickleshare
    pluggy
    prompt-toolkit
    protobuf
    ptyprocess
    pure-eval
    py
    Pygments
    pyparsing
    pytest
    pytz
    scikit-learn
    scipy
    setuptools
    simplegeneric
    six
    stack-data
    testpath
    threadpoolctl
    tomli
    tornado
    traitlets
    types-protobuf
    wcwidth
)

IF (OS_DARWIN)
    RECURSE(
    appnope
)
ENDIF()
