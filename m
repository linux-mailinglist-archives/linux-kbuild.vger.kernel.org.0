Return-Path: <linux-kbuild+bounces-686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E70C83EE0D
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 16:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81AAD1F22843
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 15:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4CF28E23;
	Sat, 27 Jan 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dl/Ea3iS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C128E02;
	Sat, 27 Jan 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706370436; cv=none; b=LAFntDhplJ2FQKMmjHxeK5v2B3gMAJpI0QDIz/yJiD8ODoC75Ty0/Nf3IABXCreifHGB5If3n/kmFxDD2LA88N94kaIqRthzc1glLcYIFHN4unLpMeOLHVwAlyO2PbAfrTBRDzQ3m5KaTfAaI8Kf3WHQH9VgT7ahzn8zCxcANp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706370436; c=relaxed/simple;
	bh=dt9VvdF/8OYHRRdEUaG9vvg+fTbbx3DPBoW88jakmBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/k7soZHJ3nOC78ygJAFGzq9TW6CGJgqq/mmrtUshM0bJCsC8ccSvbuCncujVGp+GRNBnuMSZaJ4csSjWUcNa0X/h46LM7UvukzmSPyLTdBUmQJ9S98e9GOwl9Oojb9UWQJiOhxdzUqyAg3Q/sSfq7m0OH7vI2LJ0dCkc0VNdJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dl/Ea3iS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25726C43394;
	Sat, 27 Jan 2024 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706370436;
	bh=dt9VvdF/8OYHRRdEUaG9vvg+fTbbx3DPBoW88jakmBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dl/Ea3iS1+YhJy8M1nNHmHwed/H+VotiXjE7HcenWap6W4RqdJ/2uK8u/ZSKqnWnI
	 KaOgrdrso+SaPeYUG1V3Uc7jYMVtDUEYbTHJFhSCbLnIh8kvkRDzuU8gupYjtGBVvf
	 2Cr79+KwfS6fM5MZMWHfj/o/YpeL6087dLKZAvojXPeM1KBoiDx9Fx5jQ9uH4SpeNE
	 qL5The4PQTF7CMILKG/DhmH6MhE9Fi2mqwERzOGOvkXdUfGwfe4mUkXBYxvGSlqBLw
	 If+SXbjbAmctt9ltwEyfJlE3bm1vZcn9ikFUTVGLzSYUUNpvE2f+uIY3hL3UjSJMsA
	 reS/U5gakHTtA==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21433afcc53so684314fac.3;
        Sat, 27 Jan 2024 07:47:16 -0800 (PST)
X-Gm-Message-State: AOJu0YyWVAZPzW5XYvxHKp3XpKKqTAsDlLmhZgPSVt/YxnMHQw/m3+uu
	evenWiqm6F2TgDDrIVhG/mfHfCJGHOsGHfOCqbHf409XIBRBjOg63CTIZscVCZHsc3EOhK3Tyqp
	aNtakWL2k5f7kuXSCtJuBNjb+wKU=
X-Google-Smtp-Source: AGHT+IF9R2Ubn6ti8JRFokgpKc272W4nvEnCWGffmIJjz1OEd2Z6fjYKChcKDBZINF2k4k2UkRATWzEsr08KUIE/iYE=
X-Received: by 2002:a05:6871:609:b0:210:dc9d:5af8 with SMTP id
 w9-20020a056871060900b00210dc9d5af8mr1247515oan.37.1706370435504; Sat, 27 Jan
 2024 07:47:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123-fix-uml-clang-18-v1-0-efc095519cf9@kernel.org> <20240123-fix-uml-clang-18-v1-1-efc095519cf9@kernel.org>
In-Reply-To: <20240123-fix-uml-clang-18-v1-1-efc095519cf9@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jan 2024 00:46:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAToMq=5TT=--i=TaZX_hCNfEJLFSzLBEBAFwKFqvhBQkg@mail.gmail.com>
Message-ID: <CAK7LNAToMq=5TT=--i=TaZX_hCNfEJLFSzLBEBAFwKFqvhBQkg@mail.gmail.com>
Subject: Re: [PATCH 1/2] um: Fix adding '-no-pie' for clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	nicolas@fjasle.eu, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, linux-um@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 8:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> The kernel builds with -fno-PIE, so commit 883354afbc10 ("um: link
> vmlinux with -no-pie") added the compiler linker flag '-no-pie' via
> cc-option because '-no-pie' was only supported in GCC 6.1.0 and newer.
>
> While this works for GCC, this does not work for clang because cc-option
> uses '-c', which stops the pipeline right before linking, so '-no-pie'
> is unconsumed and clang warns, causing cc-option to fail just as it
> would if the option was entirely unsupported:
>
>   $ clang -Werror -no-pie -c -o /dev/null-x c /dev/null


A nit. A missing space in-between.


I fixed "/dev/null-x" to "/dev/null -x"
when I applied the patch.






>   clang-16: error: argument unused during compilation: '-no-pie' [-Werror=
,-Wunused-command-line-argument]
>
> A recent version of clang exposes this because it generates a relocation
> under '-mcmodel=3Dlarge' that is not supported in PIE mode:
>
>   /usr/sbin/ld: init/main.o: relocation R_X86_64_32 against symbol `saved=
_command_line' can not be used when making a PIE object; recompile with -fP=
IE
>   /usr/sbin/ld: failed to set dynamic section sizes: bad value
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>
> Remove the cc-option check altogether. It is wasteful to invoke the
> compiler to check for '-no-pie' because only one supported compiler
> version does not support it, GCC 5.x (as it is supported with the
> minimum version of clang and GCC 6.1.0+). Use a combination of the
> gcc-min-version macro and CONFIG_CC_IS_CLANG to unconditionally add
> '-no-pie' with CONFIG_LD_SCRIPT_DYN=3Dy, so that it is enabled with all
> compilers that support this. Furthermore, using gcc-min-version can help
> turn this back into
>
>   LINK-$(CONFIG_LD_SCRIPT_DYN) +=3D -no-pie
>
> when the minimum version of GCC is bumped past 6.1.0.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1982
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/um/Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index 82f05f250634..34957dcb88b9 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -115,7 +115,9 @@ archprepare:
>         $(Q)$(MAKE) $(build)=3D$(HOST_DIR)/um include/generated/user_cons=
tants.h
>
>  LINK-$(CONFIG_LD_SCRIPT_STATIC) +=3D -static
> -LINK-$(CONFIG_LD_SCRIPT_DYN) +=3D $(call cc-option, -no-pie)
> +ifdef CONFIG_LD_SCRIPT_DYN
> +LINK-$(call gcc-min-version, 60100)$(CONFIG_CC_IS_CLANG) +=3D -no-pie
> +endif
>  LINK-$(CONFIG_LD_SCRIPT_DYN_RPATH) +=3D -Wl,-rpath,/lib
>
>  CFLAGS_NO_HARDENING :=3D $(call cc-option, -fno-PIC,) $(call cc-option, =
-fno-pic,) \
>
> --
> 2.43.0
>


--
Best Regards
Masahiro Yamada

