Return-Path: <linux-kbuild+bounces-9994-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82355CA3C04
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 14:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76D46300D01B
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 13:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2DC33B6FC;
	Thu,  4 Dec 2025 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eEfcJc7r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B999434321F
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854138; cv=none; b=BFGTOK1x3bKiYnaD6NvtABhpibj/0iWIU0nBAImHKIVLFF55Dm1p0LaqlBm8DO1o3prBMwSiCpJrnwtAA7b4BI/LMkgiGsfCUEcsnxGOW2tvaPUOs2i1COPRiFtYQykBW6k9e1DAOQxq5UPKY6bTs1SHyHGVWosNqkzZ1RJrq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854138; c=relaxed/simple;
	bh=Wny4M191Yr6Td48Z53labtwrelyi+1dAudOVsu2AK4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b5X21ABYGYYB2rPI/pfybzrkIDuOBgkomxnB+qYxu8NeYFBWjZg9pcEB/B64KfNiPHQS6Lv3ptfv+DVFSjo7G81FzJHZOHfGhoW2R+HTJIBGkvfIdCKf4ytk0MweXom2YDUYEWBDUGt8mKDeZpssNxSHkQIGi9cmTa7g6ZY5Qms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eEfcJc7r; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477771366cbso6266775e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Dec 2025 05:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764854135; x=1765458935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wny4M191Yr6Td48Z53labtwrelyi+1dAudOVsu2AK4M=;
        b=eEfcJc7rhw0cV4AVNryfwcBVWVzGB9WlKaupTm7Da2GPKv/F15Drx6dff9i7hmhXux
         91ywzr7ehL8Jn8Cut8F//aFCM80hZOtldydSRH4RAqYCnGEinGYUCxy8JUIqMrXsoZlW
         BmIdCP9sV61gj9hEiL+kVcqoRbMxuM7+ZgYs3O7Xh37HoRrDiIV1wmR0BCWgRI+008zJ
         w0zBqPuyuZV6kQiL9aHMLGG3vtrKBmqZlKEJKruCOG0Uo1AcFdjC/i1fb5zUZ2rzfthb
         n3yegWPw/vgiNu1jFIejjQreRJlLUrkazHluobEuyp8VEpe2L2LXEpwuK+6A1DRuq7z0
         EJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854135; x=1765458935;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wny4M191Yr6Td48Z53labtwrelyi+1dAudOVsu2AK4M=;
        b=PP960z1nnQDUwLGX0LFQCIPOCJdBOegcrFmkkG1SN5Xp7eT0WTz+fx7WPO88nbh2T4
         EjIxAttrmXNIeP17NbUIwxGKU+FinY2NKjXsh/8bE43H+yH7j2siwCs3+v8uEuHtcEPC
         FCFtonYpaJbfcWQ/zvp6Z4/4YHcLTpwJiXEVSvdPQWAWuXWx0ijbSYtVZ/z/6QDtVIlN
         fzlv55IZ3KcHd9HjH1oFzNt7NTIQipZYOEVGUZ/4CgtKtG3Z2AXIVZBwmV4/F/YTfrw6
         4qz6+fpycsW1LN9Z312YeuInzqdqWR37JvnPsYE2Emjsyj9HZluW2v+aMCuwetSgs7Cn
         Ka6w==
X-Forwarded-Encrypted: i=1; AJvYcCUk4mc3waG6prPxBowknXJp/QOcpRi3hAoJfAYDESg6p0LmBsVEeKltm8ysCZM9JxCqY9si9PIfPI6YiRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkqOaX3Hx4/S/IVwRdJw0848LhouVwXVWY4/w8X42qSFjpFnri
	NvViYCiXzcYFONfQnCyVop6xLfXEKT3YsF5KO/2A4aPsxsJjwV00GT2kimzTuRICTl11bbU2OLs
	600uPyABsP1SrFjG7lg==
X-Google-Smtp-Source: AGHT+IHhq1jpZSgsrG7+u70UeMI118GpL4lyrcZgSJfzAV0BpquOo2d1tIrYUXW40rz39aPBfrTMkT06vKIZZ8M=
X-Received: from wmbjj12.prod.google.com ([2002:a05:600c:6a0c:b0:470:fd92:351d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e89:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-4792af485a4mr64437335e9.35.1764854135213;
 Thu, 04 Dec 2025 05:15:35 -0800 (PST)
Date: Thu, 4 Dec 2025 13:15:34 +0000
In-Reply-To: <dd5856a8-e120-4884-8828-9d0c9edc60f0@crisal.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com> <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com> <dd5856a8-e120-4884-8828-9d0c9edc60f0@crisal.io>
Message-ID: <aTGJdlwMRxGg2iZ1@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: "Emilio Cobos =?utf-8?Q?=C3=81lvarez?=" <emilio@crisal.io>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Antoni Boucher <bouanto@zoho.com>, Arthur Cohen <arthur.cohen@embecosm.com>, 
	Gary Guo <gary@garyguo.net>, Josh Triplett <josh@joshtriplett.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2025 at 01:49:28PM +0100, Emilio Cobos =C3=81lvarez wrote:
> On 12/4/25 12:57 PM, Miguel Ojeda wrote:
> > On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >=20
> > > Right. Earlier I also proposed using libclang to parse the C header a=
nd
> > > inject that. This might be a little simpler, in that..
> >=20
> > Yeah, that would be closer to the `bindgen` route in that `libclang`
> > gets already involved.
>=20
> Yeah, so... there are existing tools (c2rust [0] being the actively
> maintained one IIUC) that in theory could do something like that (transla=
te
> the bodies of the functions from C to Rust so that rustc could consume th=
em
> directly rather than via LLVM LTO).
>=20
> I think the intended use case is more "translate a whole C project into
> rust", but it could be interesting to test how well / poorly it performs
> with the kernel helpers / with a single header translated to Rust.
>=20
> I personally haven't tried it because for work I need to deal with C++,
> which means that automatic translation to Rust is a lot harder / probably
> impossible in general. So for Firefox we end up relying on bindgen +
> cross-language LTO for this kind of thing, and it works well for us.
>=20
> If I'm understanding correctly, it seems the kernel needs this extra bit =
of
> help (__always_inline) to push LLVM to inline C functions into rust, whic=
h
> is a bit unfortunate... But this approach seems sensible to me, for now a=
t
> least.
>=20
> FWIW Bindgen recently gained an option to generate inline functions [1],
> which could help avoid at least the bindgen ifdef in the patch series?
>=20
> Anyways, it might be interesting to give c2rust a go on the kernel helper=
s
> if nobody has done so, and see how well / poorly it works in practice? Of
> course probably introducing a new dependency would be kind of a pain, but
> could be a good data point for pushing into adding something like it buil=
t
> into rustc...

I already tried c2rust as an alternative to this patch. It works okay
for many functions, but it's missing support for some features such as
asm goto, though this is fixable. But a larger issue is that some things
simply do not translate to Rust right now. For example:

* Atomics use the Ir operand.
* static_branch uses the i operand.

neither of which translate directly to Rust.

Alice

