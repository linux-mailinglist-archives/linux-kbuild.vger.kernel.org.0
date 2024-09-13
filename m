Return-Path: <linux-kbuild+bounces-3547-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC4978ACC
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 23:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EB091F234B2
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 21:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF5E17C9B7;
	Fri, 13 Sep 2024 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IkR186KB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21317156222
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Sep 2024 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263883; cv=none; b=NQfkYG6o8YHYy2YvUGqZUTrc5fY+eOMp4tLMyutxeJtgIMROv4aXSKXq6dThbW+AsPTuh1li/peCiaBfsuT3MEsBjIWmy2Sh0Gzv86J99OVNeilNFBWTT0Ko1Q16KphT9KJixFA58OTqq++M/TkM1hXmw44EKLf/RfFLQqCRmx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263883; c=relaxed/simple;
	bh=weOpgQgGVFeeHCvUfr70gOb841HLcQ83LvyuGQsmjS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9GXNTUBj/wJg7zRSVQD5+G1B7Jn5zBMTKgMrMh+1LNl1E1+5FFiPVBuvMs0erGMu0ZzqligoNnJYFjzhjqVNj03FJBUnBDmx3EAyBaurQQxS1qzUPzZ8FvHvZetbBdlz9X/thEUtzsGbwTdu8atk5dLr99YYmx5QcOxU5q+gEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IkR186KB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-371941bbfb0so1863632f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Sep 2024 14:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726263879; x=1726868679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vf45eyq3v7x3TRRfxhlxvxhoc9NAlP67nksFtDxcHog=;
        b=IkR186KBfaQsAZ4xjhiDUpvS9xtesuAms4d5XDza895eRNp48p8HRby/UDmEgisjAX
         aRf7cCRuU9temCBUViOeQlGnBGcvkrslfYV1F47WXtju1VtA291gpnrooloDCvqzyVOy
         1QbLnKKv4xZxyP3nAI4PuBs71v3ljOPVqYXdS5zV6AkcKea4L5ut1CkjMX8QWZx2MXFU
         vBYP8Sw7suty+scy1n+DUWdp8vAPHVaY+zeD8vevzRUf758RiF/VaK31VusoRhYCCYZu
         8j9FHFxcsQra6ocXaMH1/fX22k9IOKJGUwSlRJvuvjeTnK2w0o66fJmwfoe/2kUlsyrZ
         gmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726263879; x=1726868679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vf45eyq3v7x3TRRfxhlxvxhoc9NAlP67nksFtDxcHog=;
        b=HFuN+Qhq4hYRyEWic0wbe4vBT3keFdOyj/qs4wAq9fBnMaPZfKSW4yz1nAIPTVuAtB
         ysvXUwiwpj5rYGrvfdgP2VhyKm3xREKC9819OoYTtb8EQlWx2PbyxV9h0yy2sfZhJ23L
         z4Af3NWM+ujwE/X8QSzm8MVqFpSM0Yh31b4sfjp1iIGMh6cBCW+d9OuVQWjxaH5GD//I
         9aD3zUAc+pCR3tx9mBnwe1pN4+kn1fkb2PgRVOrfPL9rNqd0XBBvBtv/IF/RAvIVkxIZ
         1P2tYbWf+H/cNmDOrV0eQKmqDjYQUtGNyr69lu6iwH84OVpxEMv8d2OYUkGqHA9otvcS
         /m1A==
X-Forwarded-Encrypted: i=1; AJvYcCV04hR4rmybOd/dNH8qbfFa1RnJ3Cr33ks0P4mm+WDeBEnjlZSiumPQC8mvvhwZ39thtneEbydHdDbepas=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9lCDSn88RamkmR0mwBJYmLLTiOK9ueeKq8JsTzNR7d4Dux1si
	ZLmlGsHN86Bfo25aI/fQNKGmDDzPsEcqdNmsVQsYnv8QnABxOlFAPb62J80ttuqUL0Rxw0adBTq
	Uc1zsXQ5w3O4IRs52rbTi0KDL/CtNozpEanFT
