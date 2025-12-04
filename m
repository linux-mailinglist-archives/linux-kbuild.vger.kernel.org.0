Return-Path: <linux-kbuild+bounces-9988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6D7CA3822
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 12:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7724C3007B42
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 11:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661342E7BB6;
	Thu,  4 Dec 2025 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXJapIvo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D942EA73D
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849466; cv=none; b=G5CtoTmDlSsCnre+Z1eRGMkSs2+V3ZQZ1ZJDGkMPiMRnpKL+ggLvq0VjGfJdwkGk+icKMWCz+iY+/w3M+brzmGUuQdjdU2FPA/vZepqyLuWZa2x7aWytq9wnAUoYpXLUyz+64QGXbsF1xjnViIC2kRBP8G/HrZkDDrF6W1eP988=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849466; c=relaxed/simple;
	bh=pphVR1kisW1rn59IwFVxryo0TAPKvUFI46MwfIkrRm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KX7Nx/wzdlljtAPKDV5fYT/iOn5ntUIEsSFKcqM/7LXBU6aJNu9dNwrmGdlNbfYq+7B+IiP/och9YgtHTlnieN0TtZDGBugcDPY88aHEWuIpBggASGrnnOvi/Bcbf6v40LVdsahfKpbFEgmtboaKWs5KB2brScQIrm9wd9/3HkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXJapIvo; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7ab689d3fa0so83024b3a.0
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Dec 2025 03:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764849463; x=1765454263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy74VhsBG2iXSHso83Jci8BnfjXIZJpeGjIa5hx2ujU=;
        b=jXJapIvozbiUJjPnYGgeVVbEfCNry0N6v6zsU6E2aA8NPhHuwlVisHklOBe0v/LcYa
         tmu9x2IwgahU9tryhRm1Jx3YOwXYJkkie1VmqtCp2Vul548q4Gg7+18bH0rblgSwHi2q
         Z+PXsskav1u1ji027gEI7wLCPMx+9cuSdeNprFDx/T99auJinttibRfwKxLtMP2GJBLH
         BblnptLNIFv7QtzanDpBTLgwvgF7W3ukuXSMNgJWfSkmBOzF2aQl9OpAfrBgtqANuN+u
         +C8W1Ye0XDgTPJfAfpcFB9QwLLh9Jj8hwB6Bw6tBepE+Wbt9vuJXq9wBnXcGGCNdD+ic
         LTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764849463; x=1765454263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jy74VhsBG2iXSHso83Jci8BnfjXIZJpeGjIa5hx2ujU=;
        b=DdSPnF3C7zAvORx2oi0qKw+z/VinSg/SXtz4zKT7l5dhaZHGN741EUKbzvwhN8BSCD
         z5YGMnkOscPIux1L4Zxj/iwxaWOSdMrhrot1YQuhZJVkrMfH2HXR8CocI8qd9rNi4GDx
         yFp90w+5E23P72TNQg23axcPDy60wp7CW8YUkYetK33M+L6p9YTKyA0Gan7I8szY7GmZ
         oVJWMDQ39Sz3IFrwd3nh877lDvrL/X3RZIvQ+6NjCODERpP+XJei/5QAjBhEgujpv4nh
         lyi3XlAn96abs8Xc/fjZoBaKmFyjI74yyO6Z9hledCJW12HXuO6+68j86lUbPlZHBZdQ
         malQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeGnJaNIdWKBS9PBkcLm5Cb2+qGERT4R7OSNKCAPr4qciEbTwvdU7glcSngFmwPP5amxuX/Oq88fBMNIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHkhn2XHJ7M/38xKW1YZ5CIxK3wZdBJ0vqhYJpjhi7DE/jorM4
	jbAvVPgRTt2jxx2phuClGVQ4/cyW8k7jDdhyVCvut7/FMYbpfTYCQ29ct8ocBIkdTIVyby+aQZk
	YqrCz2VeP4q3q2KCDHRvsiTYTvMUU9O0=
