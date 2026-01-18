Return-Path: <linux-kbuild+bounces-10654-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D29D3998D
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 20:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53769300768C
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 19:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8417622652D;
	Sun, 18 Jan 2026 19:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyVFMji/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F59291864
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 19:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765398; cv=pass; b=OSe8GvnPFQrKUdoVPTrppUJTVrTVhvr7wEFE3WikrAHZ3NhiXmWPuB+Es4H67RD3NaQo1QM/f59mMup/Hk+lGNgStcNxannSOSAIZTOk/6dO1YY6XHKAcmBDjqtiWwHKmu0zzCRV9DMICZbw5L6oBol5VUDcF3n1OM+lt1xRckM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765398; c=relaxed/simple;
	bh=YcWX4KpE5LzyFkGNlp0UmN6AScfsx8INQHNsRSOVao8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d75EI9Bl2WFJ9rpQsvx2ObaQvcIV/QJ3UvLf2GcZkOXO35Y9osfVIJ73XjQtweLDjc0hDsRyao2RvG6NjgvuckkwDYVJVxQ3qHxw4docUPzloScscdvFk/4MDD7TUGNZJFCefyt3TZyjdesR4RlS0ax1vYgeufGFK8CXJBQcQHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyVFMji/; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6ce77a2cbso50004eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 11:43:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768765396; cv=none;
        d=google.com; s=arc-20240605;
        b=AUJg/g+QhB9MNh2xPCCEUEpQvow52MkvpZ+yL7/5xHz0h1WnVkwj1juXbyOtIwU+r8
         4d/p0XlUGV0zz9uE9BXzj+0TTLh66KH7aDefsbHEhSJ945kplPZntJMA8nbjWPD3fsoz
         nzJgNJ9q1kYP9LrbMDfTK7NNdGw1lT+bk3zdUPYBLBVjZLHonNvdRq7Iepxf1r7mecRQ
         vWzpar0zWBHQd6bbJYK48CuIW28P7HwHGb9J7SVB2NbnyvPKSYJ3zLvmRrjIHop3/kVk
         kzT5k4FvkcZwMs+Clrfmyta6hg1yQ/HT+5ECnrsXb1oNx72F+ysxQGENhsKCSj67A+Lm
         Umag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3WkwnRacVzZnF9+VHDBdh2NvGD/q/Isu1ZQKlvNDN0I=;
        fh=9V8bs5XCHhWqGiCC2DKhf/Gq5HZue+7TymMBT3M33/Y=;
        b=Md40jz9aiVwTbl+dfiMTkZys1Wfd62i2NiEOIsMBGVIOIC6bmJdB9dWfhKJfq99OGF
         Lh743ZunZ6svVyqNPxRvlEkV+w2dsjQcnT29XECW+AT/IzIK90xX9JJhGVtAU7amrIDh
         tIyV/6fIS81uspdkG92qdQw/R1kW0xyw6htHbo/uFTM8jzvGtn5RDYqGx9NcbpyKCT/E
         htkw22J2tLNIZIZP8DmJekubp9krgAZwmGOkc3mW+CdkDAbbdofy9G9RQtSLNSEVS3vc
         KO5iBS7rLXgRhKTcBynTf8ne/3Jm9obwoJX6Awl+bHwkRgFzu1Meoo+38DWX4ME/XSpA
         Nk3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768765396; x=1769370196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WkwnRacVzZnF9+VHDBdh2NvGD/q/Isu1ZQKlvNDN0I=;
        b=JyVFMji/c1eBg4LJmOVPcjNlcOenkPq7z/Ysjq3Hehh3n2JscrHBsQqoX0KD9dIj/B
         CgGK4f6ikRvaXkaNakJpb9IqeqXcI3liEZr9ApuIuJ7hhwPV5z1v06CjEzlOiDIsqC5r
         f9DM+zzkFTg170yiNciTf9IZoMPVzY6JrDPmytalgfSnVJga+bl9uIrIjSt70kwxPhWZ
         lgNubit1H/r/xahYemoLlOJ9rrd8PPy4jnmXsNubOrK45nhpSEI1syOxwxUadEJ+7HSj
         0CfCLjMTsvLkyG0lZgj8v3eDZq4Zn4N+/Kiy19W/8WQllIrTJ9Cbf7nkaUtuiES+e3iP
         de3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768765396; x=1769370196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3WkwnRacVzZnF9+VHDBdh2NvGD/q/Isu1ZQKlvNDN0I=;
        b=YHuYbu3WZfhxWQ87KazhXLDKQ58nn7qVaY1fqOImKCGo6mLdAZKhAi6dpG6Tp6uAeB
         KWiFNLb/Kks+r+uk7lPhE80D0lUVppZSgvalmXmrAmEl4NA/fm+90FyDlt0y1kv9qAMF
         /zpcGxzOyiE0b2Ao3muFb07rHQTYHErwGOIpZXHX31ncsr2mndbbjiDReab0GGmdAoXt
         KIVoN2yu9VPXf+dFVmcgHImrDXOtCI7XL54TXbFgCyV45M18mQ7Seh7S1myJgWZllrg7
         iKOs7skkInNrU3kNrqSH3/1ISwXFLOkYZLo+5NC6418UXeCfkp6zRoCU2E9AD0zubOW+
         uR1A==
