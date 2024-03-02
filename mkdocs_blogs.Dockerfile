FROM python:3.11-slim

LABEL maintainer="Arindam Tanti <arindamtanti123@gmail.com>"

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install Mkdocs and any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Mkdocs project files into the container
COPY . .

# Delete cache files and temporary files
RUN rm -rf __pycache__ \
    && rm -rf .pytest_cache \
    && find . -name '*.pyc' -delete

# Expose port 8000 to access the Mkdocs site
EXPOSE 8000

# Command to serve the Mkdocs site
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000", "-w", "/app/TuxTechBlogs/", "-f", "/app/TuxTechBlogs/mkdocs.yml", "--verbose"]
