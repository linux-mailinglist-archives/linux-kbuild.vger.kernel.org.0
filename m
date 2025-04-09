Return-Path: <linux-kbuild+bounces-6555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 022DAA82E81
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 20:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E57531B6760A
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 18:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26369270EC0;
	Wed,  9 Apr 2025 18:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXCyWM4u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672E31C5F23;
	Wed,  9 Apr 2025 18:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222947; cv=none; b=nbotkosqamANMcICYl63/pMjBTLeUmM8pTSZ2+HcItmDZuI0hIkzn9dgGMUmYmn9DVFCC+5a8sGFZqoI/HTQ4zMEZoITyAlnqmeDmv7q2s+vPI+3w1GNAQgczZ1h7br82bpXReofgcYdNP1FJ18/jaAlbiyHU/QcWCY9FvBv4uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222947; c=relaxed/simple;
	bh=w+j8lu1r0xwnw+RjG9AetU0PtQlqSbWDZeToiORrs0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AjIX6jIWxF1qfM9aQSsnNPEBCmhpTfFqpYUn2m2//FzhSECGDsyY/3YlkoXk+OeF4wZm9qLiBWopY6j0MAaDjpTjtBM984mjuTUFyYUQB9AhEYf/P5UbMVNsXDTWmzwfpZF7sDGhnlS72wLX40J/SLwYf/vUs0bwLCaE0u0+9X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXCyWM4u; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30beedb99c9so65078761fa.3;
        Wed, 09 Apr 2025 11:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744222943; x=1744827743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+j8lu1r0xwnw+RjG9AetU0PtQlqSbWDZeToiORrs0k=;
        b=GXCyWM4uO3Fqdu9EWR0SkIfOlXAqzYliCwGjuKLx8k3+JjlXd9qgS5nvidv4E8aK1L
         fbui3Yy/KZQH8TmTwWyBGq/GaFDvAHkCjxK4CB5tIsI8qMUmFy0UL+dUOhH5GP18fzLe
         f30kjVoUlct35V54pglOWqWU2jgqkfA6PJ0OqYE2ehCe5SC72rkW8za9RUOUGFDDxtMs
         +dyqrYAxDnNim3lKVb601QhBWKnELMgLBYjzJz8k0UAXmWi/1gxhCplVuiLgd1z4ll2B
         CaNxhW7n7sdjXZBVD08vkXCvs8maqGwd6yYaFS+GK5ipO82Dglt1HhwPCpv9YNMZ8LpZ
         uISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222943; x=1744827743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+j8lu1r0xwnw+RjG9AetU0PtQlqSbWDZeToiORrs0k=;
        b=kg8CgsbITsKN8bZoVP+TVxokZAZz/R+EtuQ9Bfu8HuctYh+FtoQVRHl/rW7bu2Nfh3
         VLKIW5CehSmZbCA+uSVEj0Xm7PEp3Wh8GdalYBjRIwigm29lRPfueKNfRszdPfjaxpR0
         4HwFHfZP1G7TBfaK+m3SpqxvsZxwmwMYT6oNfF/jt1rBye101IeFfjWDAzwMaGRF5/i2
         Tm9xh+RqWMWgYWpwRNWH3XyvY22Cqu6xdyWi5+BKG3gzY1luJxgDHpmD49NFb2KXRNZS
         129K1+aMLWjnqsYVmvmbcS4uCnJDZlZz8onlEIhBY3MgXqxmHPhDmHQ0sbPQ8f8MYHFK
         VyXA==
X-Forwarded-Encrypted: i=1; AJvYcCVDI8e8EL5trfq9C0iEB2qrBwoOJdd40IQSrbO8SZVORljWF+fD/mtUiEHuQKHtf7LVUI6xB+KVS0V/Oms=@vger.kernel.org, AJvYcCVyKP57Zr09kdTJo770v1TemUtt4En8ly8YhETpDI/VmJDOKu7Ky5Z6eo6SITymLsC8fjnI4y2BNiTlz7RgbQ==@vger.kernel.org, AJvYcCXEw5kuCh+hHhYtxJnywLYXNy9rOT0lS3qabc98P8GVvvgPCTn851d1knE/JFxX0+mTSasOmJ/RLMjv/h4o@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+p40+qPKEgiPWEBDBk8ysuoQ83TUDUruSD49DKC4kvb3WbMx
	XXR1pLqQQlAAULebRT8mw30qlAnQQZUIaYdb4zDFgoa/M3+gFDByOaexsUSlTN+GlWTqqJVDhXK
	UcGhRaJXGvOxopEVX8+imf1r+25M=
X-Gm-Gg: ASbGncu/qwoKFfNetu2TRhrKeqLFnxGN+6k/xVme18HJ4hE0ad8BaQ9MbPrj0bVWkXa
	0TbmKogyKR1enqXBM7JkHLdvmpSOD26ABSmg9v1fT8UbOyMGlmS7dRUC+X7PVgm9BVkdNfa54J0
	Ge+aefgkT6ED4K0fSFRgKRiQ==
X-Google-Smtp-Source: AGHT+IFsB9benurawG81+pvnZhZj9jumXPvVrvbkEkLVqi891fTMsPJbJSjcP8kZ9f0nWfiqMJ2a0Hmv4Nd8ZMIVsAo=
X-Received: by 2002:a05:651c:1b11:b0:30a:448a:467 with SMTP id
 38308e7fff4ca-30facc1fae8mr199711fa.21.1744222943258; Wed, 09 Apr 2025
 11:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404102535.705090-1-ubizjak@gmail.com> <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
 <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
 <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
 <CAFULd4b25r5wf31DJputSOZhhMTrejQ_3-2P5rpeOL8H=4_mcA@mail.gmail.com>
 <CAK7LNAQVbwnnX5TJLmEShtmUtLCwr=rnZgwX9NoAke+PqzsqiA@mail.gmail.com>
 <CAFULd4b2azU-oBOTTXgQ6ahkVeYWHTJrnmJ97vtLm3P6jMOeug@mail.gmail.com>
 <20250409152812.GGZ_aSDEaLEOVUf3YX@fat_crate.local> <CAFULd4avYC6V=-ewBcTGHA5GjuTBh++-wLNOH=M68u1rwNsAmg@mail.gmail.com>
 <20250409153819.GHZ_aUayZlfOd7TTq4@fat_crate.local>
In-Reply-To: <20250409153819.GHZ_aUayZlfOd7TTq4@fat_crate.local>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 9 Apr 2025 20:22:11 +0200
X-Gm-Features: ATxdqUE-C1Kv9b5K2r0cnaqqZQfpFR1Cncv9OTwGH9yN-dFDPcpf4fvukunwpnc
Message-ID: <CAFULd4Y=BbAwrQdCY5sO8WuUo1wi4h-BiqywoKBu50ir6f_XHw@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Borislav Petkov <bp@alien8.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Sami Tolvanen <samitolvanen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 5:38=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Wed, Apr 09, 2025 at 05:32:39PM +0200, Uros Bizjak wrote:
> > The workaround is posted to the list. It should be committed to the
> > mainline until genksyms is fixed.
>
> I'll take it through tip.

Thanks!

Best regards,
Uros.

