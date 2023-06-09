Install python https://www.python.org/downloads/
You don't need admin rights. Do custom installation and just don't give access to all users.

In the terminal:

We can't switch activate python envs without access from admins.
IF you have access:

python -m venv hackathon

.\hackathon\Scripts\Activate

Without access, you'll always need to do:

python -m pip install -r requirements.txt

instead of the usual pip ... it's now python -m pip. No environment.

mkdir %userprofile%\.dbt
