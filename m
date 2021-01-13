Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566692F546A
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jan 2021 22:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbhAMU7Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Jan 2021 15:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbhAMU6x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jan 2021 15:58:53 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0205EC061794;
        Wed, 13 Jan 2021 12:55:50 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id m6so2010809pfk.1;
        Wed, 13 Jan 2021 12:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J9lVrM6cSutgG7mLzBj653Ro4jtg4186uGwFWHcVmp8=;
        b=aRbWDjM0yw+GzgajvHwsGcoM/qQAnLebk4lOpB6oieho/KvR/07e+KyNCPGY5laQw4
         SPRAXQMAnMCbRMCTC5fqzPugVtDlbETr5J97GgdQ1sAv0cKQW0tL8ofkciZjiXIlwHQq
         8iKkxV3P+ks7L5tVLOs5lBAmCILODu+eHpjX7VKBnX1JQS8a4gOclyrrGXRCLd3zwPNo
         MCkmKjfE9QMOM4wJx85TZZ6+jGtD54JDm/5GV3YNyYf7pmQMVps2rBjhXfJo6fVDQ7aD
         qXJEQZi7fP0/r4g5G+q+mmyoGfG7mcYVVo2RpYgUffvfo1tqWddaZ+KOflabOsP2dq7Z
         X4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J9lVrM6cSutgG7mLzBj653Ro4jtg4186uGwFWHcVmp8=;
        b=bSBs7fWvUKQ6G+MRh6k+9pTByg8UahqbwqApmG3oB8Ase0bLA1JoRhuvuqa+VMhGqD
         nTz5XfARidWnIsq+XX1xiOeEpkMIhEBY/PYUUWepvW0mfe486+zw8XB+5fcKU+3yKUud
         CQTuglyJdXh/X7uiLqOAv/fMQp4wCJJOx6837CIxOlX198YwBYZ/b8iLSbKxiy+p6lru
         2IzWS0W2fpOiekFS0SlotlhfUZkxHVAeO7r+d5jAK5+gNPdB3PfepJ8Bk0ceaIkhVulZ
         NXehBRzIKUKHNY8eJYHTNwaLkBh7d7FDTX4+Q4mgf/kmUG4SArXLLg82Sn4gEzxTNPLE
         I99Q==
X-Gm-Message-State: AOAM533ZcpNzLgih5h3qKdjtC2YdDJWVzba2E53l5j/Ps4JDXnxbHu7A
        gcAjAc+XEHoDMxDMJEE3G3/g8cw3C1+Uvfow
X-Google-Smtp-Source: ABdhPJwJB5cRbqWwwGBk5Nr7WqzNuqy+CTCQqqVwdvVa0dQ8kEtvDJ3rLMDb9QGF7xp6flDXXyBxZg==
X-Received: by 2002:a63:f21:: with SMTP id e33mr3991936pgl.84.1610571350379;
        Wed, 13 Jan 2021 12:55:50 -0800 (PST)
Received: from Ryzen-9-3900X.localdomain (ip68-104-204-241.ph.ph.cox.net. [68.104.204.241])
        by smtp.gmail.com with ESMTPSA id 193sm3564863pfz.36.2021.01.13.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 12:55:49 -0800 (PST)
Date:   Wed, 13 Jan 2021 13:55:47 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v4] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <20210113205547.GA21653@Ryzen-9-3900X.localdomain>
References: <20210112053113.4180271-1-morbo@google.com>
 <20210113061958.886723-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113061958.886723-1-morbo@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Bill,

On Tue, Jan 12, 2021 at 10:19:58PM -0800, Bill Wendling wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> profile, the kernel is instrumented with PGO counters, a representative
> workload is run, and the raw profile data is collected from
> /sys/kernel/debug/pgo/profraw.
> 
> The raw profile data must be processed by clang's "llvm-profdata" tool
> before it can be used during recompilation:
> 
>   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
>   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> 
> Multiple raw profiles may be merged during this step.
> 
> The data can now be used by the compiler:
> 
>   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> 
> This initial submission is restricted to x86, as that's the platform we
> know works. This restriction can be lifted once other platforms have
> been verified to work with PGO.
> 
> Note that this method of profiling the kernel is clang-native, unlike
> the clang support in kernel/gcov.
> 
> [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Co-developed-by: Bill Wendling <morbo@google.com>
> Signed-off-by: Bill Wendling <morbo@google.com>
> Change-Id: Ic78e69c682286d3a44c4549a0138578c98138b77

Small nit: This should be removed.

I applied this patch on top of v5.11-rc3, built it with LLVM 12
(f1d5cbbdee5526bc86eac0a5652b115d9bc158e5 + D94470) with Microsoft's
WSL 5.4 config [1] + CONFIG_PGO_CLANG=y, and ran it on WSL2.

$ zgrep PGO /proc/config.gz
# Profile Guided Optimization (PGO) (EXPERIMENTAL)
CONFIG_ARCH_SUPPORTS_PGO_CLANG=y
CONFIG_PGO_CLANG=y
# end of Profile Guided Optimization (PGO) (EXPERIMENTAL)

However, I see an issue with actually using the data:

$ sudo -s
# mount -t debugfs none /sys/kernel/debug
# cp -a /sys/kernel/debug/pgo/profraw vmlinux.profraw
# chown nathan:nathan vmlinux.profraw
# exit
$ tc-build/build/llvm/stage1/bin/llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
warning: vmlinux.profraw: Invalid instrumentation profile data (bad magic)
error: No profiles could be merged.

Am I holding it wrong? :) Note, this is virtualized, I do not have any
"real" x86 hardware that I can afford to test on right now.

[1]: https://github.com/microsoft/WSL2-Linux-Kernel/raw/linux-msft-wsl-5.4.y/Microsoft/config-wsl

Cheers,
Nathan
