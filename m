Return-Path: <linux-kbuild+bounces-3066-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC0F95581C
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 15:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B975B21A28
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 13:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614CC14F9EE;
	Sat, 17 Aug 2024 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etEVR7bO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3314A09F;
	Sat, 17 Aug 2024 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723901312; cv=none; b=HBI0o7c8E6yC4eugSledAgxJ5EXbSJa1/bDYKfRa+Fymmgso88DnHDOnrDHGnnu2rh1Pacjn/syXhJN24Q/pGsEt59QxrCZbe8i8H7ZFN5YYFWOgpMfg5UwUZ9Pjm/VKI/JXc46N1CdFqhOzxeK/lPnUvDbVo9TUU2OMCOxJgCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723901312; c=relaxed/simple;
	bh=bG7amRFd1SeXww/sW3fHII8B50Zcx0B+0CeTFObVS5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcphrHmaIjEeKwGv19pOxwCbqPMTC77XS8Oq1fNCBpf1L9e1cSlAzPX7ZSXKMekB4cXWadOp8nDPy933JNMvIpHvKFFRoxmFHjoBxLvf7A9+fT4lRYYBWm6c+BXjFzjWZA2O38bc6eqQt3cK7OHlBv462takhDofflX5rSMRy/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etEVR7bO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d3e44b4613so1249983a91.3;
        Sat, 17 Aug 2024 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723901309; x=1724506109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w46CrKlXMkRvz2M8MkwLOk4U12EJHFtMw4PTZouv2zI=;
        b=etEVR7bOK28sNf0yev91pxbBLy/A/NF9iT4pYxTwDHMkxKFDkDbZ+m0WNvuhJ/p+1Z
         PAGGiCmt47J6YJBTR5hoTgZwoa42qHwr4qp+YrDb0TvHMRhOTcRGDQZHcSsEqCUUrje5
         cmzJ8aGo54pNQUHQDtwmIeUOtw5QrUMBMzqNEv+6o9m12fnZQgvMNssZ+Z2YyCDtj5gD
         mZCKkbCrXfLNL10AjgS7AYzl//UrHCd28YpiT015Mk/VebFTT/j8Hw60xzsB3jjK3+Rd
         /xZBHaIZcMHauIl6pLJRJE7v4AayKmx0v1kGm6fmcwVpbVFsHy+KBZzyXVOVRaXmRion
         K8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723901309; x=1724506109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w46CrKlXMkRvz2M8MkwLOk4U12EJHFtMw4PTZouv2zI=;
        b=enr4pnyO5jAaX5JVp8bP8VnfSlKq6hjJu108YzAkejXTYORnqO+IHlHChljV4/ohpH
         HeiizJk6Bu1DrMTXr1WPjnQeeWm9ndH0/ZbkorpILfObzCrq5ww02WOgK6scDQY9YvSL
         /fLhH2N2GBlH6ydSPorOW53/2OOeLR1KNLWusY5fnaSTG0ev8hFE36E7oi/qWLreFspq
         19YLoW2TXNRmBx8skg7fB9y05CUu1m/TYN2fhe8QAcBnJyh9hAig20Jh3ejCKhQGZCPs
         ma9bkn9y6ehtZWA2RiGpMLcehy8jFGs23zeKKSJJ6oxXlMqNduGvMSKFthEuFEqsqf7H
         fCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE0ELAlfXStXag3K7EfHYjH1YT3u/fOA3PWgMDcCK8+c1YW0CctZXm5cEVHZzeZxIvkZ0Kn2ilIPZqc6zwJ8Hw85CyO2YUupPE0cOcdr8zBOWieEg29AyLoIuJb4CA8g/OWtkfwQHNUD79Fl2hAH/aAJ6buJb0L829KALCzp7Rp2wZXwdTtObSJi0=
X-Gm-Message-State: AOJu0Yy2H1ubhTmo+qxbows1kFM21yzT4CIkbHKWa1Imwn0iaEEfAS2G
	C8qPArPr71e/i3O7ZdS+gc2QYBHV+uOGCKJ885GgHWFa9hHa2rZVF6C6UZf7+1ZKO5NUsdS2RFs
	c6NYpcVACcsTNa0AZDJt2WOleAUc=
X-Google-Smtp-Source: AGHT+IGkwUrq5cvtbg90rMni5kEuQpodzfRuOoYIc/r9GruV5MgAJHDJJ62APn+dxgexiydViJ0S2Xi0JWt3Vguy0T0=
X-Received: by 2002:a17:90a:ad93:b0:2c9:b72:7a1f with SMTP id
 98e67ed59e1d1-2d3e00f324cmr5497946a91.28.1723901309226; Sat, 17 Aug 2024
 06:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <20240808221138.873750-4-ojeda@kernel.org>
 <20240817-heavy-dancing-whale-6ae13d@lindesnes>
In-Reply-To: <20240817-heavy-dancing-whale-6ae13d@lindesnes>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Aug 2024 15:28:16 +0200
Message-ID: <CANiq72n60=dKdsu0X3CWLaCkEhnAHMuwRZZpwhiJMGkt0aGyUw@mail.gmail.com>
Subject: Re: [PATCH 3/6] kbuild: rust: re-run Kconfig if the version text changes
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 2:58=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> If you send a v2, mind you consider reformatting so that this comment
> block stays <=3D 80 chars?

Sure.

> Do we already support rust in external kernel modules?  In top-level

If you mean out-of-tree modules, then yeah, they should generally work
(at least I test the build with a trivial one regularly, but perhaps
it is missing something), although they are not the highest priority.

> Makefile's oot-kmod 'prepare' target we check that the compiler
> (version) is the same as when the kernel itself was built.  If rust
> modules are supported, adding a similar check might be helpful.

That is a good point, I will take a look.

> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Thanks!

Cheers,
Miguel

