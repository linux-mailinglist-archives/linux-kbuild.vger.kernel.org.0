Return-Path: <linux-kbuild+bounces-6526-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC332A819C8
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 02:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 812F94479FA
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 00:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98102A1C9;
	Wed,  9 Apr 2025 00:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JH0EQjwN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD47125B9
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Apr 2025 00:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744157719; cv=none; b=G5FL2BN2ocpBFyMQcTjXexR9o8YMhkMNQs1hjBZ3ibW4bg2/GuuJthD0JjvwPsUpeIB73syq+uoYJHU+s+4CgwRI9O7FoF19EgePWpmZiBby82tCMCkbe8pyqyzPLH4URDQmZ3l+KO5p+gQ/2z39ye5wxNlfJerOCu+bWQ5FMqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744157719; c=relaxed/simple;
	bh=kzUr1f5PApCyyaQsNWZA+8T6s6ncUwpR5rXya9vt64M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gmx7mIHchkWFX9h/EH/5lPNBjW3X2htywE+CdtX5n+NI4kTg3AaEkLu+3x+Q9bqhfh48w3M/MiIQQEMNcz6PwfnanI1k/+j5IueLKGxevS+G3OjhAsPo/uSC4LZ8+35KY16YIzsIQTo/80m0tyB/iT8ETws3g2OAX3aMu4qCX3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JH0EQjwN; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso375125a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Apr 2025 17:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744157714; x=1744762514; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y7RB+y2EUGP8TtBqM/TIRDMB8wrdZCpt37v8TqudoNA=;
        b=JH0EQjwNRFiiR9JKTZT+2Qv+Ww6e7i6GrQHvblVDi9+fC8FBVkInJt+GVzLagbBIrU
         HO/VfWR1x28xrQuTLH79O1Hh9qlAEW/7Iq3zI0WwXdFz2lTR4PcTsdmzgZLE2Ujix/tj
         hrA4V9DHwfmIihNomYXAdvXc4OZFx2BGy+1Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744157714; x=1744762514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7RB+y2EUGP8TtBqM/TIRDMB8wrdZCpt37v8TqudoNA=;
        b=syNulcqkiUZZh7JcBGfie3GiIcyadbi2fXXBQ9NRisxLCJErKolxhA9UJiJjJkve93
         rVEldVwpKejJt06MTu+6olK6vnQ8sYnQP12RcqL9ok8ArOVJNoSq1CYXxkojztW8M6Ec
         NVNMCvg8Vo7MNgxhvGRsNFapGX9pFZ2ziAwHDJNRo6MdH5lR0itV6fOZqb8HsQtoa+CB
         LWngmx2ijFbdt7CkeSSPJMzoVvLRZC7GKVPzyw8JwDq/icCDR7o6Rt0NCjh+FRKtleMR
         cML7PxhtWpiLbC+TaQdKbrYqvRifxmEYWKHVtdaHWIGYXcDKU4zbv531WJprgtRKYykh
         eCHw==
X-Forwarded-Encrypted: i=1; AJvYcCX2A/hni7+XopgIjODGOwKuyaGUb4ihNYpydCQy4OgSgo6fA+FYVx4KiPXSIA+CS0lCW6eBXC9PX6HEUdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzf4kIl+iwGP9P8CJHZZ7ModdgxJ59uIxqzlQ61l3fE1caqDMP
	uN/BMUDKs2nWL78mkvD2bzbrLNVa7snGYbvud+aOHMtGDH2UFOAs4cfm9Cf8qtJW4S/LaTN2gbY
	DBKI=
X-Gm-Gg: ASbGncvrfI1jLtks/URVT4DRwbVd1T6Mjq4Dv7S4vOIENGpft/RZ8pyqRV5OQ+O1pvd
	sz5X3XjXii1QacHxiZH8Rw5+q2WgzEOt1Cj4X+wsHQjnbFAFsZ2bG4GZMDegut00Xyoxa1P9+qj
	N+j8l1zLUimgX30F69GryetmLxHBMQp+tRVQSLisp2UmVjs37kINqiw6dlVlGj4CYA0uFvsrYjf
	1FkifP7h9IFvK2OISs7EEx8OP+t5/+t0tMhZhdmyFBDX6wMtZI4HP79/bryFxMTp5RiHJDQ/blt
	WbRWe+Z0wTBXyNhdqgbAk0V6cc3C39ZJFcAG3RlvxqdUtZq16vw46YRFFrEYpDzFCOmnvobqJns
	jy4RRpo5/KjAZK/UGUkw=
X-Google-Smtp-Source: AGHT+IGEoIUBlVVqe0bhtbwa7Oa/KPTs2dXHaIutpXZzryHFSH44zjoQSa0m6JSWYhvBaBeoReuN4g==
X-Received: by 2002:a05:6402:4415:b0:5e4:d52b:78a2 with SMTP id 4fb4d7f45d1cf-5f1f4808cb2mr4564365a12.15.1744157713951;
        Tue, 08 Apr 2025 17:15:13 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed1c1csm8754434a12.22.2025.04.08.17.15.11
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 17:15:12 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac7bd86f637so40888266b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Apr 2025 17:15:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXICe5HZePEmLbLozXRTDUihAB41D3w0Osdf9SFOAQMPE8ZUzeCkDH9OrBz3KIknCm3NAoSUvaMoF79+3U=@vger.kernel.org
X-Received: by 2002:a17:907:97ca:b0:ac3:ef17:f6f0 with SMTP id
 a640c23a62f3a-aca9bfb0d37mr81837666b.5.1744157710814; Tue, 08 Apr 2025
 17:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-fno-builtin-wcslen-v1-1-6775ce759b15@kernel.org> <202504081632.00837E7921@keescook>
In-Reply-To: <202504081632.00837E7921@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 17:14:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiN62aoWPkgRutvjKpxbXJdvgNNY0DqDc=9_r5FGUjfNA@mail.gmail.com>
X-Gm-Features: ATxdqUEzxdv_c924M2x5edBsLVmXTsnFzfYKX1p8a7EiZ3toGIQu_4WxIx108FY
Message-ID: <CAHk-=wiN62aoWPkgRutvjKpxbXJdvgNNY0DqDc=9_r5FGUjfNA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add '-fno-builtin-wcslen'
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 16:33, Kees Cook <kees@kernel.org> wrote:
> Since I have stuff queued for -rc2, do you want me to snag this too?

Well, since I felt so strongly about this one, I already took it...

           Linus

