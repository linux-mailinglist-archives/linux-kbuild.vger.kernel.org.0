Return-Path: <linux-kbuild+bounces-5705-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C8A2FFB4
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 01:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F980188CDC6
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 00:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574551E3DEC;
	Tue, 11 Feb 2025 00:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qR/0+Cv+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE311E3DE3;
	Tue, 11 Feb 2025 00:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234834; cv=none; b=Ybof/ka7cTbS7bQEMqTqHGfEdMYi47w0O1Kc1L6JLiQ11ePcnB6w75GWMU7hDN/BOEole2JJZiexo4GDcLOBdW7gerKKzyTweShcaMQROI3eNLEqHU+vCNmbjXUHW5IB1qb0+cOKhiqvBZP1zj1uLyfm7YFZLGBQFEgAExn6Scg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234834; c=relaxed/simple;
	bh=qrCLKCr3lp4Od3eARtB8IWB+0Ku+BwguDtG0i3KJAtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WegH30KzEc8hXmr5QVWk11CjPSx4n0xewg+yQDPpGbSzYudk0AU/c//JPjtPbzcF0Cj3iDAhJCwlEv6a0Z9GX25YjeEyOOzoTWSiC6jp4iaKOtBbfNCQ9xDehAV3QeyPnnkihRitorxs14Df5MPEIpdfjGcqd8kfn/3bajOpxM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qR/0+Cv+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9054FC4AF09;
	Tue, 11 Feb 2025 00:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739234833;
	bh=qrCLKCr3lp4Od3eARtB8IWB+0Ku+BwguDtG0i3KJAtE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qR/0+Cv+ano5arWUwg/8ByIfAIcScQLo6IKe0bT9X1FSBv4rzObQ/2weehePoKOsL
	 Lea/GZmsawipy/pyIPlby0YjmLrgOoUp4UZw1Nr8Fo6foUBb+HYuZYI4pZ5KY2/o+z
	 HHnnEd/n+xJA9yfQypNhqOuHcZ4uu/1sVTimUlFS8RtuImNe5WeNrf4T8wgytCd54/
	 klNE1gCmwFaiFFK/YYANvG21vT0EsUxbnKQXr679ZGE+qyZyxPCHVRtHRz5T3Lw/tO
	 ebCj8XwTJqRDbtkRimG4wmidaTSBeEz0L07ERMBqim7eKbm1UoTXyalq25ac3DgtPb
	 UkTVVIhg9Pzuw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-308ee953553so17010371fa.0;
        Mon, 10 Feb 2025 16:47:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2cEAeUS8W9MsxS1ztTnR1XeTcAGhu1CG4Kbu1BECJ03VpaNoh1KCh92sQTbhOolSgvPu/GwUo4q/Gmto=@vger.kernel.org, AJvYcCWbFeGdm195bx/9bNghWbP/z70D+5jjWIbQsuuV/dl8iV3cA0xsdWf+BKA9IBUNsm991H8/A46mfF/LeDxh@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPt/GRFVf/7iUTrZKTecisJVC8j5zweZs171hq3XmvTYyF+cZ
	NnYSqZin/MTtiHHh+C/wX/1Np2AIpkElNVOROurx/AVfQxG0d8vw/iQob1p4Br69rhOcRdMVq5Z
	g/se7i6KStvjPTewWU/VRA15uUGs=
X-Google-Smtp-Source: AGHT+IEF94kl+HuFqhqZyJF4k12riyy8vRxRUkt8s9LvLbCLbZwV+87J+Qv3tWfHCQfOPNY6q1VjZNQnp8K6v9HVhWw=
X-Received: by 2002:a05:651c:2226:b0:308:f53a:ed34 with SMTP id
 38308e7fff4ca-308f53af039mr16029961fa.18.1739234832238; Mon, 10 Feb 2025
 16:47:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
 <CAK7LNAQBBKfSwQ=z3yBchg--gcrAykWz6xvpAYWKse9R9g8KVQ@mail.gmail.com> <Z6oeplCypN825pyR@bombadil.infradead.org>
In-Reply-To: <Z6oeplCypN825pyR@bombadil.infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Feb 2025 09:46:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT48101gZzcHF3U-VL1i0Ekns6zXKpNDb3MnScoSNr-kw@mail.gmail.com>
X-Gm-Features: AWEUYZlO8WVOfuZud4umbLAHHUCz-8Dphu2RHwzMTd2fI6VTdW2KiDyFEVqFXbY
Message-ID: <CAK7LNAT48101gZzcHF3U-VL1i0Ekns6zXKpNDb3MnScoSNr-kw@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] kconfig: Add support for conflict resolution
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ole Schuerks <ole0811sch@gmail.com>, linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, 
	thorsten.berger@rub.de, deltaone@debian.org, jan.sollmann@rub.de, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 12:43=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> On Mon, Feb 10, 2025 at 02:00:52PM +0900, Masahiro Yamada wrote:
> > Thanks for this, but I have no plans to merge the SAT solver.
> >
> > The reason is that my future plan is to move toolchain selection
> > to the Kconfig stage instead of specifying it statically from the comma=
nd line.
>
> That makes sense.
>
> > This approach was suggested by Linus [1], and to achieve that,
> > the shell evaluation must be dynamically re-evaluated [2].
>
> Sure.
>
> > The SAT solver would likely conflict with this plan. At least due to th=
e
> > significant amount of additional code, which would be an obstacle.
>
> I can't see how the toolchain selection, if set on Kconfig can't be
> leveraged later to enable / disable the SAT solver, however I can
> see the amount of code shuffling incurred to be an extra hurdle to
> address and a preference to leave that for later.
>
> In other words, I susepct it is still possible to evaluate to
> add support for the SAT solver post toolchain kconfig integration.
>
> Thoughts?


It depends on how the dynamic shell evaluation is implemented.
This is not limited to bool/tristate, but SAT solver only works for
those two types.




--=20
Best Regards
Masahiro Yamada

