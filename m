Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6410E2F20DC
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 21:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbhAKUcG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 15:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbhAKUcF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 15:32:05 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073FAC061795
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 12:31:25 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id lj6so243363pjb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 12:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BZbWJMckP7KnFzgMzYjv6b0GUK1slDkOJ3IpYhCUuJM=;
        b=ZmSjWT7fgSd1h2QCqYkfefvC7EBMF1WXYaFlU/v6xYDyebfJ3A4MtqB5B9R9QoJZdr
         zwOkX46YznqaaTwRUsjKhbu/FTJce0XchX3Dg38w4d2PJ78QBFiXRDYnLVddUQPZXii6
         w1MIlAW7XLcq/wIvIcumiEkGdcHd1/N4oQg63J9ONYBGGCvtmkdgYKdY9EivNstrRP6C
         UcXE7ajSI/3Z4OVHWC4dl4c9Vfila5c9BIabdkWEkgYCM7Ti8QeQDSM2DJBievQ1Efwu
         HMMhPtCEikIiUF7Yx4UrhQK+CrOLwJUyjvTrJYRZJmxR9tmkl9AGvjbIcU86JCWmlfdM
         J+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BZbWJMckP7KnFzgMzYjv6b0GUK1slDkOJ3IpYhCUuJM=;
        b=gomUu4ZoEyDRIohsN4+3saahy9mYbXUjyS4m7sK4Yz8JXqGEPYlXm/dsOyoNmrGXVa
         ejBewoVPMFtsTs3tx9/T0OshxBhKLh5D4W8ghpdZ3W2I1CDPsSfbC+mUIw68T3u6tO1g
         fOdJCR5NUjun3LjdjebbXWckEFPtMNhlV1Ua+X+9Jc8KpmysmnSrDuXjiW9eF1hXFDL5
         mpukQIGLKcMSDzvUXHInbk8UP6POkIAWfMnpiDeF3N8nboiDC9SoVEu6FBS0ufpL13x7
         qCeUc40EOBkNG9i6x+cKJc/4ip2kmyRYVwNQ3idCxdwc/wBiGOq8+1oSEqOjB/7MgIsO
         VTvQ==
X-Gm-Message-State: AOAM531On0k0lodVScY2IAA+fY3ilegmvDYRGcHEQcGOYzYO3i0W+KMy
        MfRQ2TaKm9ETjhIUu+DKFdZcMg==
X-Google-Smtp-Source: ABdhPJxYNzGpmQg8oZE5NeZyx+bJ73huRA+dBmzVz8D+rUMN7YQUX4wwdcr0btxqP/PRS0wXW4Ugrg==
X-Received: by 2002:a17:90b:23d6:: with SMTP id md22mr638840pjb.206.1610397084289;
        Mon, 11 Jan 2021 12:31:24 -0800 (PST)
Received: from google.com ([2620:15c:2ce:0:a6ae:11ff:fe11:4abb])
        by smtp.gmail.com with ESMTPSA id t23sm538631pfc.0.2021.01.11.12.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 12:31:23 -0800 (PST)
Date:   Mon, 11 Jan 2021 12:31:20 -0800
From:   Fangrui Song <maskray@google.com>
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <20210111203120.daeef4yuwgmk5em4@google.com>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210111201224.l5r2zxuyd7ayszke@google.com>
 <CAGG=3QWo5_wwTMHtif4BzFssByaW1ScvpaEH1p1nZ6ymVggLjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGG=3QWo5_wwTMHtif4BzFssByaW1ScvpaEH1p1nZ6ymVggLjA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-01-11, Bill Wendling wrote:
>On Mon, Jan 11, 2021 at 12:12 PM Fangrui Song <maskray@google.com> wrote:
>>
>> On 2021-01-11, 'Bill Wendling' via Clang Built Linux wrote:
>> >From: Sami Tolvanen <samitolvanen@google.com>
>> >
>> >Enable the use of clang's Profile-Guided Optimization[1]. To generate a
>> >profile, the kernel is instrumented with PGO counters, a representative
>> >workload is run, and the raw profile data is collected from
>> >/sys/kernel/debug/pgo/profraw.
>> >
>> >The raw profile data must be processed by clang's "llvm-profdata" tool before
>> >it can be used during recompilation:
>> >
>> >  $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
>> >  $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
>> >
>> >Multiple raw profiles may be merged during this step.
>> >
>> >The data can be used either by the compiler if LTO isn't enabled:
>> >
>> >    ... -fprofile-use=vmlinux.profdata ...
>> >
>> >or by LLD if LTO is enabled:
>> >
>> >    ... -lto-cs-profile-file=vmlinux.profdata ...
>>
>> This LLD option does not exist.
>> LLD does have some `--lto-*` options but the `-lto-*` form is not supported
>> (it clashes with -l) https://reviews.llvm.org/D79371
>>
>That's strange. I've been using that option for years now. :-) Is this
>a recent change?

The more frequently used options (specifyed by the clang driver) are
-plugin-opt=... (options implemented by LLVMgold.so).
`-lto-*` is rare.

>> (There is an earlier -fprofile-instr-generate which does
>> instrumentation in Clang, but the option does not have broad usage.
>> It is used more for code coverage, not for optimization.
>> Noticeably, it does not even implement the Kirchhoff's current law
>> optimization)
>>
>Right. I've been told outside of this email that -fprofile-generate is
>the prefered flag to use.
>
>> -fprofile-use= is used by both regular PGO and context-sensitive PGO (CSPGO).
>>
>> clang -flto=thin -fprofile-use= passes -plugin-opt=cs-profile-path= to the linker.
>> For regular PGO, this option is effectively a no-op (confirmed with CSPGO main developer).
>>
>> So I think the "or by LLD if LTO is enabled:" part should be removed.
>
>But what if you specify the linking step explicitly? Linux doesn't
>call "clang" when linking, but "ld.lld".

Regular PGO+LTO does not need -plugin-opt=cs-profile-path=
CSPGO+LTO needs it.
Because -fprofile-use= may be used by both, Clang driver adds it.
CSPGO is relevant in this this patch, so the linker option does not need to be mentioned.
