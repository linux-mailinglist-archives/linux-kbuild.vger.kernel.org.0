Return-Path: <linux-kbuild+bounces-3988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAC996656
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 12:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297B31F23963
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 10:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAE9185949;
	Wed,  9 Oct 2024 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLcXPAdH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC0A15382F;
	Wed,  9 Oct 2024 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468079; cv=none; b=LVW8n+CS38RaLLYbTI2l6usxvq6EqwuOgth0GfEs6IkOy2uIYl/p4AazKy/yjhUJxlnjTFE5QF1R/T8UMUx4eM4nC5tsagKo8Ge6BPuvhsT6Ve5vclWJ/QdQCp/du2zowBo6Y2pLRfpo3iQOnSdvcEEvM7rSjnnogRdP/RKlXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468079; c=relaxed/simple;
	bh=uQDUq9211a48TjUCS6KlseKbjtQ3LW+c+5F7r7rV7ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYqiOzh34bk0jdBOwSv0PI1U01fLVCw+pDtXebv08/BPi3HexoAlLHlXVAFkD7qkf2sKyqkCyxxaItvWf4QvChCqVkkRPpPgWQcm/41L5z5auvHqBZnukalErAMHoFf8ACisLXi0XHLOthixWpeAETvfWFai0pGFZf1QkccklQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLcXPAdH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e1ed14105so53146b3a.3;
        Wed, 09 Oct 2024 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728468077; x=1729072877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqWZlm3yRT7bzwlRQigXbQucU7XYIO4vwZbCFW+v+iM=;
        b=SLcXPAdHJUqEFCKn/NkzW/8y+tKUSbKuMg2iuLsjh+k7+O2SJQr8o+evOJegBvPpfh
         SHWH8dg5E12d4EABVEDtkk/nGj74MsG2hyZH4+6jPAsL8aXkThZb5clFlObmXPhO7ZVa
         VKwm8C/mZrhrjgK1LJTOnPr/xtkddFQXihB0c/abHocZnseOtnaU3UevVMEUHEUfdwkT
         h4eA4vm+DeGR09GDo7ZmKfrlGDRgf9Y/tU6m5si1ZfhQIW5T2T3vQHTs0uo3JIeLnu8n
         m8aSQR4P6Yj1j4O12R6NzNtktlJMw+hKWXLgaSFaWmMD1htVArAmULKovFTrc0ria2LD
         Acaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728468077; x=1729072877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqWZlm3yRT7bzwlRQigXbQucU7XYIO4vwZbCFW+v+iM=;
        b=VnLbhgmzm2fK9ugH12ortHbF+gvgxo4sl7veuo5GGU7OWzZO7nE+GLENZzy/vkDvFT
         CtLQsM+R5lbwQUP1kOdNVq0yhR9V9QGdivId9/I2Zr4jlBhl5mlrenG3/KSMgmc9sTbO
         mf044fHX6/w6gmSaGKhEH6TVaUbfieBH0SFSlUfCUrG7YCf0RxFIlXecnvRBZHrNTLRy
         XSmIqYTzDb3w5lBZk6+kGBo4uIxLXfcGyVO31o5DTgTQ/myqeonnFRxf5D+utpAz/uyl
         4kkrftRAWnFWNWw2SKIuHZKJbOJfsZVrbuBzgrGSBZUrIGSSu0/hw7q3jqwiqNyNX4tB
         8diA==
X-Forwarded-Encrypted: i=1; AJvYcCVz1nCqmZr7rkfnVSDWLOG0BtjvkDw/qnkUW4ufnpPzF1y7ondV7EkhS8KK3WIaZUeuvHDy2PJLpRXOJuRM@vger.kernel.org, AJvYcCWvFd9mmFMZNuWLZoEI2dZR4VkkINgm5BefjX7qQHtDaP58/PA55P6bm69N0YKF0F94BVqiiLvul7zGkaw=@vger.kernel.org, AJvYcCXy2WGIko0NVos9oLZwuSMg6QpsaV0dRMtWMErtHir34Oq7KzyKIO8IyxSj/4vwYhlZlHSYO0n4qjHrEwua7og=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdgZl4qnopRevdSaZilpasJ8LgPe7fiPcmWp9qqQgXMV5xqdYD
	IvThrBAizOJm5O/KN31cigB8g3jcYeuOOS1hvbjeTu33A+9CzDXLyMN4NlGFc0aaKH22qPbAm0b
	nuAneHWDI9JkxBpjTeOIqV9jEld0=
