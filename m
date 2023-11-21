Return-Path: <linux-kbuild+bounces-100-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191117F33E5
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 17:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49FFF1C21C6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 16:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9643A4A9B6;
	Tue, 21 Nov 2023 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVzqhREw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F85B1E3
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 16:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BE0C433C9;
	Tue, 21 Nov 2023 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700584620;
	bh=90jfxCqzjOBfBN+wpF26ZcGIh+zvRIz7KOwb6AcEbkk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iVzqhREwZPIcasf4XWCszbWXVJDs8LY4hHhilR3fXsLsLZ0fWJO8k79KzCMyvIAHc
	 cI9iZJ6+O3USDAdAEySFLBOIGlPKhLyEfs5kcbxlI+q3rqwyMe5Lb8+o/PlXDLIxl6
	 hNSiRmvHgkf0kF/IEkDRbd75UxggTeohYIWmVIRZgWBIwn93RbxYyF2z1XWnpRCXLT
	 tonxPq2JKNQXTjqwMNjeM5WStrTT5BBRHWQbTnksnXwHo0RY3qzYRKwZAIaSfz3VQt
	 TWoT+JXq214C2oceKyGPUdwHTttVbpymo6shPUg7QEi8xgsTchxPjIdGyjndD6S3sP
	 BXoT63PqgDZKA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c87903d314so37198141fa.1;
        Tue, 21 Nov 2023 08:37:00 -0800 (PST)
X-Gm-Message-State: AOJu0YwL/e42V4jat+s3ntVFguTqGks3+xN+D3VTPnef2YvgQ5cw40Ut
	W252xORdcIIhjarZZckwjFiSZmgkf/KXFoYGN7Y=
X-Google-Smtp-Source: AGHT+IHNYCwF3uqqI4dsPxCI3mpJ+DNt7kg6IHqCmH3GN1kM9w/qG4RkuMgpCd8A0ebUCzePmaiJMAeizaskFjJhi3Q=
X-Received: by 2002:a2e:b4b4:0:b0:2c5:6e01:58b8 with SMTP id
 q20-20020a2eb4b4000000b002c56e0158b8mr6668049ljm.37.1700584619083; Tue, 21
 Nov 2023 08:36:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231119100024.2370992-1-masahiroy@kernel.org>
In-Reply-To: <20231119100024.2370992-1-masahiroy@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Nov 2023 11:36:48 -0500
X-Gmail-Original-Message-ID: <CAMj1kXF5Vm+Br68qk3rxgtsUxTknz2stfBTpruwQ3diVQrAc3Q@mail.gmail.com>
Message-ID: <CAMj1kXF5Vm+Br68qk3rxgtsUxTknz2stfBTpruwQ3diVQrAc3Q@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add dependency among Image(.gz), loader(.bin),
 and vmlinuz.efi
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Nov 2023 at 05:00, Masahiro Yamada <masahiroy@kernel.org> wrote:
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
>   $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     GZIP    arch/riscv/boot/Image.gz
>     AS      arch/riscv/boot/loader.o
>     AS      arch/riscv/boot/loader.o
>     Kernel: arch/riscv/boot/Image is ready
>     PAD     arch/riscv/boot/vmlinux.bin
>     GZIP    arch/riscv/boot/vmlinuz
>     Kernel: arch/riscv/boot/loader is ready
>     OBJCOPY arch/riscv/boot/loader.bin
>     Kernel: arch/riscv/boot/loader.bin is ready
>     Kernel: arch/riscv/boot/Image.gz is ready
>     OBJCOPY arch/riscv/boot/vmlinuz.o
>     LD      arch/riscv/boot/vmlinuz.efi.elf
>     OBJCOPY arch/riscv/boot/vmlinuz.efi
>     Kernel: arch/riscv/boot/vmlinuz.efi is ready
>
> The log "OBJCOPY arch/riscv/boot/Image" is displayed 5 times.
> (also "AS      arch/riscv/boot/loader.o" twice.)
>
> It indicates that 5 threads simultaneously enter arch/riscv/boot/
> and write to arch/riscv/boot/Image.
>
> It occasionally leads to a build failure:
>
>   $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     PAD     arch/riscv/boot/vmlinux.bin
>   truncate: Invalid number: 'arch/riscv/boot/vmlinux.bin'
>   make[2]: *** [drivers/firmware/efi/libstub/Makefile.zboot:13: arch/riscv/boot/vmlinux.bin] Error 1
>   make[2]: *** Deleting file 'arch/riscv/boot/vmlinux.bin'
>   make[1]: *** [arch/riscv/Makefile:167: vmlinuz.efi] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>     Kernel: arch/riscv/boot/Image is ready
>     GZIP    arch/riscv/boot/Image.gz
>     AS      arch/riscv/boot/loader.o
>     AS      arch/riscv/boot/loader.o
>     Kernel: arch/riscv/boot/loader is ready
>     OBJCOPY arch/riscv/boot/loader.bin
>     Kernel: arch/riscv/boot/loader.bin is ready
>     Kernel: arch/riscv/boot/Image.gz is ready
>   make: *** [Makefile:234: __sub-make] Error 2
>
> Image.gz, loader, vmlinuz.efi depend on Image. loader.bin depends
> on loader. Such dependencies are not specified in arch/riscv/Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Fix commit log
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 5cbe596345c1..1d6ed27e0a2a 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -163,6 +163,8 @@ BOOT_TARGETS := Image Image.gz loader loader.bin xipImage vmlinuz.efi
>
>  all:   $(notdir $(KBUILD_IMAGE))
>
> +loader.bin: loader
> +Image.gz loader vmlinuz.efi: Image
>  $(BOOT_TARGETS): vmlinux
>         $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
>         @$(kecho) '  Kernel: $(boot)/$@ is ready'
> --
> 2.40.1
>

