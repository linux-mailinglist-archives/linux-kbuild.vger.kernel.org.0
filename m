Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2CE0F0DAB
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 05:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731207AbfKFEQc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 23:16:32 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:33463 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbfKFEQc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 23:16:32 -0500
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id xA64GQDP008203;
        Wed, 6 Nov 2019 13:16:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com xA64GQDP008203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573013787;
        bh=oq2kVTgJnhwHzQg6FYk0N33Gkp9WTDpEnW/af98rhL8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PQGhudb9I08q8LPWfnqoOWuLLs5X+mGpAQziK25vEzrTIvYt5zBVFCgvQeaD6mSNz
         8nSM9Wjtt2ecKL1ccG0YsJF7zaLURVJ2xhI3uR22YINY4XebxpTOp+AtO7wtittIvI
         HMfhOphz2kfwtkGaQMet8OjJXAwwH1/suWVnpEq2F5RNCGx++35U357xEETqnsau4U
         yNNj0rlxBtKHWbU2ux4iDicg9Lz5ugIsrpVOeaYClNH4HZBOsMdzyS+ezqk3HfhAL7
         wG+cJ0dR5LNC5A8rnFkn3D/SwDefQ46T1V2PFAm1g3zaRhN8GtS89t6lvLnKTixTXf
         u4eUobhmuJkzQ==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id k15so15073726vsp.2;
        Tue, 05 Nov 2019 20:16:26 -0800 (PST)
X-Gm-Message-State: APjAAAUHHw2T/9q6kXRIyMsPOyIwWAqEpXstB6PNGZapLcdsVqnUIv+c
        VUxBvlRJSiGi9em89O5uHCgO8Iei8b9plZYpJKE=
X-Google-Smtp-Source: APXvYqyj2fn6n6xfIF0zWdZVbfoYZNCKmN0aECMFEX4AODzPIGTNIPvyzpVHP4cWRdHOCSwn4LNzAWBWw3vOWk/7IsE=
X-Received: by 2002:a05:6102:726:: with SMTP id u6mr262077vsg.179.1573013785785;
 Tue, 05 Nov 2019 20:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20191025080544.7209-1-unixbhaskar@gmail.com>
In-Reply-To: <20191025080544.7209-1-unixbhaskar@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 6 Nov 2019 13:15:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT1=e36tLgPcHUOxKUSCH7MW3egYuJMtY+OfZWvHRxfGA@mail.gmail.com>
Message-ID: <CAK7LNAT1=e36tLgPcHUOxKUSCH7MW3egYuJMtY+OfZWvHRxfGA@mail.gmail.com>
Subject: Re: [PATCH] scripts:patch-kernel:bash syntax replace,correct one
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 25, 2019 at 5:06 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> This patch will replace backquote to dollar parenthesis syntax
> for better readability.Corrected one.

Talking about the commit subject,
which part is 'bash syntax' ?

One more thing,
"correct one" is not the correct way to send
a new patch version.
See the patch submission from other people.
The version number is enclosed in the square brackets.

[PATCH v2]


The commit subject should describe what it does
in imperative mood.

https://patchwork.kernel.org/patch/11205593/





> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/patch-kernel | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/patch-kernel b/scripts/patch-kernel
> index 033d5916797d..6f9443336f9a 100755
> --- a/scripts/patch-kernel
> +++ b/scripts/patch-kernel
> @@ -153,7 +153,7 @@ applyPatch () {
>      echo "failed.  Clean up yourself."
>      return 1;
>    fi
> -  if [ "`find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ]
> +  if [ "$(find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print)" ]
>    then
>      echo "Aborting.  Reject files found."
>      return 1;
> @@ -175,7 +175,7 @@ reversePatch () {
>                 echo "failed.  Clean it up."
>                 exit 1
>         fi
> -       if [ "`find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ]
> +       if [ "$(find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print)" ]
>         then
>                 echo "Aborting.  Reject files found."
>                 return 1
> @@ -189,7 +189,7 @@ reversePatch () {
>  # set current VERSION, PATCHLEVEL, SUBLEVEL, EXTRAVERSION
>  # force $TMPFILEs below to be in local directory: a slash character prevents
>  # the dot command from using the search path.
> -TMPFILE=`mktemp ./.tmpver.XXXXXX` || { echo "cannot make temp file" ; exit 1; }
> +TMPFILE=$(mktemp ./.tmpver.XXXXXX) || { echo "cannot make temp file" ; exit 1; }
>  grep -E "^(VERSION|PATCHLEVEL|SUBLEVEL|EXTRAVERSION)" $sourcedir/Makefile > $TMPFILE
>  tr -d [:blank:] < $TMPFILE > $TMPFILE.1
>  . $TMPFILE.1
> @@ -200,7 +200,7 @@ then
>      exit 1
>  fi
>
> -NAME=`grep ^NAME $sourcedir/Makefile`
> +NAME=$(grep ^NAME $sourcedir/Makefil)
>  NAME=${NAME##*=}
>
>  echo "Current kernel version is $VERSION.$PATCHLEVEL.$SUBLEVEL${EXTRAVERSION} ($NAME)"
> @@ -216,8 +216,8 @@ fi
>
>  #echo "stopvers=$stopvers"
>  if [ $stopvers != "default" ]; then
> -       STOPSUBLEVEL=`echo $stopvers | cut -d. -f3`
> -       STOPEXTRA=`echo $stopvers | cut -d. -f4`
> +       STOPSUBLEVEL=$(echo $stopvers | cut -d. -f3)
> +       STOPEXTRA=$(echo $stopvers | cut -d. -f4)
>         STOPFULLVERSION=${stopvers%%.$STOPEXTRA}
>         #echo "#___STOPSUBLEVEL=/$STOPSUBLEVEL/, STOPEXTRA=/$STOPEXTRA/"
>  else
> @@ -306,7 +306,7 @@ if [ x$gotac != x ]; then
>                 HIGHESTPATCH=0
>                 for PATCHNAMES in $patchdir/patch-${CURRENTFULLVERSION}-ac*\.*
>                 do
> -                       ACVALUE=`echo $PATCHNAMES | sed -e 's/^.*patch-[0-9.]*-ac\([0-9]*\).*/\1/'`
> +                       ACVALUE=$(echo $PATCHNAMES | sed -e 's/^.*patch-[0-9.]*-ac\([0-9]*\).*/\1/')
>                         # Check it is actually a recognised patch type
>                         findFile $patchdir/patch-${CURRENTFULLVERSION}-ac${ACVALUE} || break
>
> --
> 2.20.1
>


--
Best Regards
Masahiro Yamada
