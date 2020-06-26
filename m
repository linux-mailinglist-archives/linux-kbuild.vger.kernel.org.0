Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2161A20B985
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 21:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgFZT6i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 15:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFZT6h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 15:58:37 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93515C03E979
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 12:58:37 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so4636043plo.7
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=taJpkHjbit6GSnXY6CgYGxPxu2VnJV0zi6VGm2eT+v0=;
        b=asziHWfJW2e9Ecz+JH75NFuwW/6x7JieQ6YHFu5P5Iq2bqQ59KyA6TdzgrDCbF/IKs
         Dy2mijdalInD/2D4LbH5E/F8BLW0Xhlu0NbtBZlkg+QT4ccA2sYosDbNEUKTSmoVPkXY
         n7RWhfkkIaXrwdSH0iCIhOxfSsqIRJpAK3HjLLDpNDpVVWIQCDHBiPKMjLkQlqUdecp0
         XcaLDgi5eiq21/4Sdb4cHpI5ZM/KNaSsznT/6WUEEhO1z58a14quZYWmDMPbTfM+FyVp
         h6PskQwCDl57tVUjwtFqpm8PEZ/Rih94zvjKWsgA/MF/cz/08u5Qbah7xV1XFZSCyp42
         U2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=taJpkHjbit6GSnXY6CgYGxPxu2VnJV0zi6VGm2eT+v0=;
        b=RsISe0dFMINo67UQyvK4VbJjH7j8ehmqzYBELFqzxNZx9NY6/zCZPOzf8AnPTBuFdA
         UmgQkIW/OlYgXuhjJQcy1KedwO3LzrEYmpBrAP1T42hIO7ZI1mcv0rj0s/LTpZ47DCw7
         hbXseADuG28BGQt9at2VK0QPmwMCCSS8fSK6P4FXLDWX70QlLVsIEn+p2i/3Lc2ZetrK
         bcnDOTK4mmiBleMLU0sQF0sV26m86FDriWSDnDvZgQRP8J4rNd5ZaRORsVddVwUvWz9u
         elRdua88qCkRLMzieM1HqNLqvwyie59tzRh5yntlqInZhgbzCfO1XPbzOzjxcotGlFeT
         GcNA==
X-Gm-Message-State: AOAM532IL6UHuWhpP5rS7l9nudo14uE5t2IUSvWmuX4bloMNX6W8K7sj
        CHuAhdJamcg48H4oykdH5L52OEShk+0tQVKmsseziR9dVxc=
X-Google-Smtp-Source: ABdhPJxIdj06GPh3DcqA+tMERbU74tnx7im0OJvT7k028uEQsqKEEqe11t0XIcgt/4kKGEmx7Isi2eVSzVWG19FmBd4=
X-Received: by 2002:a17:902:7208:: with SMTP id ba8mr3909663plb.179.1593201516722;
 Fri, 26 Jun 2020 12:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200626185913.92890-1-masahiroy@kernel.org> <20200626185913.92890-2-masahiroy@kernel.org>
In-Reply-To: <20200626185913.92890-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 26 Jun 2020 12:58:24 -0700
Message-ID: <CAKwvOdnPN0=32R=35oJ-WmJwwCtJ-NqAFsp57KXW6Cb2NgUDFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: remove cc-option test of -ffreestanding
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 26, 2020 at 11:59 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Some Makefiles already pass -ffreestanding unconditionally.
> For example, arch/arm64/lib/Makefile, arch/x86/purgatory/Makefile.
> No problem report so far about hard-coding this option. So, we can
> assume all supported compilers know -ffreestanding.
>
> I confirmed GCC 4.8 and Clang manuals document this option.
>
> Get rid of cc-option from -ffreestanding.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  arch/s390/Makefile                    | 2 +-
>  arch/x86/Makefile                     | 2 +-
>  arch/x86/boot/compressed/Makefile     | 2 +-
>  drivers/firmware/efi/libstub/Makefile | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/s390/Makefile b/arch/s390/Makefile
> index 8dfa2cf1f05c..ba94b03c8b2f 100644
> --- a/arch/s390/Makefile
> +++ b/arch/s390/Makefile
> @@ -27,7 +27,7 @@ KBUILD_CFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64 -O2
>  KBUILD_CFLAGS_DECOMPRESSOR += -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY
>  KBUILD_CFLAGS_DECOMPRESSOR += -fno-delete-null-pointer-checks -msoft-float
>  KBUILD_CFLAGS_DECOMPRESSOR += -fno-asynchronous-unwind-tables
> -KBUILD_CFLAGS_DECOMPRESSOR += $(call cc-option,-ffreestanding)
> +KBUILD_CFLAGS_DECOMPRESSOR += -ffreestanding
>  KBUILD_CFLAGS_DECOMPRESSOR += $(call cc-disable-warning, address-of-packed-member)
>  KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),-g)
>  KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO_DWARF4), $(call cc-option, -gdwarf-4,))
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 89c3cdfba753..edc68538a04e 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -36,7 +36,7 @@ REALMODE_CFLAGS       := $(M16_CFLAGS) -g -Os -DDISABLE_BRANCH_PROFILING \
>                    -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
>                    -mno-mmx -mno-sse
>
> -REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -ffreestanding)
> +REALMODE_CFLAGS += -ffreestanding

See also
commit 032a2c4f65a2 ("x86/build: Use __cc-option for boot code
compiler options")
for additional context (to fellow reviewers).

>  REALMODE_CFLAGS += -fno-stack-protector
>  REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -Wno-address-of-packed-member)
>  REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), $(cc_stack_align4))
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index c88a31569a5e..b7beabecef8a 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -35,7 +35,7 @@ cflags-$(CONFIG_X86_32) := -march=i386
>  cflags-$(CONFIG_X86_64) := -mcmodel=small
>  KBUILD_CFLAGS += $(cflags-y)
>  KBUILD_CFLAGS += -mno-mmx -mno-sse
> -KBUILD_CFLAGS += $(call cc-option,-ffreestanding)
> +KBUILD_CFLAGS += -ffreestanding
>  KBUILD_CFLAGS += -fno-stack-protector
>  KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index f8418763cd79..296b18fbd7a2 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -28,7 +28,7 @@ cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
>  KBUILD_CFLAGS                  := $(cflags-y) -Os -DDISABLE_BRANCH_PROFILING \
>                                    -include $(srctree)/drivers/firmware/efi/libstub/hidden.h \
>                                    -D__NO_FORTIFY \
> -                                  $(call cc-option,-ffreestanding) \
> +                                  -ffreestanding \
>                                    -fno-stack-protector \
>                                    $(call cc-option,-fno-addrsig) \
>                                    -D__DISABLE_EXPORTS
> --

-- 
Thanks,
~Nick Desaulniers
