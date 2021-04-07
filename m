Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A31356BD8
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 14:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242763AbhDGMNS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 08:13:18 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:32293 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234694AbhDGMNS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 08:13:18 -0400
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 137CCfdj028677;
        Wed, 7 Apr 2021 21:12:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 137CCfdj028677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617797561;
        bh=G2OAzpQeE86KD19ErE7vjeVXsj0toXPSm4HsA5jarbY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dDGn3wRBr2p8T5KSmSx/s/1zw/1KHHmyR6+U3AenRCC7mINr+y8dNF9CCLrpPBLZb
         lYuoLNC6NH1fW/KARSPQ/6Ol4m8GQibp65EVHMJEEFkJCFsDrQdSvr2weFX/BsThSh
         GlH/pqA3gvAK/YpES1fzGt+e50QorDfkIlplEJdjeH7Mcfb17bgbaOmMZDD60Km0Aq
         624yxjFGbEAk6GG9GgDpurVzfipZfR3+iJV5EMeHxnMJ5vEgxJyeI7HI7UIoAQhq1J
         mQ6afwCDd/IzQa085cNqU8Ul2cVtfJfOYokXuTDTn7ol8ZuG2ItNQkK5YfJHASS2Rd
         hV2MGcFd9khNA==
X-Nifty-SrcIP: [209.85.210.171]
Received: by mail-pf1-f171.google.com with SMTP id a12so12763039pfc.7;
        Wed, 07 Apr 2021 05:12:41 -0700 (PDT)
X-Gm-Message-State: AOAM5333jjQUGYE11AMb/JPQOQDOl7KGPyggLPqoTNMKxPW7mALoq70V
        y/DIJBEBn9k4um43onPpuGAKknqiuwkVoGtw7GA=
X-Google-Smtp-Source: ABdhPJy9LRtHMPkZn9qh/2r5DQZKxJhu13p3bA/4mWPzeVr7P5CaYeg6AhE9FmRVbhEGiTypGdeQ3vqnLaD9Rw0iPLs=
X-Received: by 2002:a65:41c6:: with SMTP id b6mr2965394pgq.7.1617797560602;
 Wed, 07 Apr 2021 05:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210326060122.25277-1-unixbhaskar@gmail.com>
In-Reply-To: <20210326060122.25277-1-unixbhaskar@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 7 Apr 2021 21:12:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARH0dXETXtQOfowkpC6Da9_4htbp1T+t50gFLwTXV3Ang@mail.gmail.com>
Message-ID: <CAK7LNARH0dXETXtQOfowkpC6Da9_4htbp1T+t50gFLwTXV3Ang@mail.gmail.com>
Subject: Re: [PATCH] kconfig: streamline_config.pl: Couple of typo fixes
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 26, 2021 at 3:03 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
>
> s/configuraton/configuration/
> s/orignal/original/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>


Applied to linux-kbuild. Thanks.



> ---
>  scripts/kconfig/streamline_config.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index 1c78ba49ca99..911c72a2dbc4 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -21,7 +21,7 @@
>  #  1. Boot up the kernel that you want to stream line the config on.
>  #  2. Change directory to the directory holding the source of the
>  #       kernel that you just booted.
> -#  3. Copy the configuraton file to this directory as .config
> +#  3. Copy the configuration file to this directory as .config
>  #  4. Have all your devices that you need modules for connected and
>  #      operational (make sure that their corresponding modules are loaded)
>  #  5. Run this script redirecting the output to some other file
> @@ -481,7 +481,7 @@ sub parse_config_depends
>  # The idea is we look at all the configs that select it. If one
>  # is already in our list of configs to enable, then there's nothing
>  # else to do. If there isn't, we pick the first config that was
> -# enabled in the orignal config and use that.
> +# enabled in the original config and use that.
>  sub parse_config_selects
>  {
>      my ($config, $p) = @_;
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
