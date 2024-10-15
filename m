Return-Path: <linux-kbuild+bounces-4118-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4700C99DB2E
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 03:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A5741C21351
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 01:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8196913DBBC;
	Tue, 15 Oct 2024 01:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mfasahkd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95C9137930;
	Tue, 15 Oct 2024 01:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728954688; cv=none; b=O5ARVeW2mVujF9Adkjp1QDfVmy/Wyhcxmsh9BWVASVW0Acij5EOAzPjxLl7mQJHxJLHJ5fT3rA7t59Bzhzd8qPtQyVt0i9bmh/GHV3wJRY8APLS+Zsa9IRS1I0gyVohc43Tw6/LM5dpdoz2OR48CSMgkBfapCTgwJyh5DaKD7ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728954688; c=relaxed/simple;
	bh=GFiyNF6adA02Mq2IVwbmM9nOQAw+5VpG9OYi9gku6fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gxl+ad8fGjo1rONnt3wvy2l5qiJ5vkvn96M+4QpYTf9ysQQgLsQqcYS5Z99oEOi6eKRFOEkxUz1yDpHedQbURbEYPWO1WxBWeK5xs/MBaiF5Z8XgqMy8wTOKWvqhAWWxaDrvWWLdzs7omI5FZ4ENovTAPg97i9hx7rqiPJiCY7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mfasahkd; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso21066431fa.3;
        Mon, 14 Oct 2024 18:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728954685; x=1729559485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsWOsNGSGmtH0ytbyOdAJmfSCP9OZiNKAIy8ksHhFEg=;
        b=MfasahkdprxRRAx81tKflRVOCQdrXV/nexoTsLvX07g847A/pYm5Tus2fKX3LmFQH1
         g9v8MaIUugcFDnxGR1XZEcKRXCLayvDDTs8cUs2LFvZB0jwvVRcXZW64l6rDp0IKheue
         yPl1R0urFrZa9wuhrlfRCOTnOrQJuYjAUwtMQ/AkHcEtDkTW4xJV8kYKo4JHYQDsZg81
         3qDDoRNGoe6zSvTHEPgv5iZe8OD+a/7CBeNsX990+dh/1N5WWWPdmZxjjVRlnL/57Xh5
         nDbB2lj8QGiS1QPjUAFv0+1NdxeaVz/rAU4nnXMs3feVpXYSS8x6u/YyqKO4LAWs28dT
         P4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728954685; x=1729559485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsWOsNGSGmtH0ytbyOdAJmfSCP9OZiNKAIy8ksHhFEg=;
        b=nn+HRxofZeCziL2dx2NZuDp0s9dWIxanzWC30fe232sLqyxxHd9ay+Qja4NuBYAUMN
         oaoV6SSSULYi/DTomJ58WRPMxZop51vXv6ns+6O85W35HQKB1DNEWNvWuEEfkLyb4XZc
         UQRcnhFfIwaVc76j0wd/6l1C+1f+a9dVGaH7gNEbTBe9AOWSXDMccmuTEmOT/VNCp5g4
         xv9r2t1yUVzTkJIhl6c9WvwgkVwyqwGehwJhEXZjLoENCqfZTEUhv0nc9vBw5nJsCWdT
         LijD+r28o5ymlobeXAXxvOee52Wesg6umaBWdQL3Up4KYWvswHBYca3Zurv+GYoKXL58
         VpJg==
X-Forwarded-Encrypted: i=1; AJvYcCUrpH7PI+3AKYQK0BQyQX1TzwX56ePEvnRjsuzWEvXRYPwHDvzzdsHZS6MeEBnGDXooNFlFq/zwKN5kgyvi@vger.kernel.org, AJvYcCVeekG46GO7CAyn+w1zV5HjvJ7yKt2zq+y13Uok+pVM3wC5USKecMJlJuXziNvgDk2LNLp8SQmJIgOyE9wSlyE=@vger.kernel.org, AJvYcCXAUKlt293r2W4HEDDfOoHrdeZAOGPP0xiNASTer2qMVa+qyq0SdOvvSfrk+gBK763NbVgMMiFpMbu5+a0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOH8TsXSJtIYO+nmxjZhhtxLFiQcsSGlCo1wFYcyn+yi/rifpY
	HDCgYCEQCRObFgv5fB8qi/KOf06VPMG9T2r0XpxOULlCLOoavdYk/0X4AoWdinYmFPOAfXrlqF4
	CgACCVgGN63pBP6ghJOQaZdxk/hrQW3us
X-Google-Smtp-Source: AGHT+IHReT9937E4Y9zh0njLxZI25BwdY635Ngg5j+l95zk7/wFOGUxVmLiWq8NRh5rk0cLmmNwyTdGDJcvqHHKYhss=
X-Received: by 2002:a2e:bc26:0:b0:2fb:36df:3b4 with SMTP id
 38308e7fff4ca-2fb3f2c7231mr53143111fa.34.1728954684446; Mon, 14 Oct 2024
 18:11:24 -0700 (PDT)
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
 <CAK7LNARg=ZvD14ARKw40uk0XNfE5qgWqsrM6H4jBJu0m5XYCWQ@mail.gmail.com> <CANiq72n6zkCZdUJ0A8enLW3BgmA_=eJKgDKwNCfs-q3dfeR2BA@mail.gmail.com>
In-Reply-To: <CANiq72n6zkCZdUJ0A8enLW3BgmA_=eJKgDKwNCfs-q3dfeR2BA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 14 Oct 2024 21:10:47 -0400
Message-ID: <CAJ-ks9==6mi7SF5rTR=YouwC6RwktJftqXHqhsBcHNTWxdbfig@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Mon, Oct 14, 2024 at 3:09=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 14, 2024 at 8:46=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > rustc ignores --emit=3Dlink=3Drust/libmacro.so
> > and produces rust/libmacro.dylib.
> >
> > Is this a bug in rustc?

This was my bad - I set this thread down the wrong path. In fact the
current build produces libmacros.so, but I haven't been able to convince
rustc to consume it. Changing `--extern macros` to `--extern
macros=3D$(objtree)/$(obj)/libmacros.so` produces 'error[E0463]: can't
find crate for `macros`'.

With a toy example, trying to link a proc-macro crate .so produces a
more informative message than the kernel build does:
```
 rustc main.rs --extern macros=3D./libmacros.so
error: extern location for macros is of an unknown type: ./libmacros.so
 --> main.rs:4:1
  |
4 | extern crate macros;
  | ^^^^^^^^^^^^^^^^^^^^

error: file name should be lib*.rlib or lib*.dylib
 --> main.rs:4:1
  |
4 | extern crate macros;
  | ^^^^^^^^^^^^^^^^^^^^
```

I've opened https://github.com/rust-lang/rust/issues/131720, let's see
what the experts think.

