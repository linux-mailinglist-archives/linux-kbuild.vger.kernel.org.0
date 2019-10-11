Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84EBED3876
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2019 06:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfJKE25 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 00:28:57 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42797 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfJKE24 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 00:28:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id q12so5276789pff.9
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2019 21:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VY4VJ/gm1IhEgvt192a7inBKLtQvf0GFj/9M1nKu+ks=;
        b=P/0W9Qa3fJfIsacWhZEHAEzcbhc9K0X7ngXmd9DjcSGs0JAYXTqMV9UY2chPLMRiqD
         CmeKADIwYXs0wPclhcpwtpndJQ02RdFAwmhywPFklVgknfWH5HDDUasgO3wuZJElU6oi
         475SZ3iIYNW0XL768euDpxSB5LWWzt4zCLSGCtRppyFhZN+GRAx7otROGEqYj2TaugxC
         CX1iEZ3eiS5NTTW79UrKB3yH9ArhLN3bV50/uTiBDtFuFshtxd+HwYjcJx6cYOksUNAo
         jBbyBcnKWRR2o42V/byIsE5zfxFoqPvPAOClJrggmBjKBq3Z/FZIn11lO+/iUYpODsT9
         eSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VY4VJ/gm1IhEgvt192a7inBKLtQvf0GFj/9M1nKu+ks=;
        b=tLBBgAQvi/1jlzYwQ7jA1u1OSSEfvb2Vv7zAC9bdLrf1CioA8O5t1zSCxYsMsPOuQp
         VdB51CIvPmWTHK99MNfO6B0y8HbzfB09IToF+l8nzHTQMCVs+AU8V0ZBCp+ug9oPbJN2
         vsjk4yWvSgSA90qkGHJg5K0ctNRGY14aa8hnrx8dcJUrTv8b0lw/RZgwW5WYGT3EX3dw
         z+DNMKuPOPy8bmGeUix2Aq4stwkYWNXSmHttlUZGNgJcIeLt/C+bgTw+xIbweqO58tP/
         jNtracCbqMLn9d0jBRbhBJvTcH+esBPI0mbkNEwbcSIu3ofhbZ2ZixdqhIwaNtANNwaM
         061A==
X-Gm-Message-State: APjAAAWs4u+xLmi+X4ejph+ZuPzE52k4H4D2aZhF+BAj6Y8VNlEyDBHC
        0Muz2ZlVF9SMRpd3o4+/m810JyE20LWChg==
X-Google-Smtp-Source: APXvYqwis4/CUMovb+ErMKcy2xxe1ybQgSqR65QTOvXUrXCAwPipfco4MbzdWT5STW9yBgfmCPx52w==
X-Received: by 2002:aa7:96a9:: with SMTP id g9mr14180771pfk.147.1570768133793;
        Thu, 10 Oct 2019 21:28:53 -0700 (PDT)
Received: from Gentoo ([103.231.91.69])
        by smtp.gmail.com with ESMTPSA id w7sm5658060pjn.1.2019.10.10.21.28.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 21:28:52 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:58:43 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Modern Bash syntax, replace backquote to dollar
 parenthesis
Message-ID: <20191011042840.GA11550@Gentoo>
References: <yamada.masahiro@socionext.com,michal.lkml@markovi.net,linux-kbuild@vger.kernel.org>
 <20191011021759.28960-1-unixbhaskar@gmail.com>
 <369b1248-fd80-11e2-d879-d5943f9659f4@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <369b1248-fd80-11e2-d879-d5943f9659f4@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20:04 Thu 10 Oct 2019, Randy Dunlap wrote:
>On 10/10/19 7:17 PM, Bhaskar Chowdhury wrote:
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  setlocalversion | 183 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 183 insertions(+)
>>  create mode 100755 setlocalversion
>
>Hi,
>I'm pretty sure something is mucked up here.
>
>> diff --git a/setlocalversion b/setlocalversion
>
>but this isn't a diff between those 2 files.
>
>And this diff should be from the top level of the kernel source tree, so it
>should be a diff between a/scripts/setlocalversion and b/scripts/setlocalv=
ersion.
>
Right. I have move the original file to top level dir then ...
>> new file mode 100755
>
>There is already a file scripts/setlocalversion, so this "new file" is str=
ange.
>
It is indeed..because of my stupidity ..as I said removed that file and
made the patch...heck

