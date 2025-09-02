Return-Path: <linux-kbuild+bounces-8692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54189B3FC4C
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Sep 2025 12:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E30F12C4058
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Sep 2025 10:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3302F3C20;
	Tue,  2 Sep 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OWLm9hfT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DED283146
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Sep 2025 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808623; cv=none; b=rQ3dFZJZKjgthUjrWVMPOYwtzcOgT9g7kjsq3XyJbzy2Sbdc7KVevzjd2MrmdVLFzO8Vrf0FSGywhCCHe2gfxwHPZ+fQ/JU7oWVq7DJNvEifQxeKyDhFI6HM67Lg+vKcNN4Grt0RWb9ZXdyTH3pw2HqPq/mIC15FMCwYgUbMLFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808623; c=relaxed/simple;
	bh=0KRQMGE2Ku0icIb0e95NofGJzzChw6uLxT6PglA6loc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByU/CFr4tU4pEfqSfdSfyc/y8w6DwwxYqdVPM4E3ffh+l8c8MYNDlARD8minrrj+VocIVsGmXI3/cBws0zlPgN2fkOKM4nKFogqNO9fa0eGJgi9m4yWHrPRq+883bTi4ozSacjC9ROvkFP0QuxPDUH8ER3wmef1Ffd2Q2wtJrUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OWLm9hfT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3d0b6008a8bso1975401f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Sep 2025 03:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756808619; x=1757413419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZG75Fyl9tDZ5Dejg8bO+Je0PHBuLoFooUnwuE0fIUk=;
        b=OWLm9hfTg+hp4Bqx7VONk25MFSfEmWGwpfFnFCVYhWeBY99ZKqyX545igHB974sGfG
         us3Ml1MyQAME+kRmFShT769EMEK6znRdy4ttqpyuN45DyJOGze6kqL8lwdEFfbDWqQHF
         neYYa7dQJy+ZwKu6KzDUeY9hK8FZFPxwps9oADUNx0KnNXkx9jVaOuVqw58KnQ4WtigC
         bKo5EvYBaup+yp1onRL6iTpq/umSdV9SBjwqgphY04bUnjaQjWmKNqqI8vxJNXYuGGAB
         c7yBdtldHU7ELAKy/X+nndCkoJ2DQoTQD/qYvgxEzqDr4CpPhugzxt0WR17N+jlMKQ8g
         IWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756808619; x=1757413419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZG75Fyl9tDZ5Dejg8bO+Je0PHBuLoFooUnwuE0fIUk=;
        b=RrzlD01sCvVc0E8rojGemWs7d/+SPY01ldaVcV2OfAJjmsnJlSSdHwluXJEkDTpoUj
         1hgeSBEuJVAFTs0KCKNaaLGfvrJ3xEfr6VuJJ8bqG1Pu0wanpet3OoiJDxqJL/Ig9Z8y
         wlqBz6CoG2pDzPiKuf+Zfg31JzbpsHTmK4E6yrZbEg7zFlPiS8+AQEzlU5GTYN1IolS9
         S8QfYd4+KrTZUZ+AbglRXfqGIobmCLoXnse5PibrPlOI9xwcHa1tcEKUd4jF2TkQiJxs
         Xil8P/BSTI49jfdP61Ph/usbaFAHf59OooVwZNjJFmaYBVzgIT+NQsX9tDzHYM7QlQHl
         NL3g==
X-Forwarded-Encrypted: i=1; AJvYcCXJzapzWfDksOWDMzM4InA5nmHa6rAEzpAJhnZ2z0duSJ/sWYXcia6XrqXsDT8A0Nlf4nFhKsbudR4oasI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye42DRuaDi5SRRJbQ/ojF67v1HCjdiIA4XcLNnn/taXFwab0Cm
	Uh0spRPuRufi8fqq0kdkWi0wqbSo9UMWAEksC8nKppYrM3xV9Hd2Dj7+iepNNI9SfrkYDtBWWgF
	K24VQi9IflTfrp6jvwnRU4VqNBJPQR/BV2i3NQCoB
X-Gm-Gg: ASbGnctrh1XR8CpgvfYTrqJHk6pG0NSjeiHj26DATqdmfv0JEAdP4ndDe0Tg8CoeID3
	vCeia+sZ90mCefhTUSqI3KJt4MxwCXEBtRPqb6RY1MfUb4Yg7ss6nCtnft1DVcf3cEiW49co0vc
	tLPMP46lZnpqE3LAgDn7gFp5Sh44W2goymVs9+ivCndtFyafcSma3eQv8ozNTOB+NQF9nlDy/FM
	dV0kQtIEq2pMmCe6oKgCM1M7oBSiVhMvgvrwsRwWUZPKMcscdbGZbhgw3mPPfdCLsC2EDEjqZqO
	9gxJW2s/Uii76HUCjupOnQ==
