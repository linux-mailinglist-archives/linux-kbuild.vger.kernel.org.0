Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E7E70B52
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2019 23:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbfGVV2C (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jul 2019 17:28:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50662 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfGVV2C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 17:28:02 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so36572377wml.0;
        Mon, 22 Jul 2019 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BXazYWDeTENq/iKxIaP3L6u+URhjPIAHJqyoF+TgtA8=;
        b=U+4gi2ZCTUY1MCWT5zKODpDIfMSOphnaW0ox0qS3SYWklCcCoVAqqVs2tzb1NgxO+C
         NIcmS9EYwq/MAX9zaswuyKyx3f5r6Yl+0Hn/OO0vODPbluNPU+bbwHSOM2rBhUE82OgN
         dLyYDsK5/ZTYPUbEOVyV7MWt5ubTD5Q/14extJjmj23JCT9Yw/Xc23SHzml3nOQQkGJ+
         W1UAmJ42Z6kLe5qcAzmVMrycqyxbV7UBZnidJ3l1SfujPQHpxSu8Nz5LpTe2y8Zpllpa
         Fv1uZlK+YqxPZjQxCLmGevnbw0ZOISFT5jv2mdNR6VGpw0VM6R9TCGKZ2xY3tZ4pi6Xg
         J7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BXazYWDeTENq/iKxIaP3L6u+URhjPIAHJqyoF+TgtA8=;
        b=jC58qREEKVsplVMVA6/NncYukZDYrvhpfTw6HVpl5uD1vB+7xz320FylY7wZ8+a5y8
         nbCWGKcOLs4f/4/me06fIrjF+LxoI4kF7EijUzmYh8ZjwuZVXPA5eNqKgAEcMSDb4/H7
         W5Lwthry8bkYlHEMp29aA6MEXI0vfNEvI4qHX5Ifr1d2TmTo1tDtNYxT3Cw8bIaL4gle
         qAoSP65j28br7OCJ7M7M+u3fVqGwr+mUqmK5EecRtdhw5QwY8EcPxvdDHKboKRY0XepY
         qNooxCxyFIzsiLphhwJChbKIfbQpKgagSpOUJE2qi0ptXMbFUQVVp0XHwWa0n2wjSKTs
         NVIA==
X-Gm-Message-State: APjAAAXw1RQ1Vdqyd6akdMY2MNdrwQ5b2gpDyBwwTVofmziuO1xie6at
        O3ijecmS/B7j2zzzwOJt3KxrhCU=
X-Google-Smtp-Source: APXvYqwF611WDfYdYPe7+bHWdAGvYtg57KmpIAYQHYOFiEKOmtDhKF/zM528NEtNlwnxAMCiiFQb5w==
X-Received: by 2002:a7b:c106:: with SMTP id w6mr68690065wmi.80.1563830880238;
        Mon, 22 Jul 2019 14:28:00 -0700 (PDT)
Received: from avx2 ([46.53.253.254])
        by smtp.gmail.com with ESMTPSA id c1sm86246278wrh.1.2019.07.22.14.27.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 14:27:59 -0700 (PDT)
Date:   Tue, 23 Jul 2019 00:27:57 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: Re: [PATCH 2/5] x86_64, -march=native: POPCNT support
Message-ID: <20190722212757.GA2525@avx2>
References: <20190722202723.13408-1-adobriyan@gmail.com>
 <20190722202723.13408-2-adobriyan@gmail.com>
 <20190722211210.GN6698@worktop.programming.kicks-ass.net>
 <20190722211539.GA29979@avx2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190722211539.GA29979@avx2>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 23, 2019 at 12:15:39AM +0300, Alexey Dobriyan wrote:
> On Mon, Jul 22, 2019 at 11:12:10PM +0200, Peter Zijlstra wrote:
> > On Mon, Jul 22, 2019 at 11:27:20PM +0300, Alexey Dobriyan wrote:
> > > Detect POPCNT instruction support and inline hweigth*() functions
> > > if it is supported by CPU.
> > > 
> > > Detect POPCNT at boot time and conditionally refuse to boot.
> > > 
> > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > > ---
> > >  arch/x86/include/asm/arch_hweight.h           | 24 +++++++++++++++++++
> > >  arch/x86/include/asm/segment.h                |  1 +
> > >  arch/x86/kernel/verify_cpu.S                  |  8 +++++++
> > >  arch/x86/lib/Makefile                         |  5 +++-
> > >  .../drm/i915/display/intel_display_power.c    |  2 +-
> > >  drivers/misc/sgi-gru/grumain.c                |  2 +-
> > >  fs/btrfs/tree-checker.c                       |  4 ++--
> > >  include/linux/bitops.h                        |  2 ++
> > >  lib/Makefile                                  |  2 ++
> > >  scripts/kconfig/cpuid.c                       |  7 ++++++
> > >  scripts/march-native.sh                       |  2 ++
> > >  11 files changed, 54 insertions(+), 5 deletions(-)
> > 
> > *WHY* ?
> > 
> > AFAICT this just adds lines and complexity and wins aboslutely nothing.
> 
> If CPU is know to have POPCNT, it doesn't make sense to go through RDI.
> Additionally some CPUs (still?) have fake dependency on the destination,
> so "popcnt rax, rdi" is suboptimal.

More general argument is that if -march=native is accepted, compiler will
generate new instructions which will throw #UD on CPUs which aren't
capable, so it doesn't make sense to _not_ go deeper and use all the
knowledge about current CPU.
