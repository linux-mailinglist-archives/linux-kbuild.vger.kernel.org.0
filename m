Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADAC2FBC6F
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 17:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731449AbhASQ24 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 11:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731236AbhASQ2t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 11:28:49 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A95C061574;
        Tue, 19 Jan 2021 08:28:08 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id 143so22335379qke.10;
        Tue, 19 Jan 2021 08:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EW8XrT7JtMKJbnFCv1YRnev1AQPs+Hl+bUMfJys3xoQ=;
        b=UZCzTkkjsjT1pA7Mv+p6MiXPbtyHr40esKXDMjjQ1R6ykbEp/T3m//LtX1e11hiyT6
         +Lve7769zBfr7HumVckVtxLJiuAIgdw5ITIRFkPxNFC9YiQuC7gEY7KSmurB02FgyEJj
         m6QcY9ssG+XskJvwK3j4fTrV5MzZp1FjQjowKY4aD/hIHja9QRuRLXZ+r/noRpGEcVLz
         c3wVXt/nyqqtAvNgbOeUGGHHWOgs5gAv7FZcxj08QPwAq8pHRb+iG7ENhrqF+rA6Pc6o
         r9O/wpbg+Cft0VBECoeh105uhM/PUNVW/Oik6EqlvTSeIh5IPzdTzh7/56X9GuDFlbL+
         pOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EW8XrT7JtMKJbnFCv1YRnev1AQPs+Hl+bUMfJys3xoQ=;
        b=tCXlSEjsS/mrqC//6501M/AUyk9g+Bp68uw45GfP0bVhaT+DdNEUR1+QHM4lzfseLq
         IVKD8ydPnVHCJzcPzJugqIYMJeCQTv3yWF5grtqWndcOPbZ+a5v0SluekMiH9cprsceP
         zrVfaLYRAS2xkkB1im7PzxK8qBi04xdWzYeRQaOMWB7oSwcLG64q4jgeMhigwIYVBUFs
         75V8Z7M3wb+YQ7MVXDyK3gmxNUCZKRYHA2acV1Ex/V9KIcZDzL1qYgDgohIKSssNxEYW
         rxKpVOyhCWcl40/skxHr7ASNTHk8g0UuFOBnkIUykuQlQ+ZINDQk/mOnck8/jwyraFTQ
         t56Q==
X-Gm-Message-State: AOAM530CfphrUvNvFuhJpHVQlxIpYJr4TrSnzh7abaRlsYK217iCzm21
        bojEpBc4YIn3KQnr6m4wDYTQGX1EVgiu8g==
X-Google-Smtp-Source: ABdhPJwcSyDBih4gpQEkhh/F2mbFuhXuR6MVs6vP7KIB9FyQJu87Y7m77b5D8nvOMcmB25S98gj3Dg==
X-Received: by 2002:a37:ad0d:: with SMTP id f13mr5119460qkm.355.1611073686981;
        Tue, 19 Jan 2021 08:28:06 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id x25sm12963742qkx.88.2021.01.19.08.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 08:28:06 -0800 (PST)
Subject: Re: [PATCH V2 2/2] scripts: dtc: Build fdtoverlay and fdtdump tools
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Frank Rowand <frowand.list@gmail.com>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <d6e4edd213433d24a2a5c7e6a816bc40b0ada32d.1609996381.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <8e6395db-6ae4-f231-22fb-910eb2208477@gmail.com>
Date:   Tue, 19 Jan 2021 10:28:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d6e4edd213433d24a2a5c7e6a816bc40b0ada32d.1609996381.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/6/21 11:15 PM, Viresh Kumar wrote:
> We will start building overlays for platforms soon in the kernel and
> would need these tools going forward. Lets start building them.
> 
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
> -hostprogs-always-$(CONFIG_DTC)		+= dtc
> +hostprogs-always-$(CONFIG_DTC)		+= dtc fdtdump fdtoverlay
>  hostprogs-always-$(CHECK_DT_BINDING)	+= dtc
>  
>  dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
>  		   srcpos.o checks.o util.o
>  dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
> +fdtdump-objs	:= fdtdump.o util.o
> +

# The upstream project builds libfdt as a separate library.  We are choosing to
# instead directly link the libfdt object files into fdtoverly

> +libfdt_dir	= libfdt
> +libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
> +libfdt		= $(addprefix $(libfdt_dir)/,$(libfdt-objs))
> +fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
>  
>  # Source files need to get at the userspace version of libfdt_env.h to compile
>  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
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
