Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABC9D16859D
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 18:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgBURwh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 12:52:37 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:35874 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgBURwg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 12:52:36 -0500
Received: by mail-yb1-f195.google.com with SMTP id u26so1509684ybd.3;
        Fri, 21 Feb 2020 09:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pfOqpQDUaur2M6YY/gkICE0ETj9HGANxbXQFE0s27Qs=;
        b=T8rtdkXd7pSann2Acm8dZHl0L8ucIUt34HX10/+FdzKbPO6vXXvd1qO+G4fGgMyGKD
         Lez9AIuBpCxJnUHXzL/KXaHoe6Nk8TB6fRHO5ykztU2BqNTn2fBvE150o0/SZIM1nBsa
         Un2WauQf+OnWf6o6hdqorjNO1nVtSPp/RKUhPVop1Kjb8GcV+fj/9UUiXNln2xpXVdEw
         drqK2p5MolJ5p3w2SKYLkLBsSAcLCwbdMJCgfbbZOY8VMuV0W1eIRyJFkms6ZhYa7PNI
         VBzbsQEIgQn5LaLuEq2ZEdCbjt1iP3T+DS8z6+JKT6PrwiCc7AWJVFeKbsdIohA23q+l
         T24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pfOqpQDUaur2M6YY/gkICE0ETj9HGANxbXQFE0s27Qs=;
        b=twUp8JxXjC+M/p8mjtCqpWyWyc/aMXS6PYCwXvLe4in1pA1zhiSp8g7uOuOX88BFz7
         RYtFHm6R+HSVNd9CQQ1//U40Ge6tjbQLOE5JamPSKvjY2gnvg5GO4f+9YxGFgfLo8NgJ
         ReH8m/aVusdF2JTnJhld3NA+Dduer6RQLIpkg8Difo0lmOCuG4EG55C0rpZQ73sym1gQ
         CoTmG4MLVGHszUzV8M8VtErnhQ7pOB1mWszENZubxayBoORQtiyXy1X9V/5MripbxMAn
         h8CrqQQ62fnbPy8tsPZ8KQqqEGMmT4b+YhT8ISAB185xbPAW1x8vm03NE9XslXO4gBSd
         SNSA==
X-Gm-Message-State: APjAAAXN6CohcDM8yn2STBJmn0tXNbWD8rhOXumQra9kvY7yj9h370TO
        T25SlCOzNHAvGb9eyF8LdqQ=
X-Google-Smtp-Source: APXvYqyJ0oww4/TUajF27cnTog03w0Ji7aBpRzBBVCKkuhgwDKSzTq1M2iEyeFbL2S7YRNA+Da6HoA==
X-Received: by 2002:a25:99c3:: with SMTP id q3mr32471987ybo.323.1582307555679;
        Fri, 21 Feb 2020 09:52:35 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id i84sm1570680ywc.43.2020.02.21.09.52.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Feb 2020 09:52:35 -0800 (PST)
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build
 information
To:     Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        david@gibson.dropbear.id.au, sjg@chromium.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org,
        Ian Lepore <ian@freebsd.org>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-2-alexandre.torgue@st.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <592e41a4-6115-474e-b6ce-eeb82f858a78@gmail.com>
Date:   Fri, 21 Feb 2020 11:52:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200221161418.20225-2-alexandre.torgue@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2/21/20 10:14 AM, Alexandre Torgue wrote:
> This commit adds a new script to create a file (in dts file directory) with
> some information (date, Linux version, user). This file could then be used
> to populate "build-info" property in every dts file that would use this
> build information:
> 
> Example:
> 
> / {
> 	...
> 	build-info = /incbin/("dtb-build.txt");

s/.txt/.dtsi/

and same wherever the file name is used.


> 	...
> };
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index bae62549e3d2..a5af84ef4ffc 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
>  # DTC
>  # ---------------------------------------------------------------------------
>  DTC ?= $(objtree)/scripts/dtc/dtc
> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
>  
>  # Disable noisy checks by default
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
> @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>  
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
> +	$(DTB_GEN_INFO) $(src) ; \
>  	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>  	$(DTC) -O $(2) -o $@ -b 0 \
>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
> new file mode 100755
> index 000000000000..0cd8bd98e410
> --- /dev/null
> +++ b/scripts/gen_dtb_build_info.sh
> @@ -0,0 +1,10 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -o nounset
> +
> +DTB_DIR=$1
> +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
> +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"

I would remove the filler words "From", "by", "the", and the trailing
period ('.').

<bikeshed>
You might consider using a format more like the Linux
kernel version line, which puts parenthesis around the
compiled by info.
</bikeshed>

-Frank

> +
> +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
> 

