Return-Path: <linux-kbuild+bounces-10438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6161ACFE111
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 14:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18E23300D4BB
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 13:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23878328B61;
	Wed,  7 Jan 2026 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lo9wDIH+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521EC326920
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Jan 2026 13:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793362; cv=none; b=oN3bB3+x4f5sqH2CBwxQ4WTLE2KLog1oGBgB8cHC/Z2yhhAVv5Vhm3D4PvwwV8eAmWXu20ZkZiPRJIrlwqHmUHFSM/IFmAMaas4l50KICBo46N+0yFdmPL0KA2+ma52DiX7K7yD4StFNwb2SG4OgtbIEFtIh54vUfGqYwMnVrqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793362; c=relaxed/simple;
	bh=iXZwlopuNJRJwpn4lKa2cESnuSuulNoWC+xhEaqaBVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMUtc9/1GIf2P+v5fbAB/H+873SV2LDHaXLOTr9f453yTVfD4PqQUAE6G4KjPwfy9L3ZjCCFLhYxhnlVJzpAL5CUWmF4ifuUZW9mCaBpoumY9VtBnkhQ1f4Lpv95Q9pERDDM+FdRez/kYlfsvxX+G3knVAWr4IDBVf9l/qI6xUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lo9wDIH+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4327778df7fso1211819f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Jan 2026 05:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767793359; x=1768398159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuezIgzsAyyNB5F641/r8/tOCfKBUN9xZVmivfP98JU=;
        b=lo9wDIH+x3Hzi4fafnhOI8TJYxf6vfpxZF1n++B5ZqOUbCWQPSDj5o4kpUgMkLGEcR
         UteAOmQJGzkfXs1S2movvjfKr9yM2GRLUFISc+j+dV9Fp6OjHP3zXQYW/1fBoTd6rfkA
         g6WloBHGhK4LBeM077X7g0Hl/y1/6UOfi4daWTfOG1IKeWcpbWokDKOHM26ukZdCDQu7
         NloX0kDckyA7NmiB6EZ2X5pKjhugCabowj/DmAA83+Ues+pdiMambbx8TzEQekFWc3/b
         uK4pt3nGHVOmTCOwmX8mxKJuzW9kEeqZpUUouTr2ZTdF4zs7snzv0GhciJnNPHDQVtZI
         jNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793359; x=1768398159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VuezIgzsAyyNB5F641/r8/tOCfKBUN9xZVmivfP98JU=;
        b=PGZM8eWUe76PoN2eNMZ2ZwKlXhIcOXyiwKmaLXPXw3cwDmR206D01PYd9U/kgkhnIp
         ULUmvlEnBAjbA3Gse5WLxFgo1uKIrLz4zJg9S39VBIXsbe936RMt+vYPlXKqe5zGhnuZ
         C+IBZTFGnJea7Qz7h9OQoSnQzpd2WRNOJw1pes+NpXzrepnhpoovtvxjr8deBnrkxDcq
         /i8rtORs2SlEE7rTprne9PJyhWwEEcZk9cZKBLtVScy9OESDNXlWHOOcQsL7z/+tmIeK
         vv/PzqLmkx7/cIPzIbZ6k9C8EkxMhpg4ywQUpdIQzv6koDZj7g7HTRlk9s3unvldsvoF
         v7PA==
X-Forwarded-Encrypted: i=1; AJvYcCXQcFuNtR7c/bOWlCMB1hkJx/nLpVgSNPAW9tvByvJLQjoECaUCM2D19LULzrBGnaLIkIS+jmqTrEZbkH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV2rDtMPL/m9oB/4AIgAu2bk6BhiQAuRJaHEp0QH/eT14ax81t
	XASLfjhFgWfgfc+HnzfvRbRgUZzYnwXcEtaVSxRR1VEkPWtFXIDEaBaO7+lRTOc/GSP4Ze+Bjf/
	fN0bMfRMCsNpMH6e/9d9FvLStFO9MmWLIACyEsn0p
X-Gm-Gg: AY/fxX4advu76omTI3471KItmqClzniyR2lN5YrIQZr3zNSvOdmNu7OFOooA/ojvGYR
	Vjkk5mLM3j6VnMJ/pSI0X2K8Q6QXRgePaFc/KPgcvfonM7tJjaabaoVMbQqsbX33SrqebmUF/8U
	VgbIWNrPMSl9HQDVC8JJ4V/X0cTiJAUBfZraDN4SoDbX/PvoG+N8TkrU2H77cquXSJGQA9KXLGc
	RLqRqE13XTzuc/9AVn2peYl40EXcOqVDMgKNY862X3egbBuzs2+wHCvqsfyWbUTlRy+l2O180Qa
	o4k5v278nc2HE5jxXgwM0yfjnb/6LQYxQLAXSEk37cHHdNvVFcQbRsQy3A==
