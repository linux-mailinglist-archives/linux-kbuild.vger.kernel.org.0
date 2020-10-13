Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0512428D046
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 16:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388713AbgJMOcE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Oct 2020 10:32:04 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60543 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388691AbgJMOcE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 10:32:04 -0400
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 09DEVlSu012298;
        Tue, 13 Oct 2020 23:31:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 09DEVlSu012298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602599508;
        bh=YB1WCHK+o0PqjhCmZaRPYUlHHjnzTpeZ72Cc5ws6nnQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0J/PcS7RB6cSMWzhxjAkmcMYmQ0jpQkyiqE3Gl20SI+j1Sgjx6rCh5HPw5T/yV9Mo
         HTiB3Ji4HtV1N1yU9LTSSpJomh16lcl1Yp/aKwZwirASTVyIJJQTysUb8CHpo2+8Oe
         3hu4SeJc9ITlz4pdImlv+j6rXSO3LNl0xGtD9r51rpdHyspqdvNxiJbwHhb+z5lHHn
         s0HZXUooYhijAoCvYrsxsjYqh44DlXpYCGWcF4On9xO2fK23iqA5OXnkv9lWgrqB5/
         IdqPB346sMuYSyzNtqXDHJ17B0K84jt5TSRhkB/DeQisLudnFo1Og6zEuKtwbizN8X
         qkq+sXDhH8xkA==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id x16so17679933pgj.3;
        Tue, 13 Oct 2020 07:31:48 -0700 (PDT)
X-Gm-Message-State: AOAM533L/j5NP0SGTwvQVzgeWXrppA03MOlRbVfHq6LOxl5Ojt2j8Dzo
        3sXWArWMHhmYG4trznMsUl+nbBHG+Ze1G8DLEOo=
X-Google-Smtp-Source: ABdhPJxQEpKrJv97JNnMtyZL/6zzLxfMcFXOLKK2hXBRKcuKHRyo30zIrJHi3byG9tmQNm6tYre1p+bv2hRJsgHxsv0=
X-Received: by 2002:a63:1b44:: with SMTP id b4mr17246132pgm.175.1602599507368;
 Tue, 13 Oct 2020 07:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201001075723.24246-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201001075723.24246-1-lukas.bulwahn@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 13 Oct 2020 23:31:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com>
Message-ID: <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: doc: describe proper script invocation
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 1, 2020 at 4:57 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> During an investigation to fix up the execute bits of scripts in the kernel
> repository, Andrew Morton and Kees Cook pointed out that the execute bit
> should not matter, and that build scripts cannot rely on that. Kees could
> not point to any documentation, though.
>
> Masahiro Yamada explained the convention of setting execute bits to make it
> easier for manual script invocation.
>
> Provide some basic documentation how the build shall invoke scripts, such
> that the execute bits do not matter, and acknowledge that execute bits
> are useful nonetheless.
>
> This serves as reference for further clean-up patches in the future.
>
> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> Link: https://lore.kernel.org/linux-kbuild/CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com/
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Applied to linux-kbuild.
Thanks.


> ---
> RFC v1 -> RFC v2:
> explain why execute bits are still convenient.
>
> Kees, Andrew, please ack.
>
> Masahiro-san, I have taken your feedback into account. Please pick this small
> documentation update into your kbuild tree.
>
> Ujjwal Kumar, a potential future mentee, will follow up with further fixes to
> the build scripts.
>
>  Documentation/kbuild/makefiles.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 58d513a0fa95..bd3e1baf58be 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -21,6 +21,7 @@ This document describes the Linux kernel Makefiles.
>            --- 3.10 Special Rules
>            --- 3.11 $(CC) support functions
>            --- 3.12 $(LD) support functions
> +          --- 3.13 Script Invocation
>
>         === 4 Host Program support
>            --- 4.1 Simple Host Program
> @@ -605,6 +606,25 @@ more details, with real examples.
>                 #Makefile
>                 LDFLAGS_vmlinux += $(call ld-option, -X)
>
> +3.13 Script invocation
> +----------------------
> +
> +       Make rules may invoke scripts to build the kernel. The rules shall
> +       always provide the appropriate interpreter to execute the script. They
> +       shall not rely on the execute bits being set, and shall not invoke the
> +       script directly. For the convenience of manual script invocation, such
> +       as invoking ./scripts/checkpatch.pl, it is recommended to set execute
> +       bits on the scripts nonetheless.
> +
> +       Kbuild provides variables $(CONFIG_SHELL), $(AWK), $(PERL),
> +       $(PYTHON) and $(PYTHON3) to refer to interpreters for the respective
> +       scripts.
> +
> +       Example::
> +
> +               #Makefile
> +               cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
> +                            $(KERNELRELEASE)
>
>  4 Host Program support
>  ======================
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
