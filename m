Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B603528BE1A
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 18:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403894AbgJLQgS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 12:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403803AbgJLQgS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 12:36:18 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874E1C0613D0;
        Mon, 12 Oct 2020 09:36:18 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id o9so8875018plx.10;
        Mon, 12 Oct 2020 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gd86cnVMEv6nUkqocEH/guphnmHfom7rwvxSoLZ1nQI=;
        b=k7q3poQliNKrMvFe1BHWGlTNslk5tloXi5A3aKJecrv11W7LeZbZ8+46JBcbyW4WFj
         oG0T+Oq8U5Uh9y4fT7Ye1kBl7fJJSMZeFPBOuUI8pWi5nRyBgk02EQIDi1FmhO4ZgiZy
         nszISfAfxb3Q3AEySwTSq5nv2RLPMK78fsKIFeF5fmbx1AdnkWbphY8cD5aGxRNPBEDx
         pcki268j1GbJ9vNuYYoiqJTqDamy6sU9s1yXq0Se2YsOjgBJ67Srp2H2Br4P5LUv1V6m
         HmQwSqdAasoEgG9uJfOjBi1b55fLxuzOpaWpk6I4L8vmap+gy6lk4PNLLeupWaXE2dgz
         FWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gd86cnVMEv6nUkqocEH/guphnmHfom7rwvxSoLZ1nQI=;
        b=GU1F7+/1/KB59N8qS4U0Mbx5lPM9QKgjULBGX9AF/yv1+11vV8J94xq8KHpGloFd8l
         WmvIfSAVa6D2hjfKCz1lCVnSG13ojr8zgCWREeQyIGQIbwtnU14RTBJzHA+5gXjuzQKW
         66PPgH2lXk3X1H9HQCcVYxd7e5WWZQpSRCUDv8mTlt+3QsbNVCxriwJxc2xtnAk7cJuz
         2sBJIfFBuHCWqgCco5TfE8QW1+ioejn1D6A8z9VDAl3LoQtR0q1BNO0jVxkj+8USpPCi
         v8/zd5CeJrPjyG9/M+ogJ8ncpeC9jHVyGLs6obPpbuBsJdRRMGFolsXHDW3UoPHIdW4w
         dJeQ==
X-Gm-Message-State: AOAM533NoJCGo5QAITkNvFtebOyXRmkhrr5UCwlazkVvy852GxSdXLMs
        5YSsf9ebsRSx2EQsc42DHJo=
X-Google-Smtp-Source: ABdhPJz8AZdqfnri4o1DwdFFnh8hMt0zGwqgg9ejf3blzSfx/a97v/U3yLzd4m7LH8J9Ei3f+RmI2A==
X-Received: by 2002:a17:902:a715:b029:d3:c2b4:bcee with SMTP id w21-20020a170902a715b02900d3c2b4bceemr25272756plq.22.1602520577791;
        Mon, 12 Oct 2020 09:36:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
        by smtp.gmail.com with ESMTPSA id q24sm23427124pfn.72.2020.10.12.09.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 09:36:16 -0700 (PDT)
Subject: Re: [PATCH RFC 0/2] use interpreters to invoke scripts
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
 <CAK7LNAQwib66YwnMuN9qGQBs8dqqVaufOr9BqYMKfYUqiXu6jg@mail.gmail.com>
From:   Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <0dfaf697-1f69-74c4-ffc1-30b77026db68@gmail.com>
Date:   Mon, 12 Oct 2020 22:06:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQwib66YwnMuN9qGQBs8dqqVaufOr9BqYMKfYUqiXu6jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 12/10/20 9:48 pm, Masahiro Yamada wrote:
> On Sun, Oct 4, 2020 at 12:19 AM Ujjwal Kumar <ujjwalkumar0501@gmail.com> wrote:
>>
>> This patch series aims at removing the dependency on execute
>> bit of the scripts in the kbuild system.
>>
>> If not working with fresh clone of linux-next, clean the srctree:
>> make distclean
>> make tools/clean
>>
>> To test the dependency on execute bits, I tried building the
>> kernel after removing x-bits for all files in the repository.
>> Removing execute bits:
>> for i in $(find -executable -type f); do chmod -x $i; done
>>
>> Any attempts to configure (or build) the kernel fail because of
>> 'Permission denied' on scripts with the following error:
>> $ make allmodconfig
>> sh: ./scripts/gcc-version.sh: Permission denied
>> init/Kconfig:34: syntax error
>> init/Kconfig:33: invalid statement
>> init/Kconfig:34: invalid statement
>> sh: ./scripts/ld-version.sh: Permission denied
>> init/Kconfig:39: syntax error
>> init/Kconfig:38: invalid statement
>> sh: ./scripts/clang-version.sh: Permission denied
>> init/Kconfig:49: syntax error
>> init/Kconfig:48: invalid statement
>> make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
>> make: *** [Makefile:606: allmodconfig] Error 2
>>
>> Changes:
>> 1. Adds specific interpreters (in Kconfig) to invoke
>> scripts.
>>
>> After this patch I could successfully do a kernel build
>> without any errors.
>>
>> 2. Again, adds specific interpreters to other parts of
>> kbuild system.
>>
>> I could successfully perform the following make targets after
>> applying the PATCH 2/2:
>> make headerdep
>> make kselftest-merge
>> make rpm-pkg
>> make perf-tar-src-pkg
>> make ARCH=ia64 defconfig
>> ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare
>>
>> Following changes in PATCH 2/2 are not yet tested:
>> arch/arm64/kernel/vdso32/Makefile
>> arch/nds32/kernel/vdso/Makefile
>> scripts/Makefile.build
>>
>> Ujjwal Kumar (2):
>>   kconfig: use interpreters to invoke scripts
>>   kbuild: use interpreters to invoke scripts
>>
>>  Makefile                          |  4 ++--
>>  arch/arm64/kernel/vdso/Makefile   |  2 +-
>>  arch/arm64/kernel/vdso32/Makefile |  2 +-
>>  arch/ia64/Makefile                |  4 ++--
>>  arch/nds32/kernel/vdso/Makefile   |  2 +-
>>  init/Kconfig                      | 16 ++++++++--------
>>  scripts/Makefile.build            |  2 +-
>>  scripts/Makefile.package          |  4 ++--
>>  8 files changed, 18 insertions(+), 18 deletions(-)
>>
>> --
>> 2.26.2
>>
> 
> 
> Andrew Morton suggested and applied the doc patch
> (commit e9aae7af4601688386 in linux-next),
> but did not pick up this series.
> 
> It is difficult to predict which patch he would
> pick up, and which he would not.
> 
> 
> I can apply this series
> together with Lukas' base patch.
> 
> 
> I pointed out possible mistakes in 2/2.
> I can locally fix them up if you agree.

I agree with the changes you pointed out. I was in the process
of sending a V2 patch series (almost done). But if you prefer 
on locally fixing them, that is completely fine.

> 
> 
> BTW, Kees Cook suggested dropping the x bit
> from all scripts, but I did not agree with that part.

IIRC, in the discussion Kees Cook suggestion was not to drop
x bit but rather he meant to use that as a trick to catch
any existing dependency on x bit.

> 
> 
> In the doc change, Lukas mentioned
> "further clean-up patches", but I hope
> it does not mean dropping the x bits.

IMO, he did not mean to drop the x bits.
But rather I have many more small changes similar to these.
He must be referring to these two patches and any future
patches around this issue.

> 
> 
> --
> Best Regards
> 
> Masahiro Yamada
> 

Thanks
Ujjwal Kumar
