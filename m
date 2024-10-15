Return-Path: <linux-kbuild+bounces-4121-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235199E41D
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 12:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6480E1C227C8
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 10:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD5B1E906B;
	Tue, 15 Oct 2024 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV0VGneu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556241E4110;
	Tue, 15 Oct 2024 10:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988401; cv=none; b=m6XDeuwSBrh25wG8YLaNGqIwBJOAxQw1oajOQTeSYC7wj7/usH+FFuzyblGrL1TNWb7SegVBbgABNoTuAozjVG2vLfOo286VDcUx+jw3RNvGlJgvV8Dhnp+qJ8D/+y4HRDG6JC1jyUmch0rH/blxUpcRSMQQtXic1LcFfFavGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988401; c=relaxed/simple;
	bh=lXqo21sgwNqWP+gBle8iCEqt4Du1RWaVF9uzdyDLp3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfqTM5/e6UxvO57liyR+XkDiZljUyWTYPCJV8KFD5Oumse8xiNmgEGwks0rDZ8+aB9ctigh0287dz7jfzNy19YWodEg5VujksTDCRVgS96Be7K8lq6P3T6iHe/AvBTqv2XOwtghc917GIT8T4Rzh4KgGYY+FuRhONM4Mekyl62M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QV0VGneu; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2d83f15f3so933168a91.0;
        Tue, 15 Oct 2024 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728988399; x=1729593199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GltPBs08Kl/fytpBSYmRA40owGde5NS/uPC0UnXNWV0=;
        b=QV0VGneu1/Mb8ck+HuH2zBdGt8aP58pg69CP5eVhOzB+cpO0r0xPc3bDLIDxcpD+9q
         TQFP0cCwhmpREr4IoHAEzRZjq0NjSKUn0hMzdTgR1YVoQ9ZXOOvR92UJuZlkbeXp4Cq+
         D2II2nE3UNtY2iafDdMGGuPrkK4yXv/n2pt61qsfsTO9cSYQgmj/ykMEfbKY3/GgiRkL
         tIvJHwF0yFbBYU2bBZAXDzx8wQwE84dxaTt6HEPnPIkFVDnga1z60NPzt/w1txjNsbuh
         0ORWDpIGosih3hY5R3HFIxTFjcqfnBOU5Hmql+99ANFrNcvvZabJ9sNL5QIh59QHTu64
         LNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728988399; x=1729593199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GltPBs08Kl/fytpBSYmRA40owGde5NS/uPC0UnXNWV0=;
        b=BJYeoOzKf+jeGuKetBmK1Scm+4zMSXqG2BZhVzdqPrYkGzpv3bWWgm5Hz7IrcMmMod
         kwi6diRIFyNy3VC+WXr+PYqD1QOkyWvneboea9PlyrMhWUjHbaUWmmESfNlXv11+UOgQ
         0IEqCXveBXPO12Pw4zQA1MCpxsGZF2rLle6xJ4ekLRSnAHYJTZy2tK5owV8ReVlQ0qOq
         qelwUwxyJMy2wgrc2Ct1hxBobkMpCD+R5ekeJDoRahvlF701Rw2YLWOWXjZfMNPR0s45
         sB9Gc2iAMx9GCcRm9OgP9Oc1vBTsnnBqphqjUBk18MJFzL/IWTt1smHeXwj3F5MyW8af
         7AlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSLkcnhczUIZ7svZAE6tb1fieiwLr04AfNWZ5b+wVXzUMrM7i9p2KsH2uOCQjnmnf31c5NNmaY2mKfIkE=@vger.kernel.org, AJvYcCWTzcw1CjE4xM7PXFQFWS+NvO+/M8goV8dS7enowiA0+W9umQ7wmx+YefIgb9xOfNQZM1uIv25uClNCz7z5@vger.kernel.org, AJvYcCXuXJr8ORvfDWEzKIuCkeSpU4MitUDxBg3stjQwo2nikty1qqON4AZjvDYVxQJei76L4xMEPezSf5ZNLZIVMc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRf33mOoK5DFMe9+8dBxdhMfU7VqJWD+BK4lTBIpu5FqATMhTO
	8QwPFMAXCWfKgU0UeD3TihndFhLrzGbBmUWKnDuxznxInu46xsRLuM8EYSi/w4+UOMo0T2lXIhJ
	5fxem4dsWOlc6lzr8cGvLNuoT3sY=
X-Google-Smtp-Source: AGHT+IEOdEVCRTYytB+pvjhxhlGxQl5GWJcx0C3P97d0Hmb89OoPkN9b42EUAsEV0iGg2CbRiwajNuwdLBgx8+ycOYM=
X-Received: by 2002:a17:90b:360b:b0:2e2:c04b:da94 with SMTP id
 98e67ed59e1d1-2e2f0d77309mr7056673a91.5.1728988399600; Tue, 15 Oct 2024
 03:33:19 -0700 (PDT)
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
 <CANiq72n6zkCZdUJ0A8enLW3BgmA_=eJKgDKwNCfs-q3dfeR2BA@mail.gmail.com> <CAJ-ks9==6mi7SF5rTR=YouwC6RwktJftqXHqhsBcHNTWxdbfig@mail.gmail.com>
In-Reply-To: <CAJ-ks9==6mi7SF5rTR=YouwC6RwktJftqXHqhsBcHNTWxdbfig@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 12:33:05 +0200
Message-ID: <CANiq72nBYswZs_m9Ky3KKNz_WmHrsSoRDJqcuHGt2WpvUogtqw@mail.gmail.com>
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

On Tue, Oct 15, 2024 at 3:11=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> I've opened https://github.com/rust-lang/rust/issues/131720, let's see
> what the experts think.

Thanks -- I added some context there and linked to it (and Lore) in our lis=
t:

    https://github.com/Rust-for-Linux/linux/issues/355

Cheers,
Miguel

