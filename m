Return-Path: <linux-kbuild+bounces-171-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5187F930C
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Nov 2023 15:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EA1A1F20EFF
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Nov 2023 14:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DC1D2F6;
	Sun, 26 Nov 2023 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSa3oRND"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A380D283
	for <linux-kbuild@vger.kernel.org>; Sun, 26 Nov 2023 14:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9FFC433C7;
	Sun, 26 Nov 2023 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701008415;
	bh=5HL7Cy5319r95tB2zVJxxM8nekMUKbOq+0WJf7ZzUxc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MSa3oRNDO3TDXTJK+fHM5zcoF0/IrcStXg4R3Z63zkh6hoh2JUdjFoyDVDhtuxNTJ
	 9Gy7UEiY2TS8TeajmkmhFxFjWHzZodXKwh5jjCX4CTQVCvfSjbVi9UrNeNmiAeY72A
	 lKAQd/i/8LBittoCyGOG3ngaIB5GVbCWX6EuInQI31tWaqYK0/4tFvdGOyQnaOkK/H
	 AqnBrqvas3YCkWlwgp1AQ+qouCFFwQk9BuX8QAN8AoaTT6pf0xBI90vSrTWwKIfin3
	 Q6Ith7c6d/z2RG1srlOzDGDMgQnFHIrdiI6uTKoBjH60QRAigyXfFCeuCHpaLQGrGi
	 2A4DJEizHg7MQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-507a3b8b113so4453390e87.0;
        Sun, 26 Nov 2023 06:20:15 -0800 (PST)
X-Gm-Message-State: AOJu0YxxVPZxI6Dz8o8bWNdVCddc4wY7tlFvDN9QO3i3T/MAaxkSWAGe
	Hjv8ugP+jX3Fs6gC6bQzVTe1D47oW7jQ0X6wixM=
X-Google-Smtp-Source: AGHT+IGMPnMHJifpP9OnzUJx3ixD5EYSC3TeGDlHLFsAK5HSLZdh/LlekFARTL1mu8S/HW3qFUrD1/7bfsF2FrOpAK4=
X-Received: by 2002:ac2:4210:0:b0:50a:9fb9:91b with SMTP id
 y16-20020ac24210000000b0050a9fb9091bmr5011131lfh.64.1701008413926; Sun, 26
 Nov 2023 06:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124035534.70432-1-wangrui@loongson.cn>
In-Reply-To: <20231124035534.70432-1-wangrui@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 26 Nov 2023 22:20:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H72pcXHQi-o71Ct7v+A1BSfNRTSzLrE9KMeS1dwd9KNnw@mail.gmail.com>
Message-ID: <CAAhV-H72pcXHQi-o71Ct7v+A1BSfNRTSzLrE9KMeS1dwd9KNnw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Apply dynamic relocations for LLD
To: WANG Rui <wangrui@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Xi Ruoyao <xry111@xry111.site>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued for loongarch-fixes, thanks.

Huacai

On Fri, Nov 24, 2023 at 11:56=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wro=
te:
>
> For the following assembly code:
>
>      .text
>      .global func
>  func:
>      nop
>
>      .data
>  var:
>      .dword func
>
> When linked with `-pie`, GNU LD populates the `var` variable with the
> pre-relocated value of `func`. However, LLVM LLD does not exhibit the
> same behavior. This issue also arises with the `kernel_entry` in
> arch/loongarch/kernel/head.S:
>
>  _head:
>      .word   MZ_MAGIC                /* "MZ", MS-DOS header */
>      .org    0x8
>      .dword  kernel_entry            /* Kernel entry point */
>
> The correct kernel entry from the MS-DOS header is crucial for jumping
> to vmlinux from zboot. This necessity is why the compressed kernel
> compiled by Clang encounters difficulties in booting.
>
> To address this problem, it is proposed to apply dynamic relocations to
> place with `--apply-dynamic-relocs`.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1962
> Signed-off-by: WANG Rui <wangrui@loongson.cn>
> ---
>  arch/loongarch/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 1f0d74403419..05ab85118212 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -83,7 +83,7 @@ endif
>
>  ifeq ($(CONFIG_RELOCATABLE),y)
>  KBUILD_CFLAGS_KERNEL           +=3D -fPIE
> -LDFLAGS_vmlinux                        +=3D -static -pie --no-dynamic-li=
nker -z notext
> +LDFLAGS_vmlinux                        +=3D -static -pie --no-dynamic-li=
nker -z notext $(call ld-option, --apply-dynamic-relocs)
>  endif
>
>  cflags-y +=3D $(call cc-option, -mno-check-zero-division)
> --
> 2.43.0
>
>

