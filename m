Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FB332C1BB
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240053AbhCCT01 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbhCCD1Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 22:27:24 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D2FC061756;
        Tue,  2 Mar 2021 19:26:24 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id i18so20037117ilq.13;
        Tue, 02 Mar 2021 19:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=MBQIh7nbzwXZfvcx1OJ6qsninMO70G/gAKxbffF9+cs=;
        b=GdqfAoy8c9cJ4nFwxF4sCWIuWuINy4Ro4diYigvC63NvkfK4+mQcXYXVqlMN2WJinB
         8zxC12P5KEvrf102AL+VZ5ml8S5+YIFedT8uEd0d8/74pABUu2omFFO9rZEoVQ/Qc4Ge
         gX4xdPW0gqoq0ak3gPz9iA/UNLeMS67zTdclgdOKTLzpO6h6Z+r25Den4YLTUcTWrOev
         ztyRspPmrFa8A5AW5LToH5F5lWQb0W6WxSpO+kwwv8rTJYS614PBdEER+IFeWPa1k8no
         GhuUIAp9f427YVQnAmJWGVxdZww8KVDhRCZhw1JfEFnM2U2qTPwgUMiNlEsMJyse9Kpx
         nkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=MBQIh7nbzwXZfvcx1OJ6qsninMO70G/gAKxbffF9+cs=;
        b=qendrCo3En68jtU2NMWPvaKSQFdJEslJFra1rYbIja5fO8RN3a2wlJCqtlS896e/90
         9OLFYB0XWi6xzXdQMsMuqHEoDDKogVnnJS9njEQmqxXMgmjn3D4u5NWrTyWqZFl0qAx+
         SedbPF/WwYLcb+DLoBuoRu13HrOD6ZrUjZdQhXcURjaf4PZ/PBx4iNnyB8lDAD2XUese
         0g2L1hKWw+QKVzXKEFsdCHtfaQce8O/v1MxPYa7ThJOJRqrYAYcl8AqO0GDzmL6USUUO
         OTaYp2EKDgplQT93Eoi8KZKl7q5yiaHLvqKU8/e+9pdcEc6CZ+LuDLGPvHOhyXcoE0C8
         q+tA==
X-Gm-Message-State: AOAM533UeBzapr0Aif4U/b2y0URDdnJTIPgYAIpglMXDvTYPJzgl5sd4
        0DsTlg/H/ssytpecHVLlDWRaOX5ok+ESkm4xpQU=
X-Google-Smtp-Source: ABdhPJw6mhK9cnJpzMfPkVOUxUTic2KGP9DyCmaf0xlPoLkL+d38XS+3vT/9QYJv0pyCnaOSKipx0yCeueagxn09RS4=
X-Received: by 2002:a92:ce84:: with SMTP id r4mr2959615ilo.112.1614741983852;
 Tue, 02 Mar 2021 19:26:23 -0800 (PST)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org>
In-Reply-To: <20210302210646.3044738-1-nathan@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 3 Mar 2021 04:25:47 +0100
Message-ID: <CA+icZUWKZ+vVTqSkPP0D8MMWuZkNzL1zpm+EkWrNSMM-5H3d1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] Makefile: Remove '--gcc-toolchain' flag
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Behan Webster <behanw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 2, 2021 at 10:07 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This is not necessary anymore now that we specify '--prefix=', which
> tells clang exactly where to find the GNU cross tools. This has been
> verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as well as a
> distribution version of LLVM 11.1.0 without binutils in the LLVM
> toolchain locations.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

[ CC Behan ]

Hahaha, that is a change of a very early commit in times of the
LLVM/Clang Linux-kernel development.
So-to-say a historical change :-).

I will try this patchset later with latest Linux -v5.12-rc1+ and my
custom patchset.

Thanks.

- Sedat -


> ---
>  Makefile | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f9b54da2fca0..c20f0ad8be73 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> -GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> -endif
> -ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  ifneq ($(LLVM_IAS),1)
>  CLANG_FLAGS    += -no-integrated-as
>
> base-commit: 7a7fd0de4a9804299793e564a555a49c1fc924cb
> --
> 2.31.0.rc0.75.gec125d1bc1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210302210646.3044738-1-nathan%40kernel.org.
