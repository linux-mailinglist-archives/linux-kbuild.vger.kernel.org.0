Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF5A9169B86
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2020 01:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbgBXA53 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 23 Feb 2020 19:57:29 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41657 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbgBXA52 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Feb 2020 19:57:28 -0500
Received: by mail-pf1-f194.google.com with SMTP id j9so4453506pfa.8;
        Sun, 23 Feb 2020 16:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Aysh99lYJb0QB28h4UkvEdDsB5SZxGmd9sP09+ztSKE=;
        b=gySB25DcqzWbfLwJ7ohcOp1/pIixZ1PNNyctooFBRKlDqn6YlsTfvTZo9ANX9C63O0
         fbABfRUPdqH1LAQxZvdk13lKjGiFuxPOaqgwStuTHzVpKEh19g2ODfg5VmQ20OM7iC7i
         VrQOJF8f7OLHc/apkdxzyw3/peC+a6zRJVPZ6287K8lmOt2Ja5dK6Apb1PSNBYOtb9VR
         TK+zj8BnTM0AoPFZiMBXMXH0Gg0aLSOLfo20RJuruUDUZv62cV8nWB57XSgRvKzlFbdS
         rXEHJU7MBwk1KCHO4SMmCuqCeMHIzVMeuk1Y+a7L1u7TVsVnEibSj1K2kO6tEdABop/n
         s3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Aysh99lYJb0QB28h4UkvEdDsB5SZxGmd9sP09+ztSKE=;
        b=GbRkf5gWlSzA6Kr9MD96t+i8WtI3tQ0VPSJtuA8HrETpXVZsicQ0w/22o7RnRxop21
         gSyioII9p5s8q7c+extJtSr6viDGo725LQ6rrXQygiVZTWD3LdLK0NHqChUXhAQej8b2
         W6HsjUPdYwayX79iEhfB/wqvHn07ULKRJNeTNIuFJfQDa8kyu3UjvSW3MYt9DM9fG0x9
         xz2QKLzVADhYAEhZd6fzrocs2tB9a9ujzpKdjpbGeg+zHOwU17glO6i86cPNmUCbQhWA
         cVI/bsgbcOH77XY/aCDNolOvrdR+6qFvrQ3zV26MaEMEyGjJTO5/9yW4/fc7bxEDiQOh
         lijA==
X-Gm-Message-State: APjAAAVaZrfJWI3UcCqYKl3sYzgameceee2N6CVfRnaXy/fOmChC1DIV
        dtizDZiTPNfKNt70BM393mc=
X-Google-Smtp-Source: APXvYqyTUJlxELEbxm86weJqlQilHU3okCeuY1dsnmFf6p7qnYUJjYoigi4EfsVi3ANhXRQyh/xkjA==
X-Received: by 2002:aa7:95a3:: with SMTP id a3mr23494287pfk.193.1582505847947;
        Sun, 23 Feb 2020 16:57:27 -0800 (PST)
Received: from [192.168.1.56] ([173.195.191.75])
        by smtp.gmail.com with ESMTPSA id s125sm10165591pgc.53.2020.02.23.16.57.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Feb 2020 16:57:27 -0800 (PST)
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build
 information
To:     David Gibson <david@gibson.dropbear.id.au>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, sjg@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org,
        Ian Lepore <ian@freebsd.org>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-2-alexandre.torgue@st.com>
 <592e41a4-6115-474e-b6ce-eeb82f858a78@gmail.com>
 <20200223215936.GB1751@umbus.fritz.box>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <9e77ace1-6821-1094-85e0-a68228b2609d@gmail.com>
Date:   Sun, 23 Feb 2020 18:57:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200223215936.GB1751@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2/23/20 3:59 PM, David Gibson wrote:
> On Fri, Feb 21, 2020 at 11:52:34AM -0600, Frank Rowand wrote:
>> On 2/21/20 10:14 AM, Alexandre Torgue wrote:
>>> This commit adds a new script to create a file (in dts file directory) with
>>> some information (date, Linux version, user). This file could then be used
>>> to populate "build-info" property in every dts file that would use this
>>> build information:
>>>
>>> Example:
>>>
>>> / {
>>> 	...
>>> 	build-info = /incbin/("dtb-build.txt");
>>
>> s/.txt/.dtsi/
> 
> I don't think that makes sense.  This is an /incbin/ not an /include/
> so the text file is *not* dts information.

You are right, thanks for catching that.

-Frank

> 
>> and same wherever the file name is used.
>>
>>
>>> 	...
>>> };
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>>
>>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>>> index bae62549e3d2..a5af84ef4ffc 100644
>>> --- a/scripts/Makefile.lib
>>> +++ b/scripts/Makefile.lib
>>> @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
>>>  # DTC
>>>  # ---------------------------------------------------------------------------
>>>  DTC ?= $(objtree)/scripts/dtc/dtc
>>> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
>>>  
>>>  # Disable noisy checks by default
>>>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>>> @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>>>  
>>>  quiet_cmd_dtc = DTC     $@
>>>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>>> +	$(DTB_GEN_INFO) $(src) ; \
>>>  	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>>>  	$(DTC) -O $(2) -o $@ -b 0 \
>>>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>>> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
>>> new file mode 100755
>>> index 000000000000..0cd8bd98e410
>>> --- /dev/null
>>> +++ b/scripts/gen_dtb_build_info.sh
>>> @@ -0,0 +1,10 @@
>>> +#!/bin/bash
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +
>>> +set -o nounset
>>> +
>>> +DTB_DIR=$1
>>> +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
>>> +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
>>
>> I would remove the filler words "From", "by", "the", and the trailing
>> period ('.').
>>
>> <bikeshed>
>> You might consider using a format more like the Linux
>> kernel version line, which puts parenthesis around the
>> compiled by info.
>> </bikeshed>
>>
>> -Frank
>>
>>> +
>>> +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
>>>
>>
> 