X-Forwarded-Encrypted: i=1; AJvYcCWfWpxdo0FwlAqwZYPxwCl5bIK20Hx1UvDHJiYPA9zibnqE801VF6UGTJPtPKYjhagVILTz5IYlsZVSrsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbQHhQ9QZM+NmvGDUYhpMn+3mONxYdbTT6Y+FYM9M3gtQq/yK
	CVrx8IQwR2fievHQUPKc1KsFQgxDReEgS4sHhwH3FH4EgK5HVR0LrWneWAdVRlpzkFOscJQZRG2
	RLob9gLpZPHGUPOufhsNkvVk3qrPerPk=
X-Gm-Gg: AY/fxX6G+jcJRymFNISHaGcCcmu4+KKTp9NYCSaFDLZB4DQ0m4DJsh9YrBlSwqyVyB7
	crqsZsaoZ8RV32ugQqsdPXQiGqz/Uhkf/UvHYdnEbJSqFrz5yIb2H74rpn0Idl0hm8Yv0IFelVz
	Cfl9lfnjE7AABw/OC6cBrMbBw6gEHba1aiXxcQlKYcX+cdZ2EWzfyIotNGPw73y2Y5o85OHwwwo
	GMYwolps7lncB7m2OLZ+osB1UMLxIjsHO4LB5ah7WXSByYTmWFvblp5i1oLXSZofqCo4oN3I5is
	Y4HZwSEBnxC2KU10FFySWlC6MTL50T10o2HwCwGyDFhSnch9yyPgCJJSr6Y16lSagjPEcX1Onej
	RUz5A553MRimh
X-Received: by 2002:a05:7301:1f10:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2b6b4114382mr3414544eec.8.1768765396119; Sun, 18 Jan 2026
 11:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115183832.46595-1-ojeda@kernel.org>
In-Reply-To: <20260115183832.46595-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 20:43:03 +0100
X-Gm-Features: AZwV_Qird-lwibLosQ8SVV1mDXaYy8TIK_gyKIQwJqqY-9VOd-kxYQI5T5v3RQE
Message-ID: <CANiq72mRB1Hhu=m26GsFHDTdiRTditNZGT4bRYWhWo_oBWsYXA@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 7:38=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `rustfmt` is configured via the `.rustfmt.toml` file in the source tree,
> and we apply `rustfmt` to the macro expanded sources generated by the
> `.rsi` target.
>
> However, under an `O=3D` pointing to an external folder (i.e. not just
> a subdir), `rustfmt` will not find the file when checking the parent
> folders. Since the edition is configured in this file, this can lead to
> errors when it encounters newer syntax, e.g.
>
>     error: expected one of `!`, `.`, `::`, `;`, `?`, `where`, `{`, or an =
operator, found `"rust_minimal"`
>       --> samples/rust/rust_minimal.rsi:29:49
>        |
>     28 | impl ::kernel::ModuleMetadata for RustMinimal {
>        |                                               - while parsing th=
is item list starting here
>     29 |     const NAME: &'static ::kernel::str::CStr =3D c"rust_minimal"=
;
>        |                                                 ^^^^^^^^^^^^^^ e=
xpected one of 8 possible tokens
>     30 | }
>        | - the item list ends here
>        |
>        =3D note: you may be trying to write a c-string literal
>        =3D note: c-string literals require Rust 2021 or later
>        =3D help: pass `--edition 2024` to `rustc`
>        =3D note: for more on editions, read https://doc.rust-lang.org/edi=
tion-guide
>
> A workaround is to use `RUSTFMT=3Dn`, which is documented in the `Makefil=
e`
> help for cases where macro expanded source may happen to break `rustfmt`
> for other reasons, but this is not one of those cases.
>
> One solution would be to pass `--edition`, but we want `rustfmt` to
> use the entire configuration, even if currently we essentially use the
> default configuration.
>
> Thus explicitly give the path to the config file to `rustfmt` instead.
>
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel

