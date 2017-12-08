#!/bin/bash

# I am really sorry for anyone who has to work with this, including myself and Kat. - mattl

repo="https://github.com/creativecommons/creativecommons.org.git"
reponame="cc-all-forks"
workdir="${HOME}"
checkoutdir="${workdir}/${reponame}"
resourcedir="${HOME}/magical-pony"
statusfile='/var/www/html/index.html'

rm -rf "${checkoutdir}"
mkdir -p "${checkoutdir}"

echo "<h1>Updating the Magical Pony</h1>" > "${statusfile}"

echo "<h2>" >> "${statusfile}"
echo `date` >> "${statusfile}"
echo "</h2>" >> "${statusfile}"

echo "<img src='data:image/png;base64,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'/>" >> "${statusfile}"

pushd "${checkoutdir}"

# Get a clean version to avoid any merge/reset weirdness
git clone "${repo}" .

echo "<h2>Branches</h2>" >> "${statusfile}"

hostnames="-d legal.creativecommons.org"

for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master`;
do
    branchname=$(basename "$branch")
    hostnames="-d ${branchname}.legal.creativecommons.org ${hostnames}"
    git checkout -f ${branchname}
#    git reset --hard
#    git pull
    mkdir -p "/srv/clones/${branchname}"
    git archive "${branchname}" \
        | tar -xC "/srv/clones/${branchname}"
    cp "${resourcedir}/transitional" \
       "/etc/apache2/sites-enabled/${branchname}".conf
    perl -p -i -e "s/MAGICALPONY/${branchname}/g" \
         "/etc/apache2/sites-enabled/${branchname}".conf
    hash=$(git log ${branchname} -1 --format="%H")
    echo "<h3>${branchname}</h3><p><b>Commit:</b> <a href=\"https://github.com/creativecommons/creativecommons.org/commit/${hash}\"\>${hash}</a></p>" \
	 >> "${statusfile}"
    git log ${branchname} -1 --format="<p>%s</p>" >> "${statusfile}"
done

popd

# Get any new certificates, incorporate old one, refresh expiring, install any
# new http->https redirects, and do so quietly and automatically.

certbot run --apache --agree-tos -m webmaster@creativecommons.org \
        --non-interactive --quiet \
        --expand --keep-until-expiring --redirect \
        ${hostnames}

echo "<h1>And we're done!</h1>" >> "${statusfile}"

rm -rf /srv/old-clones/

echo "<h2>" >> "${statusfile}"
echo `date` >> "${statusfile}"
echo "</h2>" >> "${statusfile}"

chown www-data:www-data "${statusfile}"

service apache2 restart
