Return-Path: <linux-kbuild+bounces-10655-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 447CED399FC
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 22:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E331C30076A5
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 21:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B02285C80;
	Sun, 18 Jan 2026 21:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l7IBoFct"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15AE276050
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 21:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768771692; cv=none; b=gVWlLbL3LvLN8r/w87smvWsvSpWSrWk+N8afv/8Wrzu5AC6tmt3I+QCN7WrkeCdZpV45D0oUE5frrLB093NCVYQVVlfhoBKO4kMJTohgsPZixHQJZivTS4H/ucTuvBJTYgAiuGcy9OssaVrvyOqOjqpyZM/X6dP4sYu+acklHmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768771692; c=relaxed/simple;
	bh=vMjNC2Tecqsx8qX3k0bRveOjlS/EXBttTZEBqFc2UQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmP+d6DCSyPwtk8/8cP3fqJ6g1xBDn1+W0rlP5r7gdGRUXkSzTL5Zy/qOhyDtHprgEphcjech1DId1UHL8UXdl1hIjed4w4qGrdxvkzFTSsnzZLHps116oS+bDWO6OQ6PotPGgyCE0csHKrFrpPGL2mXa0ZPchAcJIuvaU4Py1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l7IBoFct; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc3056afso2179492f8f.2
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 13:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768771689; x=1769376489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDaH472bfnhCIqyZjen1yWQU/ijPpbhjthhXvYN1hIc=;
        b=l7IBoFct5PFbMFortsr/kHXsgdv3btxnTCNp/CiM7j8lrV55RQEcNuEhwcOtc8TMoV
         vBPmYK3Eu1ndYOqpPJ0IlX6orYyWz3LaA/iRG4wKE+3bDvqY0GffxyFArC3xhBh0oD8I
         T6ErERViLhy229ny3s2y7+KDXmnEG67CCwIFVhvOnywI1Yj9ufRq0hufTJCvP6YZ1NtC
         xG69Th2AZiCp+O+0+C5bbJjuF4wZxDDUK1N8H7VZuRQU6gfxAvH7fXPqkjOO9NzcG5No
         RmzdhdLg1DhIXX8W15B6ZPByo6E6iFeJSTJHj+x615EiEGgKKEgbU7Oe1Xf7YZ+CtSKr
         IU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768771689; x=1769376489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oDaH472bfnhCIqyZjen1yWQU/ijPpbhjthhXvYN1hIc=;
        b=VH6HhREbr+Em/s6bhqUKFZaDG2fCLDunSGnXQRkxm/UIJLoWCHuMKlSI/NfxmvqDe/
         lrn56Q/2F+5beKKutPmN021UZlDk2z1peO0qUkjgQoQdd7h2EP3LWqDK/6fDc9YViLUQ
         CgTKCcVsiVrYupfyjUeLqeuaFZ6fKT7rUsxSZuVGFej8wQB6TL0SNmHpOvr7IRAHDIJq
         Dc80TcuuZrV6tUVPzs/Poew4mdkONwFkC8gMs8C15P0AAcEwsnTJ7iS3Wl5sCUHjwE6D
         +hzdYZjTEzCr9KZp2ILSzvvXGHDsnE1uM+62P6VcvBLdrMIuA+//sBLqmdrbY8FNFWIX
         E8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZxz8/OJChdpY7hHgsjQmJLHBx5yGBE+RRARs1Sb++exaRlfJMNMR03CO/HmRJc+Ox0kDbkoeUCps+16g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbon7DhbEGL5PkwNVQM5nU6ZqZtFOmRdZ/1E+y4SokvLVGn8+G
	SQNwfO8tTZ75fD9m2J+pS7Je3uLsV2WbUPv4bTyjDwHN2LfUs3Q+1neLjK+rkSiWfnhK666vjjP
	a5klXcuOba8CEW3drkPa33Pi7YTekim759Ju/VsU7
X-Gm-Gg: AY/fxX6FdMqjPgJv2s+yZZkpz8vqN4H+aL4KuhuShmhVsTmsaIBK7p787+UeE3U3Xpg
	bJmU5KI3Fk56YWueAr14VIOOk5tQuDSV4FPJg8iscO+VyRwlY5tKSVzpFTOx5TNTtYg3Dfy5xAR
	TADGISg9SNxMEZ2PJIY+O4Pw/SneArN6FxH96po78O94L3dsGlr67iZRZxn2SFDw78dSLQdv//d
	Vne18WWMCyw29ClTdCOAJX+yaJ/67Ce00cvp38QAbLuWTaj4N9Vmrj/+COlYq0wPDO9Hmy9LEjp
	c33WdjKR1AygVuyO+Qwc2NAXRsRDa0ymsabG
X-Received: by 2002:a05:6000:2913:b0:42f:ba09:aa7c with SMTP id
 ffacd0b85a97d-4356a060c90mr11483919f8f.54.1768771689026; Sun, 18 Jan 2026
 13:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115183832.46595-1-ojeda@kernel.org> <CANiq72mRB1Hhu=m26GsFHDTdiRTditNZGT4bRYWhWo_oBWsYXA@mail.gmail.com>
In-Reply-To: <CANiq72mRB1Hhu=m26GsFHDTdiRTditNZGT4bRYWhWo_oBWsYXA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 18 Jan 2026 22:27:56 +0100
X-Gm-Features: AZwV_Qh4FAOBZN8AyV-kWC5X51-KWGqGLoI6xIRuEElZkOxwPw9uZwBLY87FHhU
Message-ID: <CAH5fLgg+TOAWQAJ+KMyZBe4E70i=qy9TbFiB1ydH7YzOG7TWGQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 8:43=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jan 15, 2026 at 7:38=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> w=
rote:
> >
> > `rustfmt` is configured via the `.rustfmt.toml` file in the source tree=
,
> > and we apply `rustfmt` to the macro expanded sources generated by the
> > `.rsi` target.
> >
> > However, under an `O=3D` pointing to an external folder (i.e. not just
> > a subdir), `rustfmt` will not find the file when checking the parent
> > folders. Since the edition is configured in this file, this can lead to
> > errors when it encounters newer syntax, e.g.
> >
> >     error: expected one of `!`, `.`, `::`, `;`, `?`, `where`, `{`, or a=
n operator, found `"rust_minimal"`
> >       --> samples/rust/rust_minimal.rsi:29:49
> >        |
> >     28 | impl ::kernel::ModuleMetadata for RustMinimal {
> >        |                                               - while parsing =
this item list starting here
> >     29 |     const NAME: &'static ::kernel::str::CStr =3D c"rust_minima=
l";
> >        |                                                 ^^^^^^^^^^^^^^=
 expected one of 8 possible tokens
> >     30 | }
> >        | - the item list ends here
> >        |
> >        =3D note: you may be trying to write a c-string literal
> >        =3D note: c-string literals require Rust 2021 or later
> >        =3D help: pass `--edition 2024` to `rustc`
> >        =3D note: for more on editions, read https://doc.rust-lang.org/e=
dition-guide
> >
> > A workaround is to use `RUSTFMT=3Dn`, which is documented in the `Makef=
ile`
> > help for cases where macro expanded source may happen to break `rustfmt=
`
> > for other reasons, but this is not one of those cases.
> >
> > One solution would be to pass `--edition`, but we want `rustfmt` to
> > use the entire configuration, even if currently we essentially use the
> > default configuration.
> >
> > Thus explicitly give the path to the config file to `rustfmt` instead.
> >
> > Reported-by: Alice Ryhl <aliceryhl@google.com>
> > Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Applied to `rust-fixes` -- thanks everyone!

Thanks Miguel for looking into this.

Alice

