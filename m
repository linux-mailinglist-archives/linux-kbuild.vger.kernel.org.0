Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD152FBC8E
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 17:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbhASQcG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 11:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbhASQbv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 11:31:51 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A436C061573;
        Tue, 19 Jan 2021 08:31:11 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id d15so8665330qtw.12;
        Tue, 19 Jan 2021 08:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zaa2OrA/pICA+No44HsgGLDx902Nxuz3XBpNLHgzF6Q=;
        b=aWPPApP8sXGus1LuujhNi9cPpGiNyQQNcfOwIpcXWko9PR6dCOteEqj4CP51wW6QNx
         /jAtMy6gvGxzxtEpaVoUX6DgceaZ9/WAHwzOJd63HPIlYSMNkCMKawvgmc5v9dBj31o+
         hESBqAqX4Du4sHmjNeaxD+EldatcKMefAggqOpjrH8jj2SBJ+8vD8xBJAEM9q+EyNaM7
         LRiUpyzDl1C1r8oO30KI7v2UsFk5o+TlRsHCZEIbB294NZzaOZ0gDYqKeUoAR3+h44X8
         Q1hSx2E1Kfpqpnxv3eAJ+z615ubkk0PqdX/UXXLbOX1tlhKL+ZGOug7vsSAvj1nkQ3Dh
         TsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zaa2OrA/pICA+No44HsgGLDx902Nxuz3XBpNLHgzF6Q=;
        b=jvc9xje+w4ZqrB3e6nQvr/CMOhdc5u5x24UMt/RiDa+3Jo+xPSDPvk8QjzCW88hpbm
         Rq8DzOMJuiUoAY3Gghe2t//iWzHvu+R1g9XIHCX43hdAWZddUbtAAoXcsPAmkiSqSNU0
         KcYfmESidExwcMWaJ7KhOohdxedr5BUF/DpT/ybH6n4jyVy3oDKAXz18nFplym3dkM5d
         q8YmZz39SYIk2HHTBXUIMzxNOrnZEh8otBGotTgsyOQ5D6aqoqRIJM/qQiuJQXWDSGuu
         FJFC0V53xzrfl9iaj/P9cpFOsrqJj4gabncPSVcN4/eWE/v4wR/Tpkib7ehcuhnMqhYF
         OmFA==
X-Gm-Message-State: AOAM531Qog/sAMLdTdYq9p8uBi+Th1HxHJ4iudxy9ksEynat8T/NqBPN
        EwW0Y4kqGOD1C8OmDYBYXsQ=
X-Google-Smtp-Source: ABdhPJz4MXDZ7eo+RUon6CdwDdjZMBza2re/XR+ei/b93emr0uKf3U0pVcCfV+VMDmu1ScwPOpjkRQ==
X-Received: by 2002:ac8:3954:: with SMTP id t20mr4787829qtb.241.1611073870456;
        Tue, 19 Jan 2021 08:31:10 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id b67sm12975045qkc.44.2021.01.19.08.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 08:31:09 -0800 (PST)
Subject: Re: [PATCH V2 1/2] scripts: dtc: Add fdtoverlay.c and fdtdump.c to
 DTC_SOURCE
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <eb85b5ba-e2c5-7601-6934-089b5b1370d2@gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <e272ec7f-fa6e-9c35-142c-9f2dff0115ce@gmail.com>
Date:   Tue, 19 Jan 2021 10:31:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eb85b5ba-e2c5-7601-6934-089b5b1370d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/19/21 10:21 AM, Frank Rowand wrote:
> On 1/6/21 11:15 PM, Viresh Kumar wrote:
>> We will start building overlays for platforms soon in the kernel and
>> would need these tools going forward. Lets start fetching them.
>>
>> Note that a copy of fdtdump.c was already copied back in the year 2012,
>> but was never updated or built for some reason.
>>
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>> V2: Separate out this change from Makefile one.
>>
>> This needs to be followed by invocation of the ./update-dtc-source.sh
>> script so the relevant files can be copied before the Makefile is
>> updated in the next patch.
>>
>>  scripts/dtc/update-dtc-source.sh | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
>> index bc704e2a6a4a..9bc4afb71415 100755
>> --- a/scripts/dtc/update-dtc-source.sh
>> +++ b/scripts/dtc/update-dtc-source.sh
>> @@ -31,9 +31,9 @@ set -ev
>>  DTC_UPSTREAM_PATH=`pwd`/../dtc
>>  DTC_LINUX_PATH=`pwd`/scripts/dtc
>>  
>> -DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
>> -		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c \
>> -		dtc-lexer.l dtc-parser.y"
>> +DTC_SOURCE="checks.c data.c dtc.c dtc.h fdtdump.c fdtoverlay.c flattree.c \
>> +		fstree.c livetree.c srcpos.c srcpos.h treesource.c util.c \
>> +		util.h version_gen.h yamltree.c dtc-lexer.l dtc-parser.y"
>>  LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
>>  		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
>>  		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
>>
> 
> DTC_SOURCE is for the dtc program.  Please add a FDTOVERLAY_SOURCE and
> related use for the fdtoverlay program.

I see that this patch series is up to v4, so I commented in the wrong place.
I will repeat this comment in the v4 series.

-Frank

> 
> -Frank
> 