X-Gm-Gg: ASbGncsIpJe2oCoh+S0XJggI3m9eBHkSYGdoD2T4I9YiiBw0BM6amH1kOzGJxQIIu2V
	HePu8fRJuH8iIrG3v3msb2TpiU9t7rXwk1NXXo3Z7gFlkAFvU3/jC+YViR9mrG2ClWgQWb2hes/
	MIJxss0B35YG4Kw7g1jDJD8XygJwi45pq+GoR5dvdz4nPIN6paYz8Jnsqgl+mNGNduanWWlvAzI
	kFpDLPmCbCIfE2TW6Odz1ENnqtk+iOfQtxDOPATbNZsxb/jrvAdUSTnq2fPnL5R1UpsAtEYWaVS
	QFHophmIU9wKnHn4HpbiVJhoA2xRv/Pe13+w5yjGNGiCwHoWehKqzMK990DpGCdDgdChpWoDegQ
	RCLvOIea92JmkfA==
X-Google-Smtp-Source: AGHT+IGeyoDrjBm9pUlwr3L1lIhuYxiVR/nMKBo3Q8beIteuq1z76e1BQfFIgP3nnV9ieQFXYxZbKA8xY2mkFTTQZGc=
X-Received: by 2002:a05:7022:49a:b0:11b:98e8:624e with SMTP id
 a92af1059eb24-11df25f6eb3mr3361650c88.4.1764849463230; Thu, 04 Dec 2025
 03:57:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com> <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
In-Reply-To: <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Dec 2025 12:57:31 +0100
X-Gm-Features: AWmQ_bndz8ZZuXxUaBe-jxDMfOtEPNEq7y8MIf5_IqbpeKBzcbrA6kGhc4U4gvc
Message-ID: <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Peter Zijlstra <peterz@infradead.org>, Antoni Boucher <bouanto@zoho.com>, 
	=?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>, 
	Arthur Cohen <arthur.cohen@embecosm.com>, Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Josh Triplett <josh@joshtriplett.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Right. Earlier I also proposed using libclang to parse the C header and
> inject that. This might be a little simpler, in that..

Yeah, that would be closer to the `bindgen` route in that `libclang`
gets already involved.

> ... if you build rustc against libclang they are necessarily from the
> same LLVM build.

So currently there are 3 "LLVMs" that get involved:

  - The one Clang uses (in LLVM=3D1 builds).
  - The one `rustc` uses (the LLVM backend).
  - The one `bindgen` uses (via libclang).

If that is all done within `rustc` (so no `bindgen`), then there may
still be `rustc` vs. Clang mismatches, which are harder to resolve in
the Rust side at least (it is easier to pick another Clang version to
match).

For those using builds from distros, that shouldn't be a problem.
Others using external `rustc` builds, e.g. from `rustup` (e.g. for
testing different Rust versions) it would be harder.

But I mean, anything approach that gets us into a better position is
welcome and I think requiring people to match LLVM everywhere should
be easier now that distributions are starting to enable Rust (even
Debian).

We have been talking about this since the very beginning of the
project -- e.g. I remember Wedson and I talking to Josh et al. about
improving the situation here (in particular, talking about integrating
a solution into `rustc` directly) long before Rust was merged into the
kernel. Even on things like a `rustc cc` or `cImport` like Zig (but
Zig moved on the other direction since then), which I recall Gary
having opinions about too.

There is also the question about GCC. A deeper integration into
`rustc` would ideally need to have a way (perhaps depending on the
backend picked?) to support GCC builds properly (to read the header
and flags as expected, as you mention).

And finally there is the question of what GCC Rust would do in such a
case. Things have substantially changed on the GCC Rust in the last
years, and they are now closer to build the kernel, thus I think their
side of things is getting important to consider too.

Cc'ing Emilio (`bindgen`), Antoni (GCC backend) and Arthur (GCC Rust)
so that they are in the loop -- context at:

    https://lore.kernel.org/rust-for-linux/20251204111124.GJ2528459@noisy.p=
rogramming.kicks-ass.net/

Cheers,
Miguel