X-Google-Smtp-Source: AGHT+IHmb0DfZJV94TUYq/kEQy0nWKVz7tPBLXiFEmYCqx6M8cPMAGaISdxcGYMNpt5gZV2ATDCy0RxYBb/Z1lvzeWc=
X-Received: by 2002:a05:6a00:2d97:b0:71c:5e1b:6871 with SMTP id
 d2e1a72fcca58-71e1dbc8d89mr1309051b3a.6.1728468077208; Wed, 09 Oct 2024
 03:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com>
 <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com>
 <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com>
 <CAGSQo03_GZCJrnp9WPxo2T3GJz8TCtucHNx6_rAr7xfJ6ybukA@mail.gmail.com>
 <CANiq72kN-LiTcCjGXp6Gg=51SP+mp12CjAunt2qk4J2ngdussg@mail.gmail.com> <CAH5fLgjwuGUpKogOVUL4+fUW0-xWM+3ZQ+WmSQ+J00G6+uR9bQ@mail.gmail.com>
In-Reply-To: <CAH5fLgjwuGUpKogOVUL4+fUW0-xWM+3ZQ+WmSQ+J00G6+uR9bQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 12:01:04 +0200
Message-ID: <CANiq72k4XcxHQitFzogyeJmX83qFbXo2hwcwPvFjWMDUYhCi4g@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 11:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Miguel, can you link this issue? I don't think I saw it.

https://github.com/Rust-for-Linux/linux/pull/1087#issuecomment-2218445303

(It was in the Lore message I linked yesterday, sorry, I should have
been more explicit)

> Masahiro, are you able to clarify how to pass TMPOUT to rustc?
>
> __rustc-option =3D $(call try-run2,\
>        $(1) $(2) $(3) --crate-type=3Drlib $(srctree)/rust/probe.rs
> --out-dir=3D$(TMPOUT),$(3),$(4))
>
> Should I use $(TMPOUT) or $$TMPOUT for this case? Right now, only TMP
> is defined inside try-run. I am assuming that there is a reason for
> having TMP be defined in try-run, rather than just using $(TMP)
> everywhere. Does the same reason apply to TMPOUT? Should I add a
> TMPOUT=3D$(TMPOUT) inside try-run?

`TMPOUT` is defined already in that `Makefile`, thus you can directly
expand it. However, `TMP` is defined inside the `shell` function, and
thus `$$TMP` is used so that that script (inside the `shell`) expands
it instead.

This is why Masahiro was saying that the `TMPOUT=3D$(TMPOUT)` was
unnecessary, i.e. it would work, but we can just expand it directly.

Something like this, combining everything [1] seems to work for me.

i.e. passing the file inline, `RUSTC_BOOTSTRAP=3D1`, avoiding an output
file, keeping `--out-dir` for intermediates files. I added using a
null sysroot too (and skipping if already given, since that is an
error).

I will test it a bit more with KASAN etc.

Cheers,
Miguel

[1]

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 057305eae85c..3ce6a808764a 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -76,7 +76,9 @@ ld-option =3D $(call try-run, $(LD) $(KBUILD_LDFLAGS)
$(1) -v,$(1),$(2),$(3))
 # __rustc-option
 # Usage: MY_RUSTFLAGS +=3D $(call
__rustc-option,$(RUSTC),$(MY_RUSTFLAGS),-Cinstrument-coverage,-Zinstrument-=
coverage)
 __rustc-option =3D $(call try-run,\
-       $(1) $(2) $(3) --crate-type=3Drlib /dev/null --out-dir=3D$$TMPOUT
-o "$$TMP",$(3),$(4))
+       echo '//!\n#![feature(no_core)]#![no_core]' | RUSTC_BOOTSTRAP=3D1\
+               $(1) --sysroot=3D/dev/null $(filter-out
--sysroot=3D/dev/null,$(2)) $(3)\
+               --crate-type=3Drlib --out-dir=3D$(TMPOUT) --emit=3Dobj=3D- =
-
>/dev/null,$(3),$(4))

 # rustc-option
 # Usage: rustflags-y +=3D $(call
rustc-option,-Cinstrument-coverage,-Zinstrument-coverage)

