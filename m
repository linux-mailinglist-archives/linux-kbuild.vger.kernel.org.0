Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012FE217A8E
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 23:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgGGVcQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 17:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbgGGVcP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 17:32:15 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B86C061755
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Jul 2020 14:32:15 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w2so19801003pgg.10
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jul 2020 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7RZJvmavIn0O2TKntqB9QMi92acXLHjQQiD6TqtsJM8=;
        b=W4FLApmeUSAjzZei1tcFaAdYwlotTF70I4pqSAQG7rO5K1XEga+KnzxWnE/bCLq90N
         sQjhKVPREYroxBtzQItv//t58RkmCbDUYk9mS899tJrQuouZKBGKic5p/HdASJzraak6
         LSXz9O0gsIm+1nPah9eL7XgYtEJsFnRYWVq34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7RZJvmavIn0O2TKntqB9QMi92acXLHjQQiD6TqtsJM8=;
        b=OT9FtNPKkWB6l3SNoeZkkxwUAXKBznORBisuM7X5qKb87pN1Kzm30HMq9VZEFyphwA
         vZSVVs9lAe2vy2IklRstedyHnJs5M5n6KZc5oalvDGr2MoL0BVpMXLOUJ2gBRt1pqDms
         ABx2o3SqajGxWAkNX4LzEO9W3yVY5f+7rpVZsWUn7FNW9EG5gQ28siYIERhtFiS1pgsI
         vfJhbsMr6OUOUDtGS0+JD3oN2RuQumulS5Ea5OaLyzF7JCoAa9Qng+hxl5v+X+llqKts
         dCQWqMOyFOuV5SPiofpPR97RzJYvgnMy67Gk2XDux8Oo30vjWMSdVjE7lJRqPeQto7bC
         E+Eg==
X-Gm-Message-State: AOAM533DFeys6yPhtFkJa/JjtzOJ7rhKlXw6XJsgTNDefz+nYJ72qJsN
        hz8zFvP8nw9KoMN0iSuzOi1fTV3+AAc=
X-Google-Smtp-Source: ABdhPJyjWOYHT6AfI1WRr7cur6K+X6jRbh3iIvEo/GyqoEveZ4YQtxGCntbWjkIu+/Fdy5u9itfeOA==
X-Received: by 2002:a63:3d07:: with SMTP id k7mr46650708pga.93.1594157534774;
        Tue, 07 Jul 2020 14:32:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ji2sm3301357pjb.1.2020.07.07.14.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:32:13 -0700 (PDT)
Date:   Tue, 7 Jul 2020 14:32:12 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, gregkh@linuxfoundation.org,
        Petr Malat <oss@malat.biz>, Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [GIT PULL][PATCH v6 0/8] Add support for ZSTD-compressed kernel
 and initramfs
Message-ID: <202007071422.1060F5932@keescook>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707034604.1539157-1-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 06, 2020 at 08:45:56PM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> Please pull from
> 
>   git@github.com:terrelln/linux.git tags/v6-zstd
> 
> to get these changes. Alternatively the patchset is included.
> 
> Hi all,
> 
> This patch set adds support for a ZSTD-compressed kernel, ramdisk, and
> initramfs in the kernel boot process. ZSTD-compressed ramdisk and initramfs
> are supported on all architectures. The ZSTD-compressed kernel is only
> hooked up to x86 in this patch set.

Hello x86 maintainers!

I think this series is ready to go. Notes below...

> [...]
>   x86: bump ZO_z_extra_bytes margin for zstd

The above patch is really the only thing that has any external visibility
to kernels that have ZSTD disabled. Given the ratios of memory sizes
involved (an extra 64K when we're dealing with 2MB windows) seems
reasonable to me. If that isn't acceptable, it should be trivial to make
it CONFIG-selectable (like we already do with BOOT_HEAP_SIZE).

What do you think? If the non-x86 parts should land first in -mm, I
guess that would be okay, but I think it makes sense for all of this to
go via -tip.

-Kees

-- 
Kees Cook