X-Google-Smtp-Source: AGHT+IEmwetFagY93QocO76IsaU0CwLVTVwEf+i4UEMkAx5533P8vYmTDozz/DvOPi7tFuew3ENtKMeHxf8V8bRaarI=
X-Received: by 2002:a5d:5711:0:b0:374:b685:672 with SMTP id
 ffacd0b85a97d-378c2d04ad5mr4700069f8f.26.1726263879124; Fri, 13 Sep 2024
 14:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com> <20240913-shack-estate-b376a65921b1@spud>
In-Reply-To: <20240913-shack-estate-b376a65921b1@spud>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Sep 2024 23:44:26 +0200
Message-ID: <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, Sep 13, 2024 at 12:08:20AM +0200, Miguel Ojeda wrote:
> > On Thu, Aug 29, 2024 at 10:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> > >
> > > Add all of the flags that are needed to support the shadow call stack
> > > (SCS) sanitizer with Rust, and updates Kconfig to allow only
> > > configurations that work.
> >
> > Applied to `rust-next` -- thanks everyone!
> >
> > Paul/Palmer/Albert/RISC-V: I think you were not Cc'd (at least in this
> > version?), so please shout if you have a problem with this.
>
> For some reason I deleted the series from my mailbox, must've been in
> dt-binding review mode and hit ctrl + d. I've been away and busy, so my
> apologies Alice for not trying this out sooner.
> It's sorta annoying to test rust + scs on riscv, cos you need (unless I
> am mistaken) llvm-19. llvm-18 + rust built fine, but has no SCS.
>
> llvm-19 + rust failed to build for me riscv, producing:
>
> In file included from /stuff/linux/rust/helpers/helpers.c:22:
> /stuff/linux/rust/helpers/spinlock.c:10:23: error: call to undeclared fun=
ction 'spinlock_check'; ISO C99 and later do not support implicit function =
declarations [-Wimplicit-function-declaration]
> __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
> ^
> /stuff/linux/rust/helpers/spinlock.c:10:23: error: incompatible integer t=
o pointer conversion passing 'int' to parameter of type 'raw_spinlock_t *' =
(aka 'struct raw_spinlock *') [-Wint-conversion]
> __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
> ^~~~~~~~~~~~~~~~~~~~
> /stuff/linux/include/linux/spinlock.h:101:52: note: passing argument to p=
arameter 'lock' here
> extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char *name,
> ^
> 2 errors generated.
>
> This occurs because I have DEBUG_SPINLOCK enabled. I didn't check why,
> but Andreas seems to have introduced that code - luckily he's already on
> CC here :)
>
> With that disabled, there are dozens of warnings along the lines of:
> /stuff/linux/rust/helpers/err.c:6:14: warning: symbol 'rust_helper_ERR_PT=
R' was not declared. Should it be static?
> If those are okay for rust code, it would be rather helpful if the
> warnings could be disabled - otherwise they should really be fixed.
>
> Following that, I got a build error:
>
> error[E0425]: cannot find function `__mutex_init` in crate `bindings`
> --> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28
> |
> 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
> |                              ^^^^^^^^^^^^ help: a function with a simil=
ar name exists: `__mutex_rt_init`
> |
> ::: /stuff/brsdk/work/linux/rust/bindings/bindings_generated.rs:12907:5
> |
> 12907 | /     pub fn __mutex_rt_init(
> 12908 | |         lock: *mut mutex,
> 12909 | |         name: *const core::ffi::c_char,
> 12910 | |         key: *mut lock_class_key,
> 12911 | |     );
> | |_____- similarly named function `__mutex_rt_init` defined here
>
> error: aborting due to 1 previous error

This looks like an unrelated problem to me. This patch only changes
the rustc flags, but these errors have to do with the Rust
helpers/bindings, which get generated before the rustc flags are used
at all. Most likely, there is a problem under the particular
configuration you are using. Were you able to reproduce these errors
without this patch?

> I stopped there, Space Marine 2 awaits.
>
> Hopefully I'll get to say hello next week,
> Conor.

Thanks for taking a look, and see you at Plumbers!

Alice

