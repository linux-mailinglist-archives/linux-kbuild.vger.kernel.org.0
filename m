Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5E0440038
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 18:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhJ2QW0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Oct 2021 12:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbhJ2QW0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Oct 2021 12:22:26 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF8EC061714
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Oct 2021 09:19:57 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id p14so16890242wrd.10
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Oct 2021 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ikgahne8KsmeRHB0JuMt+hCjE+vDKAl9WiAJzz6l2C4=;
        b=yTNK5OyhTtsrJYojdFQbqgaD5Lw4ruZTav9ekBbwBHX9h657sM0VcG/V7AeKm0fl/l
         qv5aZKAbHHnJdbpH4+6HwLgfU4cPMG+4oyTiuemnPEt5MbikJ1hcv7y9g+icvZMiv5kQ
         lej0aEJ97x1tabCM3EI1zJQ6yL4KO1bS4gRM2cl3g646f1EafnrDhcNrZ1QOlaZ3zHfE
         1q1otLK4zLVc7kKCSaBYV3PjyncWUpl4/yzzrptxrMDMB+QM0lSwR8T+avlb6iJVnDM4
         oTq9zDK6kz3cyJ8e89xDQtDJcN4MBMXRIxoM68NJtqcbN/G4IU3bl29UQ9UPawnduUT5
         D4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ikgahne8KsmeRHB0JuMt+hCjE+vDKAl9WiAJzz6l2C4=;
        b=GIhLUjyoeD3ytPG+kghLKG1NhmZzWLfOhfAOtkjfkV19I/yBYgezwCNRmwH8uyseao
         ln7z/q/VOJZ43qBD6kwbcc1QuQ9NvsTWtj1SXPGPbGbeQg6OPpNXBTN7kxuOxujD8sc4
         gbv+O3FN1konOaMBP0apO/JPoT0RDwi7J8NlR4UxOHrI6Qx45e7WK3pBt8Gw4JD+vctQ
         CA4ImqqufPzeoKXDjCLAv2UYwDmCfE++VKHeOGFvsVwyUOe/9210VtZl4+Tj3Gf3yEhf
         uqyNaAAp4+1Fo/LFYJ5TdtkHpiVe9wbd3gnvKmqrcaRYMtDwVZ9UBlYPBoabf6ork6DG
         c7jA==
X-Gm-Message-State: AOAM531t7QHIo5s3E4/3fF7/HxqO5yuNgcLhxmGfZMSXMcELzge7myt6
        pHRoWhqa+jsv0J3UPKcnRwgI7w==
X-Google-Smtp-Source: ABdhPJwQTTfPOMqLfiUtj/Hw5Y2Z3mJ4qcKrUU+eQDR3bfPY1QdIkAR6ZxQGOh95l4OIHTzjiAG1BQ==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr15920082wrd.42.1635524395515;
        Fri, 29 Oct 2021 09:19:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id l6sm5320315wmq.17.2021.10.29.09.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 09:19:55 -0700 (PDT)
Date:   Fri, 29 Oct 2021 17:19:52 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Qian Cai <quic_qiancai@quicinc.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] configs: Introduce debug.config for CI-like setup
Message-ID: <20211029161952.u4g7vutcz3qd57lo@maple.lan>
References: <20211029034434.24553-1-quic_qiancai@quicinc.com>
 <20211029093115.6ychbe56pnebzi43@maple.lan>
 <e0301a5f-a2c7-eedb-90b1-1d6d631fcc47@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0301a5f-a2c7-eedb-90b1-1d6d631fcc47@quicinc.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 29, 2021 at 09:57:31AM -0400, Qian Cai wrote:
> On 10/29/21 5:31 AM, Daniel Thompson wrote:
> > Does this config need comments at the top of the file describing its 
> > "mission"?  Put another way, the comments in the description about
> > where these config options come from seem too important leave buried
> > in the git history. They are important to understanding what it is
> > for.
> > 
> > I know this the other configs do not have big header comments. However
> > the existing configs are closer to self-describing. debug.config simply does not explain what the file does in the way xen.config can! People
> > will surely want to add their "favourite" debug options[1] and those
> > contributors would benefit from clues on what the configs here are
> > intended for.
> 
> Daniel, (small world, isn't it? Enjoyed your OpenEmbedded lessons in the
> past.), That's a good point. I personally got used to "git log". I'll
> add some comments there.

Hello again.

In this case the small world comes about because "debug" is of the
keywords I use to filter LKML ;-)


> >> +# Keep alphabetically sorted.
> > 
> > This results in 119 line file that is more-or-less impossible to
> > comment. It alphabetic really the best way to maintain something
> > containing so much subjective judgement?
> 
> I thought about ordering those in different subject groups, but then
> realized it might be an overkill for an only one-hundred line file. Most
> of the options would have a prefix like _LOCKDEP_, _KMEMLEAK_ etc, so
> they are subject-related close together even sorted alphabetically.

My feedback came about because, in alphabetic form, it is not easy to
see which ftrace tracers are enabled (because they are named
CONFIG_<feature>_TRACER they appear all over the place).


> I don't really have a strong option on this matter though. We could
> organize it like in Kconfig sections if people like that way better
> although it could have a potential overhead to sync with future
> Kconfig.debug in the future as their places and names change from time
> to time.
> 
> # printk and dmesg options
> # Compile-time checks and compiler options
> # Generic Kernel Debugging Instruments
> # Memory Debugging
> # Scheduler Debugging
> # Lock Debugging (spinlocks, mutexes, etc...)
> # Debug kernel data structures
> # RCU Debugging

Personally I'd favour this. It really depends on how often it is
read/changed by uesrs rather than just consumed by the build system.
Personally I think this will be read quite often.


Daniel.
