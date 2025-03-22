Return-Path: <linux-kbuild+bounces-6287-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F5A6C917
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 11:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D2F94666BF
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 10:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C627C1F5854;
	Sat, 22 Mar 2025 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PBJBfjN1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E441F542B;
	Sat, 22 Mar 2025 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742638571; cv=none; b=CiHG8purXdgKnuwekiwTErtI/uvkakv70d3POsf4fAcNaBRX2bFIXi9YYbStxdMJVO72+nMshh3hurddUulGo7aWibJ0tqapFDu/Fm9I/ryaZVOIWwJfyxJT6eAAgMfsa+rc2xVygbmpdQs+LEXXvM8bBhzTaQbBCq7hBD4EZRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742638571; c=relaxed/simple;
	bh=BD8i4MlmnIcVcqfuILodMgdpM1y64lVQ0zfuhe3xs8M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LUstEllWGtclgeoWFATAfoq7Z5vyhwX4ewDX7O23J8WtpVQg7nnLjTkotbMGJcfXbKFOcT7hBVC8T+vWCg5SvZMbZ8aplSwLd+mSLWOrpczNptmjVGPSN/iWu2m87DTzii/Ctm/Y0l0O801yt1jFYMPBI7igoiGoi2fIzwB+5MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PBJBfjN1; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742638566; x=1742897766;
	bh=q/x2RCqLV8wNjcRkvoZvtM3RODnKdXJg5XuR7JY+vG0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=PBJBfjN1QJm0Vd20y7bITmLyJuCx0POLk9PlsIqHvMGq6ov7ttj2DIqo28Qj/3yI/
	 Rzc5IpZ881rFXrWL4vMRfXyqq+bgcMQgPe2sj2ibO82/7DeTqPZBVY3wHcj0sXRVgP
	 5cQXzPz6XFCCB4UG3CN6fcsxZMtMgOKGyucwMyUNIAxNVgi0slyjSL8p5ICmeBaWdd
	 n1c7BemuC0NIDA8apUBIStz8VqoI79tDZeNqikgMSXEonGsNmi0SqhJ0UWHfZYgAbm
	 eYFvz27T/sxBVvvO+UU3isnuI2wK06BXZJqF+V+T55TuGy2A8+VwnJOPLjVqzTnwED
	 tP35utTSp1xOA==
Date: Sat, 22 Mar 2025 10:16:01 +0000
To: Antonio Hickey <contact@antoniohickey.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature
Message-ID: <D8MPT9V5JAEN.JZ5APEZ4TYPA@proton.me>
In-Reply-To: <20250320020740.1631171-2-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com> <20250320020740.1631171-2-contact@antoniohickey.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d785bd8839a1788a99cc156edab53128ba279761
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> Since Rust 1.82.0 the `raw_ref_op` feature is stable.
>
> By enabling this feature we can use `&raw const place` and
> `&raw mut place` instead of using `addr_of!(place)` and
> `addr_of_mut!(place)` macros.
>
> Allowing us to reduce macro complexity, and improve consistency
> with existing reference syntax as `&raw const`, `&raw mut` are
> similar to `&`, `&mut` making it fit more naturally with other
> existing code.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1148
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 993708d11874..a73aaa028e34 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  =09$(call if_changed_dep,cc_lst_c)
> =20
>  # Compile Rust sources (.rs)
> -# ----------------------------------------------------------------------=
-----
> +# ----------------------------------------------------------------------=
----------------

Not sure about this change.

---
Cheers,
Benno

> =20
> -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons
> +rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,raw_ref_op
> =20
>  # `--out-dir` is required to avoid temporaries being created by `rustc` =
in the
>  # current working directory, which may be not accessible in the out-of-t=
ree



