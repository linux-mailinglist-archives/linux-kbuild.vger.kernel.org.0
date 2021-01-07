Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783842ECA3B
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jan 2021 06:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbhAGFqv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jan 2021 00:46:51 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:63806 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbhAGFqv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jan 2021 00:46:51 -0500
X-Greylist: delayed 1019 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Jan 2021 00:46:49 EST
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1075jgUj031567;
        Thu, 7 Jan 2021 14:45:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1075jgUj031567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1609998342;
        bh=rj8HGx1HfRkEblm56nJKgmbopku3uQXDt96s8x7uQtA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fJHQ4ip8hPPdtiEdhiWQ62H1hBwdVfe1dSGsMibaZ/2v4gryd+uq/xOKt+UdN4qSK
         m7hhU7tmUtcirclnVoGYBA5Vp0sZo+yNOcdGAgH3cvs9ZAPvn+0euGnh3Qnw99fxSi
         JaYT8plyJtefbzH7P3mUPayOXxu7q8kT5EhPmJRvhw9sHy3IerML6Beq0y9fG6IJyC
         vBxxciIbLHDQKWEjv5nk8B7IImfx/UU+LrvYqsZuslihvUTHgTpgPzlkY5jePzJjst
         lLNSfjUm5I1vg0+kW2R5oLCPktfjrOHOsutpNp8eunWk6+LX+hORTBnBZ0Cb2vDiDk
         Duy46CjLnPpWw==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id v19so4065430pgj.12;
        Wed, 06 Jan 2021 21:45:42 -0800 (PST)
X-Gm-Message-State: AOAM533Hh4uIy2Yt1N0I52mynJtRgeIUmfDlpjJkyrdFcyrZv5t97tNN
        W+0FcY5RJZZVC+q5rdCZjsSQ1g//FZ46sjPdw0c=
X-Google-Smtp-Source: ABdhPJz0+9prxBLGe8m959E3gyV2nUXaR2c2tmXe29c1Wxm4CSVOXB3IncRfKA5GEUXUcTfon+sl+AcKXtjnyBB0E8M=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr199667pgf.47.1609998341486;
 Wed, 06 Jan 2021 21:45:41 -0800 (PST)
MIME-Version: 1.0
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <d6e4edd213433d24a2a5c7e6a816bc40b0ada32d.1609996381.git.viresh.kumar@linaro.org>
In-Reply-To: <d6e4edd213433d24a2a5c7e6a816bc40b0ada32d.1609996381.git.viresh.kumar@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 7 Jan 2021 14:45:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQT5nVHGAZDhj4dct0v8UMzQ+-mdfBXJsfedR-7mZTnyA@mail.gmail.com>
Message-ID: <CAK7LNAQT5nVHGAZDhj4dct0v8UMzQ+-mdfBXJsfedR-7mZTnyA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] scripts: dtc: Build fdtoverlay and fdtdump tools
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 7, 2021 at 2:16 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> We will start building overlays for platforms soon in the kernel and
> would need these tools going forward. Lets start building them.


The commit log should explain how fdtdump and fdtoverlay are used
while building the kernel tree.







> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  scripts/dtc/Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
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


Adding 'libfdt_dir' is not helpful except
increasing the amount of code.

Please hard-code 'libfdt'


> +libfdt-objs    := fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
> +libfdt         = $(addprefix $(libfdt_dir)/,$(libfdt-objs))
> +fdtoverlay-objs        := $(libfdt) fdtoverlay.o util.o
>  # Source files need to get at the userspace version of libfdt_env.h to compile
>  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
> --
> 2.25.0.rc1.19.g042ed3e048af
>


--
Best Regards

Masahiro Yamada
