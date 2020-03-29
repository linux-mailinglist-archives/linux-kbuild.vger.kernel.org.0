Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D229196D2D
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2020 14:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgC2MCd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Mar 2020 08:02:33 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:62459 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgC2MCd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 08:02:33 -0400
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 02TC2HOg023031
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2020 21:02:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 02TC2HOg023031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585483338;
        bh=hZwM5bHjxA2YZJTaUBMgjqr9xr50HquI7EecA3g0HCs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d9fyC8JvXaASnlL0Tg7Eb4GYUJeY/ZThRP9RXwAPDm4WEP6xY+odROiDzgQz1P6CF
         j2lZKgTBHJIi9YJcxrIMwt0RDK8HNOFovPEOU2mcBRu2/NeirH7IOuqN6Xbmnq6/Vx
         RIGmvjS0nCOM8YwL/edhoFeFI55FLn4aSVzjaNvVnElLzuQ6YhalJrhBE3YKF1JqdV
         AyuWO1dS4b94Do78fo/Ihufei0eB5qtUhBlomkk8YSSuNTM7E52qvKp1iO1P5Wa5Qk
         D93uTsnmeZcryRzUqPa+Cu2Wx7ggHbFst9qtafgE2kcg+kXyDSUiqwQNMoE99hRN+H
         /WYo4/0Z8fRrw==
X-Nifty-SrcIP: [209.85.221.180]
Received: by mail-vk1-f180.google.com with SMTP id b187so3901763vkh.12
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2020 05:02:18 -0700 (PDT)
X-Gm-Message-State: AGi0Pubw9gYRW+zz1CpdzEIRyQ24bYhF/PfdevRiDpK7pnp1siP9Sc1U
        cCRrzOGMxQezBbt+5FBrkfXay/IkyNPcMg4bp2I=
X-Google-Smtp-Source: APiQypIlm2zwYqpbPBUgA8cmbZvgDAHn9x7UTySyOuH+4G5yOY47fEtMRBnlgzfDHlzewB92N12BkVTZCB91n3uSrJg=
X-Received: by 2002:a1f:640c:: with SMTP id y12mr4423458vkb.73.1585483337013;
 Sun, 29 Mar 2020 05:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <1966103.4dT7el1ifK@apollon>
In-Reply-To: <1966103.4dT7el1ifK@apollon>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 29 Mar 2020 21:01:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQcMM_H41zXA++FOF=LJT+YKNfmwHMYqdF3r1uQT307Hw@mail.gmail.com>
Message-ID: <CAK7LNAQcMM_H41zXA++FOF=LJT+YKNfmwHMYqdF3r1uQT307Hw@mail.gmail.com>
Subject: Re: Patch: Suppress irrelevant warning when generating a debian package
To:     Reinhard Karcher <reinhard.karcher@gmx.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        954778@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 24, 2020 at 7:24 PM Reinhard Karcher
<reinhard.karcher@gmx.net> wrote:
>
> Creating a Debian package by compiling the kernel using make bindeb-pkg
> without creating debug information creates a warning that no
> debug package was created.
> This patch excludes the debug package from the control file,
> if no debug package is created by this configuration.

OK, this seems correct.

> By making a contribution to this project, I certify that:
> The contribution was created in whole or in part by me and I have the right to
> submit it under the open source license indicated in the file.

Please drop this.

Signed-off-by implies this.
No need to explain this in an individual patch.


> Signed-off-by: Reinhard Karcher <reinhard.karcher@gmx.net>
> ---
> The condition to include the debug package is copied from the file
> builddeb in the same directory.
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 357dc56bcf30..1673b9f84804 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -198,7 +198,10 @@ Description: Linux support headers for userspace
> development
>   This package provides userspaces headers from the Linux kernel.  These
> headers
>   are used by the installed headers for GNU glibc and other system libraries.
>  Multi-Arch: same
> +EOF
>
> +if [ -n "$BUILD_DEBUG" ] ; then


This file does not define BUILD_DEBUG.
So, this conditional is always false, isn't it?

It should be:

if is_enabled CONFIG_DEBUG_INFO; then




> +cat <<EOF >> debian/control
>  Package: $dbg_packagename
>  Section: debug
>  Architecture: $debarch
> @@ -206,6 +209,7 @@ Description: Linux kernel debugging symbols for $version
>   This package will come in handy if you need to debug the kernel. It provides
>   all the necessary debug symbols for the kernel and its modules.
>  EOF
> +fi
>
>  cat <<EOF > debian/rules
>  #!$(command -v $MAKE) -f
>
>
>


-- 
Best Regards
Masahiro Yamada
