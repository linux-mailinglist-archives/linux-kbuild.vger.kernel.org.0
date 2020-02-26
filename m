Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8262B17048E
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 17:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgBZQio (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 11:38:44 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:39885 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgBZQio (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 11:38:44 -0500
Received: by mail-yw1-f66.google.com with SMTP id x184so3652646ywd.6;
        Wed, 26 Feb 2020 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=erd2mUrd075M8oO2yPj+tKoxoFziTJnQdLvZCm0QgxY=;
        b=X9eERp8QG/tuKn6AKY+yJvRNdFHoS9pG+JMlUdxyQYPYSOzXWyPyebgUOFwJQwTnVg
         4WNiomgsGWrQ0M0jMCaVVWJs7dlZlXLR/eX/6C+oeoKyGLE+jhdN32JS4BYUFo/TxxkK
         VBegQxaPBHScmsO2HL1l0CyID+cPVJodQeGAqj5sC/1pZ7I+lkj0InOF6xAJuJ5w4/CQ
         yuksL+0Y/WfH+iSin0lVK6OjOtzg9JxNw5xV8nsH2FQyD2zTZ7iStRxS+zUfqMg59gED
         V0q+EO0lQnMJdfUJfvaVZ+f23YaZ4eL1wOFDU0GtLKgB08EKzym3aLaNH4VXUidqgdX6
         7vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=erd2mUrd075M8oO2yPj+tKoxoFziTJnQdLvZCm0QgxY=;
        b=EGt4nEDOoWLAuG/caYoSDp3At8m0XlT3XFSj0rcwuhaaRJ5wXRsIDMKObrPPhSFRPE
         evjs7lnZsggmKiDhMfHtgAAkx9sByYp/Aul4BpeVcRdTqtc+dox9YfYqlKExDc2cnTJN
         7IZ5oDJS5G6EobkhT5OvzWR0tqdL2kA//pgR/Att/Lz//gJ1KK4dFp5/As5bDSrwAKga
         5YM4u+MBhtySafppba5QBHQQj3iqHHZPGErF7O/UMabrSec2mBGBE5W5AQkObvGA1jzu
         Dkx6RmmVexFIsRuLpPt1rP79twmpWJeP3h2uDGTA7HQ+SwKH54zSfwA+d5ghCJmaA8+j
         9gBw==
X-Gm-Message-State: APjAAAUEWqeBvdkAeiTmRskfqKHmmRmHxCxkYSJ61XpmUeDV09RZiby4
        SuXMLzcoI0jB3PjVdgI6Xyo=
X-Google-Smtp-Source: APXvYqxaNdTjgfv+K7BVwRT1yKLRVTPxR1B/ytKhSJaZCvCJMVXm6o1MFHd3qCmgA1+T5cVjqweqxw==
X-Received: by 2002:a81:1054:: with SMTP id 81mr35605ywq.57.1582735121692;
        Wed, 26 Feb 2020 08:38:41 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id h139sm1127231ywa.35.2020.02.26.08.38.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Feb 2020 08:38:41 -0800 (PST)
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build
 information
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Gibson <david@gibson.dropbear.id.au>,
        Simon Glass <sjg@chromium.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Ian Lepore <ian@freebsd.org>
References: <20200221161217.20069-1-alexandre.torgue@st.com>
 <20200221161217.20069-2-alexandre.torgue@st.com>
 <CAK7LNATmJN-U2GNe2Qd7fS=h5URswe=aFgVJRaBTZt7pi374wg@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <e0b65cba-6e37-8937-897d-ae82973f34e8@gmail.com>
Date:   Wed, 26 Feb 2020 10:38:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNATmJN-U2GNe2Qd7fS=h5URswe=aFgVJRaBTZt7pi374wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Alexandre,

On 2/24/20 11:45 AM, Masahiro Yamada wrote:
> Hi.
> 
> On Sat, Feb 22, 2020 at 1:12 AM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
>>
>> This commit adds a new script to create a file (in dts file directory) with
>> some information (date, Linux version, user). This file could then be used
>> to populate "build-info" property in every dts file that would use this
>> build information:
>>
>> Example:
>>
>> / {
>>         ...
>>         build-info = /incbin/("dtb-build.txt");
>>         ...
>> };
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index bae62549e3d2..a5af84ef4ffc 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
>>  # DTC
>>  # ---------------------------------------------------------------------------
>>  DTC ?= $(objtree)/scripts/dtc/dtc
>> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
>>
>>  # Disable noisy checks by default
>>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>> @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>>
>>  quiet_cmd_dtc = DTC     $@
>>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>> +       $(DTB_GEN_INFO) $(src) ; \
>>         $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>>         $(DTC) -O $(2) -o $@ -b 0 \
>>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
>> new file mode 100755
>> index 000000000000..0cd8bd98e410
>> --- /dev/null
>> +++ b/scripts/gen_dtb_build_info.sh
>> @@ -0,0 +1,10 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +set -o nounset
>> +
>> +DTB_DIR=$1
>> +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
>> +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
>> +
>> +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
>> --
>> 2.17.1
>>
> 
> 
> There are more than 1000 *.dts files
> in arch/arm/boot/dts/.
> 
> So, with this patch, the build system will creates
> arch/arm/boot/dts/dtb-build.txt 1000 times.
> 
> 
> Does it work with parallel build ?
> 
> Think about what would happen
> with 'make -j32 ARCH=arm  dtbs'
> 
> 
> The 32 threads will write to
> arch/arm/boot/dts/dtb-build.txt
> at the same time.
> 
> Then, some of DTB would very likely to
> include the broken dtb-build.txt
> 
> 
> A list of missing parts in this approach:
> 
>  - make it work with parallel build
>  - clean it up with 'make clean'
>  - add it .gitignore  (and Documentation/dontdiff)
> 
> 
> 

You might be able to rework script 'version_dtb_increment_once' from my
previous attempt at this concept.  I do not know if the build system
has changed since 2015 in a way that would make the script incorrect
or if it is still valid.

https://lore.kernel.org/linux-arm-kernel/550A44A8.9090302@gmail.com/

-Frank
