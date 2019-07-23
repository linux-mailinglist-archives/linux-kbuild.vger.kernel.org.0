Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBB472066
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jul 2019 22:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbfGWUEy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Jul 2019 16:04:54 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51014 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfGWUEy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jul 2019 16:04:54 -0400
Received: by mail-wm1-f66.google.com with SMTP id v15so39725599wml.0;
        Tue, 23 Jul 2019 13:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NkVM1cYsdc7+GgH7w6lhQHE4djGyLTakSeb8EH//NWA=;
        b=jR+e1ojIXUB0AibrrI8Z6/7an8pwt0ErnAGzYl3vMoHQoqmNi/AhSUjUKANwaPNKca
         6qqh3wwGzXVrIyryCjKNXTtErYy3fSq9QjHqd+WL4DuGxtdFED8+TPgIIVpVoN5eon5G
         dMZERuwSq6cmV9GdAYzIMvG2pb9eXhOV8BSPqMSun9+osp+WwcOoUmZawHO+kPcJORmG
         bIZRpJIXf93qQB1AlbrjQY6OX+2RvTgnh2PVpjayv/FgOPBm6W6d89XPfFwVEPoniec4
         zDWJC3kxlewsd6NPwatip8d/lBMj0v1S8TNBLWrTm6wGTij1CyytV2jSmkkgMypt2ggh
         pkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NkVM1cYsdc7+GgH7w6lhQHE4djGyLTakSeb8EH//NWA=;
        b=RoiLB1Ht42qu6kmv2JS8b7SXbK9ozZoQRozqW1SYi/MKJwVmkgywUtFZ135WO3/Pva
         lHt1LjzcT7mxNH6P6LaKHa2xdCQ4dy0LdqqfbhSO66H0/7CRiM9M1DTNyzmxxSeVxixl
         9b0McxVdU21x8dffjhhLxnB7PuwTpxdjhwcD9snoQ0ivPsgXxMG+FBRdOduV42sRUZGX
         pnz7qtzLqb0rmuvH6CLUOmFoqhn7oNKvehxaT5QRGUUrH9MdjMfYdZYXaNnIn5I/rLGF
         ttx45lAPqLHoMCZOq+Zm3+GXXKGb6dRBPfbVksCl5oj+VtKH479VszWigLvsGvRibhnR
         JAyg==
X-Gm-Message-State: APjAAAW9/u7Z1Cd9vI8BwScLVfx4+TFiBA6Q8X98J2uTNfHbqwqumCkz
        733eOyh8ybrtDPAZQ2qA8g==
X-Google-Smtp-Source: APXvYqza6mtcUmAi27QhlJliEi4S9YKGg9zWA7QDosf2WTrAamZt/JkYMfb1Jm160GmT+2cUOgTOEA==
X-Received: by 2002:a7b:cd94:: with SMTP id y20mr73654241wmj.94.1563912292308;
        Tue, 23 Jul 2019 13:04:52 -0700 (PDT)
Received: from avx2 ([46.53.254.41])
        by smtp.gmail.com with ESMTPSA id n3sm38652226wrt.31.2019.07.23.13.04.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 13:04:51 -0700 (PDT)
Date:   Tue, 23 Jul 2019 23:04:48 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: Re: [PATCH 2/5] x86_64, -march=native: POPCNT support
Message-ID: <20190723200448.GA10504@avx2>
References: <20190722202723.13408-1-adobriyan@gmail.com>
 <20190722202723.13408-2-adobriyan@gmail.com>
 <20190722211210.GN6698@worktop.programming.kicks-ass.net>
 <20190722211539.GA29979@avx2>
 <20190723072043.GU3402@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190723072043.GU3402@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 23, 2019 at 09:20:43AM +0200, Peter Zijlstra wrote:
> On Tue, Jul 23, 2019 at 12:15:39AM +0300, Alexey Dobriyan wrote:
> > On Mon, Jul 22, 2019 at 11:12:10PM +0200, Peter Zijlstra wrote:
> > > On Mon, Jul 22, 2019 at 11:27:20PM +0300, Alexey Dobriyan wrote:
> > > > Detect POPCNT instruction support and inline hweigth*() functions
> > > > if it is supported by CPU.
> > > > 
> > > > Detect POPCNT at boot time and conditionally refuse to boot.
> > > > 
> > > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > > > ---
> > > >  arch/x86/include/asm/arch_hweight.h           | 24 +++++++++++++++++++
> > > >  arch/x86/include/asm/segment.h                |  1 +
> > > >  arch/x86/kernel/verify_cpu.S                  |  8 +++++++
> > > >  arch/x86/lib/Makefile                         |  5 +++-
> > > >  .../drm/i915/display/intel_display_power.c    |  2 +-
> > > >  drivers/misc/sgi-gru/grumain.c                |  2 +-
> > > >  fs/btrfs/tree-checker.c                       |  4 ++--
> > > >  include/linux/bitops.h                        |  2 ++
> > > >  lib/Makefile                                  |  2 ++
> > > >  scripts/kconfig/cpuid.c                       |  7 ++++++
> > > >  scripts/march-native.sh                       |  2 ++
> > > >  11 files changed, 54 insertions(+), 5 deletions(-)
> > > 
> > > *WHY* ?
> > > 
> > > AFAICT this just adds lines and complexity and wins aboslutely nothing.
> > 
> > If CPU is know to have POPCNT, it doesn't make sense to go through RDI.
> > Additionally some CPUs (still?) have fake dependency on the destination,
> > so "popcnt rax, rdi" is suboptimal.
> 
> You completely forgot to mention any of that in your Changelog, also I
> doubt you can find code where this makes a measurable difference. IOW, I
> still doubt it makes any kind of sense.

It saves some space, although not much. gcc likes to use 64-bit version
even where 32-bit version should suffice.

Regardless I found some problems with POPCNT patch, so hold off the
series.
