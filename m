Return-Path: <linux-kbuild+bounces-6164-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD65A62C3A
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 13:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D95B7A3CFF
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 12:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BF62E337A;
	Sat, 15 Mar 2025 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxKpyKlx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFF11B0F2C;
	Sat, 15 Mar 2025 12:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742040159; cv=none; b=JBFpyFfAkvMS8PKSrS3wEcpDBybAcmfOkDViai9Oe67GvFS1IvWSY/A8YTW92SPqy0aJGIlLzcREGEJYUF8BEvR4PIiKaNugB3xN11DHUVjb7rXqLuzvrl0FEuU7CR+U9HaB/xxfbjC+gbVzE+BcgQPXKwInA9OIc56cKOREZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742040159; c=relaxed/simple;
	bh=ZshsBfDgmQQXxn6Zq2mwSKQ4py97/19kW7WSg6nt5DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ctRS/IOkjhlYkamEZNVP4XoYWwmlytulx2DPGEg7WPKK7a3SpRTay/Q28JZxvYALRAcgXILRKV4WENAlS8zLayjUijphiA5cebsCnvwpIKuCZ3/KuFyBUZYKRUxwLYRJacVLmF8MRJQ/h1PIfsVGYBoQvi3+C0FsA4pV5AsHELY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxKpyKlx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF9CC4CEEE;
	Sat, 15 Mar 2025 12:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742040158;
	bh=ZshsBfDgmQQXxn6Zq2mwSKQ4py97/19kW7WSg6nt5DY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PxKpyKlxovQLYibeNpu7gPR1G6ZSgOR3XZni+xyZyXOCLsy56xy0xVkdANxaR87fF
	 xZ5MGL5gP1yfFFV6/tNtOaJR8vf2D+I3NBwNnraik2zccDZKg8rJ9ruejlGZ1jKaRV
	 F+afOe+juvGQ3CamiFioNwDvGNq4ZeYaCXOFiKtJUDzbWQAHbvX6gElFj0tEbJy8ip
	 jxJdboYk6xIe6RVg1GHsnDJHO2KzA6sSLDOhHxkkwmvthO7WCneWp9d1fY1zTDcmpQ
	 TaisCHcw9XcP9pI5ITVlY/LTQryigXLBVaIOpD0D/pjsFTFfkgCxlskf6ODIJfhMvy
	 0mPlu5tRcKBeQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54954fa61c8so2730875e87.1;
        Sat, 15 Mar 2025 05:02:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAgo4gG7lVs7Ex97DmyQZMuPN4tSAlF4pUpXueBOpenMJbeiwi25TnXWTGPFeZQXcBZo/wXFpGaywKz0Ae@vger.kernel.org, AJvYcCX3rHeAwWT5/+XOS0AE3wy9ZV4R6WP+ryroMwcsZur2Ohkpu/D8zV9ec5MaJ9J6+S5sInqYakErUFA=@vger.kernel.org, AJvYcCX73VbuNR0vrQQRTdeafeg39KiQX87q7GINgyml5LMfcYhe3iImVGXQkAPsMM3pICNxVClJp47CSmtbTlSz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6GV5GsuFNOuMCSJshpZQGIXv0AV8cAtT1qo34QmM7S3JgNfVA
	pLqorHuJtKTtSTlxVQvrCqyFdsx6Sd1QSggpwterpzNIet99tAOVwO6ENMVQ6p/VOvWtm1TtS/4
	t4RMax711DZPiTdd7yYeR/zFlTFw=
X-Google-Smtp-Source: AGHT+IEcM89STBGsgVH0T8F/WmL6+RVisVeAhVW5hkRP6/aoDX4/WRx+2kapYi+yt9ee24n1pOPToUcniZucvqMH4s0=
X-Received: by 2002:a05:6512:3d29:b0:549:3b4f:4b39 with SMTP id
 2adb3069b0e04-549c38d07d4mr2122012e87.10.1742040156908; Sat, 15 Mar 2025
 05:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net> <20250315113400.GBZ9VlqIBVsVdzlRAb@fat_crate.local>
In-Reply-To: <20250315113400.GBZ9VlqIBVsVdzlRAb@fat_crate.local>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Mar 2025 21:02:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+U=FM=vS4jSPG1Jfn7e0sD8AgSvjGqTVK0s27t0soBA@mail.gmail.com>
X-Gm-Features: AQ5f1JrSCVfnKBQ5tc8_eDWdQzWiJbV0UKRlUsjTEffjkmqj704r67_zDguqv9o
Message-ID: <CAK7LNAT+U=FM=vS4jSPG1Jfn7e0sD8AgSvjGqTVK0s27t0soBA@mail.gmail.com>
Subject: Re: [PATCH 0/4] kbuild: make all file references relative to source root
To: Borislav Petkov <bp@alien8.de>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 8:34=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Mar 13, 2025 at 04:59:08PM +0100, Thomas Wei=C3=9Fschuh wrote:
> > -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> > Other references, for example in debug information, is not affected.
> > This makes handling of file references in the compiler output harder to
> > use and creates problems for reproducible builds.
> >
> > Switch to -ffile-prefix map which affects all references.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > ---
> > Thomas Wei=C3=9Fschuh (4):
> >       kbuild: make all file references relative to source root
> >       kbuild: doc: reproducible-builds: drop section "Absolute filename=
s"
> >       x86/boot: Switch to -ffile-prefix-map
> >       x86/boot/compressed: Switch to -ffile-prefix-map
>
> Btw, I don't see why those are 4 patches - it is a single logical change =
that
> converts to this new compiler switch.
>
> So why are they 4?

Good point.

>
> Masahiro, might as well merge them into one...

I'd like Thomas to submit a single patch.




--
Best Regards
Masahiro Yamada

