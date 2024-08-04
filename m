Return-Path: <linux-kbuild+bounces-2805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7A946CC0
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 08:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A992817C0
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 06:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D9CB67E;
	Sun,  4 Aug 2024 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNJSDyxD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B0138C;
	Sun,  4 Aug 2024 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722753387; cv=none; b=d3njg8DGEvWgUEPtEq84HoGle6fmSHmVvtZB+kwzbxws79pCA1XVUHOxMeU6ULESGVVaY/FkEMVBUsjlEtEv679P2+GOSw4A7VTpzjA7snLQku359abc4aBd5eSXkIs/CV1Txrxxp6OBtW0A8mERgCnb1eir4uyBw7EZkmYWW4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722753387; c=relaxed/simple;
	bh=89gmBydwfJuc7hr/nhlC9fJCSPqbNq8SfC+t53x0cIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pax+EWzgK1zfxEqcR+ER6DJ6ovu3u2FZ6kuDBCYZvRSM08aA2ohc6mx/Supa2y70ShSvF4lGdr0KoIvfOXmk4CgkrBth6fvG4XN6wsojtz14XK3Gnuwwzxom+vAraM4qCj7s+2LkeuvuCwY9tRhB54ya5ox8/IAnjYBvgAmvrcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNJSDyxD; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f00ad303aso14170601e87.2;
        Sat, 03 Aug 2024 23:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722753384; x=1723358184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4QGBhAOwbEmRox4+DxjD2M9GpPO+58govDv5LsijUYM=;
        b=lNJSDyxDilIUuODfzBBOnBDgY6OtY2TIrZeTue73UPPqiJ+eMVICeAXcpUP8vwO1u4
         DVmpUrzknE5mcAgyeb8PkIOSS8m/PNJNRTQ0KGrBpm96y8QJtc9TulfDSHECCqk1Li5b
         Qjfjpn6VjCcwcCjByc9lDb2MCbDAZFDEM3cClntyN94qng6yq9RS9oDCDhRFx6E+cBAU
         FAEPimRk8xBGWFDOcNFTgTS+PWRvcDWJITAeZc8gEzuZns+fX93X973UjNehP7+yNc32
         U3IKYWMmWNDMAwk0ZXlG0tNjTaukVoxdIAjKnvS4tYE/DSxF861QYhnoS9vA2Ajag4aR
         gHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722753384; x=1723358184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4QGBhAOwbEmRox4+DxjD2M9GpPO+58govDv5LsijUYM=;
        b=pxCAx1S1c5kl6tU7GalzRZj6dgbR0FeF8HHlawcBUldELlyUTD76xUQy79AGu/tidp
         /Sfta248dvnmMtQzHxjRZQZYcm1BcwCT1cFhvpdypGi01IX+K3i9z3mTxu2FGMDSfkLT
         97+GuKyD8mdPj+DOy/s22OCD9yGUyASecmylB3GenDwmvv17A5QIljFPsIMa0s9N2P3s
         bF4yBgbIPRmcdY8KAXR4DavLrwZXtMteFPwu+GLm7xIHcM/hhP97Pd8Qyh1/ROcmLYun
         pI9um7zU0GkbuQYoXgq1J3b22Z3iS0xGocWBjFYhbU1UtxvQQrjB4stYQOuuWqZQ17BD
         Kuyw==
X-Forwarded-Encrypted: i=1; AJvYcCV2vUkfbxc2bcjCZf8H7hGcmkKaeItWULc3YjsD5wPKJ5yk/Tn4nDNVM5JkkcPfYxLLuCoyFnPgMbFjwu6ukWOtwgDflOAl/+E/kKqa
X-Gm-Message-State: AOJu0Yzd5TxZbm0ne6yLocZGNHzz96Xo/0Pb4/wckZllKP1FBhTXLCG0
	DTwbq0BosAGHTBHmrRVuuEDZmurgbtnkXTXu6vksoxl7FStFaz96gj/H9MUc+crLZsiWAPOUnIk
	kRtgNCuOoXPYtoSVpQKz4mPHCWcE=
X-Google-Smtp-Source: AGHT+IEdfmuv2EkKcxh+7Lb40OP/oG3cP2VSdznWLo4k/BLx+i8b31l/jhv/Zy/qDEODlTKWeZpGsCPEP0qqDy4NbeY=
X-Received: by 2002:a05:6512:138d:b0:52c:e054:4149 with SMTP id
 2adb3069b0e04-530bb397770mr5372629e87.15.1722753383693; Sat, 03 Aug 2024
 23:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240804033309.890181-1-masahiroy@kernel.org>
In-Reply-To: <20240804033309.890181-1-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 4 Aug 2024 08:35:47 +0200
Message-ID: <CA+icZUWpeZF-PGQJLR1tt0u7sFVZ+MANX4hE-DUCEt=PhXGs3w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: modinst: remove the multithread option from zstd compression
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 5:33=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Parallel execution is supported by GNU Make:
>
>   $ make -j<N> modules_install
>
> It is questionable to enable multithreading within each zstd process
> by default.
>
> If you still want to do it, you can use the environment variable:
>
>   $ ZSTD_NBTHREADS=3D<N> make modules_install
>

Hi Masahiro,

I have some understanding problems.

[ start-build.txt ]
dileks     24225   24217  0 17:55 tty2     00:00:00 /usr/bin/perf stat
make V=3D1 -k -j4 ARCH=3Dx86_64 LLVM=3D1 LLVM=3D/opt/llvm/bin/
PAHOLE=3D/opt/pahole/bin/pahole KBUILD_BUILD_HOST=3Diniza
KBUILD_BUILD_USER=3Dsedat.dilek@gmail.com
KBUILD_BUILD_TIMESTAMP=3D2024-08-03
KDEB_PKGVERSION=3D6.10.3-1~trixie+dileks1
LOCALVERSION=3D-1-amd64-clang18-kcfi olddefconfig bindeb-pkg

^^ How shall someone pass so that ... ZSTD_NBTHREADS=3D<N> make
modules_install ... is used?

As far as I understood, each kernel-module file is taken - in the
Debian build-process - sequentially file for file - ZSTD compressed
and afterwards deleted.
Is there a benefit when 'make -j<N>' is used?

[ EXAMPLE - with my patch from [1] ]
zstd -T0 -19 --rm -f -q
debian/linux-image-6.10.3-1-amd64-clang18-kcfi/lib/modules/6.10.3-1-amd64-c=
lang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko

^^ How should ZSTD_NBTHREADS=3D<N> replace 'zstd -T0'?

When I pass '-T0 -L19' to ZSTD two cores are used on my CPU and a
better compress-level produces smaller kernel-module files.
I would like to benefit from both.

Thanks.

Best regards,
-Sedat-

Link: https://lore.kernel.org/all/CA+icZUUQadYjAXiCNx7PmKDV20WctvnzkXC3R2F7=
FM4Gzcm39Q@mail.gmail.com/
[1]

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 0afd75472679..04f5229efa6b 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -146,7 +146,7 @@ quiet_cmd_gzip =3D GZIP    $@
>  quiet_cmd_xz =3D XZ      $@
>        cmd_xz =3D $(XZ) --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -f $<
>  quiet_cmd_zstd =3D ZSTD    $@
> -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> +      cmd_zstd =3D $(ZSTD) --rm -f -q $<
>
>  $(dst)/%.ko.gz: $(dst)/%.ko FORCE
>         $(call cmd,gzip)
> --
> 2.43.0
>
>

