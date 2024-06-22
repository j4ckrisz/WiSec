# setup.py
from setuptools import setup, find_packages

setup(
    name='Wisec',
    version='0.1.0',
    packages=find_packages(),
    install_requires=[
        'Pillow',  
    ],
    entry_points={
        'console_scripts': [
            'Wisec=gui.main_window:MainWindow',  
        ],
    },
    include_package_data=True,
    author='J4ckris',
    description='',
    long_description=open('README.md').read(),
    long_description_content_type='text/markdown',
    url='https://github.com/j4ckrisz/wisec',  
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.7',
)
