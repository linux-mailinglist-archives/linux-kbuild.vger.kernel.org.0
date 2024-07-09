Return-Path: <linux-kbuild+bounces-2432-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6097A92B19A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 09:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E4DD28158D
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 07:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6B314E2DF;
	Tue,  9 Jul 2024 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTsCVGJj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B814C582;
	Tue,  9 Jul 2024 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511552; cv=none; b=GgQNBZH4raq1xCe4N8BWTvXL4BZhkckTbUOicgC557Lub6TRRIspk6v6KdrKKRgq1uNuHg0NqLCaJWVJ79p70p0MbeHtWeAtwhgSGN5mH7tQwROo7m+UHLtMzHAysHlh13GEaMaBXXBIQDT2hCPYrLa6XR0Pgv9zT3jg4T4+bTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511552; c=relaxed/simple;
	bh=4huwY83Cip/KiWjo4Fuer9HzRe1argLs9dYsNwYiwCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZ51QqCn7jtzKfcUTLgoDDmQtzM/sX+DtU751bd2GC4GBGvKLoeAbRMQO5EeStlO/HyJraj/FZrbyHWRZCxsrMjqcA88uAnVMT8OBF1EBTrLmsWrvVInHg2sKSZiZ+He1cyie2FoH738PhoWi+3bSDl1Ei/X1ylfJcdQyNMklHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTsCVGJj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb3cf78fa6so26694475ad.1;
        Tue, 09 Jul 2024 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720511551; x=1721116351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4huwY83Cip/KiWjo4Fuer9HzRe1argLs9dYsNwYiwCk=;
        b=OTsCVGJj8R7nQBFuypASYjXya3L+KwpY1Z5LowwHXA4LyMgekLrudzZheYulEgkjg7
         b6la9qU0W78xkZpSonEMTtdW3Lo/dWhATnSNs+jPDX/ewRNt7vBd7ivvBYRs6FZQyQUw
         Cpxb+FxXPCB2MnZCYnzr+d4A9jip3N/GatSX/aZ/N1VoJ+kEYj20dusFLXZAwIV7iF/h
         vh9H4snDNo27XeHbq8i0fClPAKpzLZ+Yfc/qtMdOxwfJNktM7XXbbUYYNydCjOSaogYc
         zHhC81W3KAEGDp0tp/Te8ITsysL0pDoPUIZDpGnmY904k8RCUARMKg93ktWgnwhCXNsq
         orlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720511551; x=1721116351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4huwY83Cip/KiWjo4Fuer9HzRe1argLs9dYsNwYiwCk=;
        b=wQ/NNlSl5+IVLSWCwPjpVyEnK900HFANe6Eu7VuV2vnvuuraFxSM2VQYjIQKgiIY7z
         AeYpNNuWmMrYUWPB6sgb3l1uCDB7s74Acil+S1ovIP4O6ByN/rLsqEoHNpxRzu0f4HVg
         Emz6bzX0r9gpzwiT+8Z9X5hUuhV/KKK3mmhPlKKlTm/UnyYLFjx6m5oRazWvzFpDJYhW
         +SGjY5OFl98r1LjkOZRXSNB8m/2Z9aTarrp7qhbeJYOUl7i0FMwU+NS8oW8qQ2rTuVI5
         Atmrdp4F2K/3FNEq7tbmsxKkSQWEGAq9dMlNtCJWoj5slmiUA9hB0XUjgGq3oWI6QNLe
         3chQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWFdw3w/uQI8B9If/fA3JILg1lwVP2r3tyHE8wfnrhCDRjTi2HcLug33QdONny03KdX5Dei7/j6wVIyPYGloEEcC9MJuEZaY3qUDn09dEBNPPsIUgyJtS8re9YheI55wC+gn49eAg7AS0Nen1+zyPxKGFBhpFeoCWOYxgs8VEqCZsx8JneYRIGzzo=
X-Gm-Message-State: AOJu0YwN2zOJcRe6ZRdCwxSpsPcBUocxpPAl40pKoPSJYvu+fJB0gXpR
	QE8U94FeR/4KMIuPc2fsaGPIA38p9QALOlnyIfFAiNixhkVvU7bjt+WWsUnTjUv/lBhrip9hYYo
	qceN2oPBEhfhY+E9uzboiZdjWtNM=
X-Google-Smtp-Source: AGHT+IEsiTEi2w47DuEz12pAyq/B0P5SMlLRpynlMjhW49xEuBs4PU0+67uU2G5y8PKx5VM+2zmkAZyJH+aqcKZ2NZA=
X-Received: by 2002:a17:90b:5384:b0:2c9:6ccc:2fbb with SMTP id
 98e67ed59e1d1-2ca35c6cad8mr1496604a91.24.1720511550658; Tue, 09 Jul 2024
 00:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528163502.411600-1-ojeda@kernel.org>
In-Reply-To: <20240528163502.411600-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jul 2024 09:52:18 +0200
Message-ID: <CANiq72=FUyYgv0Ng__A4GYh=dxpDD7FF=Fr9_pdo_HRithuAFg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: remove now-unneeded `rusttest` custom
 sysroot handling
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 6:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Since we dropped our custom `alloc` in commit 9d0441bab775 ("rust: alloc:
> remove our fork of the `alloc` crate"), there is no need anymore to keep
> the custom sysroot hack.
>
> Thus delete it, which makes the target way simpler and faster too.
>
> This also means we are not using Cargo for anything at the moment,
> and that no download is required anymore, so update the main `Makefile`
> and the documentation accordingly.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next`.

Cheers,
Miguel

