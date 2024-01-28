Return-Path: <linux-kbuild+bounces-698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943083F586
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 13:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00099281F27
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 12:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4641E884;
	Sun, 28 Jan 2024 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMwlP2Dg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572FE22087
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706445665; cv=none; b=BGhO3rvy0PTqWEWlnelFKNLqzLYfbXHsfOpzbEgi7ptnf7r+ta7BxL2SbmjEWwL3UyxAH5qmK+ZNGPyVO6hG1vUgHBnF2GYl3/X0FaGUo908yTzXUp0t/uw0Vm/pZudDaC6O5HaqCkQ++kGkEYi6uZvlnn4zwxQRAWB2v/0bD10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706445665; c=relaxed/simple;
	bh=h9bnLmsROwGej0ZcCQLs7g0Ckcpad6tjcXuZL40Rswc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0lv9/GrkPCIiQ7Ab4V8G/JBtgPpx3wy1xEhV/z0QcG6xehWI74+b6R8GWGu5zk6NNdmBSOP747AvusPn3Lo6VkXvDUNWHmaI3VuryTZ8mbG6Sr7pBI2m1HVG57qqZMFSDmEmJRBObi2L/+BiJsJzB00R0ISf8LG3s01/QUONoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMwlP2Dg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F1BC43394
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 12:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706445664;
	bh=h9bnLmsROwGej0ZcCQLs7g0Ckcpad6tjcXuZL40Rswc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lMwlP2Dg8hFQ8bguXymjAa00xSqBhL6iAjf5K0unjfAOnnOvdhAw7pWKkGCUqNCZe
	 wJy/ge4B1LKztYvwjoZsVxY+i6OWFTNz2Ug9/xuIkA5kngGPC4xbUirvwDqqbG5SK8
	 ncLrMWe4LaAYbGn2oYkhCooass3yYgbwc8DZ4xuJ4mkWckbfSJSzmpq2CoC6WCVfUE
	 QES7sB/5Px1jdXauFZE+sGWFUCFPIK6IR6VQU4+47+lXnlvHTQ76EeiKrLDgOJDKKP
	 jAY/g9nIyeVvx8Ieh6wvkF1ll2OFyINNJTutIf7Yw7e0ZbiS6R86xOqSf9VugCFNtd
	 Yp4xfFTPaCp9g==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-210e5a5fa70so867304fac.0
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 04:41:04 -0800 (PST)
X-Gm-Message-State: AOJu0YzSQqh8v/xKQfm06FSpqEu+ky0hBpjoTjgkF7HopqHlwNmJy5dq
	Q/6TUfgaWx0zSkKAQW8SNZ3eYv/BlAKJtP/2Rd4PsWcN1B6hffRewuqCmlYPyxOn4lQvKFnfuhB
	Ejql7j3Div2IRwUwp9eHVnvyi2N8=
X-Google-Smtp-Source: AGHT+IHgR5z8C+UR72Aeisx/aNbYz7Mj18+nTShC1PIZkRYm/f8/Y7QqPjSah1U3LUtKSleKXubPBtav0n89HyY4Nn4=
X-Received: by 2002:a05:6870:e412:b0:214:844d:9fab with SMTP id
 n18-20020a056870e41200b00214844d9fabmr2054163oag.3.1706445663961; Sun, 28 Jan
 2024 04:41:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG+Z0CttsBe0_OoPeU3bVh9dg9DN_cUwcX2oC0Mj2uNxurehWA@mail.gmail.com>
In-Reply-To: <CAG+Z0CttsBe0_OoPeU3bVh9dg9DN_cUwcX2oC0Mj2uNxurehWA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jan 2024 21:40:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS6LjtEieXq-+eY0HKjdK5dviO+w6Pu2Be4wCf1=W+0eg@mail.gmail.com>
Message-ID: <CAK7LNAS6LjtEieXq-+eY0HKjdK5dviO+w6Pu2Be4wCf1=W+0eg@mail.gmail.com>
Subject: Re: kbuild: Port build system to the future versions of gnu make.
To: Dmitry Goncharov <dgoncharov@users.sf.net>
Cc: linux-kbuild@vger.kernel.org, 
	Martin Dorey <martin.dorey@hitachivantara.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 7:14=E2=80=AFAM Dmitry Goncharov
