Return-Path: <linux-kbuild+bounces-10003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB14CA51E6
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 20:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE20A30D424D
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 19:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CAE34106E;
	Thu,  4 Dec 2025 19:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ipWSo0gS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B72F49EB
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 19:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764876570; cv=none; b=suwGQ+JSo1yEzp8SN0r5e4m2kQ1eSMOaMc2NABkxqrdU+ZwDq2w+EeCAiBW+H8EqDGe8yKkYpytDsAnf/SVSDaKVUyQhmPZs64kxovEshzjOKbnD41NTM7VGAXbheWh+q1liljpxG+f/jde55MR1WigaWKPvuHM4JStlQdX/o68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764876570; c=relaxed/simple;
	bh=li2jOPCpnZmjfOxkVB/u3Ntjt/9n1Mv+93gAuK1nZY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J22RMfoF0HqHz6HntB+yo6gzLZHd2jLV4la5Yz89estdnMGXSTQFNvBxNmN8nqRl7R9lLF+u9t+Ad/gHHwlol6qBc2VaOWxphOMiAz7q2tkjWzpR136JES6SO26jBvggL68vNbZYEUhj4zQL+vWF8/V2RkXmaA99NR/Cp1yUSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ipWSo0gS; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4edb8d6e98aso83711cf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Dec 2025 11:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764876568; x=1765481368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li2jOPCpnZmjfOxkVB/u3Ntjt/9n1Mv+93gAuK1nZY4=;
        b=ipWSo0gSioiPIkwLQWZ+OxmCocZz9Kgi19nrEX/PAHqsxkhaW3pYGJCqPmKOY3JgeX
         H6NMsRP7053g9Q2T048rWAC3e3zkDQ/5jIw2fltcFL74BpER8PQgLtvMtCK/D8iQ7mQ0
         pweOtRCVbbMEAKIZ3Ws9BIG5Fs06Ohl1ZnmJjS8yT0JyUIoQEUA6ZpceZJ63AR1NStcB
         pOcqq7Rblu+SQraVHx/6wTVFvzcUk3+mMsrtmt3R/73SKpakT5bbYjMPG6xQPniYa9qS
         5OViEWqizWLyCDAYA6mnmM77pi1zF/2ppdtvZ07QmmTGKeCQnjqKyOP4JQbQMUgR7Psl
         MvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764876568; x=1765481368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=li2jOPCpnZmjfOxkVB/u3Ntjt/9n1Mv+93gAuK1nZY4=;
        b=IWCwhjrPz2vy8pdQ3aWXukTIpgsHSfGMcZD5s0JOkMJ0d1aA8LQc8j9z6+ZsH7rFDB
         s/7KPkZ+4Q6SqjDLhcyJho9Ok7E0Hcth6+O9TgVWX308E1HZOcER3wMv21lmAFOrU8cv
         FII5tuphJQD2at2FleCubRMHWJl38z0GMMkP1kngRhHjWF+VoiQfNdy/Gtc/RV3vAvrP
         BVXotnbw5IUFtclCQynIMR6fAzv+Xj5ASkJpMFoUzd5f8ZmVNNQTq+1/rgD34fuX6/sf
         LQnVZaglKnmeXKW5wXSLb2gNLgnZTm6tyxNKK5tFZN0t2mi/r+4uHHm3F2L8algpJroK
         cX+A==
X-Forwarded-Encrypted: i=1; AJvYcCXo5E+iFMismpGfxv910zly2Qh71bu1cHv8a2U5IUIlKXhR4YoFcYVekZAZze2/aiZy1PufP0GRgQh6ARs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0RqczUgmxIB9/0dbqp2I6LY8uKi45lmrurl0Al7EdWVTKm/mL
	q0QnkDD9AoBbG1ahwJeL1CAa0UL9nr2ltzZ9E4XOZDzUjS0df2dLgY0ba3UzegU5qZYPvpOycn/
	kw+AgRQyolUbgve1holG7XJsW8NEhe0BZ5yHvUeaP
X-Gm-Gg: ASbGncsaCJeIkBmCuiNTpsDD9CzDyX1mneWaWiZmIdbO8g4qQrvxL7lYW01z3wD6w7i
	+VBv1Kk4eqht+XmncZvOfb/k8WyUM8UhT5bkDnIFPyzpgeDHohnw5KHZMxvYKQ1w9lojTUKM1cS
	nIZZiZGrXfcducrA6AiKcO/rPI1Fh556+2jVZJu9Djuqlx/uMLF+W5VMLG++K/XUic8wJcPmAXq
	GY7VkMugr01zmflgUqRYF4cbBwEhZihFqDyG+DCIMpNQiAxq0kISf+cd0A6TmIszq6KHZ8XNNg6
	Tmut1URPaS9ZiLMKriSyo0lKBA==
