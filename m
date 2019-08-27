Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEA49F521
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2019 23:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbfH0Vex (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Aug 2019 17:34:53 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33005 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728834AbfH0Vew (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 17:34:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id u16so313403wrr.0;
        Tue, 27 Aug 2019 14:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X7Gmk5o9VsuM2I/A4OdM4iPlEY6vJ+afjmkhaM1iGLM=;
        b=cqyny0s9Qfef7JPSUYLKgSkxJBLcSUdRwm6oEIBfbEl2MKMUMLLDz1e9lR71rkJ62T
         aRXOmvTCapNIne36rXug6ROVXzmPOOiO6rDxQRTZummUP391iBtYFyDJsyJBnS3yFsUS
         A+uYGsT5v0moHaAfNSsOfvcXanQ9HeTVaFyy0gUMi+itwLQ5vne+BhXTUxtbHutQuR8W
         D44wokcD3ELRYRYpZqQHul/czQuvo6twWnJStWgV2m21lhQVsyT1uVptKTspgAcd+YVV
         Mbl3z4qH+oFJQ0v3WwpStgjJD9YfNT+f9Clfft/OMFRq1ZFgsbJA/x7vzv7coP3MvR9p
         F1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X7Gmk5o9VsuM2I/A4OdM4iPlEY6vJ+afjmkhaM1iGLM=;
        b=AtP4+C279BQhFfP++oMrAGAJ4O34Z75Wt07y7yCB396XoJVjWUg9rJ6LxWmAu6pRr3
         9m6UM5TbM4ZKzOK2uVpWp1B+vFdF9iTWarjPInRcZNGZW148ivZpIV4NjEIhgA20RYOu
         oCVvTMYKQZbiy9Mikw77VxBQMO3y7wg4bqcJd1K+xypua521Mj3wIB55Mm6ekoHWKVs+
         ajMJUD7bHmifT3fJW1+Zs0AdRHuRlhTaddj8/y8Z3rWEhh4QH+wQeApqi3Tx3fOZF8uQ
         AXq9CJ3WGCzaN0vGiXi4fYUcxpRGFT9aXC93R5pq45KtMBGieOtep1GiAuVFVANcKToR
         J8jQ==
X-Gm-Message-State: APjAAAXP0FBPGmgPz7tcNAuiOWlUzJZxfmGYpINQ9cETG1DfnPiTNJki
        VHjqliJF7cXeeeFB+IF80Sk=
X-Google-Smtp-Source: APXvYqwa3BN3OtVjpRtZkGnQVPMF1KMLehuI6JktOQ6BXfYa/jl/3r3w/FRuqVUpdy68FAcHDrHCtg==
X-Received: by 2002:a5d:480e:: with SMTP id l14mr290257wrq.96.1566941689543;
        Tue, 27 Aug 2019 14:34:49 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id h8sm188418wrq.49.2019.08.27.14.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 14:34:48 -0700 (PDT)
Date:   Tue, 27 Aug 2019 14:34:47 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] kbuild: enable unused-function warnings for W= build
 with Clang
Message-ID: <20190827213447.GA26954@archlinux-threadripper>
References: <20190827103621.1073-1-yamada.masahiro@socionext.com>
 <20190827192811.GA24626@archlinux-threadripper>
 <CAKwvOd=7Jf13PDC9Q1FMhZUJQsq7Ggn=wRz5xpRY0YrU6tP9Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=7Jf13PDC9Q1FMhZUJQsq7Ggn=wRz5xpRY0YrU6tP9Kw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 27, 2019 at 01:58:05PM -0700, Nick Desaulniers wrote:
> On Tue, Aug 27, 2019 at 12:28 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Tue, Aug 27, 2019 at 07:36:21PM +0900, Masahiro Yamada wrote:
> > > GCC and Clang have different policy for -Wunused-function; GCC never
> > > reports unused-function warnings for 'static inline' functions whereas
> > > Clang reports them if they are defined in source files instead of
> > > included headers although it has been suppressed since commit
> > > abb2ea7dfd82 ("compiler, clang: suppress warning for unused static
> > > inline functions").
> > >
> > > We often miss to remove unused functions where 'static inline' is used
> > > in .c files since there is no tool to detect them. Unused code remains
> > > until somebody notices. For example, commit 075ddd75680f ("regulator:
> > > core: remove unused rdev_get_supply()").
> > >
> > > Let's remove __maybe_unused from the inline macro to allow Clang to
> > > start finding unused static inline functions. As always, it is not a
> > > good idea to sprinkle warnings for the normal build, so I added
> > > -Wno-unsued-function for no W= build.
> 
> s/unsued/unused/
> 
> > >
> > > Per the documentation [1], -Wno-unused-function will also disable
> > > -Wunneeded-internal-declaration, which can help find bugs like
> > > commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> > > mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
> > > I added -Wunneeded-internal-declaration to address it.
> > >
> > > If you contribute to code clean-up, please run "make CC=clang W=1"
> > > and check -Wunused-function warnings. You will find lots of unused
> > > functions.
> > >
> > > Some of them are false-positives because the call-sites are disabled
> > > by #ifdef. I do not like to abuse the inline keyword for suppressing
> > > unused-function warnings because it is intended to be a hint for the
> > > compiler's optimization. I prefer __maybe_unused or #ifdef around the
> > > definition.
> 
> I'd say __maybe_unused for function parameters that are used depending
> of ifdefs in the body of the function, otherwise strictly ifdefs.
> 
> > >
> > > [1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> >
> > I am still not a big fan of this as I think it weakens clang as a
> > standalone compiler but the change itself looks good so if it is going
> > in anyways:
> >
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> >
> > I'm sure Nick would like to weigh in as well before this gets merged.
> 
> So right away for an x86_64 defconfig w/ this patch, clang points out:
> 
> drivers/gpu/drm/i915/i915_sw_fence.c:84:20: warning: unused function
> 'debug_fence_init_onstack' [-Wunused-function]
> static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
>                    ^
> drivers/gpu/drm/i915/i915_sw_fence.c:105:20: warning: unused function
> 'debug_fence_free' [-Wunused-function]
> static inline void debug_fence_free(struct i915_sw_fence *fence)
>                    ^
> 
> The first looks fishy (grep -r debug_fence_init_onstack), the second
> only has a callsite ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS.
> 
> drivers/gpu/drm/i915/intel_guc_submission.c:1117:20: warning: unused
> function 'ctx_save_restore_disabled' [-Wunused-function]
> static inline bool ctx_save_restore_disabled(struct intel_context *ce)
>                    ^
> drivers/gpu/drm/i915/display/intel_hdmi.c:1696:26: warning: unused
> function 'intel_hdmi_hdcp2_protocol' [-Wunused-function]
> enum hdcp_wired_protocol intel_hdmi_hdcp2_protocol(void)
>                          ^
> arm64 defconfig builds cleanly, same with arm.  Things might get more
> hairy with all{yes|mod}config, but the existing things it finds don't
> look insurmountable to me.  In fact, I'll file bugs in our issue
> tracker (https://github.com/ClangBuiltLinux/linux/issues) for the
> above.
> 
> So I'm not certain this patch weakens existing checks.

Well, we no longer get -Wunused-function warnings without W=1.
Sometimes, that warning is just a result of missed clean up but there
have been instances where it was a real bug:

https://lore.kernel.org/lkml/20190523010235.GA105588@archlinux-epyc/

https://lore.kernel.org/lkml/1558574945-19275-1-git-send-email-skomatineni@nvidia.com/

Having warnings not be equal between compilers out of the box causes
confusion and irritation: https://crbug.com/974884

Is not the objective of ClangBuiltLinux to rely on GCC less?

The only reason that we see the warnings crop up in i915 is because
they add -Wall after all of the warnings get disabled (i.e.
-Wno-unused-function -Wall so -Wunused-function gets enabled again).

To get these warnings after this patch, W=1 has to be used and that
results in a lot of extra warnings. x86_64 defconfig has one objtool
warning right now, W=1 adds plenty more (from both -W flags and lack of
kerneldoc annotations):

https://gist.github.com/175afbca29ead14bd039ad46f4ab0ded

This is just food for thought though.

Cheers,
Nathan
