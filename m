Return-Path: <linux-kbuild+bounces-5485-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E8A1145A
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 23:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15B481889545
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 22:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D362144AE;
	Tue, 14 Jan 2025 22:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JODKSTyO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18BB2144DB;
	Tue, 14 Jan 2025 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736894825; cv=none; b=IsbGaFhOnmpXbcDN0vYlB4a/gTzNzXaGGmnJ9+GKX657SJ7KagHOZh6X/tXe/jclfyFoIlqGWQOgaXeVeGuoOCC0Wj7275FTv7guAd8MlwPOgsHQu9u+K8uFZgghtRENX5/R612VfbGgN9seDb1JXKsN0VVACoIjSWYfrQfVCts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736894825; c=relaxed/simple;
	bh=IXANTz1bJSDyjXEnN8PxknznKsE2jL8seUW9FVQiReU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkLSS7bxaWKaDIl9PmRLXGZuVoABO/RFZTyenhGuIIdmL+TPxdOuYCuY3VPoSwAmGY6xGF0SQvlCWD2z3ysmlWLVZunmo6LMxiqV3E3ps3vXD3uiPpnHgkVejgWxQEGx2TSbAfATXpkj1Q+Q/2cQK7r8vHm5Rey9cpS7Z7UHgXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JODKSTyO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2162699e0ccso10081385ad.0;
        Tue, 14 Jan 2025 14:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736894823; x=1737499623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lozpaj0g3GYjPfEclpw5ZqeH+g5/kYsdh3R22/oSzT8=;
        b=JODKSTyODZraHYlDzoQGB1r3Fyl89RqEcFWEXlQ820GDxGMNkxASbMiMPjLq9tAC1A
         YWTzg1mEeap8aEDRVDx/Hec0jLLwPwDAJoAytV+ppVH9lozTx8utQR1MO/v4Hq4yAdWO
         kPOWQEBnumvTUelznl71sDXuqFulG6rV34H/EmeIbw/1lVqnFFz11n1ZH6IuR9iujp7a
         SQvGkeSJTVdHGG2cEWBxvkz8lv1xRYf3EzY9LIocDHGOxRXpyB15yrR5UBJ5iGVFVEBO
         Elp9ve3/4Ah08m/gQK1ycbDGhn+unKXpvkvdeTkxkfnusLkheDbEVq3m0sgdtDEtAShB
         /44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736894823; x=1737499623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lozpaj0g3GYjPfEclpw5ZqeH+g5/kYsdh3R22/oSzT8=;
        b=UzmvFDd1012Tmu2/UnzH+efV1XhGrLg59xmbA9xq5eYL6ScJvNMxf1ntZMTnzCx9tc
         wx0raMJqBBAxUzGBrxe55rg746FLWMmvMdaQdh11AJhFmVDBBDWps5VNTZ+/79mDVxlw
         euN+mdtVnfxcLrb8QKegh4UmWuKz1UUSQ2cphGc5nPZfZMxCieBrmrIXHRR2du36DxuJ
         UkUyX6+lnWQjvUhxaqBRzWh1KC6sQIXMLE/oiyeUYo6Uu3wZlw6FXKNCcD2fuKI9xFXD
         abKFAZh+IG31ODp+UIfBXuiUHre+LBwvHbgOvBE6TTZXttH0fNMGJVKdZYjWEqWShuOe
         e0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL0oGpustraxL6g+OnGaD8e5WGsxuMEXjsoIHgFANm2hejWPzaQmhQ+c7CcRnqo1SKR11hbRWAvRgHAMfD@vger.kernel.org, AJvYcCV5Ii1V6uw8BsyX1x/zC4G7QKSo3SUZPQyc+VAyNLS23Ic2oZNc0RoR16+7eCkvyywQbibCsOz37pJ3Hc15@vger.kernel.org, AJvYcCWIdfwsGKWLYm4a29km3yAS8Ien0tOZv/BuVilRy8l3Q14szrkfoAFgsA7c943jGT1+4l+Ok/elwYLDZQiesdo=@vger.kernel.org, AJvYcCXEvjQXm+El836REp0XrMvYm/1cgLXVstpHWZyBQNBDRntxgQ8jOzAP3iSHoYZjuuNEpXIwCYy6CVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhGZFpniuA1twBO/jUJK+e0n3/zNG37VcdjnuFZXcXHzOeU6OL
	MiS3/bF0HpXfPkQorobdsj6Mn+RsOc5TPBTcf4QL9i8Y3NnlIs8Ox53GIx5J6nlW76jYR0nUwmp
	asMJcuPf5gRDNDVqjmbD2Y0ogxJc=
X-Gm-Gg: ASbGnctU9eKk73wBXPSpCYAtHIi8R/ZyDjfUKrNN7Bft7g0McWeVc44pFk+jUJjI6ic
	2ZR3UzBVLIjA8G+KxknZ66XV7K0ksNHlv+YY62g==
X-Google-Smtp-Source: AGHT+IGevwfPXGCAQQVOp/Ab1cBDzyCJ8G1YfMVI8AtOp+xUdHCuOY6eWeuJWDZfjx7Z2eYbdSZVK9tX1UXrXPJHYgA=
X-Received: by 2002:a17:902:e545:b0:215:435d:b41a with SMTP id
 d9443c01a7336-21a83f34893mr149435055ad.1.1736894823228; Tue, 14 Jan 2025
 14:47:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org> <CANiq72=BvnriScFay8SpLNe9mNhjvGsBJ9W9UtdzU_6v_i+woA@mail.gmail.com>
 <CAABy=s12gOZadhYC+=6=TbbyN9j5L0B19ZLSGR_VFEdt1jhwEA@mail.gmail.com>
In-Reply-To: <CAABy=s12gOZadhYC+=6=TbbyN9j5L0B19ZLSGR_VFEdt1jhwEA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jan 2025 23:46:50 +0100
X-Gm-Features: AbW1kvacpMeTqUYlQMLS6S4D2USApAhXAr5atLy2VwEVUQxisq97hcv1qVOPz0I
Message-ID: <CANiq72kQKGG7j61bpsORnE0vzNo_dzwMZMLx=Z0xOnY0wefv6g@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
To: "Hong, Yifan" <elsk@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 1:51=E2=80=AFAM Hong, Yifan <elsk@google.com> wrote=
:
>
> With https://github.com/rust-lang/compiler-team/issues/731 fixed and
> this idea of appending flags, our --sysroot flag should be able to be
> properly overridden. But the -L and -Wl,-rpath's remains, and could
> potentially be disturbing.

On second thought, #731 probably only applies to `rustc` native flags
only, rather than those that are passed to the linker (e.g. if I pass
a dummy flag, it is passed as-is, so I doubt they will start checking,
and probably they shouldn't), so it may not help here after all.

> So if I understand what you mean correctly, with this:
>   KBUILD_PROCMACROLDFLAGS :=3D $(HOSTLDFLAGS) $(PROCMACROLDFLAGS)
> Android might need a separate mechanism (another variable?) to filter
> out our -L/-Wl,-rpath from HOSTLDFLAGS. (Dumb question: We can't take
> -L/-Wl,-rpath away by prepending/appending more flags, right?)

Yeah, we would need a variable to provide the filters, but it would be
more complex and possibly less flexible. I think it may be best to
keep things simple and use the v3 here, which already works for your
use case.

Cheers,
Miguel

