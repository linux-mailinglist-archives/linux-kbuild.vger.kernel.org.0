Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6F4D4A7D
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2019 00:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfJKW5s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 18:57:48 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36101 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbfJKW5s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 18:57:48 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so6918548pfr.3
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Oct 2019 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Gk4zjpVRD8fFyE4qoFHFYsk3gZUIIVfevaypGZU1wPw=;
        b=CIUbbQYirhimksKWIG2NMx2oPNbuldcTxsePFqIAf0G/i7Pv9efroz/CWuGV7ZSfb9
         /YN38L+CcWE4fWuuZCBoQoS0GTdzmisRi+9rPXDaU2SBTIRtYZB7uqadvZC/Z8UA099G
         wfExAs0fYKqhQCJHR0XGXGNre7JqWH+rj3U3tG2IxgyBqS765AchNGw4xq2NmocuI7wc
         ZRFvxkkJnS6jI14vPatvRRqBixlZMuEOB5V6eXPAEvUUzkE3TASUFdR1zDqhVY/JvLQy
         2IGOFZj3iino5LVloWBgwG63Gg/XZhz8p8m6j9reW2lF7/lQSeYwIZMl1LIGrauhRQ1E
         wHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gk4zjpVRD8fFyE4qoFHFYsk3gZUIIVfevaypGZU1wPw=;
        b=R9Nx+ohkxAY3SYNVNUywwobSxIhszMKUZPyxHzymix6ZUMa2jCsOrmEZigi1gsPam7
         QSP7HXows2Yefpi+ddVlIh49IUiQ4ldMun6tsi3oqBqSip5nExilxdtoKo4SOhDYq9vA
         +0H5V6ot/vIKE3ZT9ihJ7N86si4LvjMETQpARK5Wb7uVeaXReIZo66o3itiQEF0Q+hWx
         WRaAqg26sdN833MrQFor7b0XzsbbYlhoK8g58wr7szG0N+ZK3LGNM/ZsUmrx7tPVCr5P
         dOmImtUD/dS6P5HWQmTSjblcM9lcb5Z2DQgCzfNtJqCPJjTPhFKwp3gLWq682aZXCVJY
         GLjw==
X-Gm-Message-State: APjAAAVkU12QsBL7DRTPwHbfy3rtVsx7ibsC55hU1OiMu6ZzdMdglpUw
        XQ1bg88IkBlRtfLqUtRaQ/A=
X-Google-Smtp-Source: APXvYqw1nS6nE5vBRrewV/EGSTjJpxggZGMakKL9zdhyo3Zw85xX8CAkKjmYiW54sZ0mIL5tR3HYFw==
X-Received: by 2002:a62:a50b:: with SMTP id v11mr19063606pfm.164.1570834667014;
        Fri, 11 Oct 2019 15:57:47 -0700 (PDT)
Received: from Gentoo ([103.231.91.68])
        by smtp.gmail.com with ESMTPSA id d76sm10619252pfd.185.2019.10.11.15.57.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 15:57:46 -0700 (PDT)
Date:   Sat, 12 Oct 2019 04:27:33 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: Re: [PATCH] fix shell syntax
Message-ID: <20191011225730.GA25079@Gentoo>
References: <20191011070539.25908-1-unixbhaskar@gmail.com>
 <e9a4a63c-954d-6437-0a79-323e88ef637c@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <e9a4a63c-954d-6437-0a79-323e88ef637c@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15:38 Fri 11 Oct 2019, Randy Dunlap wrote:
>Hi Bhaskar,
>
>1- the Subject line is incomplete, missing some info: e.g.
>    [PATCH] scripts: setlocalversion: fix shell syntax
>
Oops! let me redo it, I was going by your earlier suggestion :)
>
>On 10/11/19 12:05 AM, Bhaskar Chowdhury wrote:
>
>2- at this place, there should be a description of how the patch
>"fixes" the shell syntax.  and why.
>

My bad, was kinda confused,thought it might break the patch..lack of
awareness. Will fix that next one.
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/setlocalversion | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/scripts/setlocalversion b/scripts/setlocalversion
>> index 220dae0db3f1..b82a29bfc78a 100755
>> --- a/scripts/setlocalversion
>> +++ b/scripts/setlocalversion
>> @@ -45,11 +45,11 @@ scm_version()
>>
>>  	# Check for git and a git repo.
>>  	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
>> -	   head=3D`git rev-parse --verify --short HEAD 2>/dev/null`; then
>> +		head=3D$(git rev-parse --verify --short HEAD 2>/dev/null); then
>
>3- That indentation change is not good IMO.
>
Heck...another fix ...I am gobbling up your and others precious time
with this trivialities. Will be careful .

