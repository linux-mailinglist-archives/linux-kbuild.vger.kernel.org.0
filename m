Return-Path: <linux-kbuild+bounces-9794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 25120C7EC27
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 02:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9FFB43445B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 01:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EC82701C0;
	Mon, 24 Nov 2025 01:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4FB6Eei"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1364F26ED5D
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948440; cv=none; b=g53pLiPE+HJnI8O60hH4dqxf/7+4iTXDY20xDGlhnOZeBgVoM9Pr9Uv+CZpJsxRDv6eXaUY1VeOIdl45S4pNTQpCm0IgyRAPirsyG1b8rYMd4ue/0/4bs1T94SxyrT7a/sd/25XYvCl96o8SBw1lMLWoek5pBAy7tSUxfnW1R/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948440; c=relaxed/simple;
	bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=If0HHnaIvKoWIb8XKQ7x6vDhqoab2ScZW5W2fclxVbVdIoqcJKFI3evpbmhzrktk1W47i7t6B+t9DTRJ9s7ZVoDHZ8kXccBEGqbUVpQ91VBPBn1FIKCP7bZ3vd47SwdXmzHR2KHQaYu43qlyixmeuEOFNzXVOJsH4pwzKbHkemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4FB6Eei; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a990ec4e5so2604041fa.3
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 17:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763948437; x=1764553237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
        b=c4FB6EeiRcJocy50zADrvefTKU2yjAAKGusSw+vkWV7tns0+nDv0ml+MQV5vynJWqE
         5rMrjpdDDmRbQ71uu49cUh+7kPMYOPUNEOuvWVKjFJdD8xKGjjmGKvpo+aa7aFUpP9RT
         jdbRwIkdSl0cYlgBha6HwSQYxwvmPeihnjz0pJtR3XkwtGQxscwvPTgmAHacj8e2pXRp
         64DFglXObh0+14WpeSrpWV1faKjBs+LEaRo5pBUWdL3mZ6efIvQ/5rVe+6RenL1LbgDj
         K801tGvDasDp/sPSiKzJxVN7otQTEiVD6Eo6aeW0jZUQeM7DDCeLUZ7YQy1a1TxWisln
         tIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763948437; x=1764553237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
        b=rzzMOMvI5kkagrdzWOwfkgCMihAQ8rxs1yqNBZAzcQeLihc9W1yCbcbIrhe5n4ooK8
         /Gxv7BjSr8GJ41vyCHEtbzrngLTzxKtgsnssQbJ0kU0dxqGDIQsJU8lNFuRt3Uj3tnLB
         5pRF4JH9xB3dFYLRIGR6xw04nzkOz+cNRSYRRRPt9fzyl4oJjVJ9cWnfaFn2N1P3MsvH
         rf3uzcXgXXx+dUwMnIRqoGsjizKYssCJt6rRsA8uuMorj5ybFUMgllB6nhq+ZsBi50Xl
         yMjLhFHrKQU785OaOZdS336+p14311DnUahJFt8WZ9FTAiOL0eO9q+9xo3Fb13bQ31ES
         HUhw==
X-Forwarded-Encrypted: i=1; AJvYcCV9vS1CZnITqRIKGbxqD90XkmAX+qfz9zMeoZch9oQaFifYH177I4geNwVVX7R2AeltvE/4cB4EzGWVFcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbttA4IvcuKhpAkOQUoefiVNJDebhTRYYyp8VEGcycAZpZsG8
	AdmXvnCh9Yi5y5cSBKy3odv9djTd2iwqYO/n7hMcPvAweMED9b99XB/AyC76BXTAut6bOQ2X4tz
	sXgLQoo5zJGEA2nKihZLUIl7SfQ46LN4=
X-Gm-Gg: ASbGncuOq8Wicq8aAkKu4YbB6KyY8UVfzYVVJ3s2V02W+xyvKhukoYrTEOcLtMRkivI
	rfrI31DNJML/VEdvwCcdkPVK20xD530p6+0dGDbXQeTI6TRXXH2lY+6D6/JSCXvWbMiIDfzmUQ5
	fUZf2PeNkQC3rDTcTvC1zj2WU22ZzBM5rdOuLeLF4fvy18hagZCFM5VKEpOEg4kvv4oNTcz6HlR
	pFeSmwkWDKA2G++bhmLefEkHVSVYwS2r3UJ0R/6lhYuza9EuEcyxC4hdhv17tJ1TkRXy7yRxR2Q
	1Cv+TqludDcBvFNk7IlWMedMdNEgqEY23b18enblWIPsH6tmkWQB2648HKlXyTHc+ZY0q9awBoF
	y/WMlpPqdUQlTxA==
X-Google-Smtp-Source: AGHT+IGJ0/QqoFdh3XscVl74AmQLSg+MmbSCdBIAO+xihAcbKpwhdVEc+6URPzsvr/D4O5MVqOIaGXgotk7kl+mskSI=
X-Received: by 2002:a05:6512:4028:b0:594:33db:2836 with SMTP id
 2adb3069b0e04-596a52f41famr1664493e87.6.1763948436852; Sun, 23 Nov 2025
 17:40:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:40:22 +0100
X-Gm-Features: AWmQ_bkux8gOmOA5I7Y1blTc1OP02EBuH81WNeWf8pohbW3LHlgv9oWzHxyvbW4
Message-ID: <CANiq72=QFL9-b7P0UBFT9VCCOQ9BKS4WUR0Q7wWioG7nAijr9w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: export BINDGEN_TARGET from a separate Makefile
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> A subsequent commit will add a new function `rust-bindgen-option` to
> `scripts/Kconfig.include`. The bindgen backend requires the `--target`
> option for cross compiling, but variable `BINDGEN_TARGET` in
> `rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Please end with another paragraph saying what the commit does, e.g.
"Thus move the variable to a new `Makefile` that can then be imported
from the main `Makefile`" or similar.

Also, I am not sure if this should be called `Makefile.bindgen`, but I
guess it is fine as it is -- with the current name, the new file
should be covered by the `F: scripts/*rust*` rule in `MAINTAINERS`
already, so this looks OK, but please double-check it is the case.

Finally, is it possible to put this under `need-compiler` like
`Makefile.compiler`? I don't think we need to evaluate those options
for things like `make help`, but perhaps I am missing something.
Please see commit 805b2e1d427a ("kbuild: include Makefile.compiler
only when compiler is needed").

Thanks!

Cheers,
Miguel

