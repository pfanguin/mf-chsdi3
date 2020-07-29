source rc_${DEPLOY_TARGET}
export GIT_BRANCH=$(if [ -f '.venv/deployed-git-branch'  ]; then cat .venv/deployed-git-branch 2> /dev/null; else git rev-parse --symbolic-full-name --abbrev-ref HEAD; fi)
export APACHE_BASE_PATH=${GIT_BRANCH}
export API_URL=//mf-chsdi3.${DEPLOY_TARGET}.BGDI.CH/${GIT_BRANCH}
export GEODATA_STAGING=test
export GEOADMINHOST=mf-geoadmin3.${DEPLOY_TARGET}.BGDI.CH
export HOST=mf-chsdi3.${DEPLOY_TARGET}.bgdi.ch
export DBSTAGING=dev
