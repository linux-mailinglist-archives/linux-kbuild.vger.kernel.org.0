Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA7413FC35
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Jan 2020 23:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388310AbgAPWam (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Jan 2020 17:30:42 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38412 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbgAPWam (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 17:30:42 -0500
Received: by mail-pg1-f194.google.com with SMTP id a33so10637635pgm.5
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Jan 2020 14:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ODGLZwrFLfLtDSf4qIslNTvdWFOn6TwOdB2Jam0+bjY=;
        b=oqbV1Tp+GDEdOc2cR4ErkA07zWYDqwEhTYtegJkwdFH1e1ZQkr5JcSm/z2IJru6/OF
         ndhfp/Oaw/UQp/ERSrnb6JB6PLrKKkGMP9pkKRiypOAT2NGacXHT+CXZE1gURxgwMxuX
         XB7AGGWQIghkBy1T9pjgx/B/4kmJbEJyzPHqVLULaOkBPHzL1o8+PjYCh1Xuz89zttWc
         XYl97JUM9u3Iz8Xq6kOE3A/MPiQ+xJzlRTkMhiVm0+U19GETWpjdrVTCxWDSogGDvBQw
         h7He+hCPhVpYN8B81ArHqrviyy79etJyTDm1sFa81M0+BPKU6tUqr/gncYnDgGhRaUDk
         fNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ODGLZwrFLfLtDSf4qIslNTvdWFOn6TwOdB2Jam0+bjY=;
        b=pDDO9eY64vIap+7Bt0whAFmX1ZtjbaQ2a5jlpQWVCy/zIndyzlN2NlRgHoC7LaHH9A
         pwmw0EUvTZ+NAh0XCBmZ917NJBRIfeQ7/o/495KOwmUw1G/yZDQslhwvjdY/1a315Asf
         nnU7Opvs7STKnEW3q8VSSbH1HVCpUWh5Eg8uaKXY1vHdwm+JY/UenMfVZkeghkjv+udz
         9hRcYbheyxviIi0MOhGihaZwu8F9zGFHK/pqzkzjYpypyrMCmAudEWSPmBqybQmWHANt
         wFyz1So3OQRsSHDz48YJoOLZKd9TsNPbdcuwRSwvBlzWILvKreptiOUd84fM+psxUxQj
         uOuQ==
X-Gm-Message-State: APjAAAXGw7J/CN4fXjUjHgjT6VpaC4Y9OHDaGmOnUZXukFDBjVcHafJ9
        N77qu+jmiZ6H0d4R5WLrhhbfokUYHapIQdd/j3v5nQ==
X-Google-Smtp-Source: APXvYqzR+BqbJ1bXpSiKAliufK4bZjt32phEtclQlHnY/+JB8+5YQiGeOHTpkXAofoHQcxpgsOXmjHUAn9ebnyqVWvA=
X-Received: by 2002:a63:f24b:: with SMTP id d11mr41091369pgk.381.1579213839722;
 Thu, 16 Jan 2020 14:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20200115115249.27774-1-ilie.halip@gmail.com>
In-Reply-To: <20200115115249.27774-1-ilie.halip@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 16 Jan 2020 14:30:28 -0800
Message-ID: <CAKwvOdkdD9VF1k==G4vMeo4bBLarYz8gPvWfv6+N2kejeoXfjA@mail.gmail.com>
Subject: Re: [RFC PATCH] lib: move memcat_p.o to obj-y
To:     Ilie Halip <ilie.halip@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 15, 2020 at 3:53 AM Ilie Halip <ilie.halip@gmail.com> wrote:
>
> The semantics of `--undefined` differ between ld.bfd and ld.lld:
>     $ echo | gcc -x c -c - -o a.o
>     $ echo "EXTERN(test)" > a.lds
>     $ ld.bfd a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
>     0000000000000000         *UND*      0000000000000000 test
>     $ ld.lld a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
>     $
>
> When building with CONFIG_STM=m, there are no in-kernel users of memcat_p()
> and ld.lld discards this symbol because it's linked in via --no-whole-archive.
> It's marked as undefined by a linker script but ld.lld discards it anyway (as
> seen in the above snippet).
>
> Work around the ld.lld behavior by moving the object file to obj-y.
>
> Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/515

Thanks for the patch.  This solves the observed linkage failure.
Maybe Masahiro has more input based on the discussion in the above
Link?
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  lib/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/Makefile b/lib/Makefile
> index 93217d44237f..eac343b81f77 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -30,7 +30,7 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
>          flex_proportions.o ratelimit.o show_mem.o \
>          is_single_threaded.o plist.o decompress.o kobject_uevent.o \
>          earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
> -        nmi_backtrace.o nodemask.o win_minmax.o memcat_p.o
> +        nmi_backtrace.o nodemask.o win_minmax.o
>
>  lib-$(CONFIG_PRINTK) += dump_stack.o
>  lib-$(CONFIG_MMU) += ioremap.o
> @@ -45,7 +45,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
>          bsearch.o find_bit.o llist.o memweight.o kfifo.o \
>          percpu-refcount.o rhashtable.o \
>          once.o refcount.o usercopy.o errseq.o bucket_locks.o \
> -        generic-radix-tree.o
> +        generic-radix-tree.o memcat_p.o
>  obj-$(CONFIG_STRING_SELFTEST) += test_string.o
>  obj-y += string_helpers.o
>  obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
>
> base-commit: ee02f9544ebd8d38900dfe955710897b99483686
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200115115249.27774-1-ilie.halip%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
