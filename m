Return-Path: <linux-kbuild+bounces-103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 784C67F38FF
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 23:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35F4E282360
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 22:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50A842054;
	Tue, 21 Nov 2023 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c93VEcJb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE24194
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 14:10:52 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50aab0ca90aso4245440e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 14:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700604650; x=1701209450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bUrfVcVa3Jy5893jk/rq26iu6NlKWecKE/WOuTvkwso=;
        b=c93VEcJbj8ALkjb2camdiWx87HKu8PXqnNxpT8VvLWvcLTzyOMsvRA6ttq/42gj/lc
         KvPzOFfS0mcSdR8yQjtZEYFb9TWrF3pbdhe6mcJ1kKeaUno+qWh/3jzaUXoRkwmK42eq
         vNejBlPPTx2wF873z0Rcj7cKz6eU2aKgXRTxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700604650; x=1701209450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUrfVcVa3Jy5893jk/rq26iu6NlKWecKE/WOuTvkwso=;
        b=NQCm5TAgDonhK1zaYL738H4OxvNE7/PLN8JgY7ec863W5HQGWM3VsNxJXt071Wk7lR
         4dXcqssS2kazLk1JQCdoqv56ECL/OGcJi6qlQPx9x9jvF3mM1TtdkxmJXer5fDWVm1iI
         11M0TsK2eeqUcmm+N1S783FyGgz4uqQjwEemXpY8XH15my/f+Kx5YcK+MWtUF+6jir97
         xxvHQZcUwg7rGPQHjp7iuBRyomiAhVKWxGRhZS8LIKJHSYkseaVad28xlG65IsryJ2UY
         9nHxu6ZAnosPkPL3sJ3+2E9bHCjeDPxJra+R4gdILrfPHdSg3pEh1wMV2EaQuANC0ReU
         WSQA==
X-Gm-Message-State: AOJu0YxlmtIXn7F0TsSecc3o723/olVVQuDzsh+E0YXs31/q5yCrNWsz
	pwUR305oA9cbHhW3JVFpQ+ctB0N10x9W4CTGEHIbSNRSgPW9Jl9NLrc=
X-Google-Smtp-Source: AGHT+IH2p2S3EHk/kjK8/fkaPAR1usnkzeYyJjccYKzDydluwPFiM16Adxhpj8TLMQfDrLQyuU1JUml1BLpSp818Tmg=
X-Received: by 2002:ac2:5e81:0:b0:509:8f57:8e2 with SMTP id
 b1-20020ac25e81000000b005098f5708e2mr89904lfq.29.1700604650301; Tue, 21 Nov
 2023 14:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231119053234.2367621-1-masahiroy@kernel.org>
In-Reply-To: <20231119053234.2367621-1-masahiroy@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Nov 2023 15:10:38 -0700
Message-ID: <CAPnjgZ1w+0jcdR-qHSbhdXHJFA-UNFNFTtB4-6BvxYTyuhyweA@mail.gmail.com>
Subject: Re: [PATCH] arm64: add dependency between vmlinuz.efi and Image
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Nov 2023 at 22:32, Masahiro Yamada <masahiroy@kernel.org> wrote:
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
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/arm64/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: SImon Glass <sjg@chromium.org>

