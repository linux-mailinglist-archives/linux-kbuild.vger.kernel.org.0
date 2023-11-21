Return-Path: <linux-kbuild+bounces-99-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD57F33DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 17:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC6E4B21D6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 16:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4567D56779;
	Tue, 21 Nov 2023 16:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/cCR2Wv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACC95A0FA
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 16:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABB6C433D9;
	Tue, 21 Nov 2023 16:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700584542;
	bh=jwL03/K8YeD2jnmP6ZZpSn8RsDsIl0wx5YcIiq9/kBQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o/cCR2Wv6DY8Q+Bq6b9PspN6JJ6/f7prp3yUBZOtiHiXJwBMlDEuzSHhKtYDyBqKR
	 B6lI7NvWbuGrp9IkvZyyxBhUPSFiBBMmB/DP+USJlYXzgttwAT79LmGoRkQOV4x+TN
	 f+1xE+VybJXRn5emR0dxJ/Sd+/IIbtGkkpHl70ZqyG1phOpYpc4+cPPArKAcf4yXd2
	 /RDjpY2RTiB43vFpasMZTahEeO+kRCRFASFkLnk3KQbAjWxrZhhXDjpJgvrO2IShAs
	 bD/14zR8yPcHnRQvqswOlMWhBznjFkkwpe2IaCNHAa9gl/Yjzx6ifbi4+HQlIQS/FP
	 JYV33mT6VfSsw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c876e44157so38606381fa.2;
        Tue, 21 Nov 2023 08:35:42 -0800 (PST)
X-Gm-Message-State: AOJu0YwdkBYuNEbCdUYddPiYJkdD1KbeC1d8+KBhV+AGPnQPUk0ewKJW
	5wOOxS/IptSCSa+sMCQJ/a3iW8+g91WyoW4D8dY=
X-Google-Smtp-Source: AGHT+IGlrwEyOO6nOCeESzD8uRFWLsAZRGejsSPc/DqM8lP/LYqFtG8+7YSFZL0NSNOGK3Kg+q1rURqiPZoakdR47M0=
X-Received: by 2002:a2e:9101:0:b0:2c5:32b:28fa with SMTP id
 m1-20020a2e9101000000b002c5032b28famr9662302ljg.30.1700584540586; Tue, 21 Nov
 2023 08:35:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231119053234.2367621-1-masahiroy@kernel.org>
In-Reply-To: <20231119053234.2367621-1-masahiroy@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Nov 2023 11:35:29 -0500
X-Gmail-Original-Message-ID: <CAMj1kXH4pWRXWpqUCgWrbBQ9JEQX0MXb5s6+DjL5+_jw0YyLVA@mail.gmail.com>
Message-ID: <CAMj1kXH4pWRXWpqUCgWrbBQ9JEQX0MXb5s6+DjL5+_jw0YyLVA@mail.gmail.com>
Subject: Re: [PATCH] arm64: add dependency between vmlinuz.efi and Image
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Nov 2023 at 00:32, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> A common issue in Makefile is a race in parallel building.
>
> You need to be careful to prevent multiple threads from writing to the
> same file simultaneously.
>
> Commit 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
> generate invalid images") addressed such a bad scenario.
>
> A similar symptom occurs with the following command:
>
>   $ make -j$(nproc) ARCH=arm64 Image vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/arm64/boot/Image
>     OBJCOPY arch/arm64/boot/Image
>     AS      arch/arm64/boot/zboot-header.o
>     PAD     arch/arm64/boot/vmlinux.bin
>     GZIP    arch/arm64/boot/vmlinuz
>     OBJCOPY arch/arm64/boot/vmlinuz.o
>     LD      arch/arm64/boot/vmlinuz.efi.elf
>     OBJCOPY arch/arm64/boot/vmlinuz.efi
>
> The log "OBJCOPY arch/arm64/boot/Image" is displayed twice.
>
> It indicates that two threads simultaneously enter arch/arm64/boot/
> and write to arch/arm64/boot/Image.
>
> It occasionally leads to a build failure:
>
>   $ make -j$(nproc) ARCH=arm64 Image vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/arm64/boot/Image
>     PAD     arch/arm64/boot/vmlinux.bin
>   truncate: Invalid number: 'arch/arm64/boot/vmlinux.bin'
>   make[2]: *** [drivers/firmware/efi/libstub/Makefile.zboot:13:
>   arch/arm64/boot/vmlinux.bin] Error 1
>   make[2]: *** Deleting file 'arch/arm64/boot/vmlinux.bin'
>   make[1]: *** [arch/arm64/Makefile:163: vmlinuz.efi] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>   make: *** [Makefile:234: __sub-make] Error 2
>
> vmlinuz.efi depends on Image, but such a dependency is not specified
> in arch/arm64/Makefile.
>

To clarify, this dependency /is/ specified in
arch/arm64/boot/Makefile, which is consumed by explicit make
invocations from arch/arm64/Makefile, and these may end up racing with
each other.


> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>
>  arch/arm64/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 4a1ad3248c2d..47ecc4cff9d2 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -158,7 +158,7 @@ endif
>
>  all:   $(notdir $(KBUILD_IMAGE))
>
> -
> +vmlinuz.efi: Image
>  Image vmlinuz.efi: vmlinux
>         $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
>
> --
> 2.40.1
>

