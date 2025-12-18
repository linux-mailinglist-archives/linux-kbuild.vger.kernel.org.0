Return-Path: <linux-kbuild+bounces-10166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B83CCCD895
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 21:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CC8C30164D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 20:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10831487E9;
	Thu, 18 Dec 2025 20:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CgyZHU05"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF303185B48
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 20:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090068; cv=none; b=ExLCXhWBIl/rDbNU1wwflcZAqbusJKrF52QhVZXGWZWPYMumxq8sNvEFS9A9dvITZMl3V5mFhsBZGtNMsb4OThCI/nW/oOixhfJ2qxMDIqkiKbuz/fUvvJkcjVhAPg+9oChVXiYtip8J/D629D7Y1u9LwfI8R8aXrc0epvX6amE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090068; c=relaxed/simple;
	bh=+RowUUrYtzXa4i9REDNRtB7NHjBBJv9ASqbqnaOrOgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDdZNzzjLOKJn4qlAIaYD5Tpvtxe8P/LXVrFKJHxMx8LTurB9W/OTVeNxSpLbdxC0mC8Xi92wJxH5QX6dc86bW5VdcmsOIHjnwdpyrM11xhTBgUmGdH6vA1UYgUVCAvXmnyCMyXQz4206fHjjiBBNSy5d8o/+toJBYN4rQTW56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CgyZHU05; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b736ffc531fso191057766b.1
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 12:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1766090065; x=1766694865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AFdyme3OdkfY6SG6LYuzpXFnNfm347qWal7RaQqaQwE=;
        b=CgyZHU05l25N27acnHZtfkZVBEvKvS/fVJf4q4x9DRMcLn13Mhsfl596PTBiNmykcj
         abxOev4kCvY76mEtdU4SIiwkCbm/2cus42Y9W8KyUiSYpIMAf4uMjYnSqlhO4metoDF+
         x7IcMWpxgZVj5IGwd4PnfqExgZUeBaIo9pk1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766090065; x=1766694865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFdyme3OdkfY6SG6LYuzpXFnNfm347qWal7RaQqaQwE=;
        b=a8/vQ2jkGuyyJnwvVc/nC1fOjCsLEeEgHBgbNrXIkpkR9xWsYmgvzhGD8pPXrb3mwR
         CCbEbcwYAxv5PQEqZRUt7E6MWTKChJ0l76xEi+abXPg0pr2qdHPaic9SuQAT57ydLDoj
         ryAJTnaACTT584loVvjB+el4O4Pev0IqNV2pdvKpfpcGrMcenoBZDazHQNV/9d9IOdJi
         rBXPJqXoCPJqM4aaOeIRwfriIKyZJpAoaNVh38xyOAAWivvLILDXyeHMitCJSsgg5RW1
         c34lnuQ9EdXZp/wyn5N1ElGpgBme7c2P2xQmhWZY3QcCiaWojSAGA0WGhD1N82f+mxWK
         x9zA==
X-Forwarded-Encrypted: i=1; AJvYcCW3IhCgqJVQR2IyhIGV6PNiKcxbyZa7jQmLwzCCGNCrudr5l2LIWfJs0HpPXBdGofY/+OHydgxTPg8ly60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7PJZPcYwS0xqooPCaqB9wgtv6LXKQS6DWspf0+rLjs01XjYGt
	OopC+4XaRmC+ShVUbyTQCJBAPRn113cEdy4rhqO6ohacTL0EVejbvSPp81Y+AZqFdMgkmYSVQCN
	sfwGDft57qw==
X-Gm-Gg: AY/fxX7leQJE0Zd4MrWx7GniiIGuKSyrferofTSqxSgSvsTh6lR/mbD5cND/5mg+wI8
	yjIT9x7B93A4yd0ew7AlpJlNTObCuv/xHd7fLP2ghretQO9fjSsRGi5uCYDPjQeOgtfs2tZEk6h
	2SsEb4f8+HRwoQvxkWZPENZAMNUzHkBAz6uczfCDddgIrtuYapjSOm1PLA6lcqGlsTsLqtMDEa/
	vij5uu5+9KmRjkubon1tjJ2xYwuVEzzD+Lf/DOVAQMp+dgBITKLqP+YlW+BEL8RAQo35zAUUuS8
	zG+DiEIfvxTjtPAUdIpriIOiGMysJJoj/L1yczZdTBs8bUYZiX+3VXvsNTkTDCaQgRCq+U+lrhI
	1cu9IBXi3e2XFVNpKoCx3T77AnuZQmXw6VnS6/6siBpOQNJrzm1r2HydmgXyftTlsNXpbE8OUFL
	dDwTtLpMm+emPVKm/88fxQ2sO5ozVj5WKeyESY1J3rmCK2sR7XoujApKF82p+e26qSYHl+WQ0=
X-Google-Smtp-Source: AGHT+IHRUe1KnBwEa0RbCUuze+dxNwoXts4yf/2xqpVGNjB3F7w5tLSwt8KMyI2HnxgP77qRzndB7g==
X-Received: by 2002:a17:907:97c5:b0:b79:ff35:6473 with SMTP id a640c23a62f3a-b8036f12f00mr58893566b.17.1766090064966;
        Thu, 18 Dec 2025 12:34:24 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494dd3sm317798a12.21.2025.12.18.12.34.22
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 12:34:23 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6496a8dc5a7so1382800a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 12:34:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2HfW00uZduRGifW7B7AiuMspNMrDIoitT2JZ5Pey4zwY0bMhurVkzc3F0mMiEpR6TrQ7/iDYYp75eiCw=@vger.kernel.org
X-Received: by 2002:a05:6402:1ec8:b0:647:532f:8efc with SMTP id
 4fb4d7f45d1cf-64b8ec8f844mr669213a12.33.1766090062459; Thu, 18 Dec 2025
 12:34:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org> <20251218202644.0bd24aa8@pumpkin>
In-Reply-To: <20251218202644.0bd24aa8@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Dec 2025 08:34:05 +1200
X-Gmail-Original-Message-ID: <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
X-Gm-Features: AQt7F2qOKBa-zo7QJgMQveUGo5xuaKkhNSphimTCrBEi3RG5l67qg5BeTDIQqhM
Message-ID: <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
To: David Laight <david.laight.linux@gmail.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Dec 2025 at 08:26, David Laight <david.laight.linux@gmail.com> wrote:
>
> One possibility is to conditionally add _Pragma()

No. That compiler warning is pure and utter garbage. I have pointed it
out fopr *years*, and compiler people don't get it.

So that warning just needs to die. It's shit. It's wrong.

The sparse patch points out that this *can* be done correctly if you a
compiler person doesn't have their head up their arse.

(And no, I'm not claiming the sparse patch is perfect. I'm only
claiming the sparse patch is _much_ better. Bit tt could be better
still, and there could be other valid cases that could be warned for).

The "warn on type limits" is idiotic. It expects programmers to have
to always track what the exact type limits are, instead of just
writing safe and obvious code, and it warns about *good* code and.

It's exactly the *wrong* kind of thing to warn about.

               Linus

