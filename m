Return-Path: <linux-kbuild+bounces-2930-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F694DC86
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 13:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5CD282961
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 11:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23718157E9F;
	Sat, 10 Aug 2024 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLEgwVnj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23A2157E91;
	Sat, 10 Aug 2024 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723289777; cv=none; b=HYg1RxzxKBVPKow9qKqVwjsa2IdQYpzwWtCwFHNvsWJ0ehwStdup3fIEehVtZUHfMCK9NDxKo4Vea3uQR/xcSdsEP3AMp07xtaMzmQmrC4Nc43rCaMVSRB3jKR1TpQEOArQ1HBEQUvSEuIq0ubkzVuXNojC2v1BlkhYEhDMM9KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723289777; c=relaxed/simple;
	bh=pRDv7ES/6srChhxqUba+UjeIOeYp7UdK0hH4IWFavG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+5GB5gI3ALevC1QNO5Ls+yLrz74Ej+OoBgwD3Xih/RVAR4zXvrZZdUSzu4T/yCjNAo8fCueCJPNY0A7COgD8Xju6COUIGyLJMODnCCfNTr0DawWbCRVvLgEUxiRlbrH0PhYqvfkhWv/7XfluCP2KPvoS3O2q07lvGGg1CGFr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLEgwVnj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7bcf8077742so2102317a12.0;
        Sat, 10 Aug 2024 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723289775; x=1723894575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRDv7ES/6srChhxqUba+UjeIOeYp7UdK0hH4IWFavG4=;
        b=RLEgwVnjEt3745iTP0ZeClyT4adSbYxNt1Cflaqh4ohHWuozTeK6K9q9jeYi2FLl0S
         kKSBv2pPFx4oNjJJrlNHXDAOQS5Ew2EA6YfumbmnpWlkD85EZJwzNn+q47rqY08RSYky
         5A/UEGjLFWKO+qacvjnj3apJJrwI9C6z3zhuXfoiREj0NPK5HPedujwM/gJIZek4uXe/
         zgt7WYop3/btCkgCXv0Ljc7kNNTi4AqEdIOvGrfJ7PUUpnqcVwzIaCP566vyMdY0kQIf
         hGWs2LBOR45spZBAm0UgVUJFRIk0Z6VSiDsDDE/rF35IFfq/RTgT1i9SLeOrWxNota0L
         IeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723289775; x=1723894575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRDv7ES/6srChhxqUba+UjeIOeYp7UdK0hH4IWFavG4=;
        b=VdShSYGDNWat6tzp/XhRWI6Sjxg5sR5FOcNZ5AprxG6KhNqwHqXnSMsYjQxUiNY3tN
         xsu2Qre4FpXgrCFjWgfKeQ2f9pPFphePXkcSrkaOp8pkE4F1Pv893pHdvxEnAumByws5
         uiuRB0bZR5cVFZw090UIaBmF4PMo+MZxclGX8qgFGXSl90/ZwuW39F5TbiPfhczH1KaW
         UAwl3v0J55AsMLkg14fCVfSP8ZZONk07N72LP8WOaj+2b35LjqKzFJXjxrd2nvFy+9YF
         5Ycou/vHcE1f6jvHKfum5ga1OPHOD6bGkKoeLesufXw0A2ybMwlczbSzx9UVqMzHacoC
         AFcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA40qrBS2CBhwhGPguTzu72CGD8xGEzV7VMFC+ie0JCytLv4/L22h6h65P9z5GaoIOMTmDe4yBaNUHM8WmYuuwcPU11xNeKF0nksm0IQ+oNz/D3z2L/ha/7IpKAyEJ+62EYKtmTjPw8PNVFYkfRru81dp5VFfw6MuYdZRL0SslG1XM1+y3nUkXsRk=
X-Gm-Message-State: AOJu0YwdxvSVqT2HIUEYTMO2mlUuTGDyy8SiS1Mk0x+EkmUuJe/gHWqr
	wh6Jn5k6S7o6DpmEJZKu+3KLsR3AIdXg3uKjdb8plGE83Pr/ITYMv6D7h+uhkFnoAnantXzJp+7
	qHFnrvurWKtD7qAfp2hGFynZ5V+JDDsgDOIE=
X-Google-Smtp-Source: AGHT+IFpnJ7gvKTJSB6GWIWnhoHi3O1Ctb9UwS4DLIOCEJdg3CUgwGq9dgvZ3o1M5AYwLlbS30DJQDd8snHf8qzoS1E=
X-Received: by 2002:a17:90b:190a:b0:2c2:df58:bb8c with SMTP id
 98e67ed59e1d1-2d1e7fdb96amr5139875a91.18.1723289774767; Sat, 10 Aug 2024
 04:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <20240808221138.873750-6-ojeda@kernel.org>
 <CAK7LNAQBG0nDupXSgAAk-6nOqeqGVkr3H1RjYaqRJ1OxmLm6xA@mail.gmail.com>
In-Reply-To: <CAK7LNAQBG0nDupXSgAAk-6nOqeqGVkr3H1RjYaqRJ1OxmLm6xA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 10 Aug 2024 13:36:02 +0200
Message-ID: <CANiq72knS9dGTh1uEQzYvmZuFz6fE8tNhZ8JEuyKFHYR=Kh8sQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] kbuild: rust: replace proc macros dependency on
 `core.o` with the version text
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 7:31=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> The touched file, include/config/*, is an implementation detail
> in Kconfig and fixdep.
>
> Rather, I'd like to put the string "CONFIG_RUST_VERSION_TEXT"
> in the comment of the source file.
>
> This is the idea adopted in include/linux/compiler-version.h

+1, I did it this way to follow the same pattern to the previous patch
on `core.o`, since that one needed another approach, but I am happy to
change it.

> I do not know how to do it for rust/core.o because there is no in-tree
> source file.
>
> But, can we add rust/core.rs, from which
> rustlib/src/rust/library/core/src/macros/mod.rs is imported?

That is an interesting idea... :)

Hmm... I think `core` is a bit too special for that, since we need
attributes on the crate root and it is the one defining things like
`include!`. Even if we generated the file on the fly to mimic the
original, we would still need to handle the paths for each module or
recreate a directory hierarchy or similar.

We are also in talks with the Rust project to figure out building
`core` in a stable way, so the details around it may change too, e.g.
probably something like passing a flag like `-Cbuild-std=3Dcore`. They
may also want to figure out the right input file path themselves, i.e.
rather than having to provide one from our side.

So I think a hack may not be worth it compared to depending on the
implementation detail, and may be a bit brittle until we know the
final details of that.

Thanks!

Cheers,
Miguel

