Return-Path: <linux-kbuild+bounces-2746-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 458EC9410BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 13:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C49C71F24D88
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 11:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A39319E7DC;
	Tue, 30 Jul 2024 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ggu7e6RW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC6187340;
	Tue, 30 Jul 2024 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722339528; cv=none; b=biwARn236M6GTSUBQwviEVKkURZYj2a01dxFGjkiDNfFW7/BHKCsdLXx0RIyKhp59YyKrwQJTPZ5j7xcEJUGOFuJg4INPhckjoBf6tKCyHK4Spoio0JSXBsKQsMhpSymIgBo+ECTAUJoE+zaFLhzI+kchfKeiCrH1KE3fh4YDns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722339528; c=relaxed/simple;
	bh=k6w1etxIs9PSlhD2L8oROb/OhyqyBb5Zw5PxUdBQKh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atJWPbeKNNDz+dGM4B6RjFJkXm5TLuj6Fkmoz0NPFVz4gnvPTSvNkXk5Oo01ndZ0CNeHGO9ldIQB4b8cMht8VzOUBUpQ1SK59pG6OXg4EC9hZYhaTmNNjXuSyIar2+k+X5zXgfnnP+dv4HSG90m9OAiWOavmb62BZ2PS6iG1R+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ggu7e6RW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc60c3ead4so27469005ad.0;
        Tue, 30 Jul 2024 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722339526; x=1722944326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6w1etxIs9PSlhD2L8oROb/OhyqyBb5Zw5PxUdBQKh8=;
        b=Ggu7e6RWlD+L9CF7F5311suivNh/gW+AS9SRfB5n3/7ZVHMKDLz42AhTDGSDE4p3MD
         iZeFhG8oPY75Z60auLANFh6iua4yB7RKyldP3afdoLhuRFWkgmofGNYAmJs76KLOD3qR
         pz7jnDttn33eQOFyzt52QMAPxaOdFJKR0GDhdIdpnIJLmFtZCdLj2yLDeDZzuP3ZmfHl
         iaDQg+AzGyihsYD1IVMnzOTXjc702VFEP4cMelu8iTHvJuoIqBJos6yK8H1tifyjscvW
         krjWeRfNqN/UvQ4E6evqx868+lryJcw328eguR87JnQFhLodFl1TW0lXosbqALe/lRAa
         Seuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722339526; x=1722944326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6w1etxIs9PSlhD2L8oROb/OhyqyBb5Zw5PxUdBQKh8=;
        b=qPnrBo6xnIDLzqU6H8G687mhQ1SnYULhN1HDd4BpmWOOahRpATnfPGIyKY3mom0SHu
         F9LvvjLzV3mHoQ20f6+blUeGQE1Jji/nP0YoMn0vI/q1n+VlPUFshgp1AXggxGX/YPAI
         iZOW/RXDzjYDBUaSbv9kjKF6MLoERPNNEsHWgUjh8tzV5vAVNHlv4UPo141J3peG0YuY
         tVaWA/cN6msoJOUI0D6+5I1cGAtDxI0arMmYL8QixCPoi/L/+gVVgW0WJU7sa/lCK1hR
         1cw1rVzHDNFpMKRki67K9tRtMgfFUzmyBLUsd+SQtPwOLf5LFfUMDjON83+5G1Fl78a3
         y8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDA1ydJwxhqEhHwXMIMfxXyXj6QEUQ0EeKDv3XHHBqKGZDCFjpsQdfO3LbgIlsCYn6l0fjYsV/VgTPgEnLbTOj+KXB6NKEW0SZVjMfkj5ZhZfW3+h0Ia00jFaIo6Xc4dqkxqkrdaaVAMpKlYJSrekp6TJv198eSE5isqFiD7tdBA7nAiPqFmWC8xA=
X-Gm-Message-State: AOJu0YzOpz1AV9+IDJLxr/9GrhJqEsmEJN3sHsZUN/b2xb4zrVQJ/eaO
	7K3PaDWuIqLm8U5KLd28JuISJvhiFE4NdY96NpnxsRq4w4vOO14w2oJlTUQ8RPWBvpJRzF+HsYp
	+EUGoWys90LO/MryEnQNErakBHxk=
X-Google-Smtp-Source: AGHT+IEyFfR0JL+UM/RQIvp2FGsc8TUErm9I4F/AWWlIlBta6ShgvlT1kNcu3Z8LXkGFKHiM44u0YnZfRWxtkE672Mk=
X-Received: by 2002:a17:90b:4a07:b0:2c9:9643:98f4 with SMTP id
 98e67ed59e1d1-2cf7e097f0fmr9022074a91.5.1722339526064; Tue, 30 Jul 2024
 04:38:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-1-bbb948752a30@google.com>
In-Reply-To: <20240730-kcfi-v1-1-bbb948752a30@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jul 2024 13:38:33 +0200
Message-ID: <CANiq72nxq0gnCXbQfFiZ4jErLptR8juyNzv1mKL_MEyWyDQdWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
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

On Tue, Jul 30, 2024 at 11:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Introduce a Kconfig option for enabling the experimental option to
> normalize integer types. This ensures that integer types of the same
> size and signedness are considered compatible by the Control Flow
> Integrity sanitizer.
>
> This option exists for compatibility with Rust, as C and Rust do not
> have the same set of integer types. There are cases where C has two
> different integer types of the same size and alignment, but Rust only
> has one integer type of that size and alignment. When Rust calls into
> C functions using such types in their signature, this results in CFI
> failures.
>
> This patch introduces a dedicated option for this because it is
> undesirable to have CONFIG_RUST affect CC_FLAGS in this way.

Is there any case where we would want CFI_ICALL_NORMALIZE_INTEGERS
when Rust is not enabled, then? If not, is the idea here to make this
an explicit extra question in the config before enabling Rust? Or why
wouldn't it be done automatically?

Thanks!

Cheers,
Miguel

