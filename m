Return-Path: <linux-kbuild+bounces-10617-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 487A8D3861D
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 20:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EDBCB300B038
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 19:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE8F39B49B;
	Fri, 16 Jan 2026 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1qvRufi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E78A34BA54
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768592530; cv=pass; b=K+ztJjLBwY0aS4GH/zPeU82lXeV2A8BeVisrbvjGSKiQU6vjHhlRv72r5bK2hJcWpkkKopyx5vHfZim3AtTJgJu5zMo8TpaAgBbgKI4+8bbUQgnvuxSclfSWpJoNkLXbsagg6BgFmvaKnC4hd5jnukSa3USnrpiwB1qIDi4A9L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768592530; c=relaxed/simple;
	bh=eAdi2tKGdwtzK1W4hmlYB+ZVtEVFHvDaVbcQV/op7wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpcgWragkR/USXwoisspgPSV+dOU+lPm1a7izoZ5S7nzOoXUhR9DpyevsNfWwAunWoH+A8aC+nHM9WSxWGNGxl5fIu+0gw4P7Fbl7cGPmOMTmCVidF1KP9VUn1j+ro4nixaf19XTJElPDKxiOX1cQSRrOmDNaheCWN6QcutU7Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1qvRufi; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6c1ec0dd6so95296eec.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 11:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768592528; cv=none;
        d=google.com; s=arc-20240605;
        b=bpAJUn4+ZTserUuYC8z0zkun/UQW5JI5sB+hbXN31JCeLBtt0qisouvQgCPZ5WqFXM
         HF1Q55+bl0K6fnT3iPTJSNzR+yZLM0272soilURUoJS51yn6O+7WhPKgQxgZyhVMYQK7
         TlewY7zvRX1AIm8Yp1Sx3wDI2zFOETRMVsOdZDZFgR79BBspUQJx6tGvxcDu67mtmyRn
         fqbKjFNdFsol9nuVmIqq+IzGGI2+vYLjrZtetZXqJsHrZ+Jrpi7d6ZrttDHNCQzteNjl
         OADVlxYaPFNUIMfDDi7Z/uFpkmuOK+kk5jgZvwpIodeGvNe+w51gXSWX7Q0En6mX65Xw
         medw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAdi2tKGdwtzK1W4hmlYB+ZVtEVFHvDaVbcQV/op7wA=;
        fh=ptArFkzLhIT5oDHKD3C1XOIvfRQe3Zw6MTN2CRJzo9g=;
        b=N19GzmXGfm8bjEaCV9zokdxk+XiQKbrAF+BAh7FUxqVtGsxJOSfFHvscwSAoUSkkOy
         nOkXwucoJvIxx+IVZR3KDkhrkpVS5VGrdemxjXkqbz67nuIyJOYafv/iVxSW2+ymiZei
         tJ5tZRTYp9sxEqczUI9R729E/b1JX4KzJkx8YGONsBlyWsCoSuidRxobMIvOyfT1GTJA
         KQmoYPNvwpmuvzp7ngvFI2vVbfLPcxcH/slAUAjZb3au82nR1wp3WJv8nsJE2mcx56bf
         KuJ3wLez3TS3p9rGU+1+6GVUL9Ci3HkGiNmds0kvwnhF/OuqRAip/seT0xjQlls62Ps6
         yCVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768592528; x=1769197328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAdi2tKGdwtzK1W4hmlYB+ZVtEVFHvDaVbcQV/op7wA=;
        b=Q1qvRufi2FlJezBM9DltIzJGbKKG8NAKI4IjW+5Vyclfox606IlLvgSFM+HThFPezD
         69n6YdhpehLCgt3IwiPQQh/bi4TYlT3ZYazkmibDx85echRyP4aFJvvwj/yM/W79UQiE
         askSrBhpvNzaJ1vtOSoI9WHpVX4QY1Fwzf8HzV7U4M4ckw8zYWq90FURszTQzAMx4Oap
         9ocBSw64jg7cmeY0phqCcifuhhB4mVQ1ME4S4x8o0SeMjUl70F1Pqs3RyzaDBtBQcNqq
         1lEayaccxPrCWZfVkxm8QoJ8Tn9wM9Hklagz+bKbvqYKCjIa/XjCSapM6tAXEgcS9YUf
         uEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768592528; x=1769197328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAdi2tKGdwtzK1W4hmlYB+ZVtEVFHvDaVbcQV/op7wA=;
        b=i6cD/1LTdAh0PTBnIuptRfjlb4Ham1eAD57IPKu28fOrRN5GHgFRg0dcBJZnbwYs3r
         KXyhIim8DALxuTER2SYg6CSZDWTieGpK6SO+/q+enFRYRXrhDKfd0ThTxNO4LrAk+1Vd
         dVsa0Vf+KD6RQsTo+NpAF82plxNNlxBwRJf6E1IhR9TjZYFa1UYJoAo81c85UeOMpR1t
         qygZuiifA11yQgLzfnoLjzbbwk9ZtNuE2F25GW43VmZiYzJonY4AP6vi7cdBncmw6Erz
         2peg6oCLhEUj+Gu+axMXMkBqvbtvGXgI6Cb2J8PnsJlHZxlBjQ7ZPD2WHSkXRZcp4gWy
         DRZA==
