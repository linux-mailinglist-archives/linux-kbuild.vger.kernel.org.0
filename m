Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3012D41F834
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Oct 2021 01:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhJAX2T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 19:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhJAX2S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 19:28:18 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC49C06177F
        for <linux-kbuild@vger.kernel.org>; Fri,  1 Oct 2021 16:26:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y26so44727995lfa.11
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Oct 2021 16:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8tTUgmxOrN1sCYAfdmVo+uo+55hwpJgWtC1Rrm4Zacc=;
        b=J1FyGsaRsU+Qrv4JnJo48w/0H8gWXHKnylcwU852VNVpuRr98sndqv4uCu7zoLGO09
         F5RPGJBJbEldivNftWR3SS5dmfayBQgwTyAHOEQgH6EI/Bw0iPe5NtFr9Xt2LxBb2otY
         qG+MHHK0NL7gXyp/xI+qCTOtDUSZSQgf2MNM3heBo+6OhK90Zahrjs28SB9svBu9lWvL
         sbQiuHjnTHddhIigj/K1I5KvKY+NkPHfSIKqhvDR8UkqSmlUhYQuHYBByXglJR6YzBzF
         B968GVMElaWEUFq17FZIcRGpMIq6iFdu/uUCdrBBAyk1KNfNKCpVA+6I3rDgAIPSt2M6
         ocVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8tTUgmxOrN1sCYAfdmVo+uo+55hwpJgWtC1Rrm4Zacc=;
        b=8JtncGebg2VYizamkdUcdVXW3ZBlX/ijWBJAYkxtJarqsPw7G7/ndRf6hVY9VCTBG7
         hC72jAdmHnSgFU38gpKla9eVpAGsrvWE6BJHoNQGFwgH8N0xpU/sJ5PPHXZSZPX2S2qv
         H2CEkSvdsSp4elRXz0S6RJg20xRnGAtmUXGsPuEzhRZg9L8yOq4PkVC6e39ZPxH6CCm8
         zYXyA+32uZydQlcLSsz9gRMIwiKE5XdGUZn7aQKLggdwM3uamkUvUA1LC5TlUbqmaoek
         1YVwKWAILgCTgrXieoYXXLOaclM+WRSRE2DOoBU7yFLW2CgV4bOMYnf/q5Xv47fisb9T
         0Epw==
X-Gm-Message-State: AOAM533Ilw1dhHsu3/nKpHkDNIGXw8GNyMJevTEzyAJWkNQiI5hpywHQ
        wPp8xrkH96naxBe6lbULYY6XG2RtsUKftf2KUTvv+w==
X-Google-Smtp-Source: ABdhPJxo49ZwH3QpNDLKU1AVzVgp43CjeYXT1p2Ey2CEVGiEgFqYSWfOIfTby8WekIo8MKrNQW2c/GlAe74rl0IxKf4=
X-Received: by 2002:a05:6512:705:: with SMTP id b5mr768733lfs.82.1633130791771;
 Fri, 01 Oct 2021 16:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210929225850.3889950-1-ndesaulniers@google.com>
 <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
 <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com> <CAHk-=wip2uVAaRtPNFF4+C2ZmkUZ+rs2-676syUR_kJ9+8hFNA@mail.gmail.com>
