Return-Path: <linux-kbuild+bounces-70-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 998E07F0609
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 12:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 158811F21BF8
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 11:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19978498;
	Sun, 19 Nov 2023 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNFulk5i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497BDDAF
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 11:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E990C433C9;
	Sun, 19 Nov 2023 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700395165;
	bh=mgjBe9NyXgnGxQbQgYIlmqSGb5CeQDsjaIIrZhyneCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tNFulk5iOsBbkFYne6Kojs1mmSNu569//aRQSIzuF+M3mgugaM/aTwyHMoLFWS7M8
	 9yttTyEgVqKYN8RewwjlKLcrjaqsuIhUdXJgNvjH1jnbQ8+apTh1ClYl0i2iJFR0WB
	 IVEdVXt8Fafalt918MqPCO90K0WqZ7fCOEmeGvQcURoWjRK/78XQsI9ZMdG1c0tQhG
	 nxGIJUF9Ui8uKxj3hRDcDv9A50JFJaY4C0cyHtFSC8z77qpqa1DPEHw1NS4q3iElkS
	 uokZM/CP6Flfdj3AgZTPOiTOp0qlp0tl67yCHZRP0keh/c+7kuiUR35fSBk1nqlqE6
	 I6fjSUXYu3gAQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so4943056a12.2;
        Sun, 19 Nov 2023 03:59:25 -0800 (PST)
X-Gm-Message-State: AOJu0YyrF3uHg/GAnaB118EsrMzpJy1XfiK63rnt020wttxki0LPOZm0
	hp5L0wFNirLBH/iOTqy8PrKv8xo6euSm2WLxJtc=
X-Google-Smtp-Source: AGHT+IEOV0Yphn3EZlTrLENL+ZMt4WbgvODyjNv1KG8aL25BNcVStxecpKUo7uDy0Wrni/U59QS+B0+V5d8IPu8T/Ks=
X-Received: by 2002:aa7:d454:0:b0:548:4f58:4c98 with SMTP id
 q20-20020aa7d454000000b005484f584c98mr3457877edr.29.1700395163796; Sun, 19
 Nov 2023 03:59:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231119053448.2367725-1-masahiroy@kernel.org>
In-Reply-To: <20231119053448.2367725-1-masahiroy@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 19 Nov 2023 19:59:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Y4vqc45eaMs+wCN7Quf4e9ogp8aDA8V0sA=TUnMWd-Q@mail.gmail.com>
Message-ID: <CAAhV-H6Y4vqc45eaMs+wCN7Quf4e9ogp8aDA8V0sA=TUnMWd-Q@mail.gmail.com>
Subject: Re: [PATCH] loongarch: add dependency between vmlinuz.efi and vmlinux.efi
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Masahiro,

On Sun, Nov 19, 2023 at 1:35=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
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
>   $ make -j$(nproc) ARCH=3Dloongarch vmlinux.efi vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/loongarch/boot/vmlinux.efi
>     OBJCOPY arch/loongarch/boot/vmlinux.efi
>     PAD     arch/loongarch/boot/vmlinux.bin
>     GZIP    arch/loongarch/boot/vmlinuz
>     OBJCOPY arch/loongarch/boot/vmlinuz.o
>     LD      arch/loongarch/boot/vmlinuz.efi.elf
>     OBJCOPY arch/loongarch/boot/vmlinuz.efi
>
> The log "OBJCOPY arch/loongarch/boot/vmlinux.efi" is displayed twice.
>
> It indicates that two threads simultaneously enter arch/loongarch/boot/
> and write to arch/loongarch/boot/vmlinux.efi.
>
> It occasionally leads to a build failure:
>
>   $ make -j$(nproc) ARCH=3Dloongarch vmlinux.efi vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/loongarch/boot/vmlinux.efi
>     PAD     arch/loongarch/boot/vmlinux.bin
>   truncate: Invalid number: =E2=80=98arch/loongarch/boot/vmlinux.bin=E2=
=80=99
>   make[2]: *** [drivers/firmware/efi/libstub/Makefile.zboot:13:
>   arch/loongarch/boot/vmlinux.bin] Error 1
>   make[2]: *** Deleting file 'arch/loongarch/boot/vmlinux.bin'
>   make[1]: *** [arch/loongarch/Makefile:146: vmlinuz.efi] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>   make: *** [Makefile:234: __sub-make] Error 2
>
> vmlinuz.efi depends on vmlinux.efi, but such a dependency is not
> specified in arch/loongarch/Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/loongarch/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 9eeb0c05f3f4..6022bf3d30c9 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -142,6 +142,7 @@ vdso-install-y +=3D arch/loongarch/vdso/vdso.so.dbg
>
>  all:   $(notdir $(KBUILD_IMAGE))
>
> +vmlinuz.efi: vmlinux.efi
>  vmlinux.elf vmlinux.efi vmlinuz.efi: vmlinux
>         $(Q)$(MAKE) $(build)=3D$(boot) $(bootvars-y) $(boot)/$@
It is a little strange, because

in drivers/firmware/efi/libstub/Makefile.zboot:
vmlinuz.efi depends on vmlinuz.efi.elf, vmlinuz.efi.elf depends on
vmlinuz.o, vmlinuz.o depends on vmlinuz, vmlinuz depends on
vmlinux.bin, vmlinux.bin depends on $(EFI_ZBOOT_PAYLOAD).

in arch/loongarch/boot/Makefile,
EFI_ZBOOT_PAYLOAD :=3D vmlinux.efi

So I think vmlinuz.efi has already depend on vmlinux.efi.

Huacai

>
> --
> 2.40.1
>
>