X-Forwarded-Encrypted: i=1; AJvYcCX2fHSSqIrzyaVnrAcgGnU2DypXzH9xyFgDKAFKFtaBdeOf2K6xjamTtQA9GA4F2aM3A/I+orAKXrnBYr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFyGXaTgqU8gdZ2SKoCctJdj29G6X8T4mF52+QYP8Qj2wsR+97
	Vt8vMvMRVsB1cXWPFpCbizK+jG42/YAx7rOm7WsqbvnLkaQbFazvYXo1g+h2MLFnkY07idB8bq0
	IlR2rmORjigWvFEubsVO2pXm2N/qAo5iGqV79
X-Gm-Gg: AY/fxX7kqCJKtaWYYtKt78GEfpFxgqPk+h+kkbJ7GrR/s1ryAoY+J7U2NUwnZmK6J+4
	Yp7xNnyx2CVjAb6HGTRQvKhSg20ltWwaP3ypsX2GTqVFqAz8swUJ7MJRcT+f0RJIc/Qlj7CAppF
	+3Y9pFjLxoDxVeL0713bBHezO513Du41b+4A9vJeAIPcJ2IJhcmaw+jav4y2C8ToiIrCYASx70I
	hXCqfoeF1Kmd4GpxXBgzpG6FnvJ46hlXt0Sq/HtOccZK/y8DjqmuvPLHOa/ufShU34oAFqzhPtA
	JBSLGbReEnwty7Ym9YflZOV6YvMm2omYT1gNzOdOMfgLU0GUyk5XIgr7SQ6I30ppxwkiZdJ4z2M
	gay9+eEPV8IOHxpvwXsZds4c=
X-Received: by 2002:a05:7300:748a:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b6b40adeddmr1981519eec.4.1768592528181; Fri, 16 Jan 2026
 11:42:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-rust-analyzer-pin-init-duplication-v1-1-5e85c5824a02@kernel.org>
In-Reply-To: <20260116-rust-analyzer-pin-init-duplication-v1-1-5e85c5824a02@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Jan 2026 20:41:54 +0100
X-Gm-Features: AZwV_QiHfkNU0QNLcCb8-zUmrI_DNezL1s6uGMNEqvePx_xxikoGbdwF6RvO-i4
Message-ID: <CANiq72=O-+UTxP-eATh1yMAzX6B-O8h7v8FYVG7F-Ym0rA6F_A@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: reduce cfg plumbing
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 5:11=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Plumb `pin-init{,-internal}` cfgs from Makefile to rust-analyzer and
> automatically interpret `--cfg <crate>=3D<cfg>` as applying to <crate>.

So I guess the goal is to simplify things and avoid duplicate
information, which is good, but in general commits should explain why
the change is done (i.e. not just what is done), even if it may seem
obvious (for patches you receive, then you should ask the same to
submitters! :).

In addition, for the `rust/Makefile` ones, I try to mark those as
"rust: kbuild:" where possible/reasonable -- for instance, this could
be split into two patches. The first one would be the "rust: kbuild:"
factoring out the flags into the new variables and the second would
then be the rust-analyzer one that only would need the extra two
arguments in `rust/Makefile`.

The changes themselves seem fine.

Cc'ing Kbuild as well (there is no major change here, but still, I do
it out of habit).

Thanks!

Cheers,
Miguel

