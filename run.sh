docker run \
  --name "make-it-rain-server" \
  -it \
  --rm \
  -p "3000:3000" \
  --env-file ".env" \
  -v "$(pwd):/make-it-rain" \
  make-it-rain bash