<dgoncharov@users.sf.net> wrote:
>
> Port build system to the future (post make-4.4.1) versions of gnu make.
>
> Starting from https://git.savannah.gnu.org/cgit/make.git/commit/?id=3D07f=
cee35f058a876447c8a021f9eb1943f902534
> gnu make won't allow conditionals to follow recipe prefix.
>
> For example there is a tab followed by ifeq on line 324 in the root Makef=
ile.
> With the new make this conditional causes the following
>
> $ make cpu.o
> /home/dgoncharov/src/linux-kbuild/Makefile:2063: *** missing 'endif'.  St=
op.
> make: *** [Makefile:240: __sub-make] Error 2
>
> See https://savannah.gnu.org/bugs/?64185 and
> https://savannah.gnu.org/bugs/?64259 for details.
>
> This patch replaces tabs followed by conditionals with 8 spaces.
> In case the mailer program messes up the tabs and spaces in the diff,
> i enclosed the same patch in the attachment.
>
> Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
> Reported-by: Martin Dorey <martin.dorey@hitachivantara.com>
>
> regards, Dmitry


Thanks. Looks good to me.

But, the commit subject
"kbuild: Port build system to the future versions of gnu make"
is ambiguous.


Can you describe what the patch is changing?

For example,
"kbuild: avoid using tabs followed by conditionals for future gnu make"
or something similar.




>
>
> diff --git a/Makefile b/Makefile
> index 9869f57c3fb3..12dcc51c586a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -294,15 +294,15 @@ may-sync-config    :=3D 1
>  single-build    :=3D
>
>  ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
> -    ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
> +        ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
>          need-config :=3D
> -    endif
> +        endif
>  endif
>
>  ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
> -    ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
> +        ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
>          may-sync-config :=3D
> -    endif
> +        endif
>  endif
>
>  need-compiler :=3D $(may-sync-config)
> @@ -323,9 +323,9 @@ endif
>  # We cannot build single targets and the others at the same time
>  ifneq ($(filter $(single-targets), $(MAKECMDGOALS)),)
>      single-build :=3D 1
> -    ifneq ($(filter-out $(single-targets), $(MAKECMDGOALS)),)
> +        ifneq ($(filter-out $(single-targets), $(MAKECMDGOALS)),)
>          mixed-build :=3D 1
> -    endif
> +        endif
>  endif
>
>  # For "make -j clean all", "make -j mrproper defconfig all", etc.
> diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
> index 43e39040d3ac..76ef1a67c361 100644
> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -15,10 +15,10 @@
>  KBUILD_DEFCONFIG :=3D multi_defconfig
>
>  ifdef cross_compiling
> -    ifeq ($(CROSS_COMPILE),)
> +        ifeq ($(CROSS_COMPILE),)
>          CROSS_COMPILE :=3D $(call cc-cross-prefix, \
>              m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
> -    endif
> +        endif
>  endif
>
>  #
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 920db57b6b4c..7486b3b30594 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -50,12 +50,12 @@ export CROSS32CC
>
>  # Set default cross compiler for kernel build
>  ifdef cross_compiling
> -    ifeq ($(CROSS_COMPILE),)
> +        ifeq ($(CROSS_COMPILE),)
>          CC_SUFFIXES =3D linux linux-gnu unknown-linux-gnu suse-linux
>          CROSS_COMPILE :=3D $(call cc-cross-prefix, \
>              $(foreach a,$(CC_ARCHES), \
>              $(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
> -    endif
> +        endif
>  endif
>
>  ifdef CONFIG_DYNAMIC_FTRACE
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 1a068de12a56..2264db14a25d 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -112,13 +112,13 @@ ifeq ($(CONFIG_X86_32),y)
>          # temporary until string.h is fixed
>          KBUILD_CFLAGS +=3D -ffreestanding
>
> -    ifeq ($(CONFIG_STACKPROTECTOR),y)
> -        ifeq ($(CONFIG_SMP),y)
> +        ifeq ($(CONFIG_STACKPROTECTOR),y)
> +                ifeq ($(CONFIG_SMP),y)
>              KBUILD_CFLAGS +=3D -mstack-protector-guard-reg=3Dfs
> -mstack-protector-guard-symbol=3D__stack_chk_guard
> -        else
> +                else
>              KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dglobal
> -        endif
> -    endif
> +                endif
> +        endif
>  else
>          BITS :=3D 64
>          UTS_MACHINE :=3D x86_64



--=20
Best Regards
Masahiro Yamada

