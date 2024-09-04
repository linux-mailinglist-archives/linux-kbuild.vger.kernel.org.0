Return-Path: <linux-kbuild+bounces-3367-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE396C96F
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 23:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7097281694
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 21:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECA8154BE0;
	Wed,  4 Sep 2024 21:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kq7AEOda"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998091547F3;
	Wed,  4 Sep 2024 21:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484554; cv=none; b=uUSYInqDOkzqY6ofWkJOild3azS2QX43/Cdi1+pVo69ryjOANeXhdnYRSCFjtmd8kxXFfP5lZv5y8ctloTT6Isf+d0GM4SPyPhZhpeTHvFcNcEkBZXauaw2xlhRRKMI6QwMC952N4F6GbdRmti572NMh4rJhwAIjnNa5/73YZ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484554; c=relaxed/simple;
	bh=4fCflFULU1+SFkIZ9nYfOOgt5VRh5g5+mOSpWCdLiVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0/6z0TskPL20/qmNWo5vPWpGYhwTKpqg9gOxSfT14/kH6aebp3KLMTb7iRyxn/WqTcXyc5A9SxuXhPohYsbEjMuOyBPuVYAIP9JVp3FlB8TYOceObw5eACNZPV+cj+MXtycR+9TuWqa6+iA1q2gbb9GZHnnlv+bn0zHOW3+F1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kq7AEOda; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d87182874fso584a91.3;
        Wed, 04 Sep 2024 14:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484553; x=1726089353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fCflFULU1+SFkIZ9nYfOOgt5VRh5g5+mOSpWCdLiVA=;
        b=Kq7AEOdaBZF+BDivlY1uqLs0Rk+5GgMdtx6xelTBLamtKZJxspDI5MXBep6oXx76nz
         LoTQLFSbTVbXvJ32Ld7i43UaNGJaffVKRU5EY5j8PUE09C0B2S/d7F95A8WeU5sdwRuf
         1vxUrKZHK8NNkQ0d+ZW6LNLOh8IK5n4BqqtN/c33Cv67yu54yBwIO0J+MWTrbK91fYiJ
         1oYXsDTuBLUzo3zkQw0IMDouL2MtNBBvJeMZekdPrWXr/QbS00DufP6wlTd0wR7Rtgtf
         /GyAUopOXCkrNwwYX10fI6G6bqHtOPJ6E7MDfXe78xr6q5cr14gabXHCFRcGJO+WOKGO
         EUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484553; x=1726089353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fCflFULU1+SFkIZ9nYfOOgt5VRh5g5+mOSpWCdLiVA=;
        b=bGnJ9WDxDeK7B9TJUMJKsw9Z0xG5Zm3esTN+T9EjfTCUkFFTZlU369OuaOhF7mbuCr
         EGvaPHQ5ChrydjfdUwm/WOMz8JXMG/kDJEYogMT3Ur53FDPQ2acDykdlvxd0BIWA+9wV
         sz++k1LpIcjO/Fej2/Cocz+K8TqKvWI5skuP10tw4Lagx5VKfRj3DsALpX001IY1QkJq
         lf9o6Tm3IxzSzEjaH+u98r+MPFMHEmeJnvxXfgQE4Fcmax1SzOFDFnJlARyOvqd2p1JD
         CI7cbqmK+A7ejkiDv5JGykMNVHyjSh2w02+Gvtk4HzIf88Nz64jhKyFZnEaJUyZaW6Yk
         7eWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXnYbZXAjnvfbFMNsX3874I3/wKwz7FCJZuShAp2M0LZC9/ys101BCAq81NH0wZi4IiuNyl/ofgqSUykAxEuw=@vger.kernel.org, AJvYcCW+Krr7jO1t+bvuIQ8wToF51409e5IWgs0P3wE28RF1ghTjSoMPmf5OxAY5XbO0z3Hu/2VHj/vU5/SjbS2w@vger.kernel.org, AJvYcCW8zuiwaEXt4N1h7INpNO2/jlr7CknAKa1GqLnLgAMoHgd5hNqN8+4gsWUIDyRY/uaOs+XQAz/R7ZtxN1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK++HiBoLRgHIfYMK2tusG9VJE1mFIiQ48nTadyMucFeWw5xHR
	QmIvRLCbbe48NQ+RURL0mhYRN10wkXzEqNItRiv0kGDYdYk/zeSBDF1CIJHeUjDXzk7rr6FEGyy
	CvSlSu1SxHph1UtNp84UBij0HM8M=
X-Google-Smtp-Source: AGHT+IFlxv6CPgnp/Wrf38HuLWqVbBunoKGlc8ncr3kHRkQdIkIQT11t5zcA9Eh5DzjZI9I8Fg6EOTfIRZSE4JfoGUQ=
X-Received: by 2002:a17:90b:4f8b:b0:2d8:e7ef:7d23 with SMTP id
 98e67ed59e1d1-2d8e7ef8144mr6231365a91.4.1725484553082; Wed, 04 Sep 2024
 14:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902165535.1101978-1-ojeda@kernel.org>
In-Reply-To: <20240902165535.1101978-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Sep 2024 23:15:38 +0200
Message-ID: <CANiq72ni=sC7Co6W8U-_ikGU0Tf2HvOOoNdHOc7dXLWb1Cuq0A@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] `RUSTC_VERSION` and re-config/re-build support on
 compiler change
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 6:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> This series mainly adds support for `CONFIG_RUSTC_VERSION` (which is need=
ed for
> other upcoming series) as well as support for rebuilding the kernel when =
the
> Rust compiler version text changes, plus other secondary improvements.

Applied to `rust-next` -- thanks everyone!

Just to be extra safe, I did not add patch #5 ("kbuild: rust: warn if
the out-of-tree compiler differs from the kernel one") for the moment
to give people more time to look at it, but we can add it later if
nobody shouts.

Cheers,
Miguel