X-Google-Smtp-Source: AGHT+IE5Vy/wSrO6MssjX3WYMX8v3QdFOiofgYk4M9t6NexPcbIwSDmaT3qhZJWKYqATGYUQjTlkcIx74nuY9kBXnqk=
X-Received: by 2002:a5d:64c9:0:b0:3d8:7c6e:8b08 with SMTP id
 ffacd0b85a97d-3d87c6e8edamr3829658f8f.13.1756808618755; Tue, 02 Sep 2025
 03:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408220311.1033475-1-ojeda@kernel.org> <20250901-shrimp-define-9d99cc2a012a@spud>
 <aLaq6TpUtLkqHg_o@google.com> <20250902-crablike-bountiful-eb1c127f024a@spud>
In-Reply-To: <20250902-crablike-bountiful-eb1c127f024a@spud>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Sep 2025 12:23:26 +0200
X-Gm-Features: Ac12FXwpn-3-ibRIG1XikBRyRDY3ok1C3LPFFXbq4WkeG6TaAMWRWaWMSctR85g
Message-ID: <CAH5fLggmXaa9JJ-yGdyH06Um8FopvYh97=rANLcoLc+60_HGqA@mail.gmail.com>
Subject: Re: [PATCH] rust: kasan/kbuild: fix missing flags on first build
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 12:12=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Sep 02, 2025 at 08:29:29AM +0000, Alice Ryhl wrote:
> > On Mon, Sep 01, 2025 at 06:45:54PM +0100, Conor Dooley wrote:
> > > Yo,
> > >
> > > On Wed, Apr 09, 2025 at 12:03:11AM +0200, Miguel Ojeda wrote:
> > > > If KASAN is enabled, and one runs in a clean repository e.g.:
> > > >
> > > >     make LLVM=3D1 prepare
> > > >     make LLVM=3D1 prepare
> > > >
> > > > Then the Rust code gets rebuilt, which should not happen.
> > > >
> > > > The reason is some of the LLVM KASAN `rustc` flags are added in the
> > > > second run:
> > > >
> > > >     -Cllvm-args=3D-asan-instrumentation-with-call-threshold=3D10000
> > > >     -Cllvm-args=3D-asan-stack=3D0
> > > >     -Cllvm-args=3D-asan-globals=3D1
> > > >     -Cllvm-args=3D-asan-kernel-mem-intrinsic-prefix=3D1
> > > >
> > > > Further runs do not rebuild Rust because the flags do not change an=
ymore.
> > > >
> > > > Rebuilding like that in the second run is bad, even if this just ha=
ppens
> > > > with KASAN enabled, but missing flags in the first one is even wors=
e.
> > > >
> > > > The root issue is that we pass, for some architectures and for the =
moment,
> > > > a generated `target.json` file. That file is not ready by the time =
`rustc`
> > > > gets called for the flag test, and thus the flag test fails just be=
cause
> > > > the file is not available, e.g.:
> > > >
> > > >     $ ... --target=3D./scripts/target.json ... -Cllvm-args=3D...
> > > >     error: target file "./scripts/target.json" does not exist
> > > >
> > > > There are a few approaches we could take here to solve this. For in=
stance,
> > > > we could ensure that every time that the config is rebuilt, we rege=
nerate
> > > > the file and recompute the flags. Or we could use the LLVM version =
to
> > > > check for these flags, instead of testing the flag (which may have =
other
> > > > advantages, such as allowing us to detect renames on the LLVM side)=
.
> > > >
> > > > However, it may be easier than that: `rustc` is aware of the `-Cllv=
m-args`
> > > > regardless of the `--target` (e.g. I checked that the list printed
> > > > is the same, plus that I can check for these flags even if I pass
> > > > a completely unrelated target), and thus we can just eliminate the
> > > > dependency completely.
> > > >
> > > > Thus filter out the target.
> > >
> > >
> > >
> > >
> > > > This does mean that `rustc-option` cannot be used to test a flag th=
at
> > > > requires the right target, but we don't have other users yet, it is=
 a
