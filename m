Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67062D85F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2019 04:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388284AbfJPCiC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Oct 2019 22:38:02 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:36857 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729087AbfJPCiB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 22:38:01 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x9G2bvjE003202
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 11:37:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x9G2bvjE003202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571193478;
        bh=UodyNJvnWbFeQsREuWQJ1Gw2fjd0qicT6SgiHx1PZus=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Oer9s3oQMqbydx3tsnpFgJvSot+iUERwqpIEh7znGzNVxnyL0n4BXfOpi1CVH5pFv
         cCQp4Ngl281wW4VTIwAgdyXx3bLqu8dawBeELetZO+8Di4ET0pQNbI8xcXbNa14eQM
         MdUBhdvM2nnDfvNenUc8YGaWmbb+hlXDAF+a5TZlFq8wfMweimtHxuuK+zCJbCVjUM
         lcWNTzlBShScj85134MCwK6mwjoBMJTuy8hDkMgq2CLgKvh2RfxRcL/bKAzuN0/1dF
         x14MpUqUncUN4DIVvx1jtGCgErc0lIHbVi9zF0jFBt4gvYUWTv57arTf3funDoVXks
         HofK3VfAHyGrQ==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id l2so14562774vsr.8
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2019 19:37:57 -0700 (PDT)
X-Gm-Message-State: APjAAAVx5e6oSV1QQPOgwpjip/smtXwLNQSp1W9fHVi7A89aMNsTUCHv
        42QBF/orFZCK0Gulb9frsjDFoVFJjPFZ5AM+LnA=
X-Google-Smtp-Source: APXvYqx6iCDHaABF8DAuk1UtdTJJkm/dcSLcPV+JidD5h1ZWFLnzPvnf1MdrbQL2kQUynN2/phVyIkrn4am8DoedbTI=
X-Received: by 2002:a05:6102:97:: with SMTP id t23mr22708469vsp.179.1571193476472;
 Tue, 15 Oct 2019 19:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191012045328.24443-1-unixbhaskar@gmail.com>
In-Reply-To: <20191012045328.24443-1-unixbhaskar@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 16 Oct 2019 11:37:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQGLX+Z5Ti3LBWsDQ7yz4isL=J6Vwj9N2Ag4dk1HN9N9w@mail.gmail.com>
Message-ID: <CAK7LNAQGLX+Z5Ti3LBWsDQ7yz4isL=J6Vwj9N2Ag4dk1HN9N9w@mail.gmail.com>
Subject: Re: [PATCH] scripts: setlocalversion: fix shell syntax
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Bhaskar,


I think the commit subject "scripts: setlocalversion: fix shell syntax"
is strange. This patch does not fix any bug.
`some_command` works as well as $(some-command)


Please describe "what this commit does" in the commit subject,
and "why this change is needed" in the commit description.


An example of the subject would be:

scripts: setlocalversion: replace backquote to dollar parenthesis


An example of the commit description might be:

This commit improves the code readability.





On Sat, Oct 12, 2019 at 1:54 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> This patch replace backquote to dollar parenthesis.
>
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
>         # Check for git and a git repo.
>         if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
> -          head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
> +               head=$(git rev-parse --verify --short HEAD 2>/dev/null); then

This line is fine as-is.




>                 # If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
>                 # it, because this version is defined in the top level Makefile.
> -               if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
> +               if [ -z "$(git describe --exact-match 2>/dev/null)" ]; then
>
>                         # If only the short version is requested, don't bother
>                         # running further git commands
> @@ -59,7 +59,7 @@ scm_version()
>                         fi
>                         # If we are past a tagged commit (like
>                         # "v2.6.30-rc5-302-g72357d5"), we pretty print it.
> -                       if atag="`git describe 2>/dev/null`"; then
> +                       if atag="$(git describe 2>/dev/null)"; then
>                                 echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
>
>                         # If we don't have a tag at all we print -g{commitish}.
> @@ -70,7 +70,7 @@ scm_version()
>
>                 # Is this git on svn?
>                 if git config --get svn-remote.svn.url >/dev/null; then
> -                       printf -- '-svn%s' "`git svn find-rev $head`"
> +                       printf -- '-svn%s' "$(git svn find-rev $head)"
>                 fi
>
>                 # Check for uncommitted changes.
> @@ -91,15 +91,15 @@ scm_version()
>         fi
>
>         # Check for mercurial and a mercurial repo.
> -       if test -d .hg && hgid=`hg id 2>/dev/null`; then
> +       if test -d .hg && hgid=$(hg id 2>/dev/null); then
>                 # Do we have an tagged version?  If so, latesttagdistance == 1
> -               if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
> -                       id=`hg log -r . --template '{latesttag}'`
> +               if [ "$(hg log -r . --template '{latesttagdistance}')" == "1" ]; then
> +                       id=$(hg log -r . --template '{latesttag}')
>                         printf '%s%s' -hg "$id"
>                 else
> -                       tag=`printf '%s' "$hgid" | cut -d' ' -f2`
> +                       tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
>                         if [ -z "$tag" -o "$tag" = tip ]; then
> -                               id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
> +                               id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
>                                 printf '%s%s' -hg "$id"
>                         fi
>                 fi
> @@ -115,8 +115,8 @@ scm_version()
>         fi
>
>         # Check for svn and a svn repo.
> -       if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
> -               rev=`echo $rev | awk '{print $NF}'`
> +       if rev=$(LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
> +               rev=$(echo $rev | awk '{print $NF}')
>                 printf -- '-svn%s' "$rev"
>
>                 # All done with svn
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
