Return-Path: <linux-kbuild+bounces-4072-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C9B99B51A
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 15:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB7C21C211D0
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 13:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFFE17838C;
	Sat, 12 Oct 2024 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeRvLYmQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA3C1E511;
	Sat, 12 Oct 2024 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728740478; cv=none; b=H+QHFm2cD+OfMniE94FOKmev+dGiCmyIHlbWnhDPmzVJbcO2JObDmBVQctSaQBXtoW3vwY65uqN9WGZpgWaiGPj9u82UbrRrr4BGwr+j7ILGBEzbDsAls4RaqN62oN5Jj/DC8k+7v8Bb2iiQdovF9X6mrOwlK6KbMx79zacoQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728740478; c=relaxed/simple;
	bh=2aWYQO59JYR3v1loKuAiJ8kxWXzcVGteodP2hiIRfec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WK9Q+SJBc4Q2qZsI3eVAFXwWiFc0ZMx/WdxGIWHL9NwT2fpOLKOmamA3PcqfzyGkD3aLNqQwPpX3DDdneb+cT6KdVJfiRvqTKDr45ZPzyeE9dhfsXb/yqAvcFmf8AzED3HdiPxw/8LolrduyAUARcY8GUbj6Yl/Hq2RIw8+ZbbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeRvLYmQ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so518835a91.0;
        Sat, 12 Oct 2024 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728740476; x=1729345276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aWYQO59JYR3v1loKuAiJ8kxWXzcVGteodP2hiIRfec=;
        b=NeRvLYmQ74gTdl4dL/n3P8R0GjsYMOZ7PuADtoZwH2Gobl7X+IviCe1CdGqgWCQVYH
         +TTbjdiVKC160i6hosHw1hGlCoCII4DFsqFCFUZODsdn/U/v+yYEta6VT7Z6pqMGfjj/
         BBj4sufH0eMFs6xZ+wHtcPsnvsfmV4G2NKY+4ErtUf6gWfqFMPoWgCBBXBHroJ0sfRhO
         Ip4cS2Jd+imqD6Vv8RM7Oa9NMI6NpP1Mmd7pGbc9dZkr8aieqL5+cLpI3qriX+h2CFjv
         /otCYyxXIpY11wlZnZGjuMcLd6KaJDOrrKe5p1zweiVCEOTtMeqXlU9k1/QNj0teS4DO
         9iTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728740476; x=1729345276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aWYQO59JYR3v1loKuAiJ8kxWXzcVGteodP2hiIRfec=;
        b=VFWK5WkXSdv9LpYWgrEkcFNmvxd7gp6G943obOlSMxUzqsQuJuV9ZQvnWLGqSS/W6V
         QSk/kpfnzGeoU7luHY8oPBQl0yQM3DYBh500JgEsXlLT0Hxzj6BS0NHL1YwhtffuqiSz
         xQid+rpCKABWRRx/x1oRraleuhXaSjwXtrjwnL07ok5RH9VetpS2CXwBtFGpmUAJzqBP
         SKeRhruzW7zz5Snjfc71+dR/Cb2f0F5kmY8zBViAEFCj1UyNyyCTON/g7jGmVi4Z0PVq
         hmDmcjz1no+xJGsYqtJzHIHWGfJkuGuun97eFmk50c0H4yLiAq03t+ZZmB6R3Nw/9G9d
         dDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwuQcoxrbNod1+LVEsuPoCuE+E5UehSrS+w//OYgZmnZXhX6Si5YclLfUZXI8onZYBMhuf224lsYFgha2S@vger.kernel.org, AJvYcCVvAn3slKZ0hXZjULPOBvDo6JIt9XHDEAt3iC70+yOAYVAI2JYzmgfFkSqyDUPSzKLT3OzAa0ibnZwPnpVs6z0=@vger.kernel.org, AJvYcCWtyA2P8dVggHElANC/PtsRr/HJ4I0kRflNe8lonIZRGuroZ9sFCHCWD2U/c1wkkpQLEEzn2MklUwZ67wI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAvNYgnUPrHvYdU3g3zhUp8fBNV8oJWIAVklPQfkNJLsjcjgAA
	wr+j5565zwx7zSfETCE4z14AJAy9nQy+5UwYk4n8Lr+cQdQAlB0wjb9EOEaaw/xZsSb99HeDuS8
	4hPpD7dUfBjqkZXZElyG8lgFMOzuLPsyNRk5Jqg==
X-Google-Smtp-Source: AGHT+IHsmJh7ueqiBUWjK5lig6GdIb9+wOLWvc272MJnMoB1e1yrmtmLuIQ6GWnRG4x1mj7dqWaanJMNxfqoPH5vrSY=
X-Received: by 2002:a05:6a20:2450:b0:1cf:2be2:8dd2 with SMTP id
 adf61e73a8af0-1d8bd04067emr3932318637.11.1728740476268; Sat, 12 Oct 2024
 06:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CGME20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514@eucas1p2.samsung.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com> <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com>
In-Reply-To: <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Oct 2024 15:41:03 +0200
Message-ID: <CANiq72n+mWOP3xNUU4Mep-n5QtJ8zQiwP9JZ-KX68+fOC0GMmw@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
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

On Thu, Oct 10, 2024 at 10:31=E2=80=AFAM Daniel Gomez <da.gomez@samsung.com=
> wrote:
>
> Building Linux in macOS is now supported for arm64 (targets tested: allye=
sconfig
> and defconfig). The upstream policy is to use the build system variables =
to
> configure the necessary tweaks to support building in macOS. However, thi=
s
> will not always be possible then, patches are welcome from the build syst=
em
> maintainer to support "portability" across OSes. But not full integration=
.
> Please, let me know if this is not clear.

Thanks for writing this -- it seems similar to the summary you wrote
elsewhere, but it does confirm we should probably be using build
variables instead (i.e. I don't think the overall macOS support
questions are answered, but we don't need to answer them here).

In other words, it sounds to me like the solution here is to simply
provide a variable with the current name as the default, and let
out-of-tree override that if they need, rather than query `rustc`.

Thus upstream can keep the variable working very easily, and
out-of-tree can maintain/test the overall macOS support.

Does that sound reasonable for everyone?

Cheers,
Miguel

