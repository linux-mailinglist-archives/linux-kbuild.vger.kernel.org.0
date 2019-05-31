Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8858311E6
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 May 2019 18:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfEaQDe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 May 2019 12:03:34 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61157 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfEaQDe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 May 2019 12:03:34 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x4VG3EhX028961;
        Sat, 1 Jun 2019 01:03:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x4VG3EhX028961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559318595;
        bh=kJBHRLcXvbaLbs7VdY0urin0KXZb9MB5irbTDQDFLsM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j1vS3Fo2SbSSGk5hgSGlnZE18MPfhXToy+JQX6djnAMb6PqS6sC4G7WD9736s6PKJ
         10F7vqeJS79+DJ3knYjdpChTvE8N3V/W8R2ucksMjuF+TaC4SdSt0kZLnju2TAE0bC
         6iPMC/O0QIKHMtdipBy3dEZE3I/P7kGA5MVv93o33/CfeKA+8yXp0HFEFXAKCC5eFU
         jaSJ8AyNJ2yXiV5udyXAMvodL0Mlig+DC4VoI8tNbFgtrWvZZ6Lf0w7HZVzD/qxmeh
         DxonV1qKs//TvOYzk/X7inuTOqsRnVlloS6Slk5lzFmX4lIxctELld9i11NGF6Jx5N
         MCtiwYF/17xZg==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id n7so4011412uap.12;
        Fri, 31 May 2019 09:03:14 -0700 (PDT)
X-Gm-Message-State: APjAAAW8/oxIZn50opiYrHKzyAXy6B7j9nznEs0VRvCjdIIMXaxD0MCL
        UvgN+Izb5Jgdy8Xa85vGVZ14f/0FvSXBxDfwUvI=
X-Google-Smtp-Source: APXvYqwHQqFZ9e5//lG3X8WUAgLmWN6ZzV4dNJBRrUjKgJtyQq6oBEdOAFsk02L/Yu/qZJbj3cpHf8ZTPT/71l3++hs=
X-Received: by 2002:a9f:3381:: with SMTP id p1mr5953024uab.40.1559318593421;
 Fri, 31 May 2019 09:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
In-Reply-To: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 1 Jun 2019 01:02:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
Message-ID: <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
Subject: Re: [RFC][PATCH] Makefile: Fix checkstack.pl arm64 wrong or unknown architecture
To:     "George G. Davis" <george_davis@mentor.com>
Cc:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 1, 2019 at 12:27 AM George G. Davis <george_davis@mentor.com> wrote:
>
> The following error occurs for the `make ARCH=arm64 checkstack` case:
>
> aarch64-linux-gnu-objdump -d vmlinux $(find . -name '*.ko') | \
> perl ./scripts/checkstack.pl arm64
> wrong or unknown architecture "arm64"
>
> Fix the above error by setting `CHECKSTACK_ARCH := aarch64` for the
> ARCH=arm64 case.
>
> Signed-off-by: George G. Davis <george_davis@mentor.com>


Why don't you fix scripts/checkstack.pl ?



> ---
>  Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 11358153d8f2..3e615e8553c0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1695,7 +1695,11 @@ PHONY += checkstack kernelrelease kernelversion image_name
>  ifeq ($(ARCH), um)
>  CHECKSTACK_ARCH := $(SUBARCH)
>  else
> -CHECKSTACK_ARCH := $(ARCH)
> +       ifeq ($(ARCH), arm64)
> +               CHECKSTACK_ARCH := aarch64
> +       else
> +               CHECKSTACK_ARCH := $(ARCH)
> +       endif
>  endif
>  checkstack:
>         $(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
