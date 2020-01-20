Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05DC142F6A
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2020 17:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgATQQI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jan 2020 11:16:08 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:33416 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgATQQH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jan 2020 11:16:07 -0500
Received: by mail-yw1-f66.google.com with SMTP id 192so74235ywy.0;
        Mon, 20 Jan 2020 08:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dMR2QJBU8mwguXzF24MAtQqBj4xzoWj1UhHfZ6DEbQU=;
        b=l6vSuXn0iQNJtBxu529TjmBhwLNJihjMleP6uAWGtww6EEirV0ECyzCD+JyhDY8l/h
         kgr7jaJqqHkvG7jN8Ry3cAW0p9xmmWnH+PRyvapw0Zzbre3M9luzSErDmil5ltMWqkQj
         89lHeyacBjV5dLQ74tP4dU1g/hgOO2zoptyv+6bCoHgv7wXweeMTtwmTy9LTRRj9R4tE
         /AdvK2RoTJS85dloI5jhYngyrZxKaYdwTQ3RNtH3f9PEWudTFCIke7dafsTBAZR1ZHnJ
         OOs5ZRZ+3A/c82goic1SvVXZyTZtlm7XawaUj9tePNAaEFmN82GduiaywpJ35hXHlanY
         JhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dMR2QJBU8mwguXzF24MAtQqBj4xzoWj1UhHfZ6DEbQU=;
        b=OqmeWCYv+UFt1kVIBcWY3AsbQLNduEvRv/ApYkwEmsNUQzR7XIK44AQWCq25J2f8+9
         xZfADq6WeVco2VaJCoPym4czoWQc05cLxhLk7sEWB7fmaqcirqrVrdg+NscgkpzDSMeM
         5xm/clxeaDFRnp5d76wp14rMDzYsdTbz2dxPgsUZrBJRVCc35AwUiuIERPutTYgazCvf
         pPNI1g3Xru52rO182vm7u3g/l8bVvwD8s9GPtPilqThjN9t0EgaKCKhJ5ptAOQLVXvc+
         JuvpFGKjONyz4xTV1+5NiRBlGYBKtG1OiTgKPdU4pKiKXck+8XDrSFn24k75FSvpuDci
         982w==
X-Gm-Message-State: APjAAAXPmt4EdAZ7rwNrk/WkVxrpOT2BBfzefwm/sL0KzGyE1HnTYJHt
        axDhYnVj5+eO+mxUbiE2OlI=
X-Google-Smtp-Source: APXvYqwMpDjDDEtNiDqpnf1C9x4lDmRnx9+4m89tTbXV9PL6UBk55W99RfoijHH264iLsM1tTIxm2w==
X-Received: by 2002:a0d:fb46:: with SMTP id l67mr42006467ywf.38.1579536966644;
        Mon, 20 Jan 2020 08:16:06 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id f138sm16113793ywb.99.2020.01.20.08.16.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 08:16:06 -0800 (PST)
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
Message-ID: <5b5a40b5-6954-05aa-5c7f-5ae8100aa1ee@gmail.com>
Date:   Mon, 20 Jan 2020 10:16:05 -0600
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

The indentation should be tabs instead of spaces.

-Frank

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

