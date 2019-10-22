Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE5CE072D
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2019 17:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731220AbfJVPVc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Oct 2019 11:21:32 -0400
Received: from mx.ungleich.ch ([185.203.112.16]:34840 "EHLO smtp.ungleich.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731025AbfJVPVb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Oct 2019 11:21:31 -0400
Received: from diamond.localdomain (localhost [IPv6:::1])
        by smtp.ungleich.ch (Postfix) with ESMTP id 0FD86200BB;
        Tue, 22 Oct 2019 17:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
        t=1571757688; bh=vGinmf3HTVVLER3WLc/60TML/X0E8b0w9iv7eiQT9rI=;
        h=References:From:To:Cc:Subject:In-reply-to:Date:From;
        b=qMzMTks+ayJtBNgRARcZTYuX24+J107bgP7IIShNjnB+ZjiS2Pk/X99PbMMc7MaeZ
         u5RuSn+ttb7Mxyp/WtWkOQ33m0UJGJiVntm728IrmLYMEo3rOJNqEg0eVMBzN/QJiy
         v9JMRk9FHqyC0loZmXJndWY45ObQ1u0PhkZki+dwOADN+5D/cKJT6GYqr0rW1fvTOk
         r5qxFqVwKj39vuKSAALRyzxhvQHWuDtyt/4pTASbc4KLlREQGTnui/Zywjx8zXgQ0U
         9/g5cYHy8+RdwQwnTv97QBy8hczxCtCjSN7Q4b+0ohxT6U0TxtLfrf8Ewj+nhPfOaZ
         wMP6lUT0XH1LA==
Received: by diamond.localdomain (Postfix, from userid 1000)
        id 9F94313E2BB8; Tue, 22 Oct 2019 17:21:50 +0200 (CEST)
References: <20191016093246.20000-1-unixbhaskar@gmail.com> <87h848vrej.fsf@ungleich.ch> <20191022144602.GB28989@debian>
User-agent: mu4e 1.3.5; emacs 26.3
From:   Nico Schottelius <nico.schottelius@ungleich.ch>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] scripts: setlocalversion: replace backquote to dollar parenthesis
In-reply-to: <20191022144602.GB28989@debian>
Date:   Tue, 22 Oct 2019 17:21:50 +0200
Message-ID: <875zkg4xgx.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Acked-by confirmed from my side.

Best regards,

Nico

Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:

> On 13:52 Wed 16 Oct 2019, Nico Schottelius wrote:
>>
>>As $() is more robust than `` (no nesting possible),
>>I support this patch.
>>
> Hi Nico,
>
> Kindly provide the consent to use your support as Acked-by in the patch.
>
> Thanks,
> Bhaskar
>>
>>Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:
>>
>>> This patch replace backquote to dollar parenthesis syntax for better
>>> readability.
>>>
>>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>> ---
>>>  scripts/setlocalversion | 22 +++++++++++-----------
>>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/scripts/setlocalversion b/scripts/setlocalversion
>>> index 220dae0db3f1..b82a29bfc78a 100755
>>> --- a/scripts/setlocalversion
>>> +++ b/scripts/setlocalversion
>>> @@ -45,11 +45,11 @@ scm_version()
>>>
>>>  	# Check for git and a git repo.
>>>  	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
>>> -	   head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
>>> +		head=$(git rev-parse --verify --short HEAD 2>/dev/null); then
>>>
>>>  		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
>>>  		# it, because this version is defined in the top level Makefile.
>>> -		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
>>> +		if [ -z "$(git describe --exact-match 2>/dev/null)" ]; then
>>>
>>>  			# If only the short version is requested, don't bother
>>>  			# running further git commands
>>> @@ -59,7 +59,7 @@ scm_version()
>>>  			fi
>>>  			# If we are past a tagged commit (like
>>>  			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
>>> -			if atag="`git describe 2>/dev/null`"; then
>>> +			if atag="$(git describe 2>/dev/null)"; then
>>>  				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
>>>
>>>  			# If we don't have a tag at all we print -g{commitish}.
>>> @@ -70,7 +70,7 @@ scm_version()
>>>
>>>  		# Is this git on svn?
>>>  		if git config --get svn-remote.svn.url >/dev/null; then
>>> -			printf -- '-svn%s' "`git svn find-rev $head`"
>>> +			printf -- '-svn%s' "$(git svn find-rev $head)"
>>>  		fi
>>>
>>>  		# Check for uncommitted changes.
>>> @@ -91,15 +91,15 @@ scm_version()
>>>  	fi
>>>
>>>  	# Check for mercurial and a mercurial repo.
>>> -	if test -d .hg && hgid=`hg id 2>/dev/null`; then
>>> +	if test -d .hg && hgid=$(hg id 2>/dev/null); then
>>>  		# Do we have an tagged version?  If so, latesttagdistance == 1
>>> -		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
>>> -			id=`hg log -r . --template '{latesttag}'`
>>> +		if [ "$(hg log -r . --template '{latesttagdistance}')" == "1" ]; then
>>> +			id=$(hg log -r . --template '{latesttag}')
>>>  			printf '%s%s' -hg "$id"
>>>  		else
>>> -			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
>>> +			tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
>>>  			if [ -z "$tag" -o "$tag" = tip ]; then
>>> -				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
>>> +				id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
>>>  				printf '%s%s' -hg "$id"
>>>  			fi
>>>  		fi
>>> @@ -115,8 +115,8 @@ scm_version()
>>>  	fi
>>>
>>>  	# Check for svn and a svn repo.
>>> -	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
>>> -		rev=`echo $rev | awk '{print $NF}'`
>>> +	if rev=$(LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
>>> +		rev=$(echo $rev | awk '{print $NF}')
>>>  		printf -- '-svn%s' "$rev"
>>>
>>>  		# All done with svn
>>
>>
>>--
>>Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch


--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
