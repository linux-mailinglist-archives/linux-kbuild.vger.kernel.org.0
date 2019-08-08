Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9A386D5B
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2019 00:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732796AbfHHWmo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 18:42:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44795 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732740AbfHHWmo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 18:42:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id t16so44878318pfe.11
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Aug 2019 15:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JkOjhYqmVRygeXcaYXbju3SjcUYO0g4hzKDTnSbIWT4=;
        b=nRY/jvQRXetG/9nByqwuqatClIzZ271UUVLtfEYmfmw7hv2LPseiGLDBfKH8FpWIxh
         v96LjKjKu827hCnSfKE1htCRcGb6GeJIA9WGgZAIAd391CfMfKNf1FwIaYRvVa1rIYNR
         y77Yjboozq1k2KyPJoX3zU17D6HdmX7GYEdxMnnFe9zd+pc2iv9IeJCBWsptPuvXtXjD
         GVMjpTo7AZyfmIhLS/+Ux0aQIq2MON/foq04TJvp6/MY5mPl2IWSegGaPMkD5A9U6PQb
         I/LnU01q1Q0TtPbyj+InjfPeta7mNXa1AnLlViCYiTLkPR8zXRbV0+03IVsPOmqQaZet
         w+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JkOjhYqmVRygeXcaYXbju3SjcUYO0g4hzKDTnSbIWT4=;
        b=JN9q1o3C4l/N3STpvJHGbC5twvH0XmYTjSFMuIRJFGhdPaprORjLdOO+cCcC0QE/hl
         B7DOj0Fiv+l/9lbHmv+E8dQeAmiaxYhy9hiCSiNWxLEVahJQAiAcx0vi4SdZcneUbTtp
         EMEEjV6L2jbathQKM5dyV8ro4I7GbbX+UxPAfDIquDM0q4hP4jdgZm4sdFADpevhtcD9
         y8vYTJqQYCyGY6KYZuW1m2EaIZNQTd5vhfb7sQ/RTXTDKRyQaF9b5rw93YgiYOVylstq
         arvicG6pfP4xLZ2awNpZLdpqO72PCk7Di7cqmyrmFZdf/ReeC4bYv+7JiFC4BVaRJIEq
         I/RA==
X-Gm-Message-State: APjAAAUZ98CJ5o830BzO9yVVo+zoISq8iZGg+kF4cIj5VPd2UwmKbpLK
        oWcubH0HQeJxetzJRzOWDQPc+oj62ZlL4g4keuaIdw==
X-Google-Smtp-Source: APXvYqxyxXzGl9xPIKwaKJF8yfeBQ6tkkU80cdkKhPxogNfm1eE8Gn7Zx7xBcLzKbru92V6EXAWH+d9JY3f1UB2g1gw=
X-Received: by 2002:aa7:8085:: with SMTP id v5mr729148pff.165.1565304163344;
 Thu, 08 Aug 2019 15:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565297255.git.guillaume.tucker@collabora.com> <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
In-Reply-To: <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 8 Aug 2019 15:42:32 -0700
Message-ID: <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the environment
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mark Brown <broonie@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 8, 2019 at 2:07 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Only use gcc/g++ for HOSTCC, HOSTCXX and CC by default if they are not
> already defined in the environment.  This fixes cases such as building
> host tools with clang without having gcc installed.
>
> The issue was initially hit when running merge_config.sh with clang
> only as it failed to build "HOSTCC scripts/basic/fixdep".

Thanks for the patch.  I don't quite follow the exact error.

When building with Clang, I usually do:

$ make CC=clang HOSTCC=clang ...

are you trying to fix the case where you do:

$ make CC=clang ...
<no HOSTCC set>
when GCC is not installed?  Because if so, I think it would be easier
to just specify HOSTCC=clang, but maybe I'm misunderstanding the
issue?

>
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> ---
>  Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 23cdf1f41364..c8608126750d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -400,8 +400,8 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
>  HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
>  HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
>
> -HOSTCC       = gcc
> -HOSTCXX      = g++
> +HOSTCC      ?= gcc
> +HOSTCXX     ?= g++
>  KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
>                 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS) \
>                 $(HOSTCFLAGS)
> @@ -412,7 +412,7 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>  # Make variables (CC, etc...)
>  AS             = $(CROSS_COMPILE)as
>  LD             = $(CROSS_COMPILE)ld
> -CC             = $(CROSS_COMPILE)gcc
> +CC            ?= $(CROSS_COMPILE)gcc
>  CPP            = $(CC) -E
>  AR             = $(CROSS_COMPILE)ar
>  NM             = $(CROSS_COMPILE)nm
> --
> 2.20.1
>


-- 
Thanks,
~Nick Desaulniers
