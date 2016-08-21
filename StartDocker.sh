docker run --net="host" -v $(pwd):/notebook -p 8888:8888 -p 6006:6006 xerohige/basic-notebook sh -c "jupyter-notebook /notebook"
