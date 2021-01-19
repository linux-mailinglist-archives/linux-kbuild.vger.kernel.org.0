Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235392FBC97
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 17:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbhASQgH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 11:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731022AbhASQfl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 11:35:41 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D02C061573;
        Tue, 19 Jan 2021 08:35:01 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id z11so22400097qkj.7;
        Tue, 19 Jan 2021 08:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uediLwcyF0rthK+Z3QbQAPI4Z6ceHNQyis7tISCnVGE=;
        b=lGdNxBwXy8aLWfaWWDbj04K1MWgJiKaR5ey5p7I3F2dFrzaUDFusL4G+5TSt2Ql3mX
         IdUJxELBSFngnIJ7+t4tupjBgdIKGFIaZ83tKpnknKgz7NzEiD1wFVH5+oexSTBZmfTi
         y5hjEOQ7AWdKuFJ6MiXyD3Q2yYQyy6Xks/dZPpkCFVUo687HJkowougXj3fLy43qzKNa
         lwDo60aar5DC967R/hP7N5fwKrm35GuNh6a7sgTNk8gV/ags5XEGpYl3Y4Q9bitRwj+f
         FEJgMQxIMbmnGxF91XoVFIMTeTbaeglqeVrRPe4pnhE5LCqBXUK3d0Q1nsizRMYa/pWX
         kxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uediLwcyF0rthK+Z3QbQAPI4Z6ceHNQyis7tISCnVGE=;
        b=T8+G1mcw6TwcT1UbX6GxEYUtliHs16LKLPcFOTjDEMv1tPudYg56k4z3+yngnocq65
         GewTAu+N9nZoEzyUoNxo+EXIisWBOkOWlQV5cic4B5sdy3mkxZsbb0Q+CWNnZfu1sH2F
         g1XQCmEwfP8mZwX2uvlHEmi5XMtn6vZ+oQHgJb20zRElKrGXF7jiB38KWP9Iq3F+rkal
         m8YDzYZHHFJLrKSsh19aVcTpIyPyROMw2dwapjBH3VwlkzhL3az0tLPskpcVLjm/Yh6m
         xBDdHxQePlaR0fJThbIK/U4EpBdurZUu8zMlixMknkDpdg7XkLVtoiutNCAxNfs1LdHh
         b33Q==
X-Gm-Message-State: AOAM530mlu7qiFq1sJP1J7YjgMvS/vGlj28ekExaWH+0mF4g9Ld6QAjw
        jAssCtSsoRTf5fUw10vMrW0tqafEzFbxNQ==
X-Google-Smtp-Source: ABdhPJxsqGXAtE6N9H/6pZBEgwhQA3pyfUEltoPUxcbZLVPuiloesSgJSzLlqb1izSTCAGFr9rhZrA==
X-Received: by 2002:a05:620a:1101:: with SMTP id o1mr5139119qkk.489.1611074100580;
        Tue, 19 Jan 2021 08:35:00 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id b16sm5495403qtx.85.2021.01.19.08.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 08:35:00 -0800 (PST)
Subject: Re: [PATCH V2 2/2] scripts: dtc: Build fdtoverlay and fdtdump tools
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <d6e4edd213433d24a2a5c7e6a816bc40b0ada32d.1609996381.git.viresh.kumar@linaro.org>
 <8e6395db-6ae4-f231-22fb-910eb2208477@gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <102ca277-d404-902d-3254-e3ff787c232c@gmail.com>
Date:   Tue, 19 Jan 2021 10:34:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8e6395db-6ae4-f231-22fb-910eb2208477@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/19/21 10:28 AM, Frank Rowand wrote:
> On 1/6/21 11:15 PM, Viresh Kumar wrote:
>> We will start building overlays for platforms soon in the kernel and
>> would need these tools going forward. Lets start building them.
>>
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>>  scripts/dtc/Makefile | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
>> index 4852bf44e913..c607980a5c17 100644
>> --- a/scripts/dtc/Makefile
>> +++ b/scripts/dtc/Makefile
>> @@ -1,12 +1,18 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  # scripts/dtc makefile
>>  
>> -hostprogs-always-$(CONFIG_DTC)		+= dtc
>> +hostprogs-always-$(CONFIG_DTC)		+= dtc fdtdump fdtoverlay
>>  hostprogs-always-$(CHECK_DT_BINDING)	+= dtc
>>  
>>  dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
>>  		   srcpos.o checks.o util.o
>>  dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
>> +fdtdump-objs	:= fdtdump.o util.o
>> +
> 
> # The upstream project builds libfdt as a separate library.  We are choosing to
> # instead directly link the libfdt object files into fdtoverly
> 
>> +libfdt_dir	= libfdt
>> +libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
>> +libfdt		= $(addprefix $(libfdt_dir)/,$(libfdt-objs))
>> +fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
>>  
>>  # Source files need to get at the userspace version of libfdt_env.h to compile
>>  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
>>
> 
> In general, I am a proponent of using shared libraries (which the upstream project
> builds by default) because if a security bug in the library is fixed, it is fixed
> for all users of the library.
> 
> In this specific case, I actually prefer the implementation that the patch provides
> (directly linking the library object files into fdtoverlay, which uses the library)
> because it is the only user of the library _and_ fdtoverlay will not inadvertently
> use the system wide libfdt if it happens to be installed (as it is on my system).
> 
> Any thoughts on this Rob?

I see that this patch series is up to v4, so I commented in the wrong place.
I will repeat this comment in the v4 series.

> 
> -Frank
> 

