Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7282F36FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 18:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392009AbhALRXV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 12:23:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391167AbhALRXV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 12:23:21 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52B8C061786;
        Tue, 12 Jan 2021 09:22:40 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id 19so2513716qkm.8;
        Tue, 12 Jan 2021 09:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Cekwa6Gg8tFAQMdvQMX54ozrri2M75odcKtK/zwsgg0=;
        b=dm6lBlHFrKWfvEFQDoGKdvc8cGFBVbyku1WFw7oWjrIWT9iA9Uv7hEr7klthM8iI8V
         Jqmds2eSlencuXDnTe6vOf0sG7ZEupGgYbjt7HRQyUDXiFSqmm7pGGKKU+bF78vNe1Tt
         aoJIFzfjFvYPJwgsjih3xIo8bsf2b/gwcfu/zBaBzq5+zCRSLPYBRyto+8M2p1vehT/Y
         OeJLwQPPtHl04LNdTNj0K0WaIVtrSixICog5eHOENN0Ny2OCKMtVxIloBVlX0rYDDB41
         bB+09QjiiXmTi8l2P0XXvKbwJgtCMbEuVwOWak+47L29fXqltJp0oyqE11RwyBA36/Iu
         CNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cekwa6Gg8tFAQMdvQMX54ozrri2M75odcKtK/zwsgg0=;
        b=IP2I33ntToO+iOs7IUVgzpWaDBJ06G5bvPizQzwPQHq2TDOTHwKGZO0NqfJWCARLsb
         sZE/TpxhlEfDBfnYgYud+yfvsoEylVdekYm/Ehxkvtj6F27tiTpstnvWwfxcZGFS50/B
         J3OyBAHykik1fWWfClxoGt14xMZGXwnbQy5dApKQuYsZvLXIdON4MG4Lz1y4afd1ckoP
         MSDJ6kPcAGUP1Upu0t/HP+XDJUWo3hXXUqiOXSDaGtxd3BxqM4isci7nEYae1xMcQ/PP
         a5a7rEehvo8zJ/OsDcIppkM13RVjj+ROnn4p+yEHRqopb8+EnJye+j+sMNytEcF3xmrq
         0njA==
X-Gm-Message-State: AOAM532JMQKtHojGBQ01NHTX2iuYWxmJyLo5SeIdpGQXitkyWFSDOkyc
        VlHrsvYm4RrkkSWAAuLeSrc=
X-Google-Smtp-Source: ABdhPJxR9EN4Bi/GC/cHsHL0Wklo8RdvqQuhoTzQlheMI5t1BVqMwTVoYpHa3hRgayKDRCupixQOIw==
X-Received: by 2002:ae9:c010:: with SMTP id u16mr352562qkk.346.1610472159841;
        Tue, 12 Jan 2021 09:22:39 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id d1sm1628462qkf.102.2021.01.12.09.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 09:22:38 -0800 (PST)
Date:   Tue, 12 Jan 2021 10:22:37 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v3] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <20210112172237.GA1792840@ubuntu-m3-large-x86>
References: <20210112053113.4180271-1-morbo@google.com>
 <202101121755.pyYoRozB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202101121755.pyYoRozB-lkp@intel.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 12, 2021 at 05:10:04PM +0800, kernel test robot wrote:
> Hi Bill,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.11-rc3]
> [cannot apply to powerpc/next s390/features tip/x86/core next-20210111]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Bill-Wendling/pgo-add-clang-s-Profile-Guided-Optimization-infrastructure/20210112-133315
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a0d54b4f5b219fb31f0776e9f53aa137e78ae431
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

Hmmm... This should probably be gated on CC_IS_CLANG? Or even better
CLANG_VERSION >= 120000 due to
https://github.com/ClangBuiltLinux/linux/issues/1252?

> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/6ab85bae7667afd0aa68c6442b7ca5c369fa1088
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Bill-Wendling/pgo-add-clang-s-Profile-Guided-Optimization-infrastructure/20210112-133315
>         git checkout 6ab85bae7667afd0aa68c6442b7ca5c369fa1088
>         # save the attached .config to linux build tree
>         make W=1 ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    kernel/pgo/instrument.c:72:6: warning: no previous prototype for '__llvm_profile_instrument_target' [-Wmissing-prototypes]
>       72 | void __llvm_profile_instrument_target(u64 target_value, void *data, u32 index)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/pgo/instrument.c:135:6: warning: no previous prototype for '__llvm_profile_instrument_range' [-Wmissing-prototypes]
>      135 | void __llvm_profile_instrument_range(u64 target_value, void *data,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> kernel/pgo/instrument.c:179:6: warning: no previous prototype for '__llvm_profile_instrument_memop' [-Wmissing-prototypes]
>      179 | void __llvm_profile_instrument_memop(u64 target_value, void *data,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 

I still think that this warning will show up with clang at W=1. Given
that these are compiler inserted functions, the prototypes don't matter
but we could shut it up by just putting the prototypes right above the
functions like was done in commit 1e1b6d63d634 ("lib/string.c: implement
stpcpy").

Cheers,
Nathan
