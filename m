Return-Path: <linux-kbuild+bounces-8789-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B18B5042B
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 19:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9CFD16764E
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 17:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF39356916;
	Tue,  9 Sep 2025 17:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQHgqusb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3990935CEB0
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Sep 2025 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437941; cv=none; b=U0uxqqfeOCvVgnmIkNrVje2jsMj1ltkHaeWueyOk0gug3M9SWvKwUjPnO4jeoTUigoaBIoMxjUILD7IUrVrH+i9NiNPi893tz8QS1AWIW/L3haCK5rYJhWgEXgkCKNlgS4LnosxD73vTiL5Y5G/ggq6scK72MtRPk6hvX3XfgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437941; c=relaxed/simple;
	bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQWcaFZq49KiyeBJ7buwNkGcZaeAXYLASdLpSXB2/GucfX59e78Z/mqoFG64wL5Sfjg7dtvlvwO5KMbvp5f/q6szTwWVxea3GeItSV9gaxtfv8TMuQeBHdxipqApj5vtggabufp+fyuB8brhGCafDu6FCscftpWZWT4WMenjoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQHgqusb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-248f2da72edso10724675ad.2
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Sep 2025 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757437939; x=1758042739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
        b=RQHgqusb43uEsiz/Qq24KeTT+MdFr5ccsOa9UTnWOOLEk8F3LVY2TglbSVdpWqvVWl
         NtfHKVZAs/i/OZDclB+jYnRKTuHEN82chf6QE/eOpdGIDn8u0QqhGXuwG8aBA4Okj95P
         zdG72TH6jETBVDLZ6tZzWKYSGL5+m23FW3FavHe/pSLojZiEilhaotgrP4RszInAB9gg
         CCFlud/LUeIiJ1owocLE2Qib3QaOlGKYEYyk6+vDYrz5LB0+6CsiPZa7xZqvvibQScbr
         Yd8qOrmIUhXp2s22rez+UIMXsixe/nrp119PbSIjktxN2lyU6qKDMo2M33HI+1B/lHyA
         Fi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757437939; x=1758042739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
        b=aUj8lsuyzZgnNUM+xOTbECnsxlFmyCAaCSS4qLNU2bzz+UPi6qduJTyvEIas/BrCC9
         9g7VE3v0Nv36VnpRZetkw/1L0Fhfuhxk98734HCvfTGNJAwTFtiThLZuQ3goVXj7BkiQ
         wZEobUsPP2eUCH1lTNC1OxbYEAyrzy7jWJystG0tikI3Hm7eym8+cQt2Fn9uQH89Krbk
         jvnL0p0iXnGJv7JwW2/Pe/6uednupdnmOssQTCKODE9AF3r4vC155ozvKniqAKRIxQBo
         oaFLerRbS58EOraNLBRvFmbnqNCvBAJ8M+tNciSDR2QTIOheeVqURZKGv5GLU5Q3UCVy
         OumA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6nI3AsUdW+5hXcRUgNtxAvfLhcWwq2s7iVBb2RV/dJb/rJ1KkJ+KiPKPP5wHYCXFzH80xI9Ati6wJYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGadVI/lGoWlypWp3eLGMOBNT2kgq/JSBqdLDcYYxjpXJAYqUL
	429OnpCvnNWQ3rmBgd2iaPiOTLU6J3a+04ioP6PFHw0G8RqPFNy5xCtwuzvcIemYngVDGDJgBhd
	XwAOx9RrNsLzBTfO+x+kJIvqyMbOrknI=
X-Gm-Gg: ASbGnctjMfhLPyoFw5xYpyhlv8BrhdvwbUfbONgxZ/KY7gAzoj62tmZDi5Ei/sEsDoa
	WCNiXEw3JmKwuzJDYZhPuT2qh9aTiMJmAwKhFgp7ZNPX59PAbbJzYeIiWKThztav1E4GCuoH5QK
	P9+ir+C09GdxMUG5miSoeGDmhe7Vgl8nD792Z3CUM7hGjYhnnESppNZR8WFoxdj73qNDeSTbVjf
	WwRvp/Kb0RrRnZjeXUZ5ceWpKBYiKdhMqxUHK+rA8mm7aS2Kehv3BCKl95Srw49L8nYNQNaUyD7
	MJSEuSnaxpMxsZ9Y+XtN3R+rLQ==
X-Google-Smtp-Source: AGHT+IHd4zHzKJHiSaDYt+fas3wn4v2M9LloxztcReggEbdZvs7nvGHlisZ6Va1BAVyt7RDoMvRIKgyRryjYrTxDWWk=
X-Received: by 2002:a17:903:1cc:b0:248:a01f:a549 with SMTP id
 d9443c01a7336-251771d5b61mr95742675ad.11.1757437939384; Tue, 09 Sep 2025
 10:12:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
In-Reply-To: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 19:12:06 +0200
X-Gm-Features: AS18NWAUC9KOXLRVuptzGWpY6jU98Yraxc-lyvHQvj-0Ea4KpP1HNw-UevG-aP8
Message-ID: <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 6:55=E2=80=AFPM Asuna Yang <spriteovo@gmail.com> wro=
te:
>
> The separation of get-rust-bindgen-libclang script is reverted based on t=
he
> concerns raised by Miguel. However, it's worth noting that we now have 3
> different places rust/Makefile scripts/{Kconfig.include,rust_is_avilable.=
sh}
> where manually calling bindgen rust_is_available_bindgen_libclang.h + sed=
 to get
> the version of libclang, and in particular, for our newly added Kconfig s=
ymbol,
> we now use awk to canonicalize the version to an integer. I would still l=
ike to
> do the script separation later for better maintainability and readability=
 if
> possible, which can be discussed further later when Miguel has time.

To clarify, since this probably targets the next cycle, there is time
to discuss and get feedback to do whatever we feel it is best
(personally, I can take a look after Kangrejos at some point). Is
there a particular rush for this?

Having said that, this v2 looks substantially simpler than v1, which
is nice, and perhaps RISC-V wants to land it already. Up to them in
that case.

(I see the `ifeq ($(BINDGEN_TARGET),)` is still there -- in general I
would suggest splitting things if they don't depend on each other, but
it is not a huge deal. I would also probably have split the
`rustc-bindgen-libclang-version` into its own, but at least that is a
dependency).

Thanks!

Cheers,
Miguel

