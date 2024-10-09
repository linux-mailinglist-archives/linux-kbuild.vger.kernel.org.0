Return-Path: <linux-kbuild+bounces-4001-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30522996B30
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 15:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50AD6B29760
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 13:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5640E1A0BD8;
	Wed,  9 Oct 2024 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wx8CBo7v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3F1A0BCF;
	Wed,  9 Oct 2024 12:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478659; cv=none; b=W3+FQcWrDqlkGVq4QCjgVsj5QoJWSZaIC4jgzsmfxkr6nPGk2eNoCN5Lwmq/NVWM0meMWqjTBhrCcdne7/QnibB32iUyR7vaaaG+a6vPQsrnUpprQnnLHM81n/O3c+UvWJ97/5yIL3hFQzDpZkgN1XjFy/PLIm9lhr5UPVDCzTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478659; c=relaxed/simple;
	bh=0uVHWFKDY31FVOQV/fogQSVeXMRq7T3BX1itTW+hX3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STtcPw+iKwLb02VIzUYRaZtpMHxAhCUbi/Ue8XX3SUFntx9FqZLJ1qChT6vbc/dO4FdmF9pWn/KoiDBrY/ziH3J3MXtZ68OymO9rIpl55zU6Pf501S4ZDB519rkaEN8pg45aGc9iTaDmH+xYe7lCzxu8gIPsiwVRYAstOPfyj2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wx8CBo7v; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fad6de2590so103402751fa.0;
        Wed, 09 Oct 2024 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728478656; x=1729083456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjxvSM/zZkvqnbwf2eixfp92kkf/lfMEdm9BrRsnkLA=;
        b=Wx8CBo7vEcosWFCSh5oaPy78XO8WYpjdlFxcGw67EnOMPSMvQwxdjQySV92umnjngP
         UtN/GmfN3i6gDd/q8l4v1kqWg9Z+y+AQYfIBiQ96/zUsb5ewbsWOkplIsZYEvCZhk5KK
         xWT3r/jRtXtsa4oG9gCFmVgoW34K6FcxDySnUXbcBYNd1QH66pHm6u38yVTNaGdo73km
         ekKSdhRtFXlmIOpohOIZdqg46Qg/F5E/n/NSYd7Nw4TLHL2+T/XyPzNThV2PffHi4sRz
         PD/JXcnQdsRgROUparm72jlqjVp8w6Mfd8UDrSBmFWejkz0WE4TMMm84eEVBFVYGXeUY
         6NWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478656; x=1729083456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjxvSM/zZkvqnbwf2eixfp92kkf/lfMEdm9BrRsnkLA=;
        b=crbVk+1x1E56j6YRihM0kreFkI1I+w3gToQxJ4/zsRxvdkkcdYkWqPa9m4nXK6E4OL
         Icq+CuBWKjqTQkGXEiqLb7UVzP3exgrEa1Eu4EGudg60fsNWi2/3BwYxCyPgP2TsYPkW
         XsPCk/xn1Kj3lu05uTTY03EIQpJ5a+QBPPPEasMltlZu0b3dRoAL/UueeiSMAZrtNru6
         XQzs5NuO+hefe7Gw4wjf7Pb5jNlNcgaeJl1Zo24gNAUZeBD+33RrOOr7kSz7B0HOl7rD
         Ou7Dlt0xyban488a8fhPQmozSAajd25gmw9NmFRHMAGs5QrnAtwJKwFHgYzg7iHcxyua
         EhOw==
X-Forwarded-Encrypted: i=1; AJvYcCVDLNZxHdV6aPPsxBQrwgf0AE2oeCkpFO0Xjk7l3NgLIL1yxweJvR+zj7g6hWH0l2Y1ZEDAA+vZ5nNjBUv6@vger.kernel.org, AJvYcCWUuU0YvIQ2JQpt7FQaoIKqh+p8mzkbD40xv+eEsqiTMATmB4nlefLzf1sIvh2TJ0ZAoKIAH9y4i4nMnUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVmUPtOGOdKwRDw4vNUGIwyNd5FsGx9KoLsJGoeXfxWCDB74I
	+VoMoI36VkcmkUsgA3iwA57S61Qw1+d3SZLUfBnxUlJB+v9hM19dhpA1Ex6DyPe8tQYndPvsbSd
	IXncX465afHdhwIoqUvFgKo9snGg=
X-Google-Smtp-Source: AGHT+IFiSxrckUqVVRvyN3OO0mexvwYQ6TOL3Gm7u4sQnRgMuhSUQqUTzW1CtyAqQwO9Bm4oPeZx+bhy/uXrY8OEDsI=
X-Received: by 2002:a2e:6112:0:b0:2fb:5bd:8ff2 with SMTP id
 38308e7fff4ca-2fb1873684cmr19386361fa.16.1728478655068; Wed, 09 Oct 2024
 05:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
In-Reply-To: <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 9 Oct 2024 08:56:58 -0400
Message-ID: <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Wed, Oct 9, 2024 at 8:43=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 9, 2024 at 12:48=E2=80=AFAM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Rust proc-macro crates are loaded by the compiler at compile-time, so
> > are always dynamic libraries; on macOS, these artifacts get a .dylib
> > extension rather than .so.
>
> What is the status of the macOS build support? A link would be nice here.

What would you have me link to? With this patch applied and using
https://github.com/bee-headers/homebrew-bee-headers I was able to build a k=
ernel
on my apple silicon mac. Relevant config:

tamird@Tamirs-MBP linux % rg -N '_RUST' .config
CONFIG_RUSTC_VERSION=3D108100
CONFIG_RUST_IS_AVAILABLE=3Dy
CONFIG_RUST=3Dy
CONFIG_RUSTC_VERSION_TEXT=3D"rustc 1.81.0 (eeb90cda1 2024-09-04)"
CONFIG_RUSTC_SUPPORTS_ARM64=3Dy
CONFIG_HAVE_RUST=3Dy
# CONFIG_RUST_FW_LOADER_ABSTRACTIONS is not set
# CONFIG_BLK_DEV_RUST_NULL is not set
# CONFIG_RUST_PHYLIB_ABSTRACTIONS is not set
CONFIG_SAMPLES_RUST=3Dy
CONFIG_SAMPLE_RUST_MINIMAL=3Dm
CONFIG_SAMPLE_RUST_PRINT=3Dm
CONFIG_SAMPLE_RUST_HOSTPROGS=3Dy
CONFIG_RUST_DEBUG_ASSERTIONS=3Dy
CONFIG_RUST_OVERFLOW_CHECKS=3Dy
# CONFIG_RUST_BUILD_ASSERT_ALLOW is not set

> > Signed-off-by: Fiona Behrens <me@kloenk.dev>
>
> Is this patch Fiona's/yours/both? Depending on that, different tags
> are needed here (including `From:`). Please see:
>
>     https://docs.kernel.org/process/submitting-patches.html#when-to-use-a=
cked-by-cc-and-co-developed-by

Thanks. Fiona wrote the original patch ~2 years ago. I rebased it and
generalized it some. I'll use Co-developed-by.

> > @@ -9,6 +9,8 @@ import logging
> >  import os
> >  import pathlib
> >  import sys
> > +import os
> > +import subprocess
>
> Nit: double import, unsorted.

Ack, will fix.

>
> Thanks!
>
> Cheers,
> Miguel

