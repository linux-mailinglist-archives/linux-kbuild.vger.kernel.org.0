Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F55F5C0572
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Sep 2022 19:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiIURse (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Sep 2022 13:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiIURsc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Sep 2022 13:48:32 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994F1A2626
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Sep 2022 10:48:31 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id q3so7251747pjg.3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Sep 2022 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=Y0XGdQ2DGQNpNgTfIsQbxO7oZnU+9/cRxpemxaepUvs=;
        b=SSu2Vaqnb6KbYSZEkhXM+0NSQKg7CvNEm37HvC3kkIZdgywjY26OoG0cSz1XmrcImH
         4KZv0a1iHMsuL72whBX53FXq8Uv6WbejlaCcrPYRlOEzCTNbjR3JPd7TXgQPkv7Jt4qD
         yMkH/dwboDorfGWRpGT+xfm2D0LryJ7VynHWmctaBWkcWvOCKwCP1LG4uS9nfQujc2fd
         j8za13dz+aK9x9jobk8QL9kq7hMetqRHMv/hC9g5TQGJI9kk+mU48+XBl2Xxv+u+4tHf
         h2w7rC3n532YBijEZtHJLKQ/IvPFJBih8Lm3/YDugN/Mukk6jc+PhJSxE0TxOJ6aSdld
         0Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Y0XGdQ2DGQNpNgTfIsQbxO7oZnU+9/cRxpemxaepUvs=;
        b=AudV2wCJxAm5CEBTn3VQZf4G9cjr8GCMeKh2clfOt+dpPk9tzhniFjYpuVfvpI9+bJ
         LIua+FJcPnxerOpeVopE+BUVO4bZzEIUdcn/y1+ypEovxXiRhhnMtCy5IGiTRQl9XZHL
         TPqkMHrIkJlbLc3EW69XcgcTSEqcx8vYiOU45fUHq4WS47hVjg08m/7jHqF7R3m94qMF
         6iwC5Zj4abHyuT+YTkiPS7sgfeiPryr7x8joEGAMKfoRrcHz8oQiczxKtTGwOEp3TpJc
         Oz2F7+mImmD+DZHGqm9Ad5AuMUFBQVmmhNuYKvesCrsBPkvQbnLGWu5ZMJqRx6hZEwNQ
         NTfg==
X-Gm-Message-State: ACrzQf1krU0+qDMKDktMXEZd5QMzT0txnE5uGiwD0xgvPJS1jruThUOo
        5V1U/QZwx4NQbWDuHx0AlsfdU8cYYcZKhSPzI3Gkomf0Vn8=
X-Google-Smtp-Source: AMsMyM5tDuRIWv+SHniCMJDjvbW7S72cX+hRLtjWVB7hssjA/ciKMMcFAR/nwdt2uj1esC6Wbc+xAyK7vrmy3OnhcgM=
X-Received: by 2002:a17:902:e74d:b0:178:796c:e1b7 with SMTP id
 p13-20020a170902e74d00b00178796ce1b7mr5766050plf.33.1663782510329; Wed, 21
 Sep 2022 10:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220921064855.2841607-1-davidgow@google.com> <CAKwvOdnLaDn=EfGFhjhcZe4EzvjU7Cws3z3KjLGwW=xnqnmHyw@mail.gmail.com>
In-Reply-To: <CAKwvOdnLaDn=EfGFhjhcZe4EzvjU7Cws3z3KjLGwW=xnqnmHyw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 21 Sep 2022 10:48:18 -0700
Message-ID: <CAKwvOd=o5xhxUK99LK8xg534h7RCapAftrMdoaN+bNPyVciDrA@mail.gmail.com>
Subject: Fwd: [PATCH v2] arch: um: Mark the stack non-executable to fix a
 binutils warning
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If there's a reply, I'll cc in kbuild...for now just a heads up.

---------- Forwarded message ---------
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, Sep 21, 2022 at 10:47 AM
Subject: Re: [PATCH v2] arch: um: Mark the stack non-executable to fix
a binutils warning
To: David Gow <davidgow@google.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov
<anton.ivanov@cambridgegreys.com>, Johannes Berg
<johannes@sipsolutions.net>, David Gow <davidgow@google.com>, Thomas
Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave
Hansen <dave.hansen@linux.intel.com>, Linus Torvalds
<torvalds@linux-foundation.org>, Brendan Higgins
<brendan.higgins@linux.dev>, Daniel Latypov <dlatypov@google.com>,
<linux-um@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
<kunit-dev@googlegroups.com>, <x86@kernel.org>, Lukas Straub
<lukasstraub2@web.de>, Randy Dunlap <rdunlap@infradead.org>,
clang-built-linux <llvm@lists.linux.dev>


On Tue, Sep 20, 2022 at 11:49 PM David Gow <davidgow@google.com> wrote:
>
> Since binutils 2.39, ld will print a warning if any stack section is
> executable, which is the default for stack sections on files without a
> .note.GNU-stack section.
>
> This was fixed for x86 in commit ffcf9c5700e4 ("x86: link vdso and boot with -z noexecstack --no-warn-rwx-segments"),
> but remained broken for UML, resulting in several warnings:
>
> /usr/bin/ld: warning: arch/x86/um/vdso/vdso.o: missing .note.GNU-stack section implies executable stack
> /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1.o: missing .note.GNU-stack section implies executable stack
> /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2 has a LOAD segment with RWX permissions
> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2.o: missing .note.GNU-stack section implies executable stack
> /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions
>
> Link both the VDSO and vmlinux with -z noexecstack, fixing the warnings
> about .note.GNU-stack sections. In addition, pass --no-warn-rwx-segments
> to dodge the remaining warnings about LOAD segments with RWX permissions
> in the kallsyms objects. (Note that this flag is apparently not
> available on lld, so hide it behind a test for BFD, which is what the
> x86 patch does.)
>
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ffcf9c5700e49c0aee42dcba9a12ba21338e8136
> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> Signed-off-by: David Gow <davidgow@google.com>
> Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> Tested-by: Lukas Straub <lukasstraub2@web.de>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> ---
>
> Note that this still doesn't seem to be working properly with make
> LLVM=1. It doesn't appear to break anything, and still is an improvement
> for gcc, so seems worthwhile anyway...

Hi David,
Do you have more info about this comment?  Perhaps there's more
hermiticity issues with ARCH=um when a linker is explicitly specified
via LD= or HOSTLD=, or implied via LLVM=1.

Looking at our CI for ARCH=um builds...
https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/3095779516/jobs/5012260390
warnings from /usr/bin/ld. That's...unexpected.
I've filed https://github.com/ClangBuiltLinux/linux/issues/1715 to
follow up on this.

>
> Changes since v1:
> http://lists.infradead.org/pipermail/linux-um/2022-August/004234.html
> - Pass the -z noexecstack and --no-warn-rwx-segments flags as LDFLAGS,
>   rather than as CFLAGS via -Wl
> - Check that --no-warn-rwx-segments exists with the ld-option function
>   (Thanks Richard)
> - Add Lukas and Randy's tags.
>
>
>  arch/um/Makefile          | 8 ++++++++
>  arch/x86/um/vdso/Makefile | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index f2fe63bfd819..f1d4d67157be 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -132,10 +132,18 @@ export LDS_ELF_FORMAT := $(ELF_FORMAT)
>  # The wrappers will select whether using "malloc" or the kernel allocator.
>  LINK_WRAPS = -Wl,--wrap,malloc -Wl,--wrap,free -Wl,--wrap,calloc
>
> +# Avoid binutils 2.39+ warnings by marking the stack non-executable and
> +# ignorning warnings for the kallsyms sections.
> +LDFLAGS_EXECSTACK = -z noexecstack
> +ifeq ($(CONFIG_LD_IS_BFD),y)
> +LDFLAGS_EXECSTACK += $(call ld-option,--no-warn-rwx-segments)
> +endif
> +
>  LD_FLAGS_CMDLINE = $(foreach opt,$(KBUILD_LDFLAGS),-Wl,$(opt))
>
>  # Used by link-vmlinux.sh which has special support for um link
>  export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS) $(LD_FLAGS_CMDLINE)
> +export LDFLAGS_vmlinux := $(LDFLAGS_EXECSTACK)
>
>  # When cleaning we don't include .config, so we don't include
>  # TT or skas makefiles and don't clean skas_ptregs.h.
> diff --git a/arch/x86/um/vdso/Makefile b/arch/x86/um/vdso/Makefile
> index 8c0396fd0e6f..6fbe97c52c99 100644
> --- a/arch/x86/um/vdso/Makefile
> +++ b/arch/x86/um/vdso/Makefile
> @@ -65,7 +65,7 @@ quiet_cmd_vdso = VDSO    $@
>                        -Wl,-T,$(filter %.lds,$^) $(filter %.o,$^) && \
>                  sh $(srctree)/$(src)/checkundef.sh '$(NM)' '$@'
>
> -VDSO_LDFLAGS = -fPIC -shared -Wl,--hash-style=sysv
> +VDSO_LDFLAGS = -fPIC -shared -Wl,--hash-style=sysv -z noexecstack
>  GCOV_PROFILE := n
>
>  #
> --
> 2.37.3.968.ga6b4b080e4-goog
>


--
Thanks,
~Nick Desaulniers


-- 
Thanks,
~Nick Desaulniers
