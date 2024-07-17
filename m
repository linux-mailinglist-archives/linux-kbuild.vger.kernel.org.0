Return-Path: <linux-kbuild+bounces-2576-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5E9340B3
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B841F21502
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 16:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EBE5FBBA;
	Wed, 17 Jul 2024 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3KRXSCH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903851DFCB;
	Wed, 17 Jul 2024 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721234740; cv=none; b=MV4VK3aERSsoCo3C0ickhu3F4jW6vsJr5pS9kgRBMuLx07VwRIE16z4EHUbOEiiPjFh9h/cao1aM9rR3cyFQ2sqnSx2BTdMvgNaKgEisIdmozUtaR6izo1iLDV/4bsMM6cvvGz6Lb2UNROcGcR9CbrHNteAsSd2FwbeX4ZuKirU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721234740; c=relaxed/simple;
	bh=bhRp452XF+62FP9+8Ion1lmKUmMZOZgPhTUthLkmdAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUyt1iTAfzb9KRysbnKuAq/pnZcB1PGT+Z9Uajm8aUuzl2OlhzDefHYLnKI4WV5yLRfmZXWAC8uzEoTSfY21soI1Awkgi7sugNTGVtzkD2eQr2zXTKnzFXSL0vPoCRx2a5ThLP0yLqgZLZV9Tewo27zraJRen+WqoCjbkhziFOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3KRXSCH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670D5C2BD10;
	Wed, 17 Jul 2024 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721234740;
	bh=bhRp452XF+62FP9+8Ion1lmKUmMZOZgPhTUthLkmdAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y3KRXSCHQOI17Pmv1u96dbTAt1wBYbAL3Zrr68mEUfQuV4XeUyWG7TKiuFWoj/Zcc
	 ScoQ4DIWNPyFtYcPgqFko60qApGOb6LQ6TCkq0p7Jfl2pBBXjs3Y0JfOf4PMqjTihF
	 CS3Oe1YH01deDrPWHjkOYsGcMLL2hB0d/pd8PYQXyMposYFz9wK9C8ZvSv2ETimojm
	 OsJNsQiroBuVioXQb1JjSVpr87OEAJa9gYvEC91fm8QvBlW9ImrLf5tTG9aeKAg6U2
	 fSW/E5uW5zXzYmZ7GPsoLfSy69G4Oq9X3W3K27bQEAqrgXUxukkSrO3MztJLcNhInU
	 FjtTtV+fwaYHg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eea7e2b073so96877201fa.0;
        Wed, 17 Jul 2024 09:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZUrHBAaZ7YKGPjrv4dPAh66eI8YBQ1g2rNeCYn4OdI3XK3flSlYVf/VePYXYjgB/mFK+qWGtyxBeKgkz9r77ZXxAWS5FnvgXTm/PA0poc+Ej9xIxcHwGxM06wFIDUByZ6RGki3uyAPc5J
X-Gm-Message-State: AOJu0YzUhXTpqkHoJte1a/ny7dImDRX7A8EO72jQwDX1VfPK1GO2AziI
	1l7kQtZ1j73QbXprRHbajTHfIFykuC1pjM+r7eKkjynoEuT0q+g/A9bFihokAg9j+51jGBB6lcJ
	enW422cXwXoZ6KLikKRh/l92i0gg=
X-Google-Smtp-Source: AGHT+IEZt4rkIXcp0qEDCDL0ayp0N0/T33O/eoWRQs13u/51jr4xQBxQ0TX4Q4R5TNDu4JzB7UaQyc2IE0zyKFCzKss=
X-Received: by 2002:a2e:9447:0:b0:2ee:8698:10ed with SMTP id
 38308e7fff4ca-2eefd165e61mr14406591fa.49.1721234739065; Wed, 17 Jul 2024
 09:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717124253.2275084-1-arnd@kernel.org> <CAK7LNASOtyqJMET7YuuFzTCkwg02p850PnqCC57-BZNJhyKT7Q@mail.gmail.com>
 <8333c062-a773-45d3-88d3-ba78e8abbd47@app.fastmail.com>
In-Reply-To: <8333c062-a773-45d3-88d3-ba78e8abbd47@app.fastmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Jul 2024 01:45:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYnPNsJraL1qv+MFviTnPxjmc2Dmd7EcvJRCNLtHfZ6Q@mail.gmail.com>
Message-ID: <CAK7LNASYnPNsJraL1qv+MFviTnPxjmc2Dmd7EcvJRCNLtHfZ6Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mark "FORCE" target as secondary
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 1:25=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Jul 17, 2024, at 17:18, Masahiro Yamada wrote:
> >
> > Of course, NACK.
> >
> > Now I am surprised that this broken series was quickly merged
> > into the mainline.
> > I really dislike how you changed scripts/Makefile.asm-headers
> >
> >
> > I will send a correct fix.
> > Please do not break Kbuild even further.
>
> Should we maybe revert ff96f5c6971c..3db80c999deb then
> and find a better way to do it in 6.12?
>
>       Arnd
>
>

I do not think so.

I pretty much like 4fe53bf2ba0a45cd708dcd4c3e8e1950731b3d4d,
and I believe generating all syscall headers from a table
is the right thing to do.
So, it must happen.


Currently, the new syscall-y syntax can be used only for
architectures using the generic syscall table.
I wonder what we should do for the other legacy architectures.

Some years ago, I tried to unify 'archheaders' and 'asm-generic'
into a more generic rule, but I did not find a nice solution,
so I did not do anything. I need to find some way when I have time.




For the rebuild problem, I think this should work:
https://lore.kernel.org/all/20240717162421.1402773-1-masahiroy@kernel.org/T=
/#u

(I only compile-tested arch64 and riscv, but the other architectires
should be the same pattern.)



--
Best Regards
Masahiro Yamada

