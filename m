Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 427BF9F49E
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2019 22:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbfH0U6S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Aug 2019 16:58:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43656 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbfH0U6S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 16:58:18 -0400
Received: by mail-pg1-f195.google.com with SMTP id k3so121987pgb.10
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2019 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TXjsSAJv8McRWlbUcLkirZ2NM0D/RICs3+Zd+E1Xf+I=;
        b=bXg67KvMUzP60s0lVOxa4LPBAQxRnuEVPFTxoqhYno0kLCiiROzohMHKdhZTLYsKG7
         Y1EMSRv8gJaWxAcaIVota4/JNiPku5TKZHgtQugBcVPtNLd7kuDHhQ+o1Uc/I8Q2gNY8
         STBEjbGEf+otmPLiXl178YjOVzCYczBqgvy2ph9MLrwPXnDHn/o7QZ2lR9IbX2z6dN0m
         eae3er9tpRzQ/FBfiKfizwuhBpCE76p2uezoeMTGcSSOusd7HDOX96N1mwMwA8pdOT3y
         oxwMlheyCG73kV0pUtcOr5UsHVYiM+zqdqpHUyaP4/L9s0760Y8ceb2nsOiV1n6nY7qU
         tAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TXjsSAJv8McRWlbUcLkirZ2NM0D/RICs3+Zd+E1Xf+I=;
        b=LMF0FgbTtHjNPV7hXt2pTyCN8tAzk/nQuwXOfxJuRaRCPDfyTr2KWvgOdzsz10QgMi
         HmMVOvOKcjspRs3EZS28qo94pRfha/jmPYiOkp8nr5aBmHzEijlFtcUymL7KMLfHHQdX
         hQfN5u2mOkHFQsPfulWZQxBh9M6sDld5kR+HJ2EM45i5Nx+mVMDTRY4Q4dwo4FXlQzyG
         9n0oFk4V0Y+NDyvjxIkRJkX/O5GSGUvFJKuN80oQrgiotTEdfL6B6SX2KlGR9wcVPekf
         +SYlH8PsOtF7oB1HwJZT1gwQBGB7nOJjrNMEyf4Y79f6bFumzptL+BxsJ9HTZ5OyP9Tm
         f1ow==
X-Gm-Message-State: APjAAAWUaP6qAdZW4uzMwGnBaqYLNQ43wkiRaMXlc6yiak7T9SQesku6
        cRMcduKsI/T8X0QmkJhTQqE/kW90u2H2G7d247Y1hrRXgVL+LA==
X-Google-Smtp-Source: APXvYqxBy6oZ2oWOmC1TadzVg1KFfhlT40FfxLvUs5iF21O8HhGNYx4Gg8CgxKza7lZL4FZb/CKdM2Zp82wqzyic1vM=
X-Received: by 2002:a63:61cd:: with SMTP id v196mr330561pgb.263.1566939496499;
 Tue, 27 Aug 2019 13:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190827103621.1073-1-yamada.masahiro@socionext.com> <20190827192811.GA24626@archlinux-threadripper>
In-Reply-To: <20190827192811.GA24626@archlinux-threadripper>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 27 Aug 2019 13:58:05 -0700
Message-ID: <CAKwvOd=7Jf13PDC9Q1FMhZUJQsq7Ggn=wRz5xpRY0YrU6tP9Kw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: enable unused-function warnings for W= build
 with Clang
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 27, 2019 at 12:28 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Aug 27, 2019 at 07:36:21PM +0900, Masahiro Yamada wrote:
> > GCC and Clang have different policy for -Wunused-function; GCC never
> > reports unused-function warnings for 'static inline' functions whereas
> > Clang reports them if they are defined in source files instead of
> > included headers although it has been suppressed since commit
> > abb2ea7dfd82 ("compiler, clang: suppress warning for unused static
> > inline functions").
> >
> > We often miss to remove unused functions where 'static inline' is used
> > in .c files since there is no tool to detect them. Unused code remains
> > until somebody notices. For example, commit 075ddd75680f ("regulator:
> > core: remove unused rdev_get_supply()").
> >
> > Let's remove __maybe_unused from the inline macro to allow Clang to
> > start finding unused static inline functions. As always, it is not a
> > good idea to sprinkle warnings for the normal build, so I added
> > -Wno-unsued-function for no W= build.

s/unsued/unused/

> >
> > Per the documentation [1], -Wno-unused-function will also disable
> > -Wunneeded-internal-declaration, which can help find bugs like
> > commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> > mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
> > I added -Wunneeded-internal-declaration to address it.
> >
> > If you contribute to code clean-up, please run "make CC=clang W=1"
> > and check -Wunused-function warnings. You will find lots of unused
> > functions.
> >
> > Some of them are false-positives because the call-sites are disabled
> > by #ifdef. I do not like to abuse the inline keyword for suppressing
> > unused-function warnings because it is intended to be a hint for the
> > compiler's optimization. I prefer __maybe_unused or #ifdef around the
> > definition.

I'd say __maybe_unused for function parameters that are used depending
of ifdefs in the body of the function, otherwise strictly ifdefs.

> >
> > [1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
>
> I am still not a big fan of this as I think it weakens clang as a
> standalone compiler but the change itself looks good so if it is going
> in anyways:
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>
> I'm sure Nick would like to weigh in as well before this gets merged.

So right away for an x86_64 defconfig w/ this patch, clang points out:

drivers/gpu/drm/i915/i915_sw_fence.c:84:20: warning: unused function
'debug_fence_init_onstack' [-Wunused-function]
static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
                   ^
drivers/gpu/drm/i915/i915_sw_fence.c:105:20: warning: unused function
'debug_fence_free' [-Wunused-function]
static inline void debug_fence_free(struct i915_sw_fence *fence)
                   ^

The first looks fishy (grep -r debug_fence_init_onstack), the second
only has a callsite ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS.

drivers/gpu/drm/i915/intel_guc_submission.c:1117:20: warning: unused
function 'ctx_save_restore_disabled' [-Wunused-function]
static inline bool ctx_save_restore_disabled(struct intel_context *ce)
                   ^
drivers/gpu/drm/i915/display/intel_hdmi.c:1696:26: warning: unused
function 'intel_hdmi_hdcp2_protocol' [-Wunused-function]
enum hdcp_wired_protocol intel_hdmi_hdcp2_protocol(void)
                         ^
arm64 defconfig builds cleanly, same with arm.  Things might get more
hairy with all{yes|mod}config, but the existing things it finds don't
look insurmountable to me.  In fact, I'll file bugs in our issue
tracker (https://github.com/ClangBuiltLinux/linux/issues) for the
above.

So I'm not certain this patch weakens existing checks.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
