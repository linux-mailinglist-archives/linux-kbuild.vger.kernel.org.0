Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 514CF1601AD
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2020 05:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgBPEqy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 15 Feb 2020 23:46:54 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:42736 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgBPEqy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Feb 2020 23:46:54 -0500
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01G4knUL018848;
        Sun, 16 Feb 2020 13:46:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01G4knUL018848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581828410;
        bh=kRDtLlY/sMJu/K4srmxboOx3IqTLY+xR78bIUykXjLE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KxDBp5N+FL3ryREMNWh/kC/WEIPSOjGnWsw8xE5DqYJYm/K+KuoAuycSwv59Ov+LX
         q6qXypmIoU14tfcczuA+3VGbNP7daCHYwLx7/wTuY+OFfEKvyiQoeIBJS3dtc4h4V5
         koIvsXNcZ4mgEdEk6HHlIHdFtgsmYaSzZZsROHnL5wviWdbRlmhNWgWd/90Tfi+3ws
         03URtjD0FFe0x2pculeWmv/jECotLzXiCYRM9lkY/2A8kn1bai2Jbm1yW6QVuWkUnP
         SlP4p8R1pKTrMrreqy19bpjl1Tmu6KDx4SHFfl4ikcHegmh2OqpUZwv1CwGAiI8Axa
         aoHjuhND/bDxQ==
X-Nifty-SrcIP: [209.85.221.175]
Received: by mail-vk1-f175.google.com with SMTP id w4so3691431vkd.5;
        Sat, 15 Feb 2020 20:46:50 -0800 (PST)
X-Gm-Message-State: APjAAAXPUu5vjDJOY+e3qc099lEvASJCtFYy7meqXTh55SzlIlvwds0v
        1yhOmnCTudYfmL/1oQRM87op/rjbmQb/CHca16A=
X-Google-Smtp-Source: APXvYqw5njGV6lWi5rpITygFBQYX4hxKkyR82xkrXYNmCx92gIkgxqTDj11EB1ki+KarqeP6mV9EoIUZp5EpjS6aDfQ=
X-Received: by 2002:a1f:bfc2:: with SMTP id p185mr2951268vkf.73.1581828408908;
 Sat, 15 Feb 2020 20:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20200201062459.7150-1-changbin.du@gmail.com> <20200201062459.7150-2-changbin.du@gmail.com>
In-Reply-To: <20200201062459.7150-2-changbin.du@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 16 Feb 2020 13:46:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNATvWpic8r6J6eUnKtLYMnF3bhKA17x9DNYwSK66me9LtA@mail.gmail.com>
Message-ID: <CAK7LNATvWpic8r6J6eUnKtLYMnF3bhKA17x9DNYwSK66me9LtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] sanitize: Add SANITIZE_xx.o and SANITIZE to disable
 all sanitizers for specific files
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Changbin,

On Sat, Feb 1, 2020 at 3:25 PM Changbin Du <changbin.du@gmail.com> wrote:
>
> This patch add two new flags to disable all sanitizers (UBSAN and KASAN):
>   o SANITIZE_xx.o - disable all sanitizers for a single file.
>   o SANITIZE - disable all sanitizers for current directory.
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  Documentation/dev-tools/kasan.rst | 12 ++++++++++++
>  scripts/Makefile.lib              |  4 ++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index e4d66e7c50de..f59fc5fb2cd8 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -55,6 +55,18 @@ similar to the following to the respective kernel Makefile:
>
>      KASAN_SANITIZE := n
>
> +Similarly, to disable all sanitizers (KASAN, UBSAN) for specific files or
> +directories, add a line similar to the following to the respective kernel
> +Makefile:
> +
> +- For a single file (e.g. main.o)::
> +
> +    SANITIZE_main.o := n
> +
> +- For all files in one directory::
> +
> +    SANITIZE := n
> +
>  Error reports
>  ~~~~~~~~~~~~~
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 3fa32f83b2d7..9b7d784e3252 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -122,13 +122,13 @@ endif
>  #
>  ifeq ($(CONFIG_KASAN),y)
>  _c_flags += $(if $(patsubst n%,, \
> -               $(KASAN_SANITIZE_$(basetarget).o)$(KASAN_SANITIZE)y), \
> +               $(SANITIZE_$(basetarget).o)$(SANITIZE)$(KASAN_SANITIZE_$(basetarget).o)$(KASAN_SANITIZE)y), \


I think this would be very unlikely to happen, but
if both SANITIZE and KASAN_SANITIZE existed,
KASAN_SANITIZE should take precedence over SANITIZE, maybe?


Perhaps, like this?

$(KASAN_SANITIZE_$(basetarget).o)$(SANITIZE_$(basetarget).o)$(KASAN_SANITIZE)$(SANITIZE)y



>                 $(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
>  endif
>
>  ifeq ($(CONFIG_UBSAN),y)
>  _c_flags += $(if $(patsubst n%,, \
> -               $(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)$(CONFIG_UBSAN_SANITIZE_ALL)), \
> +               $(SANITIZE_$(basetarget).o)$(SANITIZE)$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)$(CONFIG_UBSAN_SANITIZE_ALL)), \
>                 $(CFLAGS_UBSAN))
>  endif
>
> --
> 2.24.0
>


-- 
Best Regards
Masahiro Yamada
