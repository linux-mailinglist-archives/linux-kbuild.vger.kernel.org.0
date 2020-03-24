Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35672191A1F
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 20:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgCXTjC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 15:39:02 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35553 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgCXTjC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 15:39:02 -0400
Received: by mail-pg1-f195.google.com with SMTP id 7so9571106pgr.2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 12:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FqoMGUJll9Veg+MpF7sippdoesIw0FFxb5gCdl/JcEs=;
        b=EJwuHni+oQ+OeokhHY9gt6Q8ZdryeMdfB7u++030DzDcuw1WPX98OZn3DFqtn5duew
         OkmR0nDFow+56mh1f+ZQ9+Rv+WbcAjhJII/oEoSC9rXixsk/WADTgV4/d/c5x0UWNHEO
         VYONcP9gnCTPA9oS+Yx8evMkSLdjLOKrYuePBVZHCcepkppIXY//vJCUZievm3oxeZNB
         cgtFFnC9j7wUiEPodlBB2YdgCThG4sgw85gWFPUGffcIIcjfiNSyjKF6gnvHIiazV/oL
         U+/vvuNAWx7IjMD/XJd4ZqNn6mTMnS9LaL7ziCQotnTUXXcfkQlSyav2aWMeSftTB1D+
         jaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FqoMGUJll9Veg+MpF7sippdoesIw0FFxb5gCdl/JcEs=;
        b=ImIGtrE8jm9owvh0ZQe47iIx8Zrvug/4HxKvpUzD9GbIOPSZkLuA5A3ty0FDuQFhaX
         TCiiwZjQdAKPSJs7Exw6Nb71kxXB8UkK5uY2MsfYx3TK77kIlAmMmdVKyOG3cXS0eCB/
         1A6AWzmmnFaHC0UkUxzPWiTOsdrD4ZseR0UBfTcuPTz9BUOrCRp8dNAaOVUkel2nr84/
         iIZJ3gsJZNw5LgvUfrbCRk4Z60c9nP3xzaksIt4Fk69F6uTdil+5LUCJB/04iyc4+GMa
         c6LE3YZ6tdOJtaHMAz8THGQeUY7ut07+02N+uKfSNC8VXDJZvXeU/V58NayAOXgZikT7
         N0pA==
X-Gm-Message-State: ANhLgQ0sRgV1+EM7Z0BJ4gMu2GUpDZZc4MXdN+LmU1qfT8zcrV5SHEeg
        Z6wuZKq82+8SNJjqyf14cmY2lyAKpVXh9UT/TS+SgA==
X-Google-Smtp-Source: ADFU+vuHCD6vCekZmASrJxBY4B7NrbsOlMmxgEx10j62oseaS81t5zvPERXGOe/446iPRII0JyXqNAJUBjBWa9/qJmE=
X-Received: by 2002:a63:a34d:: with SMTP id v13mr7687220pgn.10.1585078741157;
 Tue, 24 Mar 2020 12:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200324161539.7538-1-masahiroy@kernel.org> <20200324161539.7538-3-masahiroy@kernel.org>
In-Reply-To: <20200324161539.7538-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 12:38:50 -0700
Message-ID: <CAKwvOdkjiyyt8Ju2j2O4cm1sB34rb_FTgjCRzEiXM6KL4muO_w@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: remove AS variable
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Network Development <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 24, 2020 at 9:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> As commit 5ef872636ca7 ("kbuild: get rid of misleading $(AS) from
> documents") noted, we rarely use $(AS) in the kernel build.
>
> Now that the only/last user of $(AS) in drivers/net/wan/Makefile was
> converted to $(CC), $(AS) is no longer used in the build process.

TIL that we don't actually invoke the assembler at all for out of line
assembly files, but rather use the compiler as the "driver".
scripts/Makefile.build:
329 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
330       cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<

Though I am personally conflicted, as
commit 055efab3120b ("kbuild: drop support for cc-ldoption")
since we do the opposite for the linker (we do not use the compiler as
the driver for the linker using -Wl,-foo flags).  I wish we were
consistent in this regard (and not using the compiler as the driver),
but that is a yak-shave+bikeshed (I typed out yakshed without
thinking; maybe a new entry for Linux kernel urban dictionary or The
Jargon File) for another day.

$ grep -nR --include="Makefile" '(AS)' .
Turned up only this change and the above referenced wan driver.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>


>
> You can still pass in AS=clang, which is just a switch to turn on
> the LLVM integrated assembler.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 16d8271192d1..339e8c51a10b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -405,7 +405,6 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>  KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>
>  # Make variables (CC, etc...)
> -AS             = $(CROSS_COMPILE)as
>  LD             = $(CROSS_COMPILE)ld
>  CC             = $(CROSS_COMPILE)gcc
>  CPP            = $(CC) -E
> @@ -472,7 +471,7 @@ KBUILD_LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>  CLANG_FLAGS :=
>
> -export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
> +export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
> --

-- 
Thanks,
~Nick Desaulniers
