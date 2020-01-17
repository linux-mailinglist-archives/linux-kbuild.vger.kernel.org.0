Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7231614118F
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 20:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbgAQTUM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jan 2020 14:20:12 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:34705 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgAQTUM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 14:20:12 -0500
Received: by mail-yb1-f195.google.com with SMTP id l7so6648979ybp.1;
        Fri, 17 Jan 2020 11:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PVL+1at2XquoxaJr8gNJePY05DA3HgkzJpTeOanPYYc=;
        b=DnM8G63IIVppr6XMWLXO+/4+OFGTdA9iPZ41kuZT5VKIG8KmqTHlnuc+yhN6y92FOX
         cR99cfH86Nrk9bI2hQmgR7qu2nkIr7uw/YyIAsuw2FMSaqty+A5nHfadN7V0xNiKnz4X
         0ODnLraNGO6u8je3921Zv1A257d9RK/7DeVXVL7sI62/H7VQczbRw+RRqloMQ94U9PJM
         5L9Tp6NnT97tdyZbPyHVozL8Cza/RPjV8xXFdhxp3y03RYg00gAXdgCbwTJOKXJ4ufum
         2iu9p45Kb9bKuD8HwW+L+uMj3CR0voRvjtvUZk4/JHTXGMsDk30lqw5RB9yS0Y67agFK
         bLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PVL+1at2XquoxaJr8gNJePY05DA3HgkzJpTeOanPYYc=;
        b=sqzjBjFHs2joJ2UOROZ8cD4RuhzmjE1UzwatDpScBht+BKhmoYAeoBU+Ibw2mrFy0c
         NyUF2vck4Dzq0JZlCWVOEyRNGIggIloE+wUI4GIiLHowJk9sub/n4UZWYmBptaONxysS
         L577EvE9kOt700JxUjtUp44p8HlH8GVnh/bPLr5djTRx+9DI1mlKgeceQ04dRNvfnVHW
         CshHq8Q5SETl4BeweV1t440bn8jlx7SKHx/5WPcVpD9tFO8hRLSlMuo2p2rl1S5FwNLO
         deif9W9q/JeJXdCZV0LTtdgm2G5bgMeJ02UgR5i8KxyWeNUTjgrtuTpzfCWdLE9gCa/D
         bavw==
X-Gm-Message-State: APjAAAVeOo6j65EHNApRUEhH0Od6qKvcISiwUzZi1cQ6Uvk/n/BhYQ7n
        /oBl6QNFXa+hSWga6bUXCjE=
X-Google-Smtp-Source: APXvYqxqBEcc/n4INQDJkoFxEz+JwcY8XYI3hQMiBpfbBsnMAjD2KNy6rZ4KN1kYqTM3dQhsd0leWA==
X-Received: by 2002:a25:8042:: with SMTP id a2mr27460203ybn.195.1579288811366;
        Fri, 17 Jan 2020 11:20:11 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id a12sm11950536ywa.95.2020.01.17.11.20.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jan 2020 11:20:10 -0800 (PST)
Subject: Re: [RFC PATCH 3/3] scripts: Use -B dtc option to generate dtb build
 information.
To:     Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        david@gibson.dropbear.id.au, sjg@chromium.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-4-alexandre.torgue@st.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <bc5a94e3-389e-7ef4-5d14-1f7ab30a0826@gmail.com>
Date:   Fri, 17 Jan 2020 13:20:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200113181625.3130-4-alexandre.torgue@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/13/20 12:16 PM, Alexandre Torgue wrote:
> This commit adds a new script to create a string in tmp file with
> some information (date, linux version, user). This file is then used by
> dtc with -B option to append dts file with a new property.
> During kernel boot it will then be possible to printout DTB build
> information (date, linux version used, user).
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 3fa32f83b2d7..6a98eac1e56d 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -235,6 +235,7 @@ quiet_cmd_gzip = GZIP    $@
>  # DTC
>  # ---------------------------------------------------------------------------
>  DTC ?= $(objtree)/scripts/dtc/dtc
> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info
>  
>  # Disable noisy checks by default
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
> @@ -275,11 +276,13 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>  
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
> -	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> -	$(DTC) -O $(2) -o $@ -b 0 \
> +       $(DTB_GEN_INFO) $(@).info ;\
> +       $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> +       $(DTC) -O $(2) -o $@ -b 0 -B $(@).info\
>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> -		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
> -	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> +               -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> +       rm $(@).info ; \
> +       cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>  
>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>  	$(call if_changed_dep,dtc,dtb)
> diff --git a/scripts/gen_dtb_build_info b/scripts/gen_dtb_build_info
> new file mode 100755
> index 000000000000..30cf7506b9d5
> --- /dev/null
> +++ b/scripts/gen_dtb_build_info
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +DTB_TARGET=$@
> +COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
> +
> +touch $DTB_TARGET
> +
> +{
> +  echo From Linux $KERNELRELEASE by $COMPILE_BY the $(date).
> +} > $DTB_TARGET
> 

This specific set of information does not seem to me to be sufficient
to be of much use.  In my previous attempt to capture build time
information into the DTB I included more information that this,
which I felt provided more of the information that would be valuable
to a developer (or testing person) in a development environment,
test environment, or on an end user system.  The exact set of
information is easy to bike shed over, but one could explain what
information might be useful and why (I did not provide that explanation
in my patch series, but in retrospect should have).

