Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D01A6ED59
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2019 04:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390362AbfGTClu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jul 2019 22:41:50 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:37830 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbfGTClu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jul 2019 22:41:50 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6K2faF9009523;
        Sat, 20 Jul 2019 11:41:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6K2faF9009523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563590497;
        bh=cjbTfQ+RiOWGnD+P3w8/hXI1uAkKHwox2bpmBIGRw+c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tvyNq2C5QDy43yWSnQTrt9fZpvbhivoA8oLA/57KW00GlN16/rhWrebkxM6HocdKH
         mHuneFcGH5VckWDQ+5kbfsZjgxxmVmb82pwMDwZRoPU7ue3btduMX9BQI8z26neN/6
         5UPunKfdqKs+TJIwpEEMhdzPDGsdH0m7KpAdvA5kR4ZIcYjee8H5XYHTM9xGdSeeKV
         TqNajkDZfGpSxHIWGip/ch/Q2pU1aeREd1/VsU65BtidqLvI8DjklJAXA8tNpN/+45
         On67gegY5+J+I9Ujsk9rcMTdJdtGKoYyg6A1rRzA10+UMjKpcsX1Mv7AD6tmeey8kf
         VeiA5kw5vXe0w==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id h28so22727481vsl.12;
        Fri, 19 Jul 2019 19:41:36 -0700 (PDT)
X-Gm-Message-State: APjAAAU8mkzuAdyMGj2sKQ48+lWNQXwFCO6OL4TsGuI+xxZYnYt6hY63
        cgDNRsQIgrWOIS/MgqtNiHMxtr0QyY2KNIust2U=
X-Google-Smtp-Source: APXvYqyrP0gBJfWbNX2CrzcI4Xc86qn1ZOWEJC8CWA+yOCL9ygHgd4K3odEMTDiaNQd1kSnM1ODyQpuWXcK5AzVBdeM=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr35031406vsl.155.1563590495717;
 Fri, 19 Jul 2019 19:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 20 Jul 2019 11:40:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com>
Message-ID: <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com>
Subject: Re: [TRIVIAL PATCH] of: per-file dtc preprocessor flags
To:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 20, 2019 at 4:28 AM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> As of today we are able to pass custom flags to dtc compiler but not
> to dtc preprocessor.
> This ability is required for including some board-specific header files.
> It allows us to pass defined constants to dts without their duplication
> in several places.

How to use this option in a useful way?

I see a bunch of defined constants under include/dt-bindings/.

If you are talking about code duplication across architectures,
you can include arm dtsi from arm64 dts, or vice versa.
This was made possible by the symbolic links
in scripts/dtc/include-prefixes/.

Could you please elaborate your issues if you cannot solve them
by the current strategy?



> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  scripts/Makefile.lib | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index f1f38c8cdc74..f2595a608dce 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -166,6 +166,8 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
>                  $(addprefix -I,$(DTC_INCLUDE))                          \
>                  -undef -D__DTS__
>
> +dtc_cpp_flags  += $(DTC_CPP_FLAGS_$(basetarget))
> +
>  # Useful for describing the dependency of composite objects
>  # Usage:
>  #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