X-Google-Smtp-Source: AGHT+IG/7kUZxd/9UMd9RxOWK7oRJw6LsWkyhbSwzHRq9dv3XGK3gE0ZwwYu8Q59dnHZWlQ+QWACJNmSaDdEdt4GFj0=
X-Received: by 2002:ac8:7d91:0:b0:4ed:ff77:1a87 with SMTP id
 d75a77b69052e-4f0310036bbmr1019101cf.19.1764876567093; Thu, 04 Dec 2025
 11:29:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com> <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
 <dd5856a8-e120-4884-8828-9d0c9edc60f0@crisal.io> <aTGJdlwMRxGg2iZ1@google.com>
 <20251204142742.GM2528459@noisy.programming.kicks-ass.net>
In-Reply-To: <20251204142742.GM2528459@noisy.programming.kicks-ass.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 4 Dec 2025 11:29:13 -0800
X-Gm-Features: AWmQ_blF4lJt3BfO2o2NOJRf3_Ss0kAS-vrqLdfp0qFcfHcQVmwUbXFySwWbsjc
Message-ID: <CAGSQo01Am_rNeZqnqZU3hY7SwWG=dTHtzcksPSHUTiasgex+cA@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Antoni Boucher <bouanto@zoho.com>, 
	Arthur Cohen <arthur.cohen@embecosm.com>, Gary Guo <gary@garyguo.net>, 
	Josh Triplett <josh@joshtriplett.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 6:27=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Dec 04, 2025 at 01:15:34PM +0000, Alice Ryhl wrote:
> > On Thu, Dec 04, 2025 at 01:49:28PM +0100, Emilio Cobos =C3=81lvarez wro=
te:
> > > On 12/4/25 12:57 PM, Miguel Ojeda wrote:
> > > > On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infr=
adead.org> wrote:
> > > > >
> > > > > Right. Earlier I also proposed using libclang to parse the C head=
er and
> > > > > inject that. This might be a little simpler, in that..
> > > >
> > > > Yeah, that would be closer to the `bindgen` route in that `libclang=
`
> > > > gets already involved.
> > >
> > > Yeah, so... there are existing tools (c2rust [0] being the actively
> > > maintained one IIUC) that in theory could do something like that (tra=
nslate
> > > the bodies of the functions from C to Rust so that rustc could consum=
e them
> > > directly rather than via LLVM LTO).
> > >
> > > I think the intended use case is more "translate a whole C project in=
to
> > > rust", but it could be interesting to test how well / poorly it perfo=
rms
> > > with the kernel helpers / with a single header translated to Rust.
> > >
> > > I personally haven't tried it because for work I need to deal with C+=
+,
> > > which means that automatic translation to Rust is a lot harder / prob=
ably
> > > impossible in general. So for Firefox we end up relying on bindgen +
> > > cross-language LTO for this kind of thing, and it works well for us.
> > >
> > > If I'm understanding correctly, it seems the kernel needs this extra =
bit of
> > > help (__always_inline) to push LLVM to inline C functions into rust, =
which
> > > is a bit unfortunate... But this approach seems sensible to me, for n=
ow at
> > > least.
> > >
> > > FWIW Bindgen recently gained an option to generate inline functions [=
1],
> > > which could help avoid at least the bindgen ifdef in the patch series=
?
> > >
> > > Anyways, it might be interesting to give c2rust a go on the kernel he=
lpers
> > > if nobody has done so, and see how well / poorly it works in practice=
? Of
> > > course probably introducing a new dependency would be kind of a pain,=
 but
> > > could be a good data point for pushing into adding something like it =
built
> > > into rustc...
> >
> > I already tried c2rust as an alternative to this patch. It works okay
> > for many functions, but it's missing support for some features such as
> > asm goto, though this is fixable. But a larger issue is that some thing=
s
> > simply do not translate to Rust right now. For example:
> >
> > * Atomics use the Ir operand.
> > * static_branch uses the i operand.
> >
> > neither of which translate directly to Rust.

I took a shot at `c2rust` as well, the summary was that `c2rust` was missin=
g:
* Asm goto support
* __builtin_types_compatible_p
* Deduced types
* __count
* _Generic

I was adding hacky implementations along the way to see if things
could be made to work, but the %l and %i missing in Rust itself that
Alice pointed out were not things that could really be worked around.

I also think that the bitcode-based approach is more future proof -
the kernel may pick up new C features that `c2rust` hasn't yet learned
about. If `clang` is in charge of generating the bitcode for the
to-be-inlined helpers, we don't risk any desync in terms of what
features are supported either by `c2rust` or by `rustc` relative to
what's in use by the rest of the kernel.

>
> Right this. AFAIK Rust simply does not have feature parity with inline
> asm. Them having picked a wildly different syntax for inline asm didn't
> help either of course. But Rust is Rust, must have terrible syntax :-)