> > > > minimal change and we want to get rid of custom targets in the futu=
re.
> > >
> > > Hmm, while this might be true, I think it should not actually have be=
en
> > > true. Commit ca627e636551e ("rust: cfi: add support for CFI_CLANG wit=
h Rust")
> > > added a cc-option check to the rust kconfig symbol, checking if the c
> > > compiler supports the integer normalisations stuff:
> > >     depends on !CFI_CLANG || RUSTC_VERSION >=3D 107900 && $(cc-option=
,-fsanitize=3Dkcfi -fsanitize-cfi-icall-experimental-normalize-integers)
> > > and also sets the relevant options in the makefile:
> > >     ifdef CONFIG_RUST
> > >            # Always pass -Zsanitizer-cfi-normalize-integers as CONFIG=
_RUST selects
> > >            # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
> > >            RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-=
normalize-integers
> > >            KBUILD_RUSTFLAGS +=3D $(RUSTC_FLAGS_CFI)
> > >            export RUSTC_FLAGS_CFI
> > >     endif
> > > but it should also have added a rustc-option check as, unfortunately,
> > > support for kcfi in rustc is target specific. This results in build
> > > breakages where the arch supports CFI_CLANG and RUST, but the target =
in
> > > use does not have the kcfi flag set.
> > > I attempted to fix this by adding:
> > >     diff --git a/arch/Kconfig b/arch/Kconfig
> > >     index d1b4ffd6e0856..235709fb75152 100644
> > >     --- a/arch/Kconfig
> > >     +++ b/arch/Kconfig
> > >     @@ -916,6 +916,7 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLAN=
G
> > >      config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
> > >             def_bool y
> > >             depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
> > >     +       depends on $(rustc-option,-C panic=3Dabort -Zsanitizer=3D=
kcfi -Zsanitizer-cfi-normalize-integers)
> > >             depends on RUSTC_VERSION >=3D 107900
> > >             # With GCOV/KASAN we need this fix: https://github.com/ru=
st-lang/rust/pull/129373
> > >             depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSI=
ON >=3D 108200) || \
> > > but of course this does not work for cross compilation, as you're
> > > stripping the target information out and so the check passes on my ho=
st
> > > even though my intended
> > > RUSTC_BOOTSTRAP=3D1 rustc -C panic=3Dabort -Zsanitizer=3Dkcfi -Zsanit=
izer-cfi-normalize-integers -Ctarget-cpu=3Dgeneric-rv64 --target=3Driscv64i=
mac-unknown-none-elf
> > > is a failure.
> > >
> > > I dunno too much about rustc itself, but I suspect that adding kcfi t=
o
> > > the target there is a "free" win, but that'll take time to trickle do=
wn
> > > and the minimum version rustc version for the kernel isn't going to h=
ave
> > > that.
> > >
> > > I'm not really sure what your target.json suggestion below is, so jus=
t
> > > reporting so that someone that understands the alternative solutions =
can
> > > fix this.
> >
> > Probably right now we have to do this cfg by
> >
> >       depends on CONFIG_ARM
>
> It's valid on x86 too, right?
>
> >
> > to prevent riscv if rustc has the missing setting
> > set on riscv. Once we add it to riscv, we change it to
> >
> >       depends on CONFIG_ARM || (RUSTC_VERSION >=3D ??? || CONFIG_RISCV)
>
> I kinda shied away from something like this since there was already a
> cc-option on the other half and checking different versions per arch
> becomes a mess - but yeah it kinda is a no-brainer to do it here when
> rustc-option is kinda broken.
>
> I guess the temporary fix is then:
>
> config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
>         def_bool y
>         depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
>         depends on ARM64 || x86_64
>         depends on RUSTC_VERSION >=3D 107900
>         # With GCOV/KASAN we need this fix: https://github.com/rust-lang/=
rust/pull/129373
>         depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSION >=3D =
108200) || \
>                 (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
>
> because there's no 32-bit target with SanitizerSet::KCFI in rustc either
> AFAICT. Then later on it'd become more like:
>
> config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
>         def_bool y
>         depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
>         depends on RISCV || ((ARM64 || x86_64) && RUSTC_VERSION >=3D 1079=
00)
>         depends on (ARM64 || x86_64) || (RISCV && RUSTC_VERSION >=3D 9999=
99)
>         # With GCOV/KASAN we need this fix: https://github.com/rust-lang/=
rust/pull/129373
>         depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSION >=3D =
108200) || \
>                 (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
>
> but that exact sort of mess is what becomes unwieldy fast since that
> doesn't even cover 32-bit arm.

I think a better way of writing it is like this:

depends on ARCH1 || ARCH2 || ARCH3
depends on !ARCH1 || RUSTC_VERSION >=3D 000000
depends on !ARCH2 || RUSTC_VERSION >=3D 000000
depends on !ARCH3 || RUSTC_VERSION >=3D 000000

Alice

