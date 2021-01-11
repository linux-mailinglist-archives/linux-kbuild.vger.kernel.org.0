Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38B22F2281
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 23:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732176AbhAKWOd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 17:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730805AbhAKWOd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 17:14:33 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C4BC061786;
        Mon, 11 Jan 2021 14:13:53 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id w79so301935qkb.5;
        Mon, 11 Jan 2021 14:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nUSuOLEwKddwqAGQmUtdt1EL4PjE5423SzZtxcSveBk=;
        b=n0RinPCSd6PDjjzBzNAePmt0rFKjNgZ2Rq8UadvjZBjYbsggF2cF0kca77n9CBFXGS
         pwPQWwNXUbQZcr9Dm0JK4idGhlnTYPUFPHg4MehE+ZPn4Hyn8+5jzqP3IghHxR9aNcIo
         EdBQUbhUxNJrmQ2bIodk3y6JL9NdesS3OsWXA7N2ZYP06Myd+rqDs0xvE/IPq1jBxoU/
         ARLiLVRrKdfXyI2bUHPSHFZQnGwjywwgnLOOfk3ggYiIs377YDGa+qg9QcCzPtqe/Ome
         AVTnDNF4zKZbH2nnIUEuWfp4EkaQV/jZMgfEp9j2nAssEn0f1chKRcIX72Fi15sdfrNW
         FH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nUSuOLEwKddwqAGQmUtdt1EL4PjE5423SzZtxcSveBk=;
        b=flGxXcNw5XQ+5TyZYv8xnPucoCFieqNIpwqjU56+eai0l8/ymto5DWCauVGB+brIFa
         0D/F9lXrKWwdqZkZQ0ausGFT05wns/s+7pdhAQDBwHvAflrC3fs0Ukd66u5ARCtEAp1B
         fO62f/KB58uA8mWvGptUaRBAwsR3SQCBgm6j1cQdk62+GKowWcRlhrkTnrVZEoYtt7F5
         ZoQr3gcuRurvU3PocBkZ1P8pJmft3uwyp9VJA9X+UyVak3eyW01+Qln5OfIYcbbUJZb/
         gvwUkU5lXmkAwYvfVKTXeF3uU7iOpKWkby7aH+4CsvxkNBygrFYa2DW5ld/CxE511umk
         ixiA==
X-Gm-Message-State: AOAM532aOfmWdira3FERnMbEhvTUxiRtjr12p/MSGAQEZRZnEpgvOB21
        PQlUpzO+UEapWbpIUBJEBVg=
X-Google-Smtp-Source: ABdhPJzHX0z0hgj/Frp8oQS6zmOwwhR0jVYTmjM7pSi5J6S3ezg+zjKEQLsV+8HEEXzyhajNaZVcMg==
X-Received: by 2002:a37:4d8e:: with SMTP id a136mr1454492qkb.317.1610403232586;
        Mon, 11 Jan 2021 14:13:52 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id a194sm590265qkc.70.2021.01.11.14.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 14:13:52 -0800 (PST)
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
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <f346aea6-b97f-484f-6371-965831fc06fc@gmail.com>
Date:   Mon, 11 Jan 2021 16:13:51 -0600
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

Hi Viresh,

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

Just an FYI that Rob will do the ./update-dtc-source.sh step at the appropriate
time, creating a commit to be submitted in his pull request to Linus.

That way Rob will ensure that all of the updates from the parent project are
updated in a careful manner.

-Frank

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

