Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CD52FBC4C
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 17:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731229AbhASQW5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 11:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730889AbhASQWe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 11:22:34 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5505FC061573;
        Tue, 19 Jan 2021 08:21:54 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id 22so22357491qkf.9;
        Tue, 19 Jan 2021 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8bKO85uYL0TuKxcIkZ/8W11uUZW2LrfduTLto/+NkzI=;
        b=ED4QgOlPjbdeNh5YfNkolLpSW8IX2bPLuSFg/tr0zbzxHmNRxlcQBXFgPmuRMyPK7u
         4F4hvIFaQtqE+4q3gyjy5h0o2bUpEoUqg53nbbYo4dqj8iEt/dSi7QxWSwHpiN6VRRMM
         kk+uUnAvzzsOJWb0oMyBYPLijnnW6nftCOSQEUovCT1X5zfuniTMhy9j0IuIIQ3stLmm
         iF/Q20rlPiyRElRgruCxPlfHhOdanbSY9oCjTQ+Jfb4jQpluGAIM+VORGJ8EqANDi/lO
         U8h+IeT2BjMa/fERMEvAITo+PwidWJdiFEytv3Mw9gYCI+pwSxQfrTRNyfxcIF9mkl57
         2PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8bKO85uYL0TuKxcIkZ/8W11uUZW2LrfduTLto/+NkzI=;
        b=LApL7tob42ByrjgRCYXi10R3bC4CfCn9dzrSd5k5JQK3T+YNZi/9AJXZaCAh9T7iqP
         JVSCEtNoYdcYA9JwYbsrOc8DCT6Nijvc6zo0Xnoss+upz8ry+/EMpk8LMkSmVBzMVeCn
         Ou/ARZ2EAz6nkUxklKuwUR+R5xxNaRtBRTow520yyrXPkBGjZ4fEjLNn6lN8Wp9PdAKj
         8hMFdysQToAWUkNcB/h3tbqlL1SySPxRvaD9LFSeGhnbG0VM3owAD5FYyZAORp/13d0L
         LN/hgrqgxBHBh2YQHKHyvFjkwTfR7SBr+NDaCe599o2QpIq4LEQlFP9uY44Nb6Gzuk1A
         c+Lg==
X-Gm-Message-State: AOAM530Bb7HAG4dENvdNxF56T+fDgGZ/yUJPs//ChlC1fC8wyV2DreNO
        CUGB5PySigNrhsSOjKCAYcc=
X-Google-Smtp-Source: ABdhPJzORVjV8oYhIUFvxkNrvq9ZcABKnSG69miE7HR5p6O/qB/yiVAy7sqvFvb8VxZ8IKSI6VL+Nw==
X-Received: by 2002:a37:6611:: with SMTP id a17mr5112101qkc.150.1611073313510;
        Tue, 19 Jan 2021 08:21:53 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id c28sm12924389qtv.2.2021.01.19.08.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 08:21:53 -0800 (PST)
Subject: Re: [PATCH V2 1/2] scripts: dtc: Add fdtoverlay.c and fdtdump.c to
 DTC_SOURCE
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Frank Rowand <frowand.list@gmail.com>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <eb85b5ba-e2c5-7601-6934-089b5b1370d2@gmail.com>
Date:   Tue, 19 Jan 2021 10:21:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/6/21 11:15 PM, Viresh Kumar wrote:
> We will start building overlays for platforms soon in the kernel and
> would need these tools going forward. Lets start fetching them.
> 
> Note that a copy of fdtdump.c was already copied back in the year 2012,
> but was never updated or built for some reason.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2: Separate out this change from Makefile one.
> 
> This needs to be followed by invocation of the ./update-dtc-source.sh
> script so the relevant files can be copied before the Makefile is
> updated in the next patch.
> 
>  scripts/dtc/update-dtc-source.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
> index bc704e2a6a4a..9bc4afb71415 100755
> --- a/scripts/dtc/update-dtc-source.sh
> +++ b/scripts/dtc/update-dtc-source.sh
> @@ -31,9 +31,9 @@ set -ev
>  DTC_UPSTREAM_PATH=`pwd`/../dtc
>  DTC_LINUX_PATH=`pwd`/scripts/dtc
>  
> -DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
> -		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c \
> -		dtc-lexer.l dtc-parser.y"
> +DTC_SOURCE="checks.c data.c dtc.c dtc.h fdtdump.c fdtoverlay.c flattree.c \
> +		fstree.c livetree.c srcpos.c srcpos.h treesource.c util.c \
> +		util.h version_gen.h yamltree.c dtc-lexer.l dtc-parser.y"
>  LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
>  		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
>  		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
> 

DTC_SOURCE is for the dtc program.  Please add a FDTOVERLAY_SOURCE and
related use for the fdtoverlay program.

-Frank
