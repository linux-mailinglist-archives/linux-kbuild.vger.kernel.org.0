Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE0B9445684
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Nov 2021 16:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhKDPpa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Nov 2021 11:45:30 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:44328 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhKDPpa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Nov 2021 11:45:30 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 1A4Fgdx2001000;
        Fri, 5 Nov 2021 00:42:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 1A4Fgdx2001000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636040559;
        bh=D81BJsXH9JIReNLCEkvG8bnY7gsd9LxCzifVJbM80rc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Mv6t9/6T1mNm9Tk2EqmUVXqt4cPoYFe3Cd8hjASNCHQ221HT6hr49jh727fcQMdy4
         v9ZLeDxW5rNmeCuPABNi+P7P6U9Lo8HFrnHr/DHpCKdTB7IDJIJr6wchR5Zac3gszA
         SKUKTubY9uzd2qZMq3dE2tnZxvMPuWdTRtMYsLf5Lp+swOC/B1X44GrN8uXcZTYTGV
         bhW5balOOEvcRdrD2G1lvkwX/+5/Cq20pZBsNTgPfkxxkBKdmUZxCA+OEq2/spzG6P
         ZoB6v787kh4NcgoofW+uy+g1Ir0RV6tveYl7QwUUgLxP0AmV90QM5OqplNFTwyIi1A
         MneeEb3l8Sv3A==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id v20so7849493plo.7;
        Thu, 04 Nov 2021 08:42:39 -0700 (PDT)
X-Gm-Message-State: AOAM5319o1si5VcVFYc+QZsLMDrEB0NYlsIMw9kR8NpZVfcoXLaEWcRE
        AE+Nboc8Vyx5+zYZ1jivCaGmNaWvZCwIF+l4Q50=
X-Google-Smtp-Source: ABdhPJz4TFQHYZtd7bGZ1BjVG3E8vLdNCZg5ehrRQn1MTNZ02hO9gMxtWCXelA8HGNHODCMJGAje/3vKIrztnvnpXqg=
X-Received: by 2002:a17:90a:c3:: with SMTP id v3mr72433pjd.0.1636040558564;
 Thu, 04 Nov 2021 08:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211102224041.5105-1-rdunlap@infradead.org>
In-Reply-To: <20211102224041.5105-1-rdunlap@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Nov 2021 00:41:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQg0Dmj03xLWvz4=Y6n6VoiOnn-hkHrR7_MTgE5obt_7w@mail.gmail.com>
Message-ID: <CAK7LNAQg0Dmj03xLWvz4=Y6n6VoiOnn-hkHrR7_MTgE5obt_7w@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/config: allow "O=config-dir" option
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 3, 2021 at 7:40 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Support "O=config-dir" as the location of the .config file
> like (some) other kernel build (make) tools do.
>
> Also check for the existence of the config-dir/config-file
> and report if there is no such file instead of letting grep
> report that there is no such file.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Andi Kleen <ak@linux.intel.com>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> ---

Why don't you use  --file path/to/output/dir/.config ?







> v2:
> - use 'shellcheck' and other recommendations from Nicolas
> - move one comment from the commit description to under the "---" line
>
> Someone asked for this "feature" a few months ago but I don't
> recall who it was.
>
>  scripts/config |   44 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 5 deletions(-)
>
> --- linux-next-20211102.orig/scripts/config
> +++ linux-next-20211102/scripts/config
> @@ -37,6 +37,7 @@ commands:
>
>  options:
>         --file config-file   .config file to change (default .config)
> +       O=config-dir         Specify the directory location of the config-file
>         --keep-case|-k       Keep next symbols' case (dont' upper-case it)
>
>  $myname doesn't check the validity of the .config file. This is done at next
> @@ -124,15 +125,48 @@ undef_var() {
>         txt_delete "^# $name is not set" "$FN"
>  }
>
> -if [ "$1" = "--file" ]; then
> -       FN="$2"
> -       if [ "$FN" = "" ] ; then
> +DIR=
> +FN=
> +
> +while [ "$DIR" = "" ] || [ "$FN" = "" ]; do
> +
> +       if [ "$1" = "" ] ; then
>                 usage
>         fi
> -       shift 2
> -else
> +       if [ "$1" = "--file" ]; then
> +               FN="$2"
> +               if [ "$FN" = "" ] ; then
> +                       usage
> +               fi
> +               shift 2
> +               continue
> +       fi
> +
> +       optn=$1
> +       optnlen=${#optn}
> +       if [ "$optnlen" -gt 1 ] && [ "${optn:0:2}" = "O=" ]; then
> +               DIR=${optn:2}
> +               shift
> +               if [ "$DIR" = "" ]; then
> +                       usage
> +               fi
> +               continue
> +       fi
> +       break   # something other than --file or O=dir
> +done
> +
> +if [ "$FN" = "" ]; then
>         FN=.config
>  fi
> +if [ "$DIR" != "" ]; then
> +       DIR=$DIR"/"
> +fi
> +FN="${DIR}${FN}"
> +
> +if [ ! -r "$FN" ]; then
> +       echo "No such config file: $FN"
> +       exit
> +fi
>
>  if [ "$1" = "" ] ; then
>         usage



-- 
Best Regards
Masahiro Yamada
