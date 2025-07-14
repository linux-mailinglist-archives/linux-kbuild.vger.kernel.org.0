Return-Path: <linux-kbuild+bounces-8004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F2B039D9
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 10:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D16FE3BB2DB
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 08:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADF623D2A3;
	Mon, 14 Jul 2025 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I3n8Eymi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC1F23BCF7
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Jul 2025 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752482932; cv=none; b=a4/XDKvig2ctB8Rak2tHmGOnoZbAfH96cqHPzpy7PPOVRFQzhubT+KRGFgIfESmlY93YQ3VoQsdo5gWFWwQEebnMFKpBVQuqaOPnkzDgIuQcmq1Gb2eN/GriX8Qra+z5fkrmHiQHLKMmAXA1xctzdtBU9rqkMeCCbdObILFkXHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752482932; c=relaxed/simple;
	bh=uEb/0VR0iaHwMvhSvE890850NYx60tZHhru27ZS4cjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9J6COLsthJQSeHF5zhIndgxZcYf8TtjVeVdYqBR71Et2cQguNb5JbvoyBDiLkUHnNtCoWth2mU8IGb5FucGBExDk35vtcM8KlUXjZSETSY/8K18+21O6uBlErY3pNuNBLHMkbdmUs/6Zn9YfsY/s4gSCsiChBqUn7zOzzH+NmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I3n8Eymi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2483841f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Jul 2025 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752482928; x=1753087728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2eqVvWUGyRNHCflMNysYozlpMXxPdhkCEbZuAC8Zek=;
        b=I3n8EymihNmdglcYcNwsS2/MPGOG7vVXFBzibnHNvjm5lkfjhFSAjzqaUtmm2e6BlD
         9fo+j/Z+dvGxdk19LI0S9aPjkEcTCaLZpfuRkFZZtxTH/C0aK8F9ET4AZgUu3GYWZG5b
         NWLz9fIlLEUU60YcQik9hrjrXzyo8Mdht053meqDCbLvH8E0gtqK92jVlKTMhlZEqXM4
         zE7GZRaCRfI0ii97ruG7F1pTvtnSBpuAcUF8DnxOggZgeKPbP8qE4mmy8tU4Ad6KlO2F
         U0Wh4lelHhyMnHwTYD7/7FhMIi7zeY1jkNijJBcN5O7tvMe9am1kRFqr5LB2LiB6JqnA
         MRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752482928; x=1753087728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2eqVvWUGyRNHCflMNysYozlpMXxPdhkCEbZuAC8Zek=;
        b=abM/Vg4kE07TwoZPSBmw0waVsK5dXRUJLH7N+AKNuFZRugz08DbjpIpYc6b46QM6em
         rWA6jtmiN84x4yHzoPQcIYdoqyoAouOA3wtilxe1vBO34lT1wrpzMmaT7ugHBXkdHVjw
         OXTgU6qUPh/nYWL36/j6R4dzBFlmxOqDg1/rXb6q+r2KWOTEQcWnItkaBpX+b+Xbmykd
         3HRZpgfiFsZ18hC7d5vhfjal7rg32LxbSCvrb2MAG3yypzc7+kr8q7RnLAZ66r7ZxSjC
         fzJ0Yac7HqukeT1t1EPbwfLE3PLOmEd543PEhj0XV1RNKbRCXmYRbf7QeuIEbwvK07BY
         UrUA==
X-Forwarded-Encrypted: i=1; AJvYcCWtP4pl7oIl2Z+k5IRpVh+RXcWtfGigeZdmJcIw5B6daDEhUOHyXXwLykv3YDrZa8fanjKpCeAp547nztQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YytSMDfcRVtgi+doBAgPg7hFODe8xxiqxMX3r80g9ybFwLy2jE1
	GASdh+EnZ4zFGEE6t2EnWU0kY72k+EpwSEiLYiTQv6di/IMydsIpnHmbuV8ur4NfFyzydYAR5Ft
	HNq08ZSvnKxxGKRyCDH2dg9Ceob7UnVY2210orKqr
