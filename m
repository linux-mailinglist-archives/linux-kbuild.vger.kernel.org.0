Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617B72EC0AE
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Jan 2021 16:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbhAFPxV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Jan 2021 10:53:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:44500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727037AbhAFPxV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jan 2021 10:53:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EDA42312E;
        Wed,  6 Jan 2021 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609948360;
        bh=+w6Esc4y84H6JBMFik8yqtrwIDRoK5oIoGIZfR8uB0M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b632MbNZC2D6/Tuw1MaYs620dA3xca476erWP8k0+nPq1XCP6+zcLhqqQPghua9GB
         o5O9MRoWLPntUOpMc7hwzDnEkofnpPzvsmgvnF3edZRyTHmZbKiEnkKKv6i3K1AgDF
         9rQFc9pYHls8+sf7VYmvhkt0GGfnuCsqfKQZSwOmO+y3X3+81QmFycevq7wei9Jyfv
         9x2MduzaNQ5Rvgk8bLHwyvX5//8f5YXK9cW68v1uznxJhyTbLlTSS80Oe59SXcxCwf
         u5H8qQyU7Wfpbo3siNh24roz6udvTuNHwTv3zmWCk9OffWtMLhwEAPnU0iO6uGB5RR
         WP6uKuiwS/39g==
Received: by mail-ed1-f54.google.com with SMTP id j16so4879588edr.0;
        Wed, 06 Jan 2021 07:52:40 -0800 (PST)
X-Gm-Message-State: AOAM532j32ycGH5EXRgNYbsJk9Gm2O7XcYqjNEIfomhSvubN2o54Ys6F
        MFM+72LnjClZFxmadGzppGNqN/0TpDt903HljA==
X-Google-Smtp-Source: ABdhPJyQdyKhsl0F/RZctARYn67Dm7nJHSI3xIXZUvaFdcK0gjTA8Ilgz+WhkN1yPHPxfvkVeZhxjt1wHE1uIGrmBwE=
X-Received: by 2002:a05:6402:1841:: with SMTP id v1mr4515172edy.194.1609948358753;
 Wed, 06 Jan 2021 07:52:38 -0800 (PST)
MIME-Version: 1.0
References: <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
 <5a416b44155409e45b99c5624d66992a2138cd4c.1609927722.git.viresh.kumar@linaro.org>
In-Reply-To: <5a416b44155409e45b99c5624d66992a2138cd4c.1609927722.git.viresh.kumar@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 6 Jan 2021 08:52:27 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKeF+KE_cXfyKFYo_sU+-LzedCmYjbVT=ZyhTEXvxfbiw@mail.gmail.com>
Message-ID: <CAL_JsqKeF+KE_cXfyKFYo_sU+-LzedCmYjbVT=ZyhTEXvxfbiw@mail.gmail.com>
Subject: Re: [PATCH] scripts: dtc: Start building fdtoverlay and fdtdump
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 6, 2021 at 3:09 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> We will start building overlays for platforms soon in the kernel and
> would need these tools going forward. Lets fetch and build these.
>
> Note that a copy of fdtdump.c was already copied back in the year 2012,
> but it was never updated or built for some reason.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  scripts/dtc/Makefile             | 8 +++++++-
>  scripts/dtc/update-dtc-source.sh | 6 +++---

This needs to be 2 patches so we can do a dtc sync in between. So
update update-dtc-source.sh, run update-dtc-source.sh, update the
Makefile.

>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index 4852bf44e913..c607980a5c17 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -1,12 +1,18 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # scripts/dtc makefile
>
> -hostprogs-always-$(CONFIG_DTC)         += dtc
> +hostprogs-always-$(CONFIG_DTC)         += dtc fdtdump fdtoverlay
>  hostprogs-always-$(CHECK_DT_BINDING)   += dtc
>
>  dtc-objs       := dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
>                    srcpos.o checks.o util.o
>  dtc-objs       += dtc-lexer.lex.o dtc-parser.tab.o
> +fdtdump-objs   := fdtdump.o util.o
> +
> +libfdt_dir     = libfdt
> +libfdt-objs    := fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
> +libfdt         = $(addprefix $(libfdt_dir)/,$(libfdt-objs))
> +fdtoverlay-objs        := $(libfdt) fdtoverlay.o util.o
>
>  # Source files need to get at the userspace version of libfdt_env.h to compile
>  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
> diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
> index bc704e2a6a4a..9bc4afb71415 100755
> --- a/scripts/dtc/update-dtc-source.sh
> +++ b/scripts/dtc/update-dtc-source.sh
> @@ -31,9 +31,9 @@ set -ev
>  DTC_UPSTREAM_PATH=`pwd`/../dtc
>  DTC_LINUX_PATH=`pwd`/scripts/dtc
>
> -DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
> -               srcpos.h treesource.c util.c util.h version_gen.h yamltree.c \
> -               dtc-lexer.l dtc-parser.y"
> +DTC_SOURCE="checks.c data.c dtc.c dtc.h fdtdump.c fdtoverlay.c flattree.c \
> +               fstree.c livetree.c srcpos.c srcpos.h treesource.c util.c \
> +               util.h version_gen.h yamltree.c dtc-lexer.l dtc-parser.y"
>  LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
>                 fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
>                 fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
> --
> 2.25.0.rc1.19.g042ed3e048af
>
