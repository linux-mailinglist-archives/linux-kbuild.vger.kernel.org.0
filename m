Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913C02491BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 02:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgHSAU6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 20:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgHSAU5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 20:20:57 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246BAC061389;
        Tue, 18 Aug 2020 17:20:57 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id p25so20159810qkp.2;
        Tue, 18 Aug 2020 17:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7YNr0/jQBoOjMJ1GJxHc4XuPsYwYYSpKoFcUKAuCANQ=;
        b=czQqdKt7Ca9NxyEtTkZJKnoqff5S2PCADfuwPj54uAEzngcgpvq2sEK0//1InPOnun
         6csXn+aZtRq81zUu7dEhrTqTSsYS0ApQtZGsRRG06A+90t8P4d6DmR+6pN0qRpqS/Ngp
         uiWqojUedgWVouv+216Z3jWhDdl0EjUCp1ZWSJJJYoljM+nNRR5oTyzWVrrq4YUzxQVP
         +1lTKMiL/QBddxKqDQtlksBF+LmRqSOZb2R4ijdvgQnVaWEtRkmPCKkCF1uZUhWm4xhr
         yD99SKjUDq6YwmQvK/o8xspQ/xISBL0rVPKZNfmBScbOmF6VRW2iDaF2/0Bw9U6gtGXi
         LS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=7YNr0/jQBoOjMJ1GJxHc4XuPsYwYYSpKoFcUKAuCANQ=;
        b=FkzC2dJdFEGLVWuu8uTzht+4EMRlJVrUI3883xvK47Q7BM5mw+W0DCy1LJE/p7SLHK
         GVg613vCnIEDGBiJCUQrshCij3XsuzRaqIVMetIR9Rb1xA2wAMxZlGHBxThAQpeldvoJ
         cGSq1EN5bSmBMg3KKf0WGD97FBlbsUTBBl7XiKXvbADuK229BFYtW4wFTbpX4pLzqN6H
         hKiDj441NGYSTztYgGtfz3OvKuun7aOdgF39fGTpbM1+60vo/6tHUhRl8qp74DuZRAt/
         pMPbhY5STMOwZKtP4TjjytQwjF6gamk9G/7ppBMTpOX+eaPknNEpVXt8TmDt2AvBYLYP
         ZTJA==
X-Gm-Message-State: AOAM531XiuW6d0aMnvUPTPK978BaykqYGTVe22OMzjOYX9j6tRoRqSng
        A4sgfp2mSqwUEg58I3jA25M=
X-Google-Smtp-Source: ABdhPJxGWqcfe5RiBveI6ga7nnllhDQGBRudEemfUBLCJQnu4+nLDHKaZMXMVuHsjKW+7EtPKiaC6Q==
X-Received: by 2002:a37:397:: with SMTP id 145mr20144568qkd.258.1597796455589;
        Tue, 18 Aug 2020 17:20:55 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id j72sm22657625qke.20.2020.08.18.17.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 17:20:54 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 18 Aug 2020 20:20:52 -0400
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Eli Friedman <efriedma@quicinc.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200819002052.GA3397377@rani.riverdale.lan>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <20200818222542.GA3254379@rani.riverdale.lan>
 <CAKwvOdmfiD1TNqRvFuX07BqonYzh1eKFE9mFmOpaSyrbR0d5Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdmfiD1TNqRvFuX07BqonYzh1eKFE9mFmOpaSyrbR0d5Lw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 18, 2020 at 03:59:45PM -0700, Nick Desaulniers wrote:
> On Tue, Aug 18, 2020 at 3:25 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > Another thing that needs to be fixed is that at least lib/string.c needs
> > to be compiled with -ffreestanding.
> >
> > gcc-10 optimizes the generic memset implementation in there into a call
> > to memset. Now that's on x86 which doesn't use the generic
> > implementation, but this is just waiting to bite us.
> >
> > https://godbolt.org/z/6EhG15
> 
> Admittedly, we've had the same shenanigans with memcpy implemented in
> terms of calls to __builtin_memcpy being lowered to infinitely
> recursive calls...which feels like the same kind of bug.  ("You wanted
> infinite recursion in the kexec purgatory image, right?" "No,
> compiler, I did not.")  example: https://godbolt.org/z/MzrTaM
> (probably should fix this in both implementations; at the least I feel
> like Clang's -Winfinite-recursion should try to help us out here).
> 

What's the other implementation we need to worry about? purgatory (at
least on x86) has freestanding already.