>4- The patch does seem to work, in my limited testing.
>
I made sure before sending anything , that thing should work in my local
environment. Thank you for the double check ...at least I am inline :)

>5- Near the beginning of the script, it seems to say that the author
>would like to be Cc:ed on patches.
>
Curse me for ignoring that...not fun ..why the fuck I missed that I
don't know...
>>
>>  		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
>>  		# it, because this version is defined in the top level Makefile.
>> -		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
>> +		if [ -z "$(git describe --exact-match 2>/dev/null)" ]; then
>>
>>  			# If only the short version is requested, don't bother
>>  			# running further git commands
>> @@ -59,7 +59,7 @@ scm_version()
>>  			fi
>>  			# If we are past a tagged commit (like
>>  			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
>> -			if atag=3D"`git describe 2>/dev/null`"; then
>> +			if atag=3D"$(git describe 2>/dev/null)"; then
>>  				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
>>
>>  			# If we don't have a tag at all we print -g{commitish}.
>> @@ -70,7 +70,7 @@ scm_version()
>>
>>  		# Is this git on svn?
>>  		if git config --get svn-remote.svn.url >/dev/null; then
>> -			printf -- '-svn%s' "`git svn find-rev $head`"
>> +			printf -- '-svn%s' "$(git svn find-rev $head)"
>>  		fi
>>
>>  		# Check for uncommitted changes.
>> @@ -91,15 +91,15 @@ scm_version()
>>  	fi
>>
>>  	# Check for mercurial and a mercurial repo.
>> -	if test -d .hg && hgid=3D`hg id 2>/dev/null`; then
>> +	if test -d .hg && hgid=3D$(hg id 2>/dev/null); then
>>  		# Do we have an tagged version?  If so, latesttagdistance =3D=3D 1
>> -		if [ "`hg log -r . --template '{latesttagdistance}'`" =3D=3D "1" ]; t=
hen
>> -			id=3D`hg log -r . --template '{latesttag}'`
>> +		if [ "$(hg log -r . --template '{latesttagdistance}')" =3D=3D "1" ]; =
then
>> +			id=3D$(hg log -r . --template '{latesttag}')
>>  			printf '%s%s' -hg "$id"
>>  		else
>> -			tag=3D`printf '%s' "$hgid" | cut -d' ' -f2`
>> +			tag=3D$(printf '%s' "$hgid" | cut -d' ' -f2)
>>  			if [ -z "$tag" -o "$tag" =3D tip ]; then
>> -				id=3D`printf '%s' "$hgid" | sed 's/[+ ].*//'`
>> +				id=3D$(printf '%s' "$hgid" | sed 's/[+ ].*//')
>>  				printf '%s%s' -hg "$id"
>>  			fi
>>  		fi
>> @@ -115,8 +115,8 @@ scm_version()
>>  	fi
>>
>>  	# Check for svn and a svn repo.
>> -	if rev=3D`LANG=3D LC_ALL=3D LC_MESSAGES=3DC svn info 2>/dev/null | gre=
p '^Last Changed Rev'`; then
>> -		rev=3D`echo $rev | awk '{print $NF}'`
>> +	if rev=3D$(LANG=3D LC_ALL=3D LC_MESSAGES=3DC svn info 2>/dev/null | gr=
ep '^Last Changed Rev'); then
>> +		rev=3D$(echo $rev | awk '{print $NF}')
>>  		printf -- '-svn%s' "$rev"
>>
>>  		# All done with svn
>>
>

Thank you so much for your invaluable time Randy...will be sending
another one with the correction.

Thanks,
Bhaskar
>Thanks.
>--=20
>~Randy

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2hCNcACgkQsjqdtxFL
KRV6pwgAmYkb2rRsXeLToD4sdpE/LieGahcAXdFWey4vMmTOsg8QUz4jAE9xWrH2
QIzzX+cCLn0erAnbA2rjB+Ev0PhndJ2JK31M2mcRFqyKyyP4AiDB4QMW6G3eoa0R
BcBYjtxAFiRkoI95ao4DP8TsT++BI4aY0kWtn4yWdMkAP0nbeuaTzmQT2pSxqWgd
hRYlChrej2+2b3JB1jjYU2/s7uCgrRCz/PiAi7tBxN98my4qfwrq/cswKEKyYCDV
kHr7/j5MtGGyiEwDUnzIJG3qtO6uHvmDtnjGODTaONPEc5UI8lWOZa3CYM/xy51J
tTAxemWPwWQasJIgCwmVzsDyUhUv5A==
=FEeY
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
