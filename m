Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EDA2FBCAB
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 17:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732794AbhASQi2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 11:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732565AbhASQhr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 11:37:47 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BB4C061575;
        Tue, 19 Jan 2021 08:37:06 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id e15so14102565qte.9;
        Tue, 19 Jan 2021 08:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bCSZ3cFgDncczjOTQzrLh3KhFyorQ6+1KD0+f0P1dME=;
        b=FM397utP+4/o8rUBWPME1wIrAYgGf43fXWuy1hyuw0mWNEHQrxsFVvf1bG1ZmCaBno
         AyIE5jOqNsxpfWzaUcpZhEihFeV0KP0oEnPoohl8fY7y3E8QYOrRfq5cFnOWFzMhz89E
         M4tfC6q64IEJD56nZBIL4rGiwv9BxmRvOOGisyWSTGqKu5JDbyqA64j0nnpisk8APiDi
         8trQRBpfRh7jmJ3EdC2PPt71xl9XpLQtWjX1y+mOv13kzTfVLhTlvwDQ2oZOq6LPDfJv
         CsBdZq9rhFpLXC6ALA6CA+4cOIbTKMLIq3S8PdM9NLB+dvkJxJBPiVWWP+3a43AuX6cS
         B74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bCSZ3cFgDncczjOTQzrLh3KhFyorQ6+1KD0+f0P1dME=;
        b=ID/Agr1Mhm2s2+9cbNUD1Q/WQfbrDegL6uwvPuNqtq+B1E0jS+vqawbfxS6RGEeHT/
         bm4GAkTKRPuBiwb7XAYx/Yn5XWrHVbiO1sTKkkqkm+k0mmznqBZXxszXBoxSwEtMu+Oq
         hXuIEiRYtYzBVrpM0/G9E2op0bR7AzTzZmTkcpP32qnsU01luKJUccAvSD0nuOaFyTqJ
         7uAViCHHI/9eGPgvAmchQJesfymN72yhFMhaT6pk4GnFM+FvwwWwH2yPfbTKA5wQXz9/
         PMgTlVwYHa6owqX2B27IT3oiDukp0vOCG5jZznsnQMz9CVvSkWO8/7t+St5vzSa/9nvo
         3N8Q==
X-Gm-Message-State: AOAM531y38AN7CrUHoG3GxLajaG8AEaqVGFRmoW8xvt8izDmIx/NeQGk
        0plCEw52d3/1OOxvHx3yudHka4dinl30/g==
X-Google-Smtp-Source: ABdhPJwaCSQVQJ5qmH28RmEa7+Y91MTcWHElNc3H0KIU+KNdhebpBpYrO1rymfA4b4kF6Bt8EfU15A==
X-Received: by 2002:ac8:59cb:: with SMTP id f11mr5052769qtf.70.1611074226273;
        Tue, 19 Jan 2021 08:37:06 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id z78sm13264930qkb.0.2021.01.19.08.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 08:37:05 -0800 (PST)
Subject: Re: [PATCH V4 2/3] scripts: dtc: Build fdtoverlay tool
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
 <facca66aba8070ef8bdb075ec442287c81e7d23e.1610431620.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <c77e66ee-5553-123a-7ec7-bf3d9e3cebd1@gmail.com>
Date:   Tue, 19 Jan 2021 10:37:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <facca66aba8070ef8bdb075ec442287c81e7d23e.1610431620.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

I made these comments in the v2 patch series.  I am copying them here since
this is the current version.

On 1/12/21 2:29 AM, Viresh Kumar wrote:
> We will start building overlays for platforms soon in the kernel and
> would need fdtoverlay going forward. Lets start building it.
> 
> The fdtoverlay program applies (or merges) one ore more overlay dtb
> blobs to a base dtb blob. The kernel build system would later use
> fdtoverlay to generate the overlaid blobs based on platform specific
> configurations.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  scripts/dtc/Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index 4852bf44e913..5f19386a49eb 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -1,13 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # scripts/dtc makefile
>  
> -hostprogs-always-$(CONFIG_DTC)		+= dtc
> +hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay
>  hostprogs-always-$(CHECK_DT_BINDING)	+= dtc
>  
>  dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
>  		   srcpos.o checks.o util.o
>  dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
>  

# The upstream project builds libfdt as a separate library.  We are choosing to
# instead directly link the libfdt object files into fdtoverly

> +libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
> +libfdt		= $(addprefix libfdt/,$(libfdt-objs))
> +fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
> +
>  # Source files need to get at the userspace version of libfdt_env.h to compile
>  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
>  
> 

In general, I am a proponent of using shared libraries (which the upstream project
builds by default) because if a security bug in the library is fixed, it is fixed
for all users of the library.

In this specific case, I actually prefer the implementation that the patch provides
(directly linking the library object files into fdtoverlay, which uses the library)
because it is the only user of the library _and_ fdtoverlay will not inadvertently
use the system wide libfdt if it happens to be installed (as it is on my system).

Any thoughts on this Rob?

-Frank
