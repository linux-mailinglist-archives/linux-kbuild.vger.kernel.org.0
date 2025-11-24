Return-Path: <linux-kbuild+bounces-9797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38DC7ECE2
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 03:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7D784343982
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 02:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF21F277819;
	Mon, 24 Nov 2025 02:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpqlGW4Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B853274FFD
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 02:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763950373; cv=none; b=h2l4+h7yA6qMqX8XraHZb2VeXdY4RwuTv5M1WqBZmwjtIc+0MAAGK9Lz9T0f8vPPO79ldhJAOJCvwec8aV5CLFPNt2DyYNvE+x99eMRgWUmsrkOSAkLPho02Ef9qi9sXiFpRB/EjDlYoS+13XFp6QJZiiW1xvDb/wRAKw9S2dnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763950373; c=relaxed/simple;
	bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sy3jjDi+PZH7ZEAdcFugCIS4NMQomVB5n7EJ8KwiqsIcMa+5VeMedWpo1vKIXrPzNF91RSPdo2idsBShrw6fsFRSUoPSTgsdSyPuRrivX/SPixhCVwrmJGT/Jg4nZ0UhiWymAU3Q/dFqnlayMKhCDRiAkCasv8FDgXNhBe+lCWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpqlGW4Q; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b997ae045b7so370203a12.2
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 18:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763950371; x=1764555171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
        b=dpqlGW4QkXV5LFYgY3aD7dk1ofkM7/Q1sNjb5+K1sDKF0Pw3kXD+ZPgiprs+/j9bHD
         JuasOU+m6LcaIiEYS1/zFoKqWCvVA/NoFtbgJI2GZHyLCpnyrqS/+8/oJV4H6uVIedoX
         tk8/REzmmRKPi0pT/5uZeIACumLuvKbUO1rQqvcIMO26ZkYuvHGUa+j3b91iGSCoZQDe
         tAbyx0UNk3j4OVynDs3z0xo85T198S4mLGrT7TyDEn4ULLoQCNQ5v93lpWI6AFdGggpZ
         9wRpi/7ja6XfTWdtTJA8Enz4LiDU6x8QvkFko0ypEsnQBPcjTuBToS9Z8VdcurBE1sks
         gyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763950371; x=1764555171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVUZ9mJTUK8YR2bmVzHBCS1tZ00dVVbWYZA1eoMYxug=;
        b=rTbsIxv8Y0oH2qXyG5uAdjV9X0T++YFPBJjkP2fDNzBbiDIcHaNa2HntUKawIAN97A
         dHzupPFh5axsjk+cWbq+IOh4CCMv8gR1R3DoR2mWB5YAvsIVpyqp48UKIHGAO1tjudeV
         mp1zAUpuIrzap8KZ2w3ixANoawbDwDX1JaHSA7Uwh28PbxzQ5x9muHZ8j1A+h8pCDVgc
         4ZdOqNTpyfXSaJH0rQ9xAS91asfIj1XHyJ+ALZpPd7vvYevGemnKTKF8iultgu3zcQfJ
         NFBmTqmwk8NyJGORpnRw/JJXjx92hWZc2M024HwA6KOu/h76AUG7kqTy1kpMLX6D3xct
         USgg==
X-Forwarded-Encrypted: i=1; AJvYcCUidYrHPIom+UD6xCj4OEBMEh+DEZgp131GyrJStZK7k6+ZSur0JlAknOFeMu7ppMyogaxfg5y9yFyXEAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynab9j0oa+/Mjkz5sB+Q4XNp7PadvbB3w89E69CmMp6M0WxLy2
	La+h80afad6dXZMtR3rb0bKvylRib1U93+Jx4DG1VQ50tq/MvwhCtnCYyHYqZyDAq/rpz+HIcpN
	Q8lZ4BUX3rH8A/qzs8k5RCEvfcctyCVk=
X-Gm-Gg: ASbGncu2tGcNirNbggHcJ0tqjUrCneY+t89qZZQE2qWlKiSHEsISnnevOliw50c8GJL
	j2+NmzjmizRBa47BYl/xsJu2HZPMKZS4fj4n+ps6Yw/NPW8hfuC62PbckkuzTPhGLhIZSeA6zmd
	U7bz/LOQ1B1MZKwuIeqripGiIJAT1blGR2hGxaVbPma+dgRRjg9SweVaCoHvokpZ8PZQvH0U6JH
	KGRQ4AmyYJ4s/+J2JfDNHQ2jEVPb6cGvU2JgK63ME4GyKcvC93nNFo19slJEJ9oguFGRc8G5c2X
	KVI/75aV3ROIDQU1ueGP0jZZVjRHCMbuxI9dcJrOSUmRmoDsLqVfBIHsfo52s5DhOXVEj2RmTSY
	lBgnL7ZRcn9yfKg==
X-Google-Smtp-Source: AGHT+IHMCycU2281yPoFBzJFehZlNjB/ZN9Hjei9e72GKfP8tgd3hQzDk2CQxnkWDDEZel2Cwvh5/pcBmY7xnByerRc=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr5187728eec.2.1763950370685; Sun, 23 Nov 2025
 18:12:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com> <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
 <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
In-Reply-To: <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 03:12:38 +0100
X-Gm-Features: AWmQ_bk9WXKruglIV497fNSKDmodqmzo_KTty7zsHwpLGLPWQoinN8LfqHHSZnM
Message-ID: <CANiq72mZ4uLqSe=WvoCtUR8cEiVpXBg2yB-7oFPf9jyu=QxS6g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 3:05=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Sorry, I may not have made it clear. I mean all these changes.

Ah, sorry, I missed the "conditions" word by reading too quickly and
misinterpreted it, my bad.

> I had some contributions in rust-lang/rust repo for riscv64 (PR #131955,
> FWIW), and I'd like to be added as a Rust + RISC-V Linux maintainer if
> that's okay for you guys.

I think having people explicitly listed like that would be great (e.g.
in an `... [RUST]` sub-entry to the ARCH one or similar, like we do in
other places), and it is a good way to contribute to Linux. I was
thinking about it for other architectures too. But let's see what
RISC-V maintainers think about it.

Thanks!

Cheers,
Miguel

