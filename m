Return-Path: <linux-kbuild+bounces-10618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE52D38818
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 22:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C19B1302F80C
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 21:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE69F2D594F;
	Fri, 16 Jan 2026 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ms+nqqtq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F9298CAB
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768597296; cv=none; b=dfR0XK2oBw7MYarXi6Z82eF998L+ZyOFzr7D+Nve+T7gG/HdhhNlrKrcJ6VCCM5gjD91ElXKw2yavZCyELr/8yZHhBqSyvA1F0/KfsPUVwRSWUx/NVTWrXABF/VoFwBaiRmtPVQnvHuyvNA/oXeSCHcctU8kKfauRpwKQ2NmKT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768597296; c=relaxed/simple;
	bh=J0lJBA34IyECQmfgD92fGI60ptA7n2oNGGMd+JT3TvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aO5OWKKB9EnsXSzr4fPPrZWmhyF2VAdWnpp7iP/f2+6LyT90FCZfTFnaG8T50DWYjgCNz3iWxFqh6olliTo6gvHG38aTEA0uk6t/R4kxmKFJnKfFV2pNyy7tb4CY3IVe47ogoUbVtGDeQ2+tcrc/JLKoA8ujLlt39/klwIksscM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ms+nqqtq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7294CC19423
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768597296;
	bh=J0lJBA34IyECQmfgD92fGI60ptA7n2oNGGMd+JT3TvY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ms+nqqtqWziS37esdp6Sa2S0Lai+i0peH1IAicZOHCxG3DU0pBJk+qLSwBu1Ivv4k
	 ygC3b+wjz/vbqFwTdAQtPBxAWOBvaWFlTnvs5j2+Z8K6hvIe05M9E6A17i/areFnXl
	 JsWj3Jzsl7gkR4+v1i2+6Lm21is56fZI3U8Dbf2pJue3Zyo8SxkXhV9/8NQ8O9vpQH
	 8WIs3OC1h+xpkqX3bfnd8hTdD3CaYFEpr/+E5ox9Wc/COrEZ3VcGuVn87/DJ2MfoTf
	 Z3Glc/62I/KwHF9bhBVj8fLtwKlzhxEfzUExO7HFXwuj8rsMjqLjcd11niUa9CLJtk
	 iIJcjjHYOOxTg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso22528161fa.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 13:01:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgioARDAlWumhGI1ESHgf+KjtEJbMVcaaTOx9MneRPIiXISDQN9EnYEjZ9eRbEsa1IxS01w+ZKp2JR3/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Rj/6UUkLvAyqwb+l4OVRsr3qihsyuZKl77pn/liDhQPDdY54
	sNA4Pae+4ZmZct76Ri/V68H/oYJhmlIQ/lJSLqljekdMWIXu4AMe2eIkIIkSYELBdmsZO2H4zP4
	/dtjVZXHOWH73tTjeT7ocvCYFks9iqoY=
X-Received: by 2002:a05:6512:ba9:b0:59b:7e26:2fc4 with SMTP id
 2adb3069b0e04-59baef0176cmr1369404e87.53.1768597295104; Fri, 16 Jan 2026
 13:01:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-rust-analyzer-pin-init-duplication-v1-1-5e85c5824a02@kernel.org>
 <CANiq72=O-+UTxP-eATh1yMAzX6B-O8h7v8FYVG7F-Ym0rA6F_A@mail.gmail.com>
In-Reply-To: <CANiq72=O-+UTxP-eATh1yMAzX6B-O8h7v8FYVG7F-Ym0rA6F_A@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 16 Jan 2026 16:00:59 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nz+mbT1Po+mu4LeuZ-+aff9dTjP2aamX-Zpzt1YtTmBA@mail.gmail.com>
X-Gm-Features: AZwV_QjIY5Hf7e6fJmOvQvKFXksRAdhvfCwkh4qHdNw23CZZoJXggGYpYK4Mgq0
Message-ID: <CAJ-ks9nz+mbT1Po+mu4LeuZ-+aff9dTjP2aamX-Zpzt1YtTmBA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: reduce cfg plumbing
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 2:42=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jan 16, 2026 at 5:11=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Plumb `pin-init{,-internal}` cfgs from Makefile to rust-analyzer and
> > automatically interpret `--cfg <crate>=3D<cfg>` as applying to <crate>.
>
> So I guess the goal is to simplify things and avoid duplicate
> information, which is good, but in general commits should explain why
> the change is done (i.e. not just what is done), even if it may seem
> obvious (for patches you receive, then you should ask the same to
> submitters! :).
>
> In addition, for the `rust/Makefile` ones, I try to mark those as
> "rust: kbuild:" where possible/reasonable -- for instance, this could
> be split into two patches. The first one would be the "rust: kbuild:"
> factoring out the flags into the new variables and the second would
> then be the rust-analyzer one that only would need the extra two
> arguments in `rust/Makefile`.

Sounds good, will send as two patches in v2.

> The changes themselves seem fine.
>
> Cc'ing Kbuild as well (there is no major change here, but still, I do
> it out of habit).
>
> Thanks!
>
> Cheers,
> Miguel

Thanks!

