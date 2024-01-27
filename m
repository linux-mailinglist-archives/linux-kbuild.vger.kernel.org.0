Return-Path: <linux-kbuild+bounces-687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6A383EE14
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 16:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE8CA1C20A3F
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 15:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F2F28E31;
	Sat, 27 Jan 2024 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/djCDMN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72A28DA7;
	Sat, 27 Jan 2024 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706370602; cv=none; b=mADs2jBh6pbuzyq7uxQAql4R1lXX13M6HVg+nFvBUQC+JvO2QeqFefyaZ7NdgXmyD1zAe5gfCum1Ple2GZeKN2O118vs1DPVFvGIBNMtfVxjLQXvGrSiomnoF0P8ljFIzoRLLeFatQv7rnlAi89qxXZmperGNMf92XerO9lVn2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706370602; c=relaxed/simple;
	bh=xMum1nfS4Zw0xeihyEQn0dWh29rgau+LhppkJ/8YUbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7nVmEuXDmkxwH1kLv5/eha/ZlGJvWw2lyhqnpPX7j2yH07TpcPa/Whgfc5OE6pwO8bdqv4o1y8wkRw57DP4FXtnk7FxcRwWJpFBi7ManHoiJ8cvON92Q9aSIw32iyvF3PoSZG4WZLgWTWlXkKmPSUTg9csL0GOPdvLV+Wgf7b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/djCDMN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0C2C43394;
	Sat, 27 Jan 2024 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706370602;
	bh=xMum1nfS4Zw0xeihyEQn0dWh29rgau+LhppkJ/8YUbY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d/djCDMNQTvN99njEZJfMV+GQJck3sqJIB5bHMhAmH04k+W+AV3NKVZ0UBUg16qtf
	 9i3EmWQWwr4Oza332PQLzoAWfA671swctuiq+SVz58JOZ+6sjpWr1UMRVorjnt8t1z
	 eELiPvi7w9PXHRjwiKU0ddy5c9TOn8fiWCS/f9a4IRufWhRNZZfN//05APyRUP8wa4
	 vDkXHdnA0X05xIDcPgGU6lehHN3HK+rVADqF9NaKj1vshWO1vf8zat+JYMnmkgtUOP
	 TonIhpn4i0KsR7JaUZq93JUBkgQNze5haPFDtkdbCWkf125m6TlSqQzERpUft5MmcF
	 Z5oDLHuBsNyOQ==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21533959f03so861259fac.0;
        Sat, 27 Jan 2024 07:50:02 -0800 (PST)
X-Gm-Message-State: AOJu0YwVGIk4rbptFpk2NYwPPchAz0cI8lVDFVp0CdmUXdiAF1yeFbcb
	zm1cow2doCntkbiFbZH46Q6ORDu47dkwmLdIL1U+4hlIkGUG9Sn7lqGcIrz0gwfVMfDFHhed2vM
	P9T9M6PfAtCIps/SdycyiAKU8b0M=
X-Google-Smtp-Source: AGHT+IFDy5SBpxGVQFs+UrOt0sr31INoe6WBxhB+4rEP6q675XfByIgB8DlqySVkP1CSlylWjc+vunEaHrVRYvYBUow=
X-Received: by 2002:a05:6870:d208:b0:206:8e1b:3948 with SMTP id
 g8-20020a056870d20800b002068e1b3948mr1044837oac.25.1706370601678; Sat, 27 Jan
 2024 07:50:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123-fix-uml-clang-18-v1-0-efc095519cf9@kernel.org> <20240123-fix-uml-clang-18-v1-2-efc095519cf9@kernel.org>
In-Reply-To: <20240123-fix-uml-clang-18-v1-2-efc095519cf9@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jan 2024 00:49:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWAXwcHtzsW1vex6kuL7Jf+M2HiBhTGhHYfKnAoMqvPA@mail.gmail.com>
Message-ID: <CAK7LNASWAXwcHtzsW1vex6kuL7Jf+M2HiBhTGhHYfKnAoMqvPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
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
> After the linked LLVM change, building ARCH=3Dum defconfig results in a
> segmentation fault in modpost.

Yeah, this is a mistake in my commits.
The NULL pointer access should be fixed, but that is a separate issue.

Anyway, I applied this patch.



> Prior to commit a23e7584ecf3 ("modpost:
> unify 'sym' and 'to' in default_mismatch_handler()"), there was a
> warning:
>
>   WARNING: modpost: vmlinux.o(__ex_table+0x88): Section mismatch in refer=
ence to the .ltext:(unknown)
>   WARNING: modpost: The relocation at __ex_table+0x88 references
>   section ".ltext" which is not in the list of
>   authorized sections.  If you're adding a new section
>   and/or if this reference is valid, add ".ltext" to the
>   list of authorized sections to jump to on fault.
>   This can be achieved by adding ".ltext" to
>   OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.
>
> The linked LLVM change moves global objects to the '.ltext' (and
> '.ltext.*' with '-ffunction-sections') sections with '-mcmodel=3Dlarge',
> which ARCH=3Dum uses. These sections should be handled just as '.text'
> and '.text.*' are, so add them to TEXT_SECTIONS.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1981
> Link: https://github.com/llvm/llvm-project/commit/4bf8a688956a759b7b6b8d9=
4f42d25c13c7af130
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/mod/modpost.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index cb6406f485a9..f7c4d3fe4381 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -807,7 +807,8 @@ static void check_section(const char *modname, struct=
 elf_info *elf,
>
>  #define DATA_SECTIONS ".data", ".data.rel"
>  #define TEXT_SECTIONS ".text", ".text.*", ".sched.text", \
> -               ".kprobes.text", ".cpuidle.text", ".noinstr.text"
> +               ".kprobes.text", ".cpuidle.text", ".noinstr.text", \
> +               ".ltext", ".ltext.*"
>  #define OTHER_TEXT_SECTIONS ".ref.text", ".head.text", ".spinlock.text",=
 \
>                 ".fixup", ".entry.text", ".exception.text", \
>                 ".coldtext", ".softirqentry.text"
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

