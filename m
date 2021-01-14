Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1215C2F5B73
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 08:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbhANHkE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 02:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727377AbhANHkD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 02:40:03 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2390C061786;
        Wed, 13 Jan 2021 23:39:22 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id o6so9347296iob.10;
        Wed, 13 Jan 2021 23:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=pDkl50wKKXvlnFEMyoCOA4eiXkVtCkofqFa11F/2prs=;
        b=LZyONW5l41afxbiMWOMOs2HO+Ycvj/ZhU6K3xVqaHgQmQgTGvC1VQ1gc6kVTsnGFKJ
         cmL7EHu+N03GO+52M3MV2CNuYp5od3c08tcT4hFsrAZpMZ3bmTUxl8b+L7yv4UNwPdU+
         TvSw9dtuJ/2nVUNZlFoy1x22WzDToEqa8CQB8oUIaZRUkFbzU51MT90mThiwyeodhDZM
         0f2nX0dcifQEi3DsWP81K2g5pcFZpilE/644iPlx2Ie6SraPNbekg18NWSylqf0BSYCt
         /zrNRyt0B9abhw5pPdskxkXdremW4yHbcGPAr1aOBU+8Q9SfhmmByiTZ45JdMzj+IzMQ
         pJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=pDkl50wKKXvlnFEMyoCOA4eiXkVtCkofqFa11F/2prs=;
        b=SMXAXCxx2a9ipsBYY9Fw+bNmiyoR2HgGBuVUcjdkLKQo2AXb9xM3itEqUI7ptHhG58
         XJdsT9ntvH6ORA4owA5YBawiSTZQuxhOPX/8KyqEHK+Blv+wWnh53neF4wMRjSdaVfdG
         NyByoa2JgoG/IS9TEFhXkKCflRxH01O+Qgzbz+ZKQv63wsbrA2Dk7p/BYSXA30KMiTkS
         1kNH4r8d/czRl4ifGQ4Xl3F+F6BVUr073nC5Q2ttOF/spPLA2BSVHVpJTLJB1StvCgNR
         zVia1aSMI6uzyT/VEWi+eZigYISGXjmUlu1O2Ahp/V2yFvtgmXZ0psuJmeHbyRn1ZTK0
         x5MA==
X-Gm-Message-State: AOAM5337QjXeKf3nFZpEZJNw19wStoy9J3UiIwcIKEmLF9nDds/XVdiS
        kC0YuZT1uEzXv7lj6t69tazX+QAbZP8cBHtfB2I=
X-Google-Smtp-Source: ABdhPJybXK0BLNSRQ7Ixe4ZXs/7KsiW13lw8MOehz5t9ImRNCgGZwZITi4quK9lNA4M+jLD8VYG7wr74zmhPCg8g1f8=
X-Received: by 2002:a92:d990:: with SMTP id r16mr5718971iln.10.1610609962241;
 Wed, 13 Jan 2021 23:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20210114003447.7363-1-natechancellor@gmail.com>
In-Reply-To: <20210114003447.7363-1-natechancellor@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 14 Jan 2021 08:39:11 +0100
Message-ID: <CA+icZUXyqRH_bR5xjwZ_GvHp8xoWOqJtCORBX34NX0y9u2JYcQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported architectures
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 1:35 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> The most common question around building the Linux kernel with clang is
> "does it work?" and the answer has always been "it depends on your
> architecture, configuration, and LLVM version" with no hard answers for
> users wanting to experiment. LLVM support has significantly improved
> over the past couple of years, resulting in more architectures and
> configurations supported, and continuous integration has made it easier
> to see what works and what does not.
>
> Add a section that goes over what architectures are supported in the
> current kernel version, how they should be built (with just clang or the
> LLVM utilities as well), and the level of support they receive. This
> will make it easier for people to try out building their kernel with
> LLVM and reporting issues that come about from it.
>

Thanks, this was overdue and is definitely helpful for users and developers.

For x86 64bit:

   Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

Together with "[PATCH] kbuild: check the minimum compiler version in
Kconfig" this looks very good to me.

/o\
- Sedat -

[1] https://marc.info/?t=161059811000001&r=1&w=2

> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  Documentation/kbuild/llvm.rst | 44 +++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 21c847890d03..b18401d2ba82 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -63,6 +63,50 @@ They can be enabled individually. The full list of the parameters: ::
>  Currently, the integrated assembler is disabled by default. You can pass
>  ``LLVM_IAS=1`` to enable it.
>
> +Supported Architectures
> +-----------------------
> +
> +LLVM does not target all of the architectures that Linux supports and
> +just because a target is supported in LLVM does not mean that the kernel
> +will build or work without any issues. Below is a general summary of
> +architectures that currently work with ``CC=clang`` or ``LLVM=1``. Level
> +of support corresponds to "S" values in the MAINTAINERS files. If an
> +architecture is not present, it either means that LLVM does not target
> +it or there are known issues. Using the latest stable version of LLVM or
> +even the development tree will generally yield the best results.
> +An architecture's ``defconfig`` is generally expected to work well,
> +certain configurations may have problems that have not been uncovered
> +yet. Bug reports are always welcome at the issue tracker below!
> +
> +.. list-table::
> +   :widths: 10 10 10
> +   :header-rows: 1
> +
> +   * - Architecture
> +     - Level of support
> +     - ``make`` command
> +   * - arm
> +     - Supported
> +     - ``LLVM=1``
> +   * - arm64
> +     - Supported
> +     - ``LLVM=1``
> +   * - mips
> +     - Maintained
> +     - ``CC=clang``
> +   * - powerpc
> +     - Maintained
> +     - ``CC=clang``
> +   * - riscv
> +     - Maintained
> +     - ``CC=clang``
> +   * - s390
> +     - Maintained
> +     - ``CC=clang``
> +   * - x86
> +     - Supported
> +     - ``LLVM=1``
> +
>  Getting Help
>  ------------
>
>
> base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
> --
> 2.30.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210114003447.7363-1-natechancellor%40gmail.com.
