Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD09530587A
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 11:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314182AbhAZXA0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393926AbhAZSB7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:01:59 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74423C0613ED;
        Tue, 26 Jan 2021 10:01:19 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id a12so6880471qkh.10;
        Tue, 26 Jan 2021 10:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nIegS8UA0od11pz1dGSM7MYRmYvtoRpx66cMRwZkuOc=;
        b=MLxOmnKIEcFzPLPVhhJb9V+TV2xTGT/Y2f4+LYleF0HRH3zXSnhrOjfKrI8w+bdRKE
         mS7Is5+YUEw+sTXJOxGJ2jbdQW2oqEsPpEo0Lgc8j5m7+NnI5mE6eT3L5HrwIzyUyGLn
         n2AclnxTBkqQIrW5AY/21c9Z70CgQqNJ1AyfQipYiGFIgQGZhcB//IKVawa6TAilqzwX
         fpJIlLu7cbRAQhx3IfiOKNmzc6KS8uGnCUFT9Ui2N2otIe7KAkcBbgfQSY5jCyZlwKc+
         CO4Ln+COAlojlTphECj2D/3hNdfVXlwoQGyFNDve6/p+fwrKIWAg0JyUZDRe5tfkm0zT
         Ndeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nIegS8UA0od11pz1dGSM7MYRmYvtoRpx66cMRwZkuOc=;
        b=a4fdvNjr1NQRrVKk8godb5Rh+aqS3S1r9W3kUfofc4RIeFT6ZtFf62rTZ5Uu8WWXGb
         xzb8TJro4UFZXK6a2rWWim/McTE+R6h9bNTf2XeTAOoXUFdIA9KTV5YKfgBYozy0XRj1
         FQ0miXCYhpSXG1ZZAENpveu24//POloTgG8oM7HjuKgztZKS88Agq8OiuqVVzIWeykC7
         2SULppDnpTozxS63Z+CJWrrNrmLx9h5fUBq3DSIt/Dxd7zqkH79iWONFHY88WDBMYr/n
         Zv1kDAXk6ww1DNsVmHvBzkSs4w0XXB2hqzZnLCzwRLPcpUDqfG+Gxk8wCfzm0ECl4nsD
         KjXg==
X-Gm-Message-State: AOAM533OzNpiM7V44LHaBPyBRd1VHTxz7LRMa8GT8lH2quLH9UxuYjdw
        R7SVF5bMbgbzjjOH7bivt9U=
X-Google-Smtp-Source: ABdhPJzAildjI4F6LkkkuyOdZ7dt/Zt2HCWy6RDCq2BzNuKCxC1tge/vv4UWdy2K/KRb9tXtvguv1A==
X-Received: by 2002:a37:5b85:: with SMTP id p127mr6816761qkb.180.1611684078684;
        Tue, 26 Jan 2021 10:01:18 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id a21sm14799792qkb.124.2021.01.26.10.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 10:01:17 -0800 (PST)
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        cyril@debamax.com, linux-arm-kernel@lists.infradead.org
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <a5c324a7-b1e9-0f80-a66a-a1afa960ea09@gmail.com>
Date:   Tue, 26 Jan 2021 12:01:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210125105757.661240-1-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+frank

On 1/25/21 4:57 AM, Uwe Kleine-König wrote:
> Adding the -@ switch to dtc results in the binary devicetrees containing
> a list of symbolic references and their paths. This is necessary to
> apply device tree overlays e.g. on Raspberry Pi as described on
> https://www.raspberrypi.org/documentation/configuration/device-tree.md.
> 
> Obviously the downside of this change is an increas of the size of the
> generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):
> 
> 	$ du -s arch/arm/boot/dts*
> 	101380	arch/arm/boot/dts-pre
> 	114308	arch/arm/boot/dts-post
> 
> so this is in average an increase of 12.8% in size.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 213677a5ed33..0683a5808f7f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -319,7 +319,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>  
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> -	$(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> +	$(DTC) -@ -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
>  	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> 

