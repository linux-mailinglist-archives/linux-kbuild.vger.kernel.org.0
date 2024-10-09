Return-Path: <linux-kbuild+bounces-3997-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ED4996A47
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 14:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 542F5281E15
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 12:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33808194C7A;
	Wed,  9 Oct 2024 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i81StHxk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94A7192D80;
	Wed,  9 Oct 2024 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728477784; cv=none; b=NYWa9KI1i3ZLcv01dOZKtf01yTbTvffvW6qnKlDzTIdDS21b+OopVHgXy416j9ssmWbcUDTzWX+8SKOQW+rtsXQPFV5bynoaQ1GDqyeKqwccD/hYGhDqzeE/NMk0A6mDoFvPIg0Qk1N4puy/SkA19ZP/6VdkqxKSCFF58h/yxL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728477784; c=relaxed/simple;
	bh=mbBsaI2xJGZfsoDAzw8+JA20IUK2X+OsdlBm41gwR88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdV/Z1bvXMDgmyW0aAG462UjkZZdqr0P1V/dkpK1mz7cfJp5fEZW7Ev7281R+pZZ/dCpYulhZNuOdyKpb87dnQH3f72+y+jEJMogdx81e6l2PAv3JS5bxiXgUhrTj7ViLbLZvT3z60aSiZWVmrovahDZDD5qGwb8hVUPlQ7Mdhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i81StHxk; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e018dfb5fso295962b3a.2;
        Wed, 09 Oct 2024 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728477782; x=1729082582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0GpuErI6Kfun4FFjtyuPf3ShfQr7Wv5k+GbRAIGX2Y=;
        b=i81StHxkRfu2C53x15h4WC6FPp4XnKUGU0hss7VO+JiR8Yz5TzDSFZSVvyyKYEG2dG
         6gb5P/WyAKijWFQzk+gOPORyUOS4FDIc9kF6xtLpBrtC4fEXDKBhuHM+jdSBUkhf/OhL
         PvFSNV53C/v3x+Djqspc8/K/oLyj4Rg5afCPQkPhSPZXBDCrqXfIIwdMpU6/TWmmPZvQ
         CWUjSzEyS2he7wckEPVNxHbFarNlGVDQHIaKxqcS8YHqYhnTIeQJ8wkkF5aV3laXAWrT
         evEst4Y83LUd9VIPcN8L07z8s/gLu6H/3SN2yeS4NGrSf7S/Pb9za5gTmUMMJBGlhD+h
         96SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728477782; x=1729082582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0GpuErI6Kfun4FFjtyuPf3ShfQr7Wv5k+GbRAIGX2Y=;
        b=JpjV3wlJA+B3ojxswu9UNibPKL77by6yNXaug6ma7t+QxgsNlt9sORKJblRfTRgnpr
         IpIDNKjH3PGEJjIUEJSgBLlbFKdKWXvJAt88QWg0YyxV/h3In6Ud85jCoyzZcPOJVKBS
         A845p4ozv7FDJTU0/ZehsSDTo7tJcbV3WHS8uNu9zoQyEvfxVnF+/OCsej1SWLm9DzKQ
         MYEYlnMwugwuYBw0/2YqeFa8HF/OggyIo5Fgn/JYzAlxghS6DjuW/AEI8qPq4gokjOU7
         r3BSGjjqc87jJe2CUF3gVsHx8MvMGeaMzhhnFzxcbreR8gmfIui6nacQ28xRSLtLoigy
         sJrg==
X-Forwarded-Encrypted: i=1; AJvYcCV2Nh+u3GP3A/wxsNl6PKp87nvPogWKONQLX56gUQGhXacdCkURPgN/Flp/pt255WBwyaPrXrfLPBexvWY=@vger.kernel.org, AJvYcCV36Ps9fZy1NjzjGG4ixEjhPxE6ZFi35HhI+wgHEVbnNNb0HOnGwcXqAKScne57WkKpQUrH/0loXQrvN4uo@vger.kernel.org
X-Gm-Message-State: AOJu0YywJzu3OzupPOOneph/MNRw22l3ezs1O9w7wZ9nT3B3nTqB+wxq
	zbRRBDFsXfpVyoJxSul4br4zp6x4HZS8NUN4rPp+/5T0PIKDSXD+yiOgzkss6fQjEk/lLLqZX22
	KPPDdtjwtZOsqWLPXQv1E6iv6HoU=
X-Google-Smtp-Source: AGHT+IFP9C8Vxjao4bUVDny11dLrva4Yfe7TNAq6HNcjm5OfuKUxoLnjIAaLIVNRtm4NcCLx2TU9qwCY8YeZFbV7p5Y=
X-Received: by 2002:a05:6a00:2d83:b0:71e:1499:7461 with SMTP id
 d2e1a72fcca58-71e1dbb86b5mr1612455b3a.4.1728477781728; Wed, 09 Oct 2024
 05:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com>
In-Reply-To: <20241008224810.84024-1-tamird@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 14:42:49 +0200
Message-ID: <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
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

On Wed, Oct 9, 2024 at 12:48=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Rust proc-macro crates are loaded by the compiler at compile-time, so
> are always dynamic libraries; on macOS, these artifacts get a .dylib
> extension rather than .so.

What is the status of the macOS build support? A link would be nice here.

> Signed-off-by: Fiona Behrens <me@kloenk.dev>

Is this patch Fiona's/yours/both? Depending on that, different tags
are needed here (including `From:`). Please see:

    https://docs.kernel.org/process/submitting-patches.html#when-to-use-ack=
ed-by-cc-and-co-developed-by

> @@ -9,6 +9,8 @@ import logging
>  import os
>  import pathlib
>  import sys
> +import os
> +import subprocess

Nit: double import, unsorted.

Thanks!

Cheers,
Miguel