X-Google-Smtp-Source: AGHT+IEAUc1mXQn7QPlaWNlhB+oC5uC/VKZi1CsDAujRYSITqdy4Y0I5rdAfjg0XLN3IVv+rgZqfa1hd3+1gv9RykyI=
X-Received: by 2002:a05:6000:4301:b0:42b:5592:ebe6 with SMTP id
 ffacd0b85a97d-432c32f701cmr2574852f8f.0.1767793358358; Wed, 07 Jan 2026
 05:42:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set> <QViERQV7XT0BjTfSSyP6vzQc4AYxosyF5TEZ5kRu8AVWjmGCP_5n5V2AV2hjqVza8-jvzyquH3JLJA1zvbRD9w==@protonmail.internalid>
 <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
 <87sechh8id.fsf@t14s.mail-host-address-is-not-set> <un386uEr3TEFzLpGCdZg_Tzm63zO7Ze6IZN16Cz79EfWmEI_hZXbBvhG2enZmUXJ6DUnCMNm7QIz-agEYIDr9A==@protonmail.internalid>
 <20260107131822.GD3707837@noisy.programming.kicks-ass.net> <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Jan 2026 14:42:25 +0100
X-Gm-Features: AQt7F2pAZcR9-cuXntjPdly3bLnSH5zqd4_0Qf_i4GvgVh-5nOmI2NH4hmtXZLU
Message-ID: <CAH5fLgjmjjroRf-eU+4UrTPeq3HJ7QoWoCimBW-Occf_f22ARw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 2:40=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Peter Zijlstra" <peterz@infradead.org> writes:
>
> > On Wed, Jan 07, 2026 at 02:12:10PM +0100, Andreas Hindborg wrote:
> >> "Peter Zijlstra" <peterz@infradead.org> writes:
> >>
> >> > On Wed, Jan 07, 2026 at 01:23:38PM +0100, Andreas Hindborg wrote:
> >> >> Hi Alice,
> >> >>
> >> >> Alice Ryhl <aliceryhl@google.com> writes:
> >> >>
> >> >> > Currently the only way for Rust code to call a static inline func=
tion is
> >> >> > to go through a helper in rust/helpers/. This introduces performa=
nce
> >> >> > costs due to additional function calls and also clutters backtrac=
es and
> >> >> > flame graphs with helper symbols.
> >> >> >
> >> >> > To get rid of these helper symbols, provide functionality to inli=
ne
> >> >> > helpers into Rust using llvm-link. This option complements full L=
TO, by
> >> >> > being much cheaper and avoiding incompatibility with BTF.
> >> >> >
> >> >> > I ran a microbenchmark showing the benefit of this. All the bench=
mark
> >> >> > does is call refcount_inc() in a loop. This was chosen since refc=
ounting
> >> >> > is quite hot in Binder. The results are that Rust spends 6.35 ns =
per
> >> >> > call vs 5.73 ns per call in C. When enabling this option, the two
> >> >> > languages become equally fast, and disassembly confirms the exact=
 same
> >> >> > machine code is used (in particular there is no call to
> >> >> > rust_helper_refcount_inc). Benchmarking Binder also results in an
> >> >> > improvement from this change.
> >> >> >
> >> >> > This patch is complementary to:
> >> >> > https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e1=
3cbc17a6@google.com/
> >> >> >
> >> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> >>
> >> >> I get the following modpost errors when building with this applied =
on top
> >> >> of v6.19-rc4:
> >> >>
> >> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] u=
ndefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core=
.ko] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.k=
o] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] u=
ndefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.k=
o] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] und=
efined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undef=
ined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko=
] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platfo=
rm.ko] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.k=
o] undefined!
> >> >
> >> > Looks like it used the wrong static_call_mod() version, was MODULE
> >> > defined?
> >>
> >> CONFIG_MODULES=3Dy, yes
> >>
> >> I built without the patch first, then applied the series, enabled the
> >> option via menuconfig and ran the build. I thought maybe some dependen=
cy
> >> check is messed up so I retried the build from a clean state. Same
> >> result.
> >
> > No, I mean -DMODULE. Note how the quiet_cmd_bindgen target has -DMODULE=
,
> > but the new quiet_cmd_rust_helper target does not.
>
> Ah, that did the trick, thanks!
>
>   diff --git a/rust/Makefile b/rust/Makefile
>   index 5365d53b6cf96..08d3dc1038cf5 100644
>   --- a/rust/Makefile
>   +++ b/rust/Makefile
>   @@ -483,7 +483,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: $(sr=
c)/helpers/helpers.c FORCE
>
>   quiet_cmd_rust_helper =3D HELPER  $@
>         cmd_rust_helper =3D \
>   -     $(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)=
) -c -g0 $< -emit-llvm -o $@
>   +     $(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)=
) -DMODULE -c -g0 $< -emit-llvm -o $@
>
>   $(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
>     +$(call if_changed_dep,rust_helper)
>
> Is -DMOUDLE always appropriate to pass to the helpers? The helpers are
> also inlined into non module code.

With this option, helpers.bc gets linked into every Rust object file
separately (and symbols are internalized). We might want a separate
.bc file depending on whether the Rust object files is part of the
core kernel or a .ko file.

Alice

