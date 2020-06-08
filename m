Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233F21F16AB
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2020 12:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgFHK2Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jun 2020 06:28:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45227 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729294AbgFHK2P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 06:28:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id i27so8833358ljb.12;
        Mon, 08 Jun 2020 03:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BXETQxJC01f+VTpTkoSBCDRmpaJ0OpSOkPcyqXqxA1Y=;
        b=XNYLPwD6F+5sh92m85zg6yoVFZEq+ZGYmBmSNhFqcWMCiu2FwR7qeTZEUBT4xkcdw2
         pVknksWSDI0Fgrz9NSSpFsHVhrK8eZfsB+YPXnpRbZLH8jWfsOuUMPts5mV03qffvqRS
         Kd/kgub46iaQzmBmcBhYY+5JMiiLNBIOWmy+wMqUHNoOx7AcB/p7PXcYNH0BAxg1TJzj
         DqzmwZyHwdQFSqzsYlxEsEgdEOTmjCMg8s7J0547f5jWrWuBlBriS2zAJPBuayw6A6/w
         ru+N8dea0lVJagXcw16TxldLamHdmmgu1tcqIjeNd0Egtxv2BcqaDlb55deppONHSmct
         /V4Q==
X-Gm-Message-State: AOAM530T0aFOJRWgD5Nk53JCMiArEnVbGF0EsX/i/iZCitazkmKfM3RE
        9gKKDYBDOuQ3CL35qpEObZT5v7LRy84=
X-Google-Smtp-Source: ABdhPJxPvhxjF/vIQVS6Aa0jb9zklpqRmmOXejQY4cdCD4/JCt9NdxOp0ZS5uHCA9JsX3VU1KRJFSg==
X-Received: by 2002:a2e:8991:: with SMTP id c17mr9568883lji.421.1591612090483;
        Mon, 08 Jun 2020 03:28:10 -0700 (PDT)
Received: from [192.168.1.8] ([213.87.137.116])
        by smtp.gmail.com with ESMTPSA id k29sm3614445ljc.136.2020.06.08.03.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:28:09 -0700 (PDT)
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200514131234.380097-1-efremov@linux.com>
 <20200605073955.6384-1-efremov@linux.com>
 <20200608013012.GA216607@roeck-us.net>
 <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
From:   Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
 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
Subject: Re: [PATCH v5] kbuild: add variables for compression tools
Message-ID: <d7e4a235-35eb-1c13-09dc-19a523cbf4ea@linux.com>
Date:   Mon, 8 Jun 2020 13:28:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 6/8/20 7:59 AM, Masahiro Yamada wrote:
> On Mon, Jun 8, 2020 at 10:30 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Hi,
>>
>> On Fri, Jun 05, 2020 at 10:39:55AM +0300, Denis Efremov wrote:
>>> Allow user to use alternative implementations of compression tools,
>>> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
>>> speed up the build:
>>> $ make GZIP=pigz BZIP2=pbzip2
>>>
>>> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
>>> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
>>> since 2015. However, alternative implementations (e.g., pigz) still rely
>>> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
>>>
>>
>> When building mips:defconfig, this patch results in:
>>
>> Building mips:defconfig ... failed
>> --------------
>> Error log:
>> /bin/sh: -n: command not found
>> make[3]: *** [kernel/config_data.gz] Error 127
>> make[3]: *** Deleting file 'kernel/config_data.gz'
>> make[3]: *** Waiting for unfinished jobs....
>> make[2]: *** [kernel] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>> make[1]: *** [autoksyms_recursive] Error 2
>> make: *** [__sub-make] Error 2
>>
>> Reverting this patch fixes the problem. Bisect log is attached.
>>
>> Guenter
>

I tried to reproduce it with cross-compilation on Fedora32.
$ export ARCH=mips
$ export CROSS_COMPILE=mips64-linux-gnu-
$ make defconfig
$ make -j12

And the kernel builds successfully. Could you please provide details about your
compilation steps and environment, esp. what "env | grep ZIP" shows,
"gzip --version", "sh --version", "bash --version"? This will be very helpful.

Additionally:
$ make GZIP=gzip -j12 # works
$ make GZIP=pigz -j12 # works
$ make GZIP=nosuchcommand -j12 # fails, as expected
 
> 
> Agh, this is because of CONFIG_TRIM_UNUSED_KSYMS.
> 

Hmm, it somehow works on my machine. But yes, this call looks like a problem
for these env vars:

autoksyms_recursive: descend modules.order                                       
        $(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \             
          "$(MAKE) -f $(srctree)/Makefile vmlinux" 

> Also, the distro package builds are broken
> e.g.  make GZIP=gzip bindeb-pkg
> 

Yes, thanks.

> Denis,
> 
> I think we should go back to the original
> KGZIP, KBZIP2, KLZOP.
> 

Given that the original patch is already in the Linus tree,
I've sent a hotfix. Commit message is not perfect, because I
didn't have enough time to deeply debug it. I just hope that
the original patch didn't broke too many builds. Maybe later
I will try to prepare a patch with GZIP again when I will fully
debug these corner cases.

Thanks,
Denis
