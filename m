Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D21BE1A68
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2019 14:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391591AbfJWMce (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Oct 2019 08:32:34 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39511 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391576AbfJWMce (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 08:32:34 -0400
Received: by mail-qk1-f196.google.com with SMTP id 4so19547217qki.6
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2019 05:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B49NIMe9Qp45m4n7j4yBsM/w0U/Y5dSRw5y61/jmg/U=;
        b=C5bfrMkMZwSNBuaqGvLHQGLvu+WkV3TTh3kdpyy/ob6oFoN9VqPr039NiJ7r8PbBbp
         i0Ndg1H1PKsVMYNLuBizaGICaR2zwIKJFqesGKj+GHlL+Yo7/uZxSHFBqJi57C5+6WAI
         yLSx35vCO8IkEpJmYZU0KyQ+UhKSimD8bpgLouFa3SPiviAOlFtIK3olMU0e4mYzxTR6
         ri4W3JAkTNY7BOh/AjMrLXlT8nx0TKh2nckATUVkPDUkUMcBXJfpfUlMUYgruercaW4W
         n/Sm5BbGsBp0U3XPBitQSLz/RMcCyWyqI4R/8ctXEjE0kHygx5YEq/GvmIVT0pEhi0Wm
         Wq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B49NIMe9Qp45m4n7j4yBsM/w0U/Y5dSRw5y61/jmg/U=;
        b=gyntunnaVLY0k/zRY/74oaJsJ8bMiddac9RKm6SBOWjG0V0cV13fmsF/eieUulvjsq
         JMOaGTX3xBuVH1OHt/DB66rOljT5K8tWKs9DMpuo8t5DBdmRQYCPKXOCfyd3plAf85iH
         BfLwOX4H5py0JN1ODwrOLM3rwiFeOJ/1etbfEtlK1Pm2dM0iiKsc8DQ1zlSG0PIWoMwB
         7LszKaGEFCaM9+nZpOYoA+q8zdWSpKjRoTV22DhilBns8PXBGUHseBw5lVNbSD9rk3N+
         r9jgY31zgfx0UUfD/PS8v6Ls33i2NfLPpjtR5xWzERo2xJ6V3XAENwVrR9hlnPSctqYh
         w2wg==
X-Gm-Message-State: APjAAAX92jtfSY9ucVrt5tzeAElAzrMi7lNpcpspIjqL1Zq5CGdphqt5
        b3bGnZIZBW+I2mikXj1fB8DI8a1h9FZCoWKV0X7nmg==
X-Google-Smtp-Source: APXvYqyFsU3H6xRYNHrGvBpnk/VOnsx+BN6kQrGuH12Dr1Igjr36aWMR0sDz8pvAXcYyvaIX66eDRdizKnR8UEqoIeQ=
X-Received: by 2002:a37:4a87:: with SMTP id x129mr7970246qka.43.1571833952687;
 Wed, 23 Oct 2019 05:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191017141305.146193-1-elver@google.com> <20191017141305.146193-2-elver@google.com>
In-Reply-To: <20191017141305.146193-2-elver@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 23 Oct 2019 14:32:20 +0200
Message-ID: <CACT4Y+bfVpu4017p64rc-BBAevs2Ok2otxUYpbwJGYkCbUNYVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] kcsan: Add Kernel Concurrency Sanitizer infrastructure
To:     Marco Elver <elver@google.com>
Cc:     LKMM Maintainers -- Akira Yokosawa <akiyks@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alexander Potapenko <glider@google.com>,
        Andrea Parri <parri.andrea@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>, Daniel Axtens <dja@axtens.net>,
        Daniel Lustig <dlustig@nvidia.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Luc Maranget <luc.maranget@inria.fr>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-efi@vger.kernel.org,
        "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 17, 2019 at 4:13 PM Marco Elver <elver@google.com> wrote:
>
> Kernel Concurrency Sanitizer (KCSAN) is a dynamic data-race detector for
> kernel space. KCSAN is a sampling watchpoint-based data-race detector.
> See the included Documentation/dev-tools/kcsan.rst for more details.

I think there is some significant potential for improving performance.
Currently we have __tsan_read8 do 2 function calls, push/pop, the
second call is on unpredicted slow path.
Then __kcsan_check_watchpoint and __kcsan_setup_watchpoint do full
load of spills and lots of loads and checks that are not strictly
necessary or can be avoided. Additionally __kcsan_setup_watchpoint
calls non-inlined kcsan_is_atomic.
I think we need to try to structure it around the fast path as follows:
__tsan_read8 does no function calls and no spills on fast path for
both checking existing watchpoints and checking if a new watchpoint
need to be setup. If it discovers a race with existing watchpoint or
needs to setup a new one, that should be non-inlined tail calls to the
corresponding slow paths.
In particular, global enable/disable can be replaced with
occupying/freeing all watchpoints.
Per cpu disabled check should be removed from fast path somehow, it's
only used around debugging checks or during reporting. There should be
a way to check it on a slower path.
user_access_save should be removed from fast path, we needed it only
if we setup a watchpoint. But I am not sure why we need it at all, we
should not be reading any user addresses.
should_watch should be restructured to decrement kcsan_skip first, if
it hits zero (with unlikely hint), we go to slow path. The slow path
resets kcsan_skip to something random. The comment mentions
prandom_u32 is too expensive, do I understand it correctly that you
tried to call it on the fast path? I would expect it is fine for slow
path and will give us better randomness.
At this point we should return from __tsan_read8.

To measure performance we could either do some synthetic in-kernel
benchmarks (e.g. writing something to the debugfs file, which will do
a number of memory accesses in a loop). Or you may try these
user-space benchmarks:
https://github.com/google/sanitizers/blob/master/address-sanitizer/kernel_buildbot/slave/bench_readv.c
https://github.com/google/sanitizers/blob/master/address-sanitizer/kernel_buildbot/slave/bench_pipes.c
