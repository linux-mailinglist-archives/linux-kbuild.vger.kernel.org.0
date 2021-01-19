Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8562FBC7E
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 17:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730714AbhASQdE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 11:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730577AbhASQc6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 11:32:58 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD723C061573;
        Tue, 19 Jan 2021 08:32:16 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id l7so9409145qvt.4;
        Tue, 19 Jan 2021 08:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vb/8GQGBmEYoUwaU56KAkeG9p8iEq0+1rXD7yKBnb2s=;
        b=K3PYestxgUUx2GT5/UjCWcenRn769y7JlN1u9Q6kQ6RWWpu+L2+KaNuKii5kpw1Rv9
         qh/lrNjgYsiOrtP6kOt08qs3oj1BjbaMC/6zsa4iZCYqBfn4AjlSjQ5QnLnUfLnjImAX
         VRKMvV9srYPGlrsysdyr92m6TGUxcHhjehyqwVrKFZ7DUpaGb4Dz2kZInJo73dC2Mesc
         x4INrIOjPPMe77GCO8KME/KQ9USwor8Qy2hI6AOA131AZle2WUtOBKRu2aLVdFkpTVRB
         cNnTcJC5d9ujEpzfbs1S4GS4GDgUqwcL0itaQZ3T7Sc1nbZmP5tZZLi2X524nH70iaP5
         /J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vb/8GQGBmEYoUwaU56KAkeG9p8iEq0+1rXD7yKBnb2s=;
        b=kyWa0/u+evNev952gwp/7IIiZDUZFu3shRrz0TmWOkW4SG/0xoOKva3Q3gp3VasDey
         Nd5FWXjU6c/Ta58/b9LNlixrz/SvGXwac6UmqTHx2LpigJ0HX0c8fvegLEru/H5r+U+Q
         mPNEI6VEaU2wJFWMhbEM2S0ev1Sllp20YMq0G8aVEHQOrimAijfNp+oBFN9PAUoshkyB
         +P08mJlo0tPVR+5x+vmWR5Bfo2E0KXD5O69OpWoK4tz36ttNmv/aHp3pRZtZ6rZGv77L
         PfaLohXgZGP4Sx89xAtrLF1sE6raea3+Et1PRO4Wchn72E5lLZrfRJ3B3wUueTH04nbu
         guhQ==
X-Gm-Message-State: AOAM5323i7MTZit5wycnGvlbIXnxxJBXUktC6GSbkC3qRgI5CXzxxBfd
        mez+sxDqdOCnWez2IPE6pok=
X-Google-Smtp-Source: ABdhPJz5+Z1Xj8CWizd+LgcyV8YJjUu9uFL9VQfuVC1s9YFZX3S8mqDHfEbize32hrronSvFMwzl/A==
X-Received: by 2002:a05:6214:1764:: with SMTP id et4mr5346092qvb.2.1611073936197;
        Tue, 19 Jan 2021 08:32:16 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id v145sm13643072qka.27.2021.01.19.08.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 08:32:15 -0800 (PST)
Subject: Re: [PATCH V4 1/3] scripts: dtc: Add fdtoverlay.c to DTC_SOURCE
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
 <a1587678b2d5e23c4a3e6248825e285a403f3ad1.1610431620.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <93a19789-b060-ea93-f6d5-e52633b854ac@gmail.com>
Date:   Tue, 19 Jan 2021 10:32:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a1587678b2d5e23c4a3e6248825e285a403f3ad1.1610431620.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/12/21 2:29 AM, Viresh Kumar wrote:
> We will start building overlays for platforms soon in the kernel and
> would need fdtoverlay tool going forward. Lets start fetching it.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  scripts/dtc/update-dtc-source.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
> index bc704e2a6a4a..f1c802011e1e 100755
> --- a/scripts/dtc/update-dtc-source.sh
> +++ b/scripts/dtc/update-dtc-source.sh
> @@ -31,9 +31,9 @@ set -ev
>  DTC_UPSTREAM_PATH=`pwd`/../dtc
>  DTC_LINUX_PATH=`pwd`/scripts/dtc
>  
> -DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
> -		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c \
> -		dtc-lexer.l dtc-parser.y"
> +DTC_SOURCE="checks.c data.c dtc.c dtc.h fdtoverlay.c flattree.c fstree.c \
> +		livetree.c srcpos.c srcpos.h treesource.c util.c \
> +		util.h version_gen.h yamltree.c dtc-lexer.l dtc-parser.y"
>  LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
>  		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
>  		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
> 

I made this comment in the v2 email thread.  Copying it here since v4 is
the current version of the patch series.

DTC_SOURCE is for the dtc program.  Please add a FDTOVERLAY_SOURCE and
related use for the fdtoverlay program.

-Frank
