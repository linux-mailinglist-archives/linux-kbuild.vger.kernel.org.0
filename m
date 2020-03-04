Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E38117934B
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2020 16:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgCDPZT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Mar 2020 10:25:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:60774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbgCDPZT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 10:25:19 -0500
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EEE7217F4;
        Wed,  4 Mar 2020 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583335518;
        bh=ZumlGMcBmAVs+fBT0aWZfIg+A2t7B3lHLFRmYusJrmM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QdKv8fpiPzelRasvXYQYduHy1HtpRJFB/do486BVeN6dh1HIo5wN5nyDc4YFz+MbV
         U1slqVJXuCpDun27GAhCCxkmS/+PiQGDGzOJU3c5o+P5RMIDxGGTq4zTVUFSOiwodS
         1tSDanrvqFh6iT6UX6YVCLJdlSsWUI4nsHdyLd9g=
Received: by mail-qv1-f50.google.com with SMTP id r8so932090qvs.12;
        Wed, 04 Mar 2020 07:25:18 -0800 (PST)
X-Gm-Message-State: ANhLgQ3gSkbkELZEDWvpkqj+nzdlJSfvwtGex46xHNsz9QxJ6gVzQmLJ
        b9ANYh4qbAHWOr2Zc/HFSSqzfcVyr5r1ZSxX2g==
X-Google-Smtp-Source: ADFU+vtW6eH2lMW1v5UZ2ywbP709qBKs59VL/I7EP4ShzFBY269q/YEygQz3Hie30VlnYHvQUn3WzoF/MDSrL5uju4k=
X-Received: by 2002:a0c:fecb:: with SMTP id z11mr2534654qvs.85.1583335517496;
 Wed, 04 Mar 2020 07:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20200304032038.14424-1-masahiroy@kernel.org> <20200304032038.14424-4-masahiroy@kernel.org>
In-Reply-To: <20200304032038.14424-4-masahiroy@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 4 Mar 2020 09:25:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKt1K6nOED2TeUfyxkbWHi_KrbZFDW-ZxwgHZX-Og7-DA@mail.gmail.com>
Message-ID: <CAL_JsqKt1K6nOED2TeUfyxkbWHi_KrbZFDW-ZxwgHZX-Og7-DA@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: allow to run dt_binding_check without kernel configuration
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 3, 2020 at 9:21 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The dt_binding_check target is located outside of the
> 'ifneq ($(dtstree),) ... endif' block.
>
> Hence, you can run 'make dt_binding_check' on any architecture.
> This makes a perfect sense because the dt-schema is arch-agnostic.
>
> The only one problem I see is that scripts/dtc/dtc is not always built.
> For example, ARCH=x86 defconfig does not define CONFIG_DTC. Kbuild
> descends into scripts/dtc/, but does nothing. Then, it fails to build
> *.example.dt.yaml files.

Yeah, I've just worked around this by doing 'make CONFIG_DTC=y
dt_binding_check'.

The only thing I'd come up with was just always building dtc, but I
didn't want to do that.

> Let's build scripts/dtc/dtc forcibly when running dt_binding_check.
>
> The dt-schema does not depend on any CONFIG option either, so you
> should be able to run dt_binding_check without the .config file.
>
> Going forward, you can directly run 'make dt_binding_check' in a
> pristine source tree.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile             | 2 +-
>  scripts/dtc/Makefile | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 7dec7b343842..190f595c7bfc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -255,7 +255,7 @@ clean-targets := %clean mrproper cleandocs
>  no-dot-config-targets := $(clean-targets) \
>                          cscope gtags TAGS tags help% %docs check% coccicheck \
>                          $(version_h) headers headers_% archheaders archscripts \
> -                        %asm-generic kernelversion %src-pkg
> +                        %asm-generic kernelversion %src-pkg dt_binding_check
>  no-sync-config-targets := $(no-dot-config-targets) install %install \
>                            kernelrelease
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index 3acbb410904c..2f3c3a7e1620 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -1,8 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # scripts/dtc makefile
>
> -hostprogs              := dtc
> -always-$(CONFIG_DTC)   := $(hostprogs)
> +hostprogs                      := dtc
> +always-$(CONFIG_DTC)           += $(hostprogs)
> +always-$(CHECK_DT_BINDING)     += $(hostprogs)

This looks like a good solution.

Reviewed-by: Rob Herring <robh@kernel.org>
