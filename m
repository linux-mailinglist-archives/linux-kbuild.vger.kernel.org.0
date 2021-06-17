Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3EE3AA868
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jun 2021 03:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhFQBIY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Jun 2021 21:08:24 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:23279 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhFQBIY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jun 2021 21:08:24 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 15H163Ro023442;
        Thu, 17 Jun 2021 10:06:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 15H163Ro023442
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1623891964;
        bh=Nes41jKPWaXsM5bgH+6WMq/TOgIPzhfZ+k/ThcLSQGo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=q2qZ1sa+f4lJjn69nOuoVE9gasI0dpTozZZ89FsCxnukSJ6mR9DpwhERtEP1CUwQa
         UxNCoQNZiSXolVNXJo4Kfkc1vUxKIdd8ftG1jqdWKFjs/IgzP0Nh6SgoVh5Dc/0+Bp
         ihDW2CHlL30Sp124dWGJTjymddhUxrqTxbw1ppRbT4kpmYqEiRTdh4OIOeu5p6PCgg
         RLTCbAvfA0gsWLoyETEHJbQPOEaxH62BKLm2i6WVLvNn1aZunGxgRODoE0Ls3EcabL
         We7SU8+uc++1twvMOrzq9WQmXHPsWTdYsgtKZN6EnNt62GZL2UBuJUt8n+zRHHrXs6
         V5u3BsHLKhYJA==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id h16so2812720pjv.2;
        Wed, 16 Jun 2021 18:06:04 -0700 (PDT)
X-Gm-Message-State: AOAM532lBAQE8sBz3Uxu6/bNS+b+jjnaEkvG7AhqdONAdTpv8LiqrKhR
        eDV9C7ajProk06aakfI6bSEn/XzBZL9qHelPZ4M=
X-Google-Smtp-Source: ABdhPJzlRthpjhWpvo1eiG+0JsuwSfsqhwRGtctVMqP/x6KZoQjWBC/2pcl+KzNnIL7pbSaqJt8AfnD/cJZZPozQAAk=
X-Received: by 2002:a17:90a:e2c6:: with SMTP id fr6mr13779995pjb.198.1623891963372;
 Wed, 16 Jun 2021 18:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210612141838.1073085-1-maennich@google.com>
In-Reply-To: <20210612141838.1073085-1-maennich@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 17 Jun 2021 10:05:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQkoqTG540EOER27G83z+DO5fkeHi-in-vRYkrbX-o0cg@mail.gmail.com>
Message-ID: <CAK7LNAQkoqTG540EOER27G83z+DO5fkeHi-in-vRYkrbX-o0cg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: consider timestamp if
 KBUILD_BUILD_TIMESTAMP is set
To:     Matthias Maennich <maennich@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 12, 2021 at 11:18 PM Matthias Maennich <maennich@google.com> wrote:
>
> To avoid unnecessary recompilations, mkcompile_h does not regenerate
> compile.h if just the timestamp changed.
> Though, if KBUILD_BUILD_TIMESTAMP is set, an explicit timestamp for the
> build was requested, in which case we should not ignore it.
>
> If a user follows the documentation for reproducible builds [1] and
> defines KBUILD_BUILD_TIMESTAMP as the git commit timestamp, a clean
> build will have the correct timestamp. A subsequent cherry-pick (or
> amend) changes the commit timestamp and if an incremental build is done
> with a different KBUILD_BUILD_TIMESTAMP now, that new value is not taken
> into consideration. But it should for reproducibility.
>
> Hence, whenever KBUILD_BUILD_TIMESTAMP is explicitly set, do not ignore
> UTS_VERSION when making a decision about whether the regenerated version
> of compile.h should be moved into place.
>
> [1] https://www.kernel.org/doc/html/latest/kbuild/reproducible-builds.html
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Matthias Maennich <maennich@google.com>
> ---


Applied to linux-kbuild. Thanks.


>  scripts/mkcompile_h | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 4ae735039daf..a72b154de7b0 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -70,15 +70,23 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
>  # Only replace the real compile.h if the new one is different,
>  # in order to preserve the timestamp and avoid unnecessary
>  # recompilations.
> -# We don't consider the file changed if only the date/time changed.
> +# We don't consider the file changed if only the date/time changed,
> +# unless KBUILD_BUILD_TIMESTAMP was explicitly set (e.g. for
> +# reproducible builds with that value referring to a commit timestamp).
>  # A kernel config change will increase the generation number, thus
>  # causing compile.h to be updated (including date/time) due to the
>  # changed comment in the
>  # first line.
>
> +if [ -z "$KBUILD_BUILD_TIMESTAMP" ]; then
> +   IGNORE_PATTERN="UTS_VERSION"
> +else
> +   IGNORE_PATTERN="NOT_A_PATTERN_TO_BE_MATCHED"
> +fi
> +
>  if [ -r $TARGET ] && \
> -      grep -v 'UTS_VERSION' $TARGET > .tmpver.1 && \
> -      grep -v 'UTS_VERSION' .tmpcompile > .tmpver.2 && \
> +      grep -v $IGNORE_PATTERN $TARGET > .tmpver.1 && \
> +      grep -v $IGNORE_PATTERN .tmpcompile > .tmpver.2 && \
>        cmp -s .tmpver.1 .tmpver.2; then
>     rm -f .tmpcompile
>  else
> --
> 2.32.0.272.g935e593368-goog
>


-- 
Best Regards
Masahiro Yamada
