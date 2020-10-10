Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E2C289DEA
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Oct 2020 05:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730348AbgJJDTs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 23:19:48 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:57374 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730251AbgJJC74 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 22:59:56 -0400
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 09A2xUAl005630;
        Sat, 10 Oct 2020 11:59:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 09A2xUAl005630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602298771;
        bh=WWDM+o/wL6A812KwHUZbKNpAETbnnn+w7BV/JJ86H8k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1tL8Qokml2GcAc/4rKCb2deYlB5nRlYF5l2qFWYF0NdhrYeV6gJJuP2mhX0OeqM58
         KRJFV5FRF6GgODXzVCq5PO+gikKFtxO36sL+z/aqfOIAiQq+k8nbWhSaBhMFMs9Y7x
         xRp3ChKa7vRLu99dySfDNEofB9acA8BU2Z+FE7M1CydYzhF1yL1boXoFXTW7dfoK5p
         woPQtiz1xuOtXyZUbeXU2WeF/9g3E7SxK76GeGC6CmLW6GmpU2a1T8gXx9vRJO6gCG
         gZtHmHEGH1DFLDZeIRKaqS0fXo8O1j/TYgkiPYgwUIE30ISHx9ySmWXiRxnFRe5vdA
         NatIcfNllpNQg==
X-Nifty-SrcIP: [209.85.215.170]
Received: by mail-pg1-f170.google.com with SMTP id h6so8797111pgk.4;
        Fri, 09 Oct 2020 19:59:31 -0700 (PDT)
X-Gm-Message-State: AOAM531nH7klLdgqpdL+n4BYaPTouFjzWR6CfbWCKhw99kaYrK11NiCr
        csXDoljrUEFXzxdkWDhVJ0dyPGKBcGQ9E+XN4Mc=
X-Google-Smtp-Source: ABdhPJwphC6cuOTQtA14yFr11HstFwMCUogPzJ6fyu1fi9MD3elUuZvTP88pEo/pxJLAHAMo2xeIoKY0Ako0OB9SqcY=
X-Received: by 2002:a17:90a:aa91:: with SMTP id l17mr7675532pjq.198.1602298770233;
 Fri, 09 Oct 2020 19:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <1602199588-24468-1-git-send-email-victor.erminpour@oracle.com>
In-Reply-To: <1602199588-24468-1-git-send-email-victor.erminpour@oracle.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 10 Oct 2020 11:58:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWnCn3=iXFrQ=kj4eRcE+5SDyob-oqOMUzTLCMRut7BQ@mail.gmail.com>
Message-ID: <CAK7LNASWnCn3=iXFrQ=kj4eRcE+5SDyob-oqOMUzTLCMRut7BQ@mail.gmail.com>
Subject: Re: [PATCH] merge_config.sh: Add switch to specify ARCH variable
To:     Victor Erminpour <victor.erminpour@oracle.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 9, 2020 at 8:25 AM Victor Erminpour
<victor.erminpour@oracle.com> wrote:
>
> Add a switch to merge_config.sh to specify the ARCH variable
> which defines the target architecture.
>
> Set x86 as the default architecture.
>
> Signed-off-by: Victor Erminpour <victor.erminpour@oracle.com>
> ---


You can do

ARCH=arm ./scripts/kconfig/merge_config.sh






>  scripts/kconfig/merge_config.sh | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 63c8565206a4..b7a687f093f0 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -22,6 +22,7 @@ clean_up() {
>
>  usage() {
>         echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
> +       echo "  -a    set ARCH variable to define the target architecture"
>         echo "  -h    display this help text"
>         echo "  -m    only merge the fragments, do not execute the make command"
>         echo "  -n    use allnoconfig instead of alldefconfig"
> @@ -34,6 +35,7 @@ usage() {
>
>  RUNMAKE=true
>  ALLTARGET=alldefconfig
> +ARCH=x86
>  WARNREDUN=false
>  BUILTIN=false
>  OUTPUT=.
> @@ -46,6 +48,11 @@ while true; do
>                 shift
>                 continue
>                 ;;
> +       "-a")
> +               ARCH=$2
> +               shift 2
> +               continue
> +               ;;
>         "-m")
>                 RUNMAKE=false
>                 shift
> @@ -172,7 +179,7 @@ fi
>  # Use the merged file as the starting point for:
>  # alldefconfig: Fills in any missing symbols with Kconfig default
>  # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
> -make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
> +make ARCH=$ARCH KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>
>
>  # Check all specified config values took (might have missed-dependency issues)
> --
> 1.8.3.1
>


-- 
Best Regards
Masahiro Yamada