X-Gm-Gg: ASbGnctMVnmCk++NEc3kTeTRLRsWgAFK8LcCrk/vxKn5ofNKsMLBhybY9/Zb8u4raS0
	KqcsFIpy0AgkKGl+3iohBmIZMZxrQiC28XHiobDGkFJmctpeUmRSCFE0EzuwafvImP9z910MxhO
	XzzQlz6OOM9X0qbcIzO8o7lUuBlXi1V6fO3jpzTEuaB8NIN+/Ks3CiyJqnjgZazyx4VVZxivKyE
	J5aoBYKw+aKOzbxBenzeOnQxUnSNSFry5glUg==
X-Google-Smtp-Source: AGHT+IFbanDs448XsjcCBuRD1OV+c4gYqU1GnCMBsm0XxQ4lxhrcMIJOjMNwYVAs8QqAaAg2E2jmgkH/HpU2k0t6Gys=
X-Received: by 2002:a05:6000:1ac5:b0:3a5:58a5:6a83 with SMTP id
 ffacd0b85a97d-3b5f187e264mr10159893f8f.13.1752482927867; Mon, 14 Jul 2025
 01:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250712160103.1244945-1-ojeda@kernel.org> <20250712160103.1244945-2-ojeda@kernel.org>
 <20250714084638.GL905792@noisy.programming.kicks-ass.net>
In-Reply-To: <20250714084638.GL905792@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Jul 2025 10:48:33 +0200
X-Gm-Features: Ac12FXxMqzqa-86YzzJsOO2IogpXRlxWKeLa1kAAYOw4KPVk-KLgMAKuFCR7SWg
Message-ID: <CAH5fLgjtU1u=h8FY3im364AsC21GitnrjhBT=YJMmipH_ZWnQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] objtool/rust: add one more `noreturn` Rust function
 for Rust 1.89.0
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 10:46=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Sat, Jul 12, 2025 at 06:01:02PM +0200, Miguel Ojeda wrote:
> > Starting with Rust 1.89.0 (expected 2025-08-07), under
> > `CONFIG_RUST_DEBUG_ASSERTIONS=3Dy`, `objtool` may report:
> >
> >     rust/kernel.o: warning: objtool: _R..._6kernel4pageNtB5_4Page8read_=
raw()
> >     falls through to next function _R..._6kernel4pageNtB5_4Page9write_r=
aw()
> >
> > (and many others) due to calls to the `noreturn` symbol:
> >
> >     core::panicking::panic_nounwind_fmt
> >
> > Thus add the mangled one to the list so that `objtool` knows it is
> > actually `noreturn`.
> >
> > See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions"=
)
> > for more details.
> >
> > Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned=
 in older LTSs).
> > Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>
> > ---
> >  tools/objtool/check.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > index f23bdda737aa..3257eefc41ed 100644
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
> > @@ -224,6 +224,7 @@ static bool is_rust_noreturn(const struct symbol *f=
unc)
> >              str_ends_with(func->name, "_4core9panicking14panic_explici=
t")                            ||
> >              str_ends_with(func->name, "_4core9panicking14panic_nounwin=
d")                            ||
> >              str_ends_with(func->name, "_4core9panicking18panic_bounds_=
check")                        ||
> > +            str_ends_with(func->name, "_4core9panicking18panic_nounwin=
d_fmt")                        ||
> >              str_ends_with(func->name, "_4core9panicking19assert_failed=
_inner")                       ||
> >              str_ends_with(func->name, "_4core9panicking30panic_null_po=
inter_dereference")            ||
> >              str_ends_with(func->name, "_4core9panicking36panic_misalig=
ned_pointer_dereference")      ||
>
> Just having "_4core9panicking" substring is not sufficient?

That prefix just means it is defined in the panicking.rs file, which
also has a few functions that are not noreturn.

Alice