>Also, the patch subject should be something like:
>[PATCH] scripts: fix shell syntax
>
Doesn't the subject catch it from commit message??=20

>And note that the shell in this case is /bin/sh, not necessarily bash.
>Actually we prefer to make patches that remove bashisms in many cases.
>
Do you want me drop this one ? Can you be specific Randy, please, if it
is not what is need , no point wasting time on it.
>One more:  you should Cc: the kbuild maintainer on patches that he might a=
pply/merge.
>

I did , I believe ..both the maintainers .
>Thanks.
>
>> index 000000000000..220dae0db3f1
>> --- /dev/null
>> +++ b/setlocalversion
>> @@ -0,0 +1,183 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# This scripts adds local version information from the version
>> +# control systems git, mercurial (hg) and subversion (svn).
>> +#
>> +# If something goes wrong, send a mail the kernel build mailinglist
>> +# (see MAINTAINERS) and CC Nico Schottelius
>> +# <nico-linuxsetlocalversion -at- schottelius.org>.
>> +#
>> +#
>> +
>> +usage() {
>> +	echo "Usage: $0 [--save-scmversion] [srctree]" >&2
>> +	exit 1
>> +}
>> +
>> +scm_only=3Dfalse
>> +srctree=3D.
>> +if test "$1" =3D "--save-scmversion"; then
>> +	scm_only=3Dtrue
>> +	shift
>> +fi
>> +if test $# -gt 0; then
>> +	srctree=3D$1
>> +	shift
>> +fi
>> +if test $# -gt 0 -o ! -d "$srctree"; then
>> +	usage
>> +fi
>> +
>> +scm_version()
>> +{
>> +	local short
>> +	short=3Dfalse
>> +
>> +	cd "$srctree"
>> +	if test -e .scmversion; then
>> +		cat .scmversion
>> +		return
>> +	fi
>> +	if test "$1" =3D "--short"; then
>> +		short=3Dtrue
>> +	fi
>> +
>> +	# Check for git and a git repo.
>> +	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
>> +	   head=3D`git rev-parse --verify --short HEAD 2>/dev/null`; then
>> +
>> +		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
>> +		# it, because this version is defined in the top level Makefile.
>> +		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
>> +
>> +			# If only the short version is requested, don't bother
>> +			# running further git commands
>> +			if $short; then
>> +				echo "+"
>> +				return
>> +			fi
>> +			# If we are past a tagged commit (like
>> +			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
>> +			if atag=3D"`git describe 2>/dev/null`"; then
>> +				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
>> +
>> +			# If we don't have a tag at all we print -g{commitish}.
>> +			else
>> +				printf '%s%s' -g $head
>> +			fi
>> +		fi
>> +
>> +		# Is this git on svn?
>> +		if git config --get svn-remote.svn.url >/dev/null; then
>> +			printf -- '-svn%s' "`git svn find-rev $head`"
>> +		fi
>> +
>> +		# Check for uncommitted changes.
>> +		# First, with git-status, but --no-optional-locks is only
>> +		# supported in git >=3D 2.14, so fall back to git-diff-index if
>> +		# it fails. Note that git-diff-index does not refresh the
>> +		# index, so it may give misleading results. See
>> +		# git-update-index(1), git-diff-index(1), and git-status(1).
>> +		if {
>> +			git --no-optional-locks status -uno --porcelain 2>/dev/null ||
>> +			git diff-index --name-only HEAD
>> +		} | grep -qvE '^(.. )?scripts/package'; then
>> +			printf '%s' -dirty
>> +		fi
>> +
>> +		# All done with git
>> +		return
>> +	fi
>> +
>> +	# Check for mercurial and a mercurial repo.
>> +	if test -d .hg && hgid=3D`hg id 2>/dev/null`; then
>> +		# Do we have an tagged version?  If so, latesttagdistance =3D=3D 1
>> +		if [ "`hg log -r . --template '{latesttagdistance}'`" =3D=3D "1" ]; t=
hen
>> +			id=3D`hg log -r . --template '{latesttag}'`
>> +			printf '%s%s' -hg "$id"
>> +		else
>> +			tag=3D`printf '%s' "$hgid" | cut -d' ' -f2`
>> +			if [ -z "$tag" -o "$tag" =3D tip ]; then
>> +				id=3D`printf '%s' "$hgid" | sed 's/[+ ].*//'`
>> +				printf '%s%s' -hg "$id"
>> +			fi
>> +		fi
>> +
>> +		# Are there uncommitted changes?
>> +		# These are represented by + after the changeset id.
>> +		case "$hgid" in
>> +			*+|*+\ *) printf '%s' -dirty ;;
>> +		esac
>> +
>> +		# All done with mercurial
>> +		return
>> +	fi
>> +
>> +	# Check for svn and a svn repo.
>> +	if rev=3D`LANG=3D LC_ALL=3D LC_MESSAGES=3DC svn info 2>/dev/null | gre=
p '^Last Changed Rev'`; then
>> +		rev=3D`echo $rev | awk '{print $NF}'`
>> +		printf -- '-svn%s' "$rev"
>> +
>> +		# All done with svn
>> +		return
>> +	fi
>> +}
>> +
>> +collect_files()
>> +{
>> +	local file res=3D
>> +
>> +	for file; do
>> +		case "$file" in
>> +		*\~*)
>> +			continue
>> +			;;
>> +		esac
>> +		if test -e "$file"; then
>> +			res=3D"$res$(cat "$file")"
>> +		fi
>> +	done
>> +	echo "$res"
>> +}
>> +
>> +if $scm_only; then
>> +	if test ! -e .scmversion; then
>> +		res=3D$(scm_version)
>> +		echo "$res" >.scmversion
>> +	fi
>> +	exit
>> +fi
>> +
>> +if test -e include/config/auto.conf; then
>> +	. include/config/auto.conf
>> +else
>> +	echo "Error: kernelrelease not valid - run 'make prepare' to update it=
" >&2
>> +	exit 1
>> +fi
>> +
>> +# localversion* files in the build and source directory
>> +res=3D"$(collect_files localversion*)"
>> +if test ! "$srctree" -ef .; then
>> +	res=3D"$res$(collect_files "$srctree"/localversion*)"
>> +fi
>> +
>> +# CONFIG_LOCALVERSION and LOCALVERSION (if set)
>> +res=3D"${res}${CONFIG_LOCALVERSION}${LOCALVERSION}"
>> +
>> +# scm version string if not at a tagged commit
>> +if test "$CONFIG_LOCALVERSION_AUTO" =3D "y"; then
>> +	# full scm version string
>> +	res=3D"$res$(scm_version)"
>> +else
>> +	# append a plus sign if the repository is not in a clean
>> +	# annotated or signed tagged state (as git describe only
>> +	# looks at signed or annotated tags - git tag -a/-s) and
>> +	# LOCALVERSION=3D is not specified
>> +	if test "${LOCALVERSION+set}" !=3D "set"; then
>> +		scm=3D$(scm_version --short)
>> +		res=3D"$res${scm:++}"
>> +	fi
>> +fi
>> +
>> +echo "$res"
>>
>
>
>--=20
>~Randy

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2gBO4ACgkQsjqdtxFL
KRWUqggAzXSXukSugooptYTzsh/pVUbp9QfBko5KyY/Aadj+5slUjotpePhRQK4n
GpML26dxEwkBz0czm2FhvKe7In4ZJu3GYB+oYAbXsksWN2s4gM7VaCTy1Pjdbw06
Dnkr7Wffka585G5vrDpmtsV5Gn3pq97jSAd5IdB5trtFD5lkxuAZgsVBZGgnlrcL
m9PD/oCCZRfMwoCfi6jgpfbUgBiidQeRX7LhCfJrdbXv4uua/hoEKafKu+tOqUoK
chEIPblhdBbnmGLZFZ/pUb4Z0TFu6D+p8H53Qn60aO1JY2iwznlWarxiFNRckjmL
Cqdqgg/DVpLF0/2Jz1dI85olT4CXNw==
=Sv9E
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
