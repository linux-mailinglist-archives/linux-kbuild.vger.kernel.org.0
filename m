Return-Path: <linux-kbuild+bounces-816-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7A848B7D
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Feb 2024 07:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B1231F21B44
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Feb 2024 06:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDBE629;
	Sun,  4 Feb 2024 06:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GsuHNmSP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49298BF9
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Feb 2024 06:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707028068; cv=none; b=Al7CXGDONHzxTLeLhpKILId6BcJ1b/gdvUgnEu+n0xweyXlp3bLDMGp2QXxCwqOXbkjMjhajY/SaUeR/Cc+2MFYf5+e0tG5Oz4qgxL7tbz0x45Zx698AdYzxDjhB3GRXPE0YX0N8LO4mrEPT1IZJshyQB5adUKZAQ7ArSbwW52U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707028068; c=relaxed/simple;
	bh=5bxZ/rq8CMxzomMWyzPoqrgoI4wlBnejXrS2wHBkLlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rM1K5MaPcqehmODnRKI8Tg9GbALdS7QMxuTi07huSDHFqHFJ540tYBlNWbs1GiqeeKeSIPPOYsMSkVwJbX1k/JQuoYxvhn0pxPrvboPv0mkCGViZ0Q7hmnoyumhEYLPC0IBvbnBBiK8A5deUtGlsQJw3B/jsrzKEqHAtjTOiaLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GsuHNmSP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a370328e8b8so250593566b.3
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Feb 2024 22:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1707028064; x=1707632864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VnGKPEZoM3Z6DTfYOVg2LOet7iC0N95dYbHHaYKz37Y=;
        b=GsuHNmSPUwAWQdnZy9Rf1gn/UMzioLqvzV0p7L/6ChamDQ602kA8QQ7H+LN30H12HQ
         MTAztwIXeKdsJZHjS5mzM3rdnVsIXVFdHhnNzFksk6kpG+qu/Nw4d0J6SVjxVhXQcGBU
         5cPuJ9x5ck/vgMKSdgvd8iVlx/r1pi8jHkUEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707028064; x=1707632864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnGKPEZoM3Z6DTfYOVg2LOet7iC0N95dYbHHaYKz37Y=;
        b=ompNYfGv7Tq13HHEHLz6faor/hWeFxzqdwW3b1fidGJUrccjicQt3mPPghFCtbJhNA
         gKRsMvbYkEq5wDENJ166eaCsz/OUKq1569HCnAh2DSc8kvKgjjeFJGzhlzFFTuEJ5vMe
         tR7cWHD27bZR1bA5VunrYVduK8hmNHROp/6bMYKKposmNIQA1qvDuAetm7uxpspkMGR5
         ZFI9U3Jxf/WyI02AaO7qg8T0c7gOrWqv9pGzSoZaYRaUB1Nvy/Ns0RdsFlgL+YVKOxR/
         iiwIL9t3Xo2d1bVyZ8Pis5APmKbkebUizgNx4LYpHtigtiMUCC1YKzyZ+tJaTsY5Itd+
         WyUw==
X-Gm-Message-State: AOJu0YyHADo/xFsnYylr5bvCqjw6K0z0InJcbkDnVDPAnJwwA5wgKGmp
	QNcImrvmgt+2nq+WbpkDFDyM/Btq3nBvgMmDPhoiF2vjfiBUdArX0QE46cKXsxceWb0U1prnMFG
	FPz4=
X-Google-Smtp-Source: AGHT+IEiV7XxMflScrDHIsNYjucwNWbdSo9gHzgjYorQJyx7FMtpUnkL5fKknG8GOn6d64klCHUEUw==
X-Received: by 2002:a17:906:3097:b0:a37:4f7c:c9c1 with SMTP id 23-20020a170906309700b00a374f7cc9c1mr1707366ejv.56.1707028064371;
        Sat, 03 Feb 2024 22:27:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXnRpw65XG0XMp3XnuGNXOaQMnTKt6FKyqkWh+8CJnpdJ/63vEIsWXOrT2fZbab9edEKGklpPtFH2syOXMNj5V0MNgFekCixLJrKxS0
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id vh8-20020a170907d38800b00a3708787ca9sm2541449ejc.146.2024.02.03.22.27.43
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 22:27:43 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so4845028a12.2
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Feb 2024 22:27:43 -0800 (PST)
X-Received: by 2002:a05:6402:30b7:b0:560:5ace:2476 with SMTP id
 df23-20020a05640230b700b005605ace2476mr32827edb.35.1707028062869; Sat, 03 Feb
 2024 22:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNASGqfMkTuzP28qydpYCC0ct3cAgMpbPpmgHuQHZbtLhbA@mail.gmail.com>
 <CAHk-=whJKZNZWsa-VNDKafS_VfY4a5dAjG-r8BZgWk_a-xSepw@mail.gmail.com>
 <CAK7LNARzZ07TX2obHSpCgsC=FPTbLx5J+kPBFUECT+N7V42i5g@mail.gmail.com>
 <CAHk-=wg+3J8L4C7dcsZZNPEr3CJ49wKtJC0taVDBwGo9ZGot+Q@mail.gmail.com>
 <CAK7LNAQwcm9XfYAgcxOmGp9tvzj8kNbq8VUX09ZKscG1KEgE0g@mail.gmail.com> <CAK7LNAQTbNv1C6sU2Z-gAofKZS=vPiGdV=V3Kd0iYFpR2qF4QA@mail.gmail.com>
In-Reply-To: <CAK7LNAQTbNv1C6sU2Z-gAofKZS=vPiGdV=V3Kd0iYFpR2qF4QA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 Feb 2024 06:27:26 +0000
X-Gmail-Original-Message-ID: <CAHk-=whDYCFbd23C6KssR=OJnaaGJDs-aXCQEiNGwgWHqdzYhA@mail.gmail.com>
Message-ID: <CAHk-=whDYCFbd23C6KssR=OJnaaGJDs-aXCQEiNGwgWHqdzYhA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.8-rc3
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Feb 2024 at 00:00, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Is the second patch fine with you?

Yes.

> If so, will you pick it up, or do you want me
> to include it in the next pull request?

This is not critical enough to bypass the regular pull chain, so just
put it in your queue, and I'll get it with the next pull.

             Linus

