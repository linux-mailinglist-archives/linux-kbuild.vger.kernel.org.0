Return-Path: <linux-kbuild+bounces-4009-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9B996DBB
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 16:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FC9D281EB2
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 14:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278FF1993B5;
	Wed,  9 Oct 2024 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfuMs4Am"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36D745948;
	Wed,  9 Oct 2024 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484140; cv=none; b=NmRFs4HqgFaiuuMpYZxe6QbliRsGa8yzNw2VGSCXK0zL84x7ReSyiJ4GXCpD3G/6Cr8yaCzrCrIn198we74O9eEfh1b+FilhMU0v7WGHPkGqOtrO8GL9gOayFZl3fDNytlFPrZlEXj0OzVYR7pmhjrBzhlbjvGUBsvifVTENEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484140; c=relaxed/simple;
	bh=pIA8LmjZ6+ktG6BChx2asgYqiokAWpkjaZEE3lQM5FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=es6xyxNNKq9lo8tYWlt9xWFeRzUmz85LTIqleyhg+n744/kzvUs7CzVmUyyhbUat3y27j84yKrj+96MHHRY3feD/TaY5nR24eZ0iTQxVCreKH5uBpKmBMb/lCybrH0J+aRPmfPRPFW+iLOzgeWKE4/DMvRWB/Y6YL0/lb5sX1Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfuMs4Am; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71dec222033so632215b3a.0;
        Wed, 09 Oct 2024 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728484138; x=1729088938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmaDJ9g2dY7WtuZq3lYE0QK7cbtkEy10zJrfuCrniLw=;
        b=LfuMs4AmeOxg49y23nP2YUp+NfV+Pc5Bq64s9oRLpfSpDndOZEpF1cS0wDl0Pk6X6g
         V+z/ToNo6FUEjiCC8ZnXCU2E3ivY52BMLn0V92W3MkmQ5U52Ep/MMa12aAGYoV3xgMXq
         F0dNvI0aq7UG3GYHKLM4H0753Z9sXP2zz/vXkozkbtL4fQFLyPgQbRxOZvsibJnoX/AE
         emkM9h4qxMXsKdc5XRQWEVXou4t8TcemfN5TNOqI1TgorJO1tuqPJPVD9v8IamidYxfk
         mNLi1qzGvBZcCflvtlGUn/I/WRMy+TS125C3ojtLGV20FibMsaJAI3zJmBHEdfHj+qC6
         kgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728484138; x=1729088938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmaDJ9g2dY7WtuZq3lYE0QK7cbtkEy10zJrfuCrniLw=;
        b=cO1AkTNX2h6wmODAbiY3fnkGKjy11nmys9O1ROm1jZEWXzONnEZF8mdiZ21yohs0WH
         XLwGNAp1Hgkd2xPbFTxKoxTepjn6UEVaEYidvV+wk4UJGapTjMtPzSAQpNGJuIFvDBuC
         fGMD3WLZv/oieHoV8qL2Z4mZbbNyJpnDXl2v2Y1trmHuKvwCQPANDI91gyPj4A1NIIKH
         C/nB5bTjWuC5+W00kpm5q+EHtsbDS0w1aiKSSDjq5tLGK225E+q/d0f1Eu09LszFhBaB
         1QoLdDuMATl6T3/NtIkMbZsqIi9eq5TkFgAoE+jZDcVGzI7Qu36rK5i6jKhHkzDztns9
         0K/A==
X-Forwarded-Encrypted: i=1; AJvYcCWzWD/CW72dBh4Xrpi7p+GzgZC4omrlg+8/Ke+xBEnMh228B1xZoF0TpJQnz45PT7dNMjay0Ra7wzDNCzf6@vger.kernel.org, AJvYcCXTap7QVy33QVwNXvSL0Nvx2sOhuK9qLwssr03D423TxubWW65FTK58HTh2hSHlDkew3HymcTt9GepxmDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOb5dH4YhTzJyNee29NzFAzdg+Iur1KnPl5gwcM1C8CaFRh2L
	WdVzx7goOiTdgxdfBMj3PKNMLUcTGiqmVkGI4gDA48EW+upFlVkEolLfAVXXJOymV24R7tYqM6w
	ojFrshVZEoF7Ea8O4oxQ6Ucx72Sw=
X-Google-Smtp-Source: AGHT+IH220r+CCE9hbJdKHaZ9ZUp1v4H5A0AEpF4Mh4EPLuJiShF6E5uxarzQFlL7eS+kyO8CjHjKe/w1jEkjDRi31o=
X-Received: by 2002:aa7:88d6:0:b0:71e:1225:77f0 with SMTP id
 d2e1a72fcca58-71e1dbc7c3emr1852035b3a.6.1728484137701; Wed, 09 Oct 2024
 07:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9neMso9pL_LPOeOwLGZG7Wy9RxV-ixKsDv=Wfzy7yKVBA@mail.gmail.com>
 <20241009140750.3356-2-tamird@gmail.com>
In-Reply-To: <20241009140750.3356-2-tamird@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 16:28:44 +0200
Message-ID: <CANiq72mS8F98WRsuc82Co6zyw1eYSGSQmr0brGwSkq-Zy4qivA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Fiona Behrens <me@kloenk.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Allison Henderson <allison.henderson@oracle.com>, 
	=?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	Kris Van Hees <kris.van.hees@oracle.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 4:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Rust proc-macro crates are loaded by the compiler at compile-time, so
> are always dynamic libraries; on macOS, these artifacts get a .dylib
> extension rather than .so.
>
> Replace hardcoded paths ending in .so with paths obtained from the
> compiler.

Nit: this should mention what the overall purpose of the patch is,
i.e. "why we are doing this?", i.e. supporting macOS builds. It is
maybe obvious since macOS is mentioned (in the "what does this patch
do?" part), but it is best to be explicit.

> Co-developed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Please read the section of the documentation I linked, it contains an
example on how this should be done, i.e. the Co-developed-by tag
cannot be on its own:

    https://docs.kernel.org/process/submitting-patches.html#when-to-use-ack=
ed-by-cc-and-co-developed-by

`scripts/checkpatch.pl` also warns about this -- please run patches through=
 it:

    WARNING: Co-developed-by and Signed-off-by: name/email do not match

Cheers,
Miguel

