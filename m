Return-Path: <linux-kbuild+bounces-2759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB5941E78
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 19:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B521F25AF0
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 17:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4FB1A76D3;
	Tue, 30 Jul 2024 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFuI62Xo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDA51A76BE;
	Tue, 30 Jul 2024 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722360556; cv=none; b=nFfxL+0bYVgk6kBaAB3DHqHWTaycmW466ytP7pXOre8naS+ZzKrokom13GF3FnkaOhawtXZXtVXkSRjZgdwJVzphqdgp4RSxRSoe+MhriQxYpC1eqqgkCrmpHVsQ2DeISszVREFoK8USJimxpLE1IVoAMZpc4z1g6VwTOgNtej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722360556; c=relaxed/simple;
	bh=GjlOMBAG3NQG0ljYfJguk2Akgzj/vQe/Tx1QnoDiCK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQLoz3d85CE5cSI3ztbnWP/VHJ4i2ORYF8oBoLkc9QiHTerURGSUaXXAO8Cw/aOQAkr2XK24jFkEC3X43W6eZLAXF/t5MO8MJi5M14rN+TYZX/FYz8vsB8+BM3o/LtPQUnMjxWtWj9nOS5Ue6brFmj/gL2YDrO79EOxAjMGHEGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFuI62Xo; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-75a6c290528so3147045a12.1;
        Tue, 30 Jul 2024 10:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722360554; x=1722965354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjlOMBAG3NQG0ljYfJguk2Akgzj/vQe/Tx1QnoDiCK0=;
        b=LFuI62Xok3zLmEYmoBahNgW3J0jIL0MfslM4hxMaIU8Ivkqg7CvSnpwLTmeUPypcL0
         HmZ/ZaHsTDGlB+KgMkdGUez4WPfLeDVl31AmGP/BPJE/dZcN8D65qDMSxX4+Amlua2ZB
         Lmr95pdla0Eyzp0LL/cZcjTX7GMq0SuJjVzOHRN4CrwrnM+g+YGSk5Pw4wSRM807F4VB
         S6rkd06yi0+FWDzF2EvObEtmFIwfQNaKL8Wk1dRq0DHsAci7cUZLXQmtOUxBaUpXbAU/
         7mooQGZ8+ebHjDf0dtPM5PSRMKj5fpEoGE4VtQZUr+oOA0Lo7RT9OHPGV5Dy0cfJKc8p
         66vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722360554; x=1722965354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjlOMBAG3NQG0ljYfJguk2Akgzj/vQe/Tx1QnoDiCK0=;
        b=mgPF8hypoDr9+gFN+ZAogCbWvHrnR5d4nC9gDzvpmm2f6ASeNSFRdKcekeXKfRaZqU
         Jc+WPWj9B9SjQY1n2hb8B6OW+xzFEtQYuHvvA1tOzQzRQ6BOjrBA6oVAqg8+qgu+rejO
         6MA46UfGnic4yTIe1hkPrgLIO6MIZAxqvvDG818Ab/zKWPxGDzFdOyGkd559pc9OMSkb
         yCWEx2BuFvRHblSHSjkrVfu/AdeJphL7qn9v15gnEzpN6cqW0m6C66OIlVbsSYUHYLqw
         u3JhtTc1R85NY6ITqmJbIoEhC92frUatkIJLyxdjh++sT20Jw8rV1zQRR7B/HNFot6Fd
         P7kA==
X-Forwarded-Encrypted: i=1; AJvYcCU8bBl5OPKbONJd89qnD0MJTcwzMjE3akppppV+EhkrKYsa+qfSswY1H5MDAG7JpKYpZ+JUqtgNxIBa3oOvNkqQinLqjctsKBWpmtB+kpRHmOe7vJ7rA29rwfY0vyBg7Rgs1WzbV6ICTLmdQw0RcSPm9KzSPGINCVyxjb1nnOJJ1gTEQv8P4X4/h08=
X-Gm-Message-State: AOJu0YwGRqZHPyibJ7fgMKhOJWAChM6hKUcfC6dEpDlToVP7E6RI6tfH
	WbKWSRhxsd4GjvBF60arWbasuIFbEW1XSUgZ89eMIzuHpWQgD91VyB42Nb0/vPyPspRid0SPpy1
	vsrkIaCnGqxDB59QZK/Zfe/O0kBM=
X-Google-Smtp-Source: AGHT+IFhRfa36mEODzNwgucOaonXWYtImLvUNBLghEHAYnCAws9ajlDQJTWh2FqXMOlQ7Yu+3ZvmM1kDokO4hRmoCnU=
X-Received: by 2002:a17:90a:5601:b0:2c9:57a4:a8c4 with SMTP id
 98e67ed59e1d1-2cf7e730999mr9716749a91.42.1722360553918; Tue, 30 Jul 2024
 10:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-2-bbb948752a30@google.com>
 <CANiq72mshrgXJLw+AZ+ovfhZXjYYfgQLdyYdW_v0FmdWdEjvbg@mail.gmail.com> <CAH5fLghu8Gy8copyBgcBknMN7GaikhYZb57M0Ye2_xANW6YzoQ@mail.gmail.com>
In-Reply-To: <CAH5fLghu8Gy8copyBgcBknMN7GaikhYZb57M0Ye2_xANW6YzoQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jul 2024 19:29:02 +0200
Message-ID: <CANiq72m7dup--to6gxCfjhgY3hk1iV=UD8hqJfT5=kWkwo_MaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: cfi: add support for CFI_CLANG with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 6:44=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Hmm. It seems like the existing variables containing rustc flags just
> use RUST not RUSTC in the name?

If you mean things like RUSTFLAGS, it was because the C side uses
CFLAGS, but for the equivalent of CC_FLAGS or CLANG_FLAGS, I would say
it should be RUSTC_FLAGS.

Cheers,
Miguel

