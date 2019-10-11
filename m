Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C38FD4A6C
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2019 00:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfJKWiQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 18:38:16 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60240 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfJKWiQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 18:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BGXFkV1G+i7gDMgQQFrP+fGdyRlBi0CXFz2JBNuUpRc=; b=s1pbxNe7/HVbfmcBr3O9LwonO
        rLyQim38Z0JiB8rmogVYZR9DEryWeqw7FiZKaqtYRlZDgNEQGqtSEOxcvlzx5RzKVaS+HS9ivjaUD
        bd5PaaIEtqwb6OZ1WaYuMpiVQa55sS5zyh6ULAlZ07V9GX+xdrF5bfE1QhR1rG9l0XxkJ801QcwMS
        DuywN67E1A+zNMMOLSTzFl6AeHgCjzu2txjOXDQk2GQty6sMEuOO8oZa+itm4+822m0CmqTHJToFx
        utd/UTKRw5iUJJV2YTJA6ucuSBy7c3yv1la4ebY1uhm3Tbrg9sug1kR7ngi8TqYsgxm7ZUf+Po94U
        hhInvSqfQ==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iJ3Y6-0003Ad-Pd; Fri, 11 Oct 2019 22:38:14 +0000
Subject: Re: [PATCH] fix shell syntax
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
References: <linux-kbuild@vger.kernel.org , yamada.masahiro@socionext.com ,
 michal.lkml@markovi.net> <20191011070539.25908-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e9a4a63c-954d-6437-0a79-323e88ef637c@infradead.org>
Date:   Fri, 11 Oct 2019 15:38:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191011070539.25908-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Bhaskar,

1- the Subject line is incomplete, missing some info: e.g.
    [PATCH] scripts: setlocalversion: fix shell syntax



On 10/11/19 12:05 AM, Bhaskar Chowdhury wrote:

2- at this place, there should be a description of how the patch
"fixes" the shell syntax.  and why.

> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/setlocalversion | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/setlocalversion b/scripts/setlocalversion
> index 220dae0db3f1..b82a29bfc78a 100755
> --- a/scripts/setlocalversion
> +++ b/scripts/setlocalversion
> @@ -45,11 +45,11 @@ scm_version()
>  
>  	# Check for git and a git repo.
>  	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
> -	   head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
> +		head=$(git rev-parse --verify --short HEAD 2>/dev/null); then

3- That indentation change is not good IMO.

4- The patch does seem to work, in my limited testing.

5- Near the beginning of the script, it seems to say that the author
would like to be Cc:ed on patches.

>  
>  		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
>  		# it, because this version is defined in the top level Makefile.
> -		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
> +		if [ -z "$(git describe --exact-match 2>/dev/null)" ]; then
>  
>  			# If only the short version is requested, don't bother
>  			# running further git commands
> @@ -59,7 +59,7 @@ scm_version()
>  			fi
>  			# If we are past a tagged commit (like
>  			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
> -			if atag="`git describe 2>/dev/null`"; then
> +			if atag="$(git describe 2>/dev/null)"; then
>  				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
>  
>  			# If we don't have a tag at all we print -g{commitish}.
> @@ -70,7 +70,7 @@ scm_version()
>  
>  		# Is this git on svn?
>  		if git config --get svn-remote.svn.url >/dev/null; then
> -			printf -- '-svn%s' "`git svn find-rev $head`"
> +			printf -- '-svn%s' "$(git svn find-rev $head)"
>  		fi
>  
>  		# Check for uncommitted changes.
> @@ -91,15 +91,15 @@ scm_version()
>  	fi
>  
>  	# Check for mercurial and a mercurial repo.
> -	if test -d .hg && hgid=`hg id 2>/dev/null`; then
> +	if test -d .hg && hgid=$(hg id 2>/dev/null); then
>  		# Do we have an tagged version?  If so, latesttagdistance == 1
> -		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
> -			id=`hg log -r . --template '{latesttag}'`
> +		if [ "$(hg log -r . --template '{latesttagdistance}')" == "1" ]; then
> +			id=$(hg log -r . --template '{latesttag}')
>  			printf '%s%s' -hg "$id"
>  		else
> -			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
> +			tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
>  			if [ -z "$tag" -o "$tag" = tip ]; then
> -				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
> +				id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
>  				printf '%s%s' -hg "$id"
>  			fi
>  		fi
> @@ -115,8 +115,8 @@ scm_version()
>  	fi
>  
>  	# Check for svn and a svn repo.
> -	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
> -		rev=`echo $rev | awk '{print $NF}'`
> +	if rev=$(LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
> +		rev=$(echo $rev | awk '{print $NF}')
>  		printf -- '-svn%s' "$rev"
>  
>  		# All done with svn
> 

Thanks.
-- 
~Randy