In-Reply-To: <CAHk-=wip2uVAaRtPNFF4+C2ZmkUZ+rs2-676syUR_kJ9+8hFNA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 1 Oct 2021 16:26:19 -0700
Message-ID: <CAKwvOdkXR+gHCRgLq5htCgykOuWiOAhV6qgCGcXnfde5nLKKWA@mail.gmail.com>
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Bill Wendling <morbo@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 30, 2021 at 11:54 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Sep 29, 2021 at 5:19 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > ...
> > arch/x86/mm/amdtopology.c:110:7: remark: 'test_bit' not inlined into
> > 'amd_numa_init' because too costly to inline (cost=115, threshold=45)
> > [-Rpass-missed=inline]
> >                 if (node_isset(nodeid, numa_nodes_parsed)) {
>
> Yeah, I think that we should just do the __always_inline thing.
>
> I'd rather have the stupid debug code overhead in the caller - that
> may end up knowing that the pointer actually is so that the debug code
> goes away - than have "test_bit()" uninlined because there's so much
> crazy debug code in it.
>
> I also happen to believe that we have too much crazy "instrumentation" crap.
>
> Why is that test_bit() word read so magical that it merits a
> "instrument_atomic_read()"?
>
> But I absolutely detest how KCSAN and some other tooling seems to get
> a free pass on doing stupid things, just because they generated bad
> warnings so then they can freely generate these much more fundamental
> problems because the result is a f*cking mess.
>
> > Though for the defconfig case...somehow the cost is more than with the
> > sanitizers...
>
> Maybe the solution is that if you have some of the crazy sanitizers,
> we just say "the end result is not worth even checking". And stop
> checking all the section mismatches, and all the stack size things.
>
> Because it looks like this is more of a real issue:
>
> > arch/x86/mm/amdtopology.c:157:7: remark: '__nodes_weight' not inlined
> > into 'amd_numa_init' because too costly to inline (cost=930,
> > threshold=45) [-Rpass-missed=inline]
> >         if (!nodes_weight(numa_nodes_parsed))
> >              ^
>
> Hmm. That's just a "bitmap_weight()", and that function in turn is
> __always_inline.
>
> And the *reason* it is __always_inline is that it really wants to act
> as a macro, and look at the second argument and do special things if
> it is a small constant value.
>
> And it looks like clang messes things up by simply not doing enough
> simplification before inlining decisions, so it all looks very
> complicated to clang, even though when you actually generate code, you
> have one (of two) very simple code sequences.
>
> > > Wouldn't it be better to make
> > > them always-inline?
> >
> > Perhaps, see what that might look like:
> > https://github.com/ClangBuiltLinux/linux/issues/1302#issuecomment-807260475
> > Does that look better?
>
> I suspect that in this case, because of clang deficiencies, that
> __always_inline actually is the right thing to do at least on
> __nodes_weight.
>
> Looking at your comment lower down
>
>   https://github.com/ClangBuiltLinux/linux/issues/1302#issuecomment-807757878
>
> I really think this is a clang bug, and that you need to do certain
> simplifications both before _and_ after inlining.
>
> Before, because of the inlining cost decisions particularly wrt
> constant arguments.
>
> After, because successful inlining changes things completely.

I made that comment because our LowerConstantIntrinsics pass was
simplifying our internal representation of __builtin_constant_p and
__builtin_object_size in the same pass, after inlining.

For the case of (defconfig) __nodes_weight not being inlined into
amd_numa_init, it's because hweight_long is a huge block of code all
predicated on __builtin_constant_p (BCP).  Because we evaluate (BCP)
AFTER inlining which is very much necessary for the semantics of BCP,
we don't eliminate that entire block.  Playing with the cost model
though...

we basically have the pattern:

void caller (void) {
  caller(42);
}
void callee (int x) {
  if (__builtin_constant_p(x)) {
    // M "instructions"
  } else {
    // N "instructions"
  }
}

the current cost model says that the cost of inlining callee into
caller is ~ M + N + C.  If we knew that BCP would fold away based on
inling, and which way, we might be able to consider the cost just M +
C or N + C.

In the case of "(defconfig) __nodes_weight not being inlined into
amd_numa_init" M >> N, and yet after inlining BCP evaluates to false
(so the estimated cost was M + N but in actuality was closer to N).
(See how big __const_hweight64 is before BCP evaluation; in this case
callee is the analog for hweight64).

I guess if the argument to BCP is a parameter of callee (brittle),
then we perhaps should be able to figure whether BCP would evaluate to
true or false, then properly select M or N.

Ok, let me see if I can go build that into the cost model...and if
that actually helps any of these cases...

Though I do wonder what happens when there's more than one level here...ie.

void caller (void) { mid(42): }
void mid (int x) { callee(x); }
void callee (int x) { if __builtin_constant_p(x) /* M */; else /* N */; }

or

void caller0 (void) { mid(42): } // BCP would be true
void caller1 (int x) { mid(x); } // BCP would be false
void mid (int x) { callee(x); } // looking just at the call site, BCP
would be false
void callee (int x) { if __builtin_constant_p(x) /* M */; else /* N */; }

(Sorry for the brain dump; this is more for me than for you. Good chat!)

>
> Marking __nodes_weight() be __always_inline just works around clang
> being broken in this regard.
>
> It is _possible_ that it might help to make bitmap_weight() be a macro
> instead of an inline function, but it's a kind of sad state of affairs
> if that is required.
>
> And it might well fail - if you don't do the constant propagation
> before making inlining decisions, you'll _still_ end up thinking that
> bitmap_weight() is very costly because you don't do that
> __builtin_constant_p() lowering.
>
> And then you end up using the (much more expensive) generic function
> instead of the cheap "look, for single words this is a trivial" thing.

-- 
Thanks,
~Nick Desaulniers
