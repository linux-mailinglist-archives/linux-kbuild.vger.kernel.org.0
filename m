Return-Path: <linux-kbuild+bounces-4011-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD26996E92
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 16:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 763FE1F22C7C
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 14:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFB619C552;
	Wed,  9 Oct 2024 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHAeGee+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8729196455;
	Wed,  9 Oct 2024 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485289; cv=none; b=HMpYEsy7moOPiRUCz7SlY0Ein8oees+w9A16XB2NUztyKwWQ+uwkuZAmFMsGMT6fklxXGh+MNbTi/gO7Zfttedw4SNqHBpuxGmiTDvisSKHRhTZ+ksxTdY2e7a/hkCcrFy/iKG+sSg2NYHuu6zMMZdHxfE96Axsej3PiqXsIi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485289; c=relaxed/simple;
	bh=jNj/XXPy6r4c18lIfqRBo2GXYh92bCduVUYJ+2aWp4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9LXvk8Jv6U/RDO8zGlRNQLeX1zvU1G9HQHa7JHovev9oSIS+d4GSoze/aehTijGY9c/D8nt8lQCQU/E0OdVUt/qL8SGkK5OIrvPdXFoEwsGJI4QiAcnPmzeaWaitono760THABwhHQHaMixlJqBY1DKvWCa4TMWQ7/Zzomt+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHAeGee+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fadb636abaso70714441fa.3;
        Wed, 09 Oct 2024 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728485286; x=1729090086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNj/XXPy6r4c18lIfqRBo2GXYh92bCduVUYJ+2aWp4g=;
        b=MHAeGee+68uHURELuJUdyYqrh0+5wd9WAS/l+tOLF54vElOmNNtinH/bfLCfBRt4en
         sBsYCo2KRhsVW5TpvmgL/HofcfGxzpZ8RxTHiZafKYVjhs3IyaUJOCArRpNWd+PPWTGl
         dBW32NEwUNA6G1OGm1CNVcFlrji4nmtRlSZlgverunc44CnF6KTsLtxyJy84GdNyHSfF
         krveGXhILLffPuqIT8/myxw9M2ftT8Wlo1fC8oUbH49CEhwbOcVzQEJpBJnuyNEvfNJE
         d7SS+YRazXHyPx3kW7NatgeXY7XkWQlJgdNj9eOo0JtKjQIQgDEQBNv5H/EJ/VLAAd5H
         Fq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728485286; x=1729090086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNj/XXPy6r4c18lIfqRBo2GXYh92bCduVUYJ+2aWp4g=;
        b=oOZqxP0S0jlHsLFxhGZAwOK8Kvxfq1OYDTma43AdQh63iUSKXpde380nIx8qnjqf/x
         64Wf57/kQLyhJ4BFtBdsBcQTsoyMOvKglLd3nSBgQzPa3r66lFrKF8+NmT5DBtWs1kIx
         Mj2KfoBeXKNs31jUDAcNHxUUWVuhqi2L5kRzlwHItsvIHg8fHO3DuxhNLeDYyyPugLcn
         sIfrE2jeF47h1rU/9qhe/1zI1GNXeR90NSCO02C4g8PoGkjnNACqdD9VAlr29E/sFcup
         ERozpPOuJWhTW0+5dxst3rT+xKMa0kMAd6bN5Mb0yN6oHnukaTx3c+kwu5yPH6tzDxYE
         aplA==
X-Forwarded-Encrypted: i=1; AJvYcCUHRndl98gAMWNGTkSufLfyDq2zkmbk10HcVwRBHdPFoCcdsYBT858U1QZRhJk4S/p1GHAFcs9Bf91BjhU=@vger.kernel.org, AJvYcCUhWSSqxksiPqF6lopdnhDYyp82zAnEtyYb6+o3olPvjWRvn9+XgMgoJjPFZz7Avcb1XQoH71eXQBd/3Zej@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqm34GKGm9Vu0VX+Arb38U01YNMczBF41q8EVzJeDJxobRB9xk
	N0AonDLfKm8ZXaWD3+W/qWt6sKNZ69nutZ3jLN/EJcnIH+3AGP/OchOIfPofA4viwwPt2x0GDg5
	EtaORNV/p/LVgAY5IFA/AcFUwPNk/EbQYgKA=
X-Google-Smtp-Source: AGHT+IFbKxcngVdNMaafNvRib0Sbeiy+vLM6P46dY4lKhpB/klY1qmNJ7OnGt0nK6vq0COCmxXeL6Q2+fxhjs8e/eQ4=
X-Received: by 2002:a05:651c:1992:b0:2f5:2ba:2c99 with SMTP id
 38308e7fff4ca-2fb187121d1mr19938921fa.9.1728485285444; Wed, 09 Oct 2024
 07:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
 <CAJ-ks9neMso9pL_LPOeOwLGZG7Wy9RxV-ixKsDv=Wfzy7yKVBA@mail.gmail.com> <CANiq72kM+29COB6vPQPotXqT3acdbrEgdjU2K6FG8gZC0EEhNg@mail.gmail.com>
In-Reply-To: <CANiq72kM+29COB6vPQPotXqT3acdbrEgdjU2K6FG8gZC0EEhNg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 9 Oct 2024 10:47:28 -0400
Message-ID: <CAJ-ks9n=Y_FAdRb=YAaCEGT-y8RP=ssOgBiQtb8T7s+LRBBBhg@mail.gmail.com>
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

On Wed, Oct 9, 2024 at 10:20=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> In particular, there were some patches NAK'd with arguments that may
> apply here (e.g. extra process spawns).

Understood. My guess is nobody will care about the process spawn in
scripts/generate_rust_analyzer.py. Someone might care about the one in
rust/Makefile, but there are already 4 others. By the way, I notice those a=
re
using $(shell ...) - should I be using that form as well?

> Moreover, how will it get tested going forward? (e.g. currently I
> can't, but I could look into setting something up if the kernel wants
> to support this). If it breaks, is it considered a bug? etc.

I guess that's not for me to say. It would be great to have basic automatio=
n.

> > Thanks Miguel! As this is my first patch, please let me know if further=
 action
> > is required.
>
> You're welcome! Yes, a new version would be needed with the proper
> tags/authorship, but first we should probably wait to hear what Kbuild
> (or the kernel) thinks.
>
> Cheers,
> Miguel

> Please read the section of the documentation I linked, it contains an
> example on how this should be done, i.e. the Co-developed-by tag
> cannot be on its own:

My apologies for the oversight.

