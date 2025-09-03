Return-Path: <linux-kbuild+bounces-8694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD17B419B2
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Sep 2025 11:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D41656043D
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Sep 2025 09:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F212F2900;
	Wed,  3 Sep 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNYk8X+A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A972F28E2;
	Wed,  3 Sep 2025 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756890771; cv=none; b=miMqM9lSSeMOiNA4GJ1vN+Lg/jIShBQH1sb05BkRQrdB0uIY9/MPoiG14r6O54aQ3k+e34Zl2Jt4JHJR3li+fTPEgjHFmp44691PQHT40inqd2FRIok863jrWIwE3Medcp2hnSZ9UP1eXhbe1Kg0HAsljF9uaYKmrZNti3kzd6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756890771; c=relaxed/simple;
	bh=u1dUo+ncWnByrkiVnzOKVZT2Xjkh2cB3EGgl85trqm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iN1e8BWZ2DNl6QxgTO8tlnFbhrN+qe12C4chJhh0hNnR2kqt0VDWE7xTyESpd84I49F5lIoLGFAjC4n7jahs54UtrhErY5ik8m8mO+frVFGUIFZrUtjEnMfW4uvqNrk5rg23JuIV90gR4vlyQ+ArV0YjIrvEbBizdi/QbSS0efw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNYk8X+A; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24ca270d700so414445ad.0;
        Wed, 03 Sep 2025 02:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756890769; x=1757495569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1dUo+ncWnByrkiVnzOKVZT2Xjkh2cB3EGgl85trqm8=;
        b=jNYk8X+ANTyTPRZOQPNw1aFoWqog6BEEILMH3skLcNgtY0K8fn3AWwZHdsE19Hqmyl
         Pfypr8WnVKbhn3I+bVndrO0FiHsqv1U/KIrnd8tLJ/nfUghGv/JlF9TLtQFzGifdUYz6
         05vwvvDnUwDpLrS+bPCC+A9sDADhG0YiOfSDL+LvwkGOqIOmStedOomAATWMiz119RcM
         oluwgydm0VPlIubZ8gyEk8xWYc1GMvRwvXt6tQP+9MUmKA4Gk7As035oaFqkCmiUshKX
         Bpu2vkl4oEDT1Db7KtAIB4lW90yCa+nTX3HOuC6OtQUTfsT0JBf1euTNI+Q7Qu1rMYB6
         Ziog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756890769; x=1757495569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1dUo+ncWnByrkiVnzOKVZT2Xjkh2cB3EGgl85trqm8=;
        b=M07vQAsmFJ+OC3IZnb01xI98Cu/MRuD4ngTzZ7ujXOuS3SwcFASOMy18LXVDwu8rjp
         BAEmhIwZyRXrDYeb72zPVNp8cKCFGqZlFgjC7OCl6TG3vtoAd1eXwuTZGKLGQFxHwedX
         dGxOm2QnTJJDYc/ib9qqJ4onUAciQSNFAFXP7KYCNuPIbRBNCF/LWjMSK62cW89toJhA
         zLY5I6KtYHNd5snk+N79q7DfjWDFSeOvJaudMEJlERr6bHYEm+ZUO9nWAYjJYTNqeALP
         IuMULJT92OlDsU6VaBuF6Pl49Wv7XW/hnKnDAA873FLt4rvZlu8WcrWcvmqoqEH4Srge
         /ZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5NAcBVcJkFkdYVjZ8Lqy8lGVuP6hYXtzYB2r+IyTanO+ylGMc6onoKnveRBT3YJCnu2RA+F4mMJCkO1Mb@vger.kernel.org, AJvYcCWoEUmoYQItupAHVyO5QL8bK3/6C8uCw0s2/iwnj+gn+7OlXV4tws4bdUW/iUB5MG8pGsXMZz31KlmiY3h2Fnc=@vger.kernel.org, AJvYcCX1HVhvNvmqTxDt3ekzaI3fRFn+TKLGFYAWaIHKECZkef6ZUhHe12N0RXphktXUV2sHPTH7KLBw@vger.kernel.org, AJvYcCXa7EST1Nz+38YUUZQlY7/rfuSL3bAIdHeVwkmMQBkF4g7o0naV75rR5Jl3ltazmpkJpIOizWfbmYof2k0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP91y4xwQ5uY23yaQOMFsvjOHMBUqkEY5NyxfSkRaSgvqTkCYZ
	VZQhDopg/ZE1YhekLOaG5nqtl61J1LBRA5InMxJ5ichsHxfZxvRiUb+2WK+4WMyF97VYFVR956A
	4xcu+DLSKYYd5nErPdgdsFAaO2x/Xpe0=
X-Gm-Gg: ASbGncsj5RHBfsr9QBEVfeENZbeSLXizutKcMTkz7ZonyQ9t6toyh+i8s9Xwant8xNP
	RLIFLVsmA/UDgw7PyYk45ONG4zJ9HdVTnPAYiNFc7Ve5De6XfBjATmlOucbG0V1gxI982rTK9Lf
	yQvatfYrrVsRlNZSTMv7wK34Pu5nL05HlR05H8dIEyVyGAYwXkbTyGyRQVxRI3ct2KE/nSpOzXT
	b9L/eoOrxOJ/dYK/00AgceTFdJozJ55Oc32FvLhSHjs8SE1V9y9ijf49DTiDqtHxYFcBF60lZvT
	Ie3TLcWycgSJhAytn3YR5fM3x6nrp7xZBA5p
X-Google-Smtp-Source: AGHT+IFy+V9mXKNgGUInVKnO4rUD7VlssVnjx0POASZsCkyJ+rfepXrTHaYt+5C8DyDBAIFxdX2YSb9WPGAXKP6wep0=
X-Received: by 2002:a17:903:41cf:b0:248:b43a:3ff with SMTP id
 d9443c01a7336-2491f246be0mr103559945ad.8.1756890768748; Wed, 03 Sep 2025
 02:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408220311.1033475-1-ojeda@kernel.org> <20250901-shrimp-define-9d99cc2a012a@spud>
In-Reply-To: <20250901-shrimp-define-9d99cc2a012a@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Sep 2025 11:12:35 +0200
X-Gm-Features: Ac12FXzVStDccJZt9jg6LxgcDhbP5A9e31eO3h_DSesybX7nfJW90L6qE4tU3Nw
Message-ID: <CANiq72=hD3No2R8-8znrOsL+AEs3rCVjNn3sn-d7qKSKZaGWvg@mail.gmail.com>
Subject: Re: [PATCH] rust: kasan/kbuild: fix missing flags on first build
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 7:46=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> I'm not really sure what your target.json suggestion below is, so just
> reporting so that someone that understands the alternative solutions can
> fix this.

If you mean the last paragraph of the commit, then what I meant is
that we could do the filter conditionally, so that `rustc-option`
would work to test flags that require the `target.json` for those
architectures that already do not use `target.json`.

Cheers,
Miguel

