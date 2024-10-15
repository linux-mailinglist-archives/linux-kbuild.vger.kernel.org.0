Return-Path: <linux-kbuild+bounces-4125-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C399F133
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 17:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AF771C232AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 15:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6FC1D9580;
	Tue, 15 Oct 2024 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDfKbT8g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991DE1B395C;
	Tue, 15 Oct 2024 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729006219; cv=none; b=GnWn7V1rDvPeMs3dVnI8LFwuYtILNzXkON1eJqxy0LsqhAJJ5SF3xUD3pY/US7QRxo/P9+mWTVIZLrwoaX4u3I9Zmo1eLJAy70Wl/KRWB5joknBTHKeXDd69fw/kRULqxHomg07ANf0CV6kNTzB7fL8TeIpImJMNsxk03bQ5lJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729006219; c=relaxed/simple;
	bh=sXzHZKex3O/R431ucGqv8oDbS25HcRRzrQ/UHyH0e7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHPtqlZsXJkK8t1XYhNeRROq/s45hIG9IYC7jN7ZvJ+aCTHTyYdXLn+ZoAYJpcpTDhCayvBbDRX6Pm12ygQ54afQL7XpFUIv3krenaU6ZzQPeTgkSocfw8r0WUVyJ71Ks0IN7oTKDIpTiXPG3wjx8CcSlwYOJlgTGnRJsj/F6HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDfKbT8g; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e29497f11cso1042701a91.2;
        Tue, 15 Oct 2024 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729006217; x=1729611017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXzHZKex3O/R431ucGqv8oDbS25HcRRzrQ/UHyH0e7s=;
        b=aDfKbT8gy6Hk3nbJXHyDqA7GF7bY6Wcf4u/7PmQWYjiHjt20HYtW6yRB/cvMM8uYiI
         FuIIDTYBfNlONkipdXPif9Yw1Zo/QbhKiA3g5QdEIR//3RY8I2kNpSIl6QSj1dj8eStw
         9Jrr8Y6r75rHFJoocjbzHrN4H4fxwfKhwHmwk/j6A9e4kZSGA6Ayeq8jpO1aakAm69q+
         9JOgVAyANRAmOFQ0VYah1ad8OUoLeuzv0udPPwZUMmpEw6XCb/W+tfXrY8H55iZK85cs
         aUJG0UBchdXHYTkaVfwR288K+O2iOIcajPfFNTYmpwmW+hc0aHAxKaNXa7Boj65rqotJ
         0TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729006217; x=1729611017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXzHZKex3O/R431ucGqv8oDbS25HcRRzrQ/UHyH0e7s=;
        b=i0z9zJ5y1wwMOwbFH/GxhWNIpRUfQIKWfr2k/BbtSgm5/ERkLnnw41scMY/oyOeApR
         KKGc96L/5TO+GDyQ0ALECi/ajTVDIYkZ7KtsxhsajCPCmoM8slWoH5FUzXBubNN2f2Xs
         Y3jxXBsBiXHyAmXtLKJbimZGJFa1+3oeL0TC4Pt4H/DSbwa2v2+55faRBwWQf3vPXaa2
         nPIXE7nstljhZA7BbSSu0VTJaOvlxXW7fTAbHTZl7mW7/q/kPiLCWZvmJBKXHuU1TNkj
         yFV9Ehh0isuEbec4gIZahKwwgs9Y1PV+wHR9jhGnCZ1Fl4qwZtiJJfL+p7hbxdARPiyV
         qHXA==
X-Forwarded-Encrypted: i=1; AJvYcCVdx0IKNK0gVi4bvdTdJ5pM4xx7b39HItodQy7T5vEONiyqDk9USZ1NwXMlD98l2OyjUXdMc8EUqJXiwHw=@vger.kernel.org, AJvYcCWCCRgweK77iIQLa1KESgUSYxpMWOXH6d2KKJ9Dk+pDDBxec6DnmW4770xcXbbW2MM1xf1LtGQy5qeUwOSD@vger.kernel.org, AJvYcCWWCGmDG/lSBwQnNGc+yUYbJo8aD2iu8M+UcPYrBEtdJmxarOBKY6cDmef/35wyDdK+FzGrWnvtyoJuqHAPfiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNsXqcnJ9ujVm8u1uW1igwyC0XwyYoQIImZJhFTlGHgWi8xpzg
	YFXl0KUnesoXu49Lf/oUjLZ3GM+NVt3R6tFOT40DovqNH8xnsPPIj1vEKdulXUv++gXj4eth3cI
	c/Cje7/qxOqR984QZy07akWlw4+Y=
X-Google-Smtp-Source: AGHT+IFYPI1sS9Do3ij/vZWzq51w9UV/EVeANHg7gZjXr68H4ERjAqiXNMQxEm4o9oWPoPUFljYSgKcSY56/JMUvBVY=
X-Received: by 2002:a17:90a:9606:b0:2e2:b20b:59de with SMTP id
 98e67ed59e1d1-2e2f0a82042mr7735294a91.3.1729006216947; Tue, 15 Oct 2024
 08:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CGME20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514@eucas1p2.samsung.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
 <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com> <CANiq72n+mWOP3xNUU4Mep-n5QtJ8zQiwP9JZ-KX68+fOC0GMmw@mail.gmail.com>
 <CAJ-ks9mrY0eWjagq7hnHzY9jMRzV_4NS1cBfg4ad0v9Q3aV38A@mail.gmail.com>
 <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com>
 <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com>
 <CAK7LNARg=ZvD14ARKw40uk0XNfE5qgWqsrM6H4jBJu0m5XYCWQ@mail.gmail.com>
 <CANiq72n6zkCZdUJ0A8enLW3BgmA_=eJKgDKwNCfs-q3dfeR2BA@mail.gmail.com>
 <CAJ-ks9==6mi7SF5rTR=YouwC6RwktJftqXHqhsBcHNTWxdbfig@mail.gmail.com>
 <CANiq72nBYswZs_m9Ky3KKNz_WmHrsSoRDJqcuHGt2WpvUogtqw@mail.gmail.com> <CAJ-ks9khX7Ha4iGWOkbHeXzJLPisE9r=+q54Z9HMQkojR=-a8Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9khX7Ha4iGWOkbHeXzJLPisE9r=+q54Z9HMQkojR=-a8Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 17:30:02 +0200
Message-ID: <CANiq72=mUeMYvgfQVozr363juCuKmMVNx_13dj+q=3KKJ4DeHA@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Daniel Gomez <da.gomez@samsung.com>, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>, 
	=?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 5:06=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> I did more digging and I don't think this is going to be readily
> fixable upstream:
> see https://github.com/rust-lang/rust/issues/131720#issuecomment-24141799=
41.
>
> A symlink fixes the problem if we *never* specify a path to
> libmacros.so, is that how we want to proceed? Note that currently we do
> specify it in one place in rust/Makefile and again in
> generate_rust_analyzer.py, so those would need updates.

If a trick still requires a similar amount of changes to mainline,
then I think we should go for something better/more proper, i.e. the
idea is to minimize changes/complexity upstream, after all.

Thanks!

Cheers,
Miguel

