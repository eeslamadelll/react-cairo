# tools/vercel-deploy/vercel-affected-deploy.sh

# Name of the app to check. Change this to your application name!
APP=nextjs-app

# Determine version of Nx installed
NX_VERSION=$(node -e "console.log(require('./package.json').devDependencies['@nrwl/workspace'])")
TS_VERSION=$(node -e "console.log(require('./package.json').devDependencies['typescript'])")

# Install @nrwl/workspace in order to run the affected command
yarn add --dev @nrwl/workspace@$NX_VERSION --prefer-offline -W
yarn add --dev typescript@$TS_VERSION --prefer-offline -W

# Run the affected command, comparing latest commit to the one before that
npx nx affected:apps --base HEAD~1 --head HEAD | grep $APP -q

# Store result of the previous command (grep)
IS_AFFECTED=$?

if [ $IS_AFFECTED -eq 1 ]; then
  echo "🛑 - Build cancelled"
  exit 0
elif [ $IS_AFFECTED -eq 0 ]; then
  echo "✅ - Build can proceed"
  exit 1
fi