Return-Path: <linux-kbuild+bounces-8259-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7831B17409
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 17:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A62FD3AFF6F
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 15:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB1E22EF4;
	Thu, 31 Jul 2025 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kxdk/SwJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A10D515
	for <linux-kbuild@vger.kernel.org>; Thu, 31 Jul 2025 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753976353; cv=none; b=iQSZQohUG967tYxAN9zScHWDAtDpwrirL0ZULv53jZ+h0IS0r+5VR65vVr+rXWkcK28UVYrTg6guB/2ZOkVERyKmEkSCTsC6BPKLZch+FbaSEQm6oGISB5FvZPCylgIoWx9lqNgXuZPNvsStE+v2uOJ6aBDBzfgXaXilCg2O5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753976353; c=relaxed/simple;
	bh=nkk9SnsBDXkIyaCdNMLt4bgFqMcO6tJ2W9AQ/1ySrhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hvfr5HSn0XXNHYJHt/M1XjUsp08erXtT9MwNQ5OiuMgfYp9YeOGIF9+T4Jc3SgKn1+JJ5B/K0sz5S/8fYTIEMHmlXCUlZ3pO/YQ4DwTvjbIgp+5H3Lzs5SqLHSYYquUs5729qHtDNJVrgWsw6CnLMfneEBYPrgSMfG6gcVvbE7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kxdk/SwJ; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73ff32d8b8aso171892a34.1
        for <linux-kbuild@vger.kernel.org>; Thu, 31 Jul 2025 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753976351; x=1754581151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwVdiiH7mkywpBwlPnmJJg7djp8mIXAb434wIn+ybAc=;
        b=Kxdk/SwJstYhCh66riUcLqv+HIK64vthxpY3HGERjGNcHBKBir/OBDWnyup9zcwiRl
         AUAdNRENpC75/Ohp204Ls1YRnP2GSwA4FH9ivBYQZen2M8s6Cgc2odg9dik8qdnzMTij
         liAv5QXiUdvwByihSS4vQzqLIFcaRlHZ4OX0AvYecWs8KaNqW8jF9rqiEe1rrnkIBj8H
         2Q0OZYDqhAr1fRPtpsh6YQVrGx70YcG/7UaB7hSWg4YWmktPJlzC50pCLx17Uv4cqwYA
         WxwJlUKFrqE9diHMV3oF0NA8dnI6tXtutpw/xQKKGJYCBuN08qxTJOCxyRw9KO0WJC5z
         mEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976351; x=1754581151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwVdiiH7mkywpBwlPnmJJg7djp8mIXAb434wIn+ybAc=;
        b=nRJbstXsNKi6fRKEcX6UvoXKJQRWBiNAjYXKiz4mxtAYAVjdFtBDC01zYEAizRbcVf
         xPJrCF4dT2zRbmWaP2220qRac9JHEspL8XYws/KLYzhjArc5HbhUteOQWYVj1LvTMkcs
         +l8bhtUa/hLc5tlAXD+w5JGfLXwj87FLQFlTHf1egRV67JriGEL0pbWAxPp6Y572gIPg
         U2tKchTgXEuSQz4WeCxYeD6SP4nSnn3f4yloEirVbQUj0ADu6s3ue21/Iu5wH5jpw3no
         jLQMna/Pn9CKDabSctDCXkYdiVbzE8E/AvKmslFEDvqDLhfGy6+FUbi3PyFpZlhOL6su
         HSig==
X-Gm-Message-State: AOJu0YxkyJSyIyGY3uY9RF1qEHQ52y1a0zLcGrLhQS0BXVVjaJAow7sv
	EvOJ9/OrdIhRgjzNWv7Cz3Sn3iIFfTr2qfx3EiHnx2tJC/GC7Zc0MeE4npyDzehDIdwaObEh3wr
	DBueiVsCFyylfz1U3SoEfnnScx7tATBKLj0vE
X-Gm-Gg: ASbGncuI48bRyWBL+OYiSN0eGrCwuPQK8MQ11bGbNC3aNXI8+xY/+Vk+ow/dQZV6Sgc
	3F/TqOY+tMIyBfoeoK2vS6DGS3QGB3zIc534dVlEM8CiNPcUKOZObUsNJ8TRx1+YVcGGWUOlSKO
	2j4QeZijqW2amKqRgHR1IsEs604MQNVVWHBBHX2n9K9JO/w42kLEXMZzrDwvpUUYS3mV1hyfwwG
	+RZ642dANh0BOJZ7g==
X-Google-Smtp-Source: AGHT+IGHUnioWY6ov4nQjK5thkeJCy4jHfq5WPoGUTS9niK2bZxcEvbwW1ch28dLLmbSe5atEO1Z3GIV7dIQBW8eBD4=
X-Received: by 2002:a05:6808:1a21:b0:406:76e4:c4f with SMTP id
 5614622812f47-4319b24ac1fmr4857397b6e.18.1753976350831; Thu, 31 Jul 2025
 08:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLtTCUoV66PAJ2VCBz70VNVKxhJHGbBFt9GXQdOP6z5KLg@mail.gmail.com>
 <aItVnueRx5QW2Zds@fjasle.eu>
In-Reply-To: <aItVnueRx5QW2Zds@fjasle.eu>
From: "David F." <df7729@gmail.com>
Date: Thu, 31 Jul 2025 08:38:59 -0700
X-Gm-Features: Ac12FXxoVEwsq-c4_UjJ8QQSRgTtn6begsG38krm3yy2pcU5jQu7aHmWXb9xuds
Message-ID: <CAGRSmLuAKjg=0P=67_M2d1bfDNwWpyHQAuZZCmY=ZNNC62BW5Q@mail.gmail.com>
Subject: Re: 6.12 and 6.15 building fixdep / modpost for amd64 instead of 686.
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linux devuan-chimaera 5.10.0-31-686 #1 SMP Debian 5.10.221-1
(2024-07-14) i686 GNU/Linux

It's the one I've been using for a while (Debian Jessy before that), I
can't do any more upgrades using the built-in upgrade tool because
whatever happens causes corruption in virtualbox shared folders
(Windows host).

The build is actually:

extraversion=3D"EXTRAVERSION=3D-amd64"
make -j$(nproc) ${extraversion} bindeb-pkg

On Thu, Jul 31, 2025 at 4:38=E2=80=AFAM Nicolas Schier <nicolas.schier@linu=
x.dev> wrote:
>
> On Wed, Jul 30, 2025 at 01:51:21PM -0700 David F. wrote:
> > Hello,
> >
> > I build the amd64 kernel on a debian based linux 686 version.
> > Building the 6.6.x kernel, everything was fine (fixdep/modpost were
> > ELF32), however I jumped to 6.12.x / 6.15.x versions and now the
> > system is building them as ELF64 which means I can't build my custom
> > kernel module.
> >
> > To make the kernel(s) I use: make bindeb-pkg
> >
> > The build for the 686 kernel worked fine, creating the ELF32 binaries,
> > and allowed me to build my kernel module for it.
> >
> > What do I need to change for the build to properly create the ELF32
> > version of the various scripts created with the headers for the amd64
> > kernel?
>
> I cannot reproduce your issue at all on v6.6.100, v6.12.40, v5.15.8 or v6=
.16 on
> a clean Debian bookworm i386.  I did:
>
> make mrproper
> make x86_64_defconfig CROSS_COMPILE=3Dx86_64-linux-gnu- bindeb-pkg
>
> Can you be more concrete about the actual commands you run?   Which Debia=
n
> distribution do you use?
>
> Kind regards,
> Nicolas

