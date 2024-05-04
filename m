Return-Path: <linux-kbuild+bounces-1755-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE438BBC54
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 16:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAD9F282B4D
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 14:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FD039FFE;
	Sat,  4 May 2024 14:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Xdi6esao"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0327137700
	for <linux-kbuild@vger.kernel.org>; Sat,  4 May 2024 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714831325; cv=none; b=duo0ozeQfK5SSRAXCmPDiuOnwtKmoC6qQEk3i3mgEkNC/shTjISNQ70Qf2ZmuQJCI/aIt32H9Q+CxC0BBVcYUd271NdUj10Tf7OOUrqx6hWnnGU2MuF4eJT831SZ7XhIuY6edMlGNX1vZTGO3aPTwY2IsLQwkQs+VvaDYJduEM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714831325; c=relaxed/simple;
	bh=w1wKLlddgNLRY7sVTw/AmzrPkB5NtGmCyXfNQGsnsrU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swP4joPtTvWfcm013e/+a7vtRI22v7avM8+RhWHwyZ1b7pvD/YOLksS4PaSkQc3pxe9dirBQG+worpcP4Zqqo21XPK6Yw0LGokUBYjVupUst1jKX22QL4cj8UqYksYRaqeyvVw61nf2nQuel/eED9Uvk0bF26tcqN/Vkna2+0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Xdi6esao; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3405D3F270
	for <linux-kbuild@vger.kernel.org>; Sat,  4 May 2024 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714831322;
	bh=w1wKLlddgNLRY7sVTw/AmzrPkB5NtGmCyXfNQGsnsrU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Xdi6esao+nKtAxvZ7ny2Iq8SNX7Rlp8TJBlAe0ohjY8RO5PfikwXxRN41QCvHiYDA
	 CUHxcqDgn+moO+LkXVpTMGAVolT1cuk2lkKGbUTln4EgCUpxIf0f3T2U+ysYsM323G
	 x/CMpyqOrbEX6cIf65yOaZdeKSELacdOi/7xUQFRZzIT4Df/H3hXUORDWmTIEe6zJB
	 zyutMEjNr5wFVRn3EXTiGwDPclaocebA5iUqTSOSGOeJ3Up+s9w7BfpI+T7YRNIC0h
	 lsrgfURqq13NFwB3eTE9ogTXFIB4bSYESQG2Gf1cLRXMxVEN2LOguZNv3SEYouI/27
	 fhgUHupcCw30Q==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43d3072072cso982651cf.3
        for <linux-kbuild@vger.kernel.org>; Sat, 04 May 2024 07:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714831321; x=1715436121;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w1wKLlddgNLRY7sVTw/AmzrPkB5NtGmCyXfNQGsnsrU=;
        b=wU/Hr/tKm3a3PY9PLAEIEnkHcSCGsc4UE0JEz8FLM/5xGgLCnKv113tgZrlPd/Cm7J
         1rL/NpOUfo+E8qm20G+Zp1Iesr6L4MdxGsdaZTM9tAzV8UqaRZDXxnd7agNvRy0k2z4G
         XxYqHyGWXpAmL3dxYduow44vdyfsx4Qk6xV1uiJS4raFEUFv/CI14BAYs4efsEhHqHBy
         PqqXKUPBy9xR8nSSr2mWVLrP1MGU2Pe8Ck01B0LqWKq7To5LCMwrO20A8Dafpa+fAyPV
         JDj6SmFWduzeHHZfmix4tiz0kCLk1MKZVN5CQd5bzMZpmH9wuSeJuMmqol8dVl3yFN+P
         4FJA==
X-Forwarded-Encrypted: i=1; AJvYcCWHqeWA5mpR2cUM0Z8G43iodwhNGaaA0H+TonI0+OP9gaJeGY2giDyyWCojxIBGfoZA2hjd0gNh9suyQcZIWqnyxz0g+KiywcQXndwG
X-Gm-Message-State: AOJu0YzfFdU5sli5cEkMmTWUMLTO45UCTouNa54U9EvgUXJ7/eEfO19p
	7gGxBtHaXR21WZ7YLtxq9nmF4cdlpq8BVa1yjwqBg2mkQ16SLHO8KiZNXNUXuGn7Q2gRX0iYEpJ
	pIYu0rvY6OJqCVjXVyWAtL4nepWcuTSeMChUw3rM/Vu7pW2jL9A59zqacbmNG4Zm2VlWLMzdJCB
	3TzK33Bf6SWr9sp9yk/dhr6k7U5sBRMbkiMQuoGL9ZxoOoOBJ1NtpK
X-Received: by 2002:a05:622a:251:b0:43a:3856:4536 with SMTP id c17-20020a05622a025100b0043a38564536mr6720478qtx.17.1714831321088;
        Sat, 04 May 2024 07:02:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGZgnGwlr5MlquzRD3HBD2jghIOPUIuKhTSH7FRuH4CWfIUsVkG3VAkY/u8aMaKyJFPxi8z4makbKpQ28f8LU=
X-Received: by 2002:a05:622a:251:b0:43a:3856:4536 with SMTP id
 c17-20020a05622a025100b0043a38564536mr6720450qtx.17.1714831320756; Sat, 04
 May 2024 07:02:00 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 May 2024 16:02:00 +0200
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
 <20240502111613.1380453-4-emil.renner.berthing@canonical.com> <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sat, 4 May 2024 16:02:00 +0200
Message-ID: <CAJM55Z-MMcePewnMsmTqHtcjLiCnmMMLawtJxPcXs8r1Sr6n4g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] kbuild: buildtar: install riscv compressed images
 as vmlinuz
To: Masahiro Yamada <masahiroy@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Masahiro Yamada wrote:
> On Thu, May 2, 2024 at 8:16=E2=80=AFPM Emil Renner Berthing
> <emil.renner.berthing@canonical.com> wrote:
> >
> > Use the KBUILD_IMAGE variable to determine the right kernel image to
> > install and install compressed images to /boot/vmlinuz-$version like th=
e
> > 'make install' target already does.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com=
>
> > ---
> > This patch depends on Masahiro's patch at
> > https://lore.kernel.org/r/20240414174139.3001175-1-masahiroy@kernel.org
>
> Thank you for fixing the issue for riscv.
> Only the question I have is how this patch series gets in.
> If it waits for the next development cycle, it will be
> cleanly applicable.

I'm ok with waiting, but otherwise Palmer could take patch 1 and 2 and you
could take patch 3. The worst that can happen is that a bisect lands on you=
r
branch that will only package the uncompressed Image in the tarballs even i=
f
Image.gz or Image.bz2 exist. CONFIG_EFI_ZBOOT=3Dy and CONFIG_XIP_KERNEL=3Dy=
_kernels
will also be fine with only patch 3 applied.

> Anyway,
>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks!

/Emil
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

