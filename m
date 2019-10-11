Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0AFD37B2
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 05:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfJKDEG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Oct 2019 23:04:06 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48246 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfJKDEG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Oct 2019 23:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WwSy08Wh/f8tLY9W7XeXUM7+EGDpIQJCxrn7NmCjSIc=; b=Gr6xhbUri5Q/tqgNUqSGueeeH
        SK5ZKp7mMCYLOTG/v5e5hDCxnONRZDZqENqATROAL0TduFUq2R9LlMl7F863E5X/pxmOr9u0TIoj3
        IlQdG6I3J1YSU9H6L8zpfV2WE8oQ5reCyAj6ZUP9zUi+KbGCs5ac9JL2afL4kxDqgDA/vHYlXHWfg
        BAktCG6kNU1Pyrq9DBYHpk9CS8q7x7GZJnAcflJxlEVAZ4VYDzM91PA8B/NUYa86Uu9IT9qKD2POB
        wVS3Sme/sV1rmXxgz5sQCykxGvRl71ZkBIoyxNH723m0bzjbfOolbi/p5pReigjwRz88JwFh9Ihi0
        YTPJmVzdA==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iIlDp-0007ur-U2; Fri, 11 Oct 2019 03:04:05 +0000
Subject: Re: [PATCH] Modern Bash syntax, replace backquote to dollar
 parenthesis
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        linux-kbuild@vger.kernel.org
References: <yamada.masahiro@socionext.com,michal.lkml@markovi.net,linux-kbuild@vger.kernel.org>
 <20191011021759.28960-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <369b1248-fd80-11e2-d879-d5943f9659f4@infradead.org>
Date:   Thu, 10 Oct 2019 20:04:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191011021759.28960-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/10/19 7:17 PM, Bhaskar Chowdhury wrote:
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  setlocalversion | 183 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 183 insertions(+)
>  create mode 100755 setlocalversion

Hi,
I'm pretty sure something is mucked up here.

> diff --git a/setlocalversion b/setlocalversion

but this isn't a diff between those 2 files.

And this diff should be from the top level of the kernel source tree, so it
should be a diff between a/scripts/setlocalversion and b/scripts/setlocalversion.

> new file mode 100755

There is already a file scripts/setlocalversion, so this "new file" is strange.

Also, the patch subject should be something like:
[PATCH] scripts: fix shell syntax

And note that the shell in this case is /bin/sh, not necessarily bash.
Actually we prefer to make patches that remove bashisms in many cases.

One more:  you should Cc: the kbuild maintainer on patches that he might apply/merge.

Thanks.

