Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02ADE0701
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2019 17:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732197AbfJVPG2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Oct 2019 11:06:28 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45386 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfJVPG2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Oct 2019 11:06:28 -0400
Received: by mail-pg1-f195.google.com with SMTP id r1so10107250pgj.12
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2019 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dmdfD8oBJ8bXSCag+b6c/4PUgWzE7eBOU9SXxAzqnZY=;
        b=pv9vn/o2LsEpWoxR+e6eHaPPYTPdG3+sr3GWmoXDuL3O5F6WP0eOG/gHJqdLz6w4oe
         bnw5RkIgajtD4HHApJBq3p0AOAn+i5CLximNrOKX7BC+dBbfHPQpt9v1gj9WKyLmpa43
         j2xQ5uHKdsBidJ0L0ZCMZeJuxYSX42IfN0zM7n29KG1bYzWwJp3HfSToibeXa9A1BwsS
         zPqXpgarwUsSdIFhMc6ZDo4I6zPenqmAlpj35wXDb2Vcwdj5DeXa+aAR9/RffqMc3nLd
         vYO/FuMPcc9dlikDsGRiY7LMtEsCuEwBI+Mbm176jb1q9B9volO1U8JWuQd7uNtwq8YN
         N8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dmdfD8oBJ8bXSCag+b6c/4PUgWzE7eBOU9SXxAzqnZY=;
        b=KM6nWpTNckMaOmWIPGRO61C5ClbEeDEqDXe1nJUs1hVY/2X+YMbcxIJ3uTO6Ur3LvN
         Z679wJ7nnMa35x4EkxME2oYCkJopB8DU1I5TR8TnL23EFl2/QZqcJUf3ZsCWMHcuVLhp
         XHsVmcH7oEQv/WM4USo5hVq6EGSDhmP8pLDq6yxmoddvs1I9MynQ5PY2s5iHUAPIyGxv
         DUdL7M8ZO+GaVbzkrCVcdqDaacaV+M2NWBkJ2shI/MXAt/KCCzkOnY582Vk3CD0ZYrGf
         npAlixks87+++c9iju3osukjIoz0tqXwh7FkoL6eUB7uepUwNMmKpF+yRF4nvSHzGT7j
         Kk5A==
X-Gm-Message-State: APjAAAV0vjXDXdYJcuDkoHdGaqI6v7c4eVDCcxDcdksBFYFpj4ZyxZMT
        hskI1Ac0yoxX1YMS8Fsq1AA=
X-Google-Smtp-Source: APXvYqwonqwLfHfSDnoiAWp6tNRTtdSpDF8ODjGJpNt94lQwOz8dYQsaKJ3pKNa6h8spLoJ6/wi7sA==
X-Received: by 2002:a65:689a:: with SMTP id e26mr4306018pgt.346.1571756786965;
        Tue, 22 Oct 2019 08:06:26 -0700 (PDT)
Received: from debian ([103.231.90.173])
        by smtp.gmail.com with ESMTPSA id u11sm25462067pgo.65.2019.10.22.08.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 08:06:25 -0700 (PDT)
Date:   Tue, 22 Oct 2019 20:36:15 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] scripts: setlocalversion: replace backquote to dollar
 parenthesis
Message-ID: <20191022144602.GB28989@debian>
References: <20191016093246.20000-1-unixbhaskar@gmail.com>
 <87h848vrej.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline
In-Reply-To: <87h848vrej.fsf@ungleich.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 13:52 Wed 16 Oct 2019, Nico Schottelius wrote:
>
>As $() is more robust than `` (no nesting possible),
>I support this patch.
>
Hi Nico,

Kindly provide the consent to use your support as Acked-by in the patch.

Thanks,
Bhaskar
>
>Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:
>
>> This patch replace backquote to dollar parenthesis syntax for better
>> readability.
>>
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
>> -	   head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
>> +		head=$(git rev-parse --verify --short HEAD 2>/dev/null); then
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
>> -			if atag="`git describe 2>/dev/null`"; then
>> +			if atag="$(git describe 2>/dev/null)"; then
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
>> -	if test -d .hg && hgid=`hg id 2>/dev/null`; then
>> +	if test -d .hg && hgid=$(hg id 2>/dev/null); then
>>  		# Do we have an tagged version?  If so, latesttagdistance == 1
>> -		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
>> -			id=`hg log -r . --template '{latesttag}'`
>> +		if [ "$(hg log -r . --template '{latesttagdistance}')" == "1" ]; then
>> +			id=$(hg log -r . --template '{latesttag}')
>>  			printf '%s%s' -hg "$id"
>>  		else
>> -			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
>> +			tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
>>  			if [ -z "$tag" -o "$tag" = tip ]; then
>> -				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
>> +				id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
>>  				printf '%s%s' -hg "$id"
>>  			fi
>>  		fi
>> @@ -115,8 +115,8 @@ scm_version()
>>  	fi
>>
>>  	# Check for svn and a svn repo.
>> -	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
>> -		rev=`echo $rev | awk '{print $NF}'`
>> +	if rev=$(LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
>> +		rev=$(echo $rev | awk '{print $NF}')
>>  		printf -- '-svn%s' "$rev"
>>
>>  		# All done with svn
>
>
>--
>Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2vGuAACgkQsjqdtxFL
KRUSxwgApmVkT8yauIK7CY2iNZfVCcAYVgm4sILAL/uDZnF9cFaExmDv1SWpfY1d
GtfWMYTk0muVi2fsX4dqylUeWqdL66PGJDX1wePAsVG7+tMNg67LPM5nE3V1rLjV
TMcaShaS5mXvOr21R2GqfnhtXCpOhqLykDZUaEb0JJhI+IenW4cCkT5RKrnlmqxR
iFex1HbtYRSQ8BcqFx4tCAuvCQ4e0KU7QfngIGarHq4miNqDrNiK03RnKIqlHir1
sQP+2gpqqncmhhXW8RjSiMXIJn6F/6HNuCO0R7+/9qK+3xY1SbJjWVDI9kJjaAB+
rG13kzj347AsOq6ndt0IB4E3oG7WIg==
=LX39
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
