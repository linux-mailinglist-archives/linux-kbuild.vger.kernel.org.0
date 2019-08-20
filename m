Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F8D963BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2019 17:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfHTPIG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Aug 2019 11:08:06 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25580 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbfHTPIG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Aug 2019 11:08:06 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x7KF7iEI015081;
        Wed, 21 Aug 2019 00:07:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x7KF7iEI015081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566313664;
        bh=K8iJaWgwlMDK+OlU7YLfgIi/89fs2wcwIBbyV/ut3Xg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r0JTMtwS7bXGKh0LzSQe2B6bAJ9gURESWM7orh3U+SJLO/4fBgaO+aiE87pwUbqht
         pEN6GgSqsHb97mwe0arR1MyTAskOZSNVIgrPcuNiG0s5y0GuAFsU3PTbZknvO9xaCt
         YiyRCAoINDbpn7NWr3/QUFBZZ4+1Rr6yrvAmk/kdXxYqsJQLGGjuYnQFra1GiU/rsO
         sKuAl2xCDsFbqb+H2bCKnSxw+XAkJ3+h7mDxPu94D9yqW/YxZbE62ZaTW9n2Nw2a44
         FNO6p8UWA2D7t1NcMoM5vCbX9RzG7HR2jqa96tNUW1E2DuOSRZ8za98Dusi0fe8ib3
         K8ml+Ni8Zq2xA==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id q16so3757413vsm.2;
        Tue, 20 Aug 2019 08:07:44 -0700 (PDT)
X-Gm-Message-State: APjAAAUEHaXha+MPlTu1aaiYNOe6V6hyBqaoPGIIpwdCXLoKupZIgp6J
        NH1Wgrw/X9sSwpHz2msmSGjca2LGLcVKMpdKaB4=
X-Google-Smtp-Source: APXvYqzVwIl5c0/FMcWNBbgpHsdWNZyxfvEzTsj5F0N9FyZ7bYyO0hEfQILwoAU1YRJRG5XvsHvtQFt5cgur+TrHfbI=
X-Received: by 2002:a67:e401:: with SMTP id d1mr7143023vsf.215.1566313663086;
 Tue, 20 Aug 2019 08:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190819200650.18156-1-broonie@kernel.org>
In-Reply-To: <20190819200650.18156-1-broonie@kernel.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 21 Aug 2019 00:07:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNARaVoxWVi679JkR1w+m-RRH1PLdvfJc1ba4n2N2bZR_5g@mail.gmail.com>
Message-ID: <CAK7LNARaVoxWVi679JkR1w+m-RRH1PLdvfJc1ba4n2N2bZR_5g@mail.gmail.com>
Subject: Re: [PATCH v2] merge_config.sh: Check error codes from make
To:     Mark Brown <broonie@kernel.org>
Cc:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 20, 2019 at 5:07 AM Mark Brown <broonie@kernel.org> wrote:
>
> When we execute make after merging the configurations we ignore any
> errors it produces causing whatever is running merge_config.sh to be
> unaware of any failures.  This issue was noticed by Guillaume Tucker
> while looking at problems with testing of clang only builds in KernelCI
> which caused Kbuild to be unable to find a working host compiler.
>
> This implementation was suggested by Yamada-san.
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied to linux-kbuild.
Thanks.

>  scripts/kconfig/merge_config.sh | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index d924c51d28b7..bec246719aea 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -13,12 +13,12 @@
>  #  Copyright (c) 2009-2010 Wind River Systems, Inc.
>  #  Copyright 2011 Linaro
>
> +set -e
> +
>  clean_up() {
>         rm -f $TMP_FILE
>         rm -f $MERGE_FILE
> -       exit
>  }
> -trap clean_up HUP INT TERM
>
>  usage() {
>         echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
> @@ -110,6 +110,9 @@ TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
>  MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)
>
>  echo "Using $INITFILE as base"
> +
> +trap clean_up EXIT
> +
>  cat $INITFILE > $TMP_FILE
>
>  # Merge files, printing warnings on overridden values
> @@ -155,7 +158,6 @@ if [ "$RUNMAKE" = "false" ]; then
>         echo "#"
>         echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
>         echo "#"
> -       clean_up
>         exit
>  fi
>
> @@ -185,5 +187,3 @@ for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
>                 echo ""
>         fi
>  done
> -
> -clean_up
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