> index 000000000000..220dae0db3f1
> --- /dev/null
> +++ b/setlocalversion
> @@ -0,0 +1,183 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# This scripts adds local version information from the version
> +# control systems git, mercurial (hg) and subversion (svn).
> +#
> +# If something goes wrong, send a mail the kernel build mailinglist
> +# (see MAINTAINERS) and CC Nico Schottelius
> +# <nico-linuxsetlocalversion -at- schottelius.org>.
> +#
> +#
> +
> +usage() {
> +	echo "Usage: $0 [--save-scmversion] [srctree]" >&2
> +	exit 1
> +}
> +
> +scm_only=false
> +srctree=.
> +if test "$1" = "--save-scmversion"; then
> +	scm_only=true
> +	shift
> +fi
> +if test $# -gt 0; then
> +	srctree=$1
> +	shift
> +fi
> +if test $# -gt 0 -o ! -d "$srctree"; then
> +	usage
> +fi
> +
> +scm_version()
> +{
> +	local short
> +	short=false
> +
> +	cd "$srctree"
> +	if test -e .scmversion; then
> +		cat .scmversion
> +		return
> +	fi
> +	if test "$1" = "--short"; then
> +		short=true
> +	fi
> +
> +	# Check for git and a git repo.
> +	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
> +	   head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
> +
> +		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
> +		# it, because this version is defined in the top level Makefile.
> +		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
> +
> +			# If only the short version is requested, don't bother
> +			# running further git commands
> +			if $short; then
> +				echo "+"
> +				return
> +			fi
> +			# If we are past a tagged commit (like
> +			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
> +			if atag="`git describe 2>/dev/null`"; then
> +				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
> +
> +			# If we don't have a tag at all we print -g{commitish}.
> +			else
> +				printf '%s%s' -g $head
> +			fi
> +		fi
> +
> +		# Is this git on svn?
> +		if git config --get svn-remote.svn.url >/dev/null; then
> +			printf -- '-svn%s' "`git svn find-rev $head`"
> +		fi
> +
> +		# Check for uncommitted changes.
> +		# First, with git-status, but --no-optional-locks is only
> +		# supported in git >= 2.14, so fall back to git-diff-index if
> +		# it fails. Note that git-diff-index does not refresh the
> +		# index, so it may give misleading results. See
> +		# git-update-index(1), git-diff-index(1), and git-status(1).
> +		if {
> +			git --no-optional-locks status -uno --porcelain 2>/dev/null ||
> +			git diff-index --name-only HEAD
> +		} | grep -qvE '^(.. )?scripts/package'; then
> +			printf '%s' -dirty
> +		fi
> +
> +		# All done with git
> +		return
> +	fi
> +
> +	# Check for mercurial and a mercurial repo.
> +	if test -d .hg && hgid=`hg id 2>/dev/null`; then
> +		# Do we have an tagged version?  If so, latesttagdistance == 1
> +		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
> +			id=`hg log -r . --template '{latesttag}'`
> +			printf '%s%s' -hg "$id"
> +		else
> +			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
> +			if [ -z "$tag" -o "$tag" = tip ]; then
> +				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
> +				printf '%s%s' -hg "$id"
> +			fi
> +		fi
> +
> +		# Are there uncommitted changes?
> +		# These are represented by + after the changeset id.
> +		case "$hgid" in
> +			*+|*+\ *) printf '%s' -dirty ;;
> +		esac
> +
> +		# All done with mercurial
> +		return
> +	fi
> +
> +	# Check for svn and a svn repo.
> +	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
> +		rev=`echo $rev | awk '{print $NF}'`
> +		printf -- '-svn%s' "$rev"
> +
> +		# All done with svn
> +		return
> +	fi
> +}
> +
> +collect_files()
> +{
> +	local file res=
> +
> +	for file; do
> +		case "$file" in
> +		*\~*)
> +			continue
> +			;;
> +		esac
> +		if test -e "$file"; then
> +			res="$res$(cat "$file")"
> +		fi
> +	done
> +	echo "$res"
> +}
> +
> +if $scm_only; then
> +	if test ! -e .scmversion; then
> +		res=$(scm_version)
> +		echo "$res" >.scmversion
> +	fi
> +	exit
> +fi
> +
> +if test -e include/config/auto.conf; then
> +	. include/config/auto.conf
> +else
> +	echo "Error: kernelrelease not valid - run 'make prepare' to update it" >&2
> +	exit 1
> +fi
> +
> +# localversion* files in the build and source directory
> +res="$(collect_files localversion*)"
> +if test ! "$srctree" -ef .; then
> +	res="$res$(collect_files "$srctree"/localversion*)"
> +fi
> +
> +# CONFIG_LOCALVERSION and LOCALVERSION (if set)
> +res="${res}${CONFIG_LOCALVERSION}${LOCALVERSION}"
> +
> +# scm version string if not at a tagged commit
> +if test "$CONFIG_LOCALVERSION_AUTO" = "y"; then
> +	# full scm version string
> +	res="$res$(scm_version)"
> +else
> +	# append a plus sign if the repository is not in a clean
> +	# annotated or signed tagged state (as git describe only
> +	# looks at signed or annotated tags - git tag -a/-s) and
> +	# LOCALVERSION= is not specified
> +	if test "${LOCALVERSION+set}" != "set"; then
> +		scm=$(scm_version --short)
> +		res="$res${scm:++}"
> +	fi
> +fi
> +
> +echo "$res"
> 


-- 
~Randy
