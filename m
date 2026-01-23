Return-Path: <linux-kbuild+bounces-10837-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL5JKrxkc2mivQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10837-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 13:08:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C2991758DA
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 13:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CD333001CFE
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 12:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4208A2EB876;
	Fri, 23 Jan 2026 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKz9BiOt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E02D0605
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170102; cv=pass; b=Ikzt0ep5Uqd5ReQuQro6uLFh8zLxzc7c2KDFi1FVlXS8Zk1A9GRDE02GkqaHHEf7wBidGxGDR/PMLg5nW6Jnb4vfkAqZBPyEjk947rmjeZBrZqGQRh2J65/jZj+dqryIjt0CpoYYhbpEb0a+SIe24TgQ2gew6022tAsrZ+DtmeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170102; c=relaxed/simple;
	bh=+XU7oFAuGDdowYm7s/ifBZpXLE7zt5MY1/p3INyojKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5oSw7hIMTg74SdN+SLb+UxI8OF1ggdflB8lLrkfxntXKrh2adDXo/SOOY7c8pJ9tTiW1CU3BWx2qbDhsk90uy3f76604XBOizfb+PQunmE6RIL4Fk2HVL1+EFqoEE+TQ5AxJEgX4FJWIbG4Hf5Ycd7hpsW0qE4ZZSUCx3oIq9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKz9BiOt; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b7267ff06fso176948eec.2
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 04:08:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769170100; cv=none;
        d=google.com; s=arc-20240605;
        b=NQHAYaJS1Ym9u1LMBd86C2lky1SubQZVcaNWvf8wtTge+Acu+aFSDh0CSVbrFwOl2t
         mj+3xcWwsPEs1OgrLuk+FWouarHfELQMuyh2ZDLW3NnL1i5TlsqgeShAm03XYJ3P9Ofi
         KjVy6ycf9cjKzWJfi5rOXnjMjZdI7tTcjDofG+ilaqHAzRXGSxhSMg0049ZwOnEqW99s
         F4K17puLQHfuSGP5HQvSvTwjPP9L3XN7wuxDvfaJH1+Yd+CxwmIoy9521olpgTo0rsXa
         l/gNhbQJYyjlYP6hWqGtXu6sJI8/dpX3BP8IFM1BpdYjuMDcqPgVXgibWa17ycpMHg7Q
         dlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XU7oFAuGDdowYm7s/ifBZpXLE7zt5MY1/p3INyojKA=;
        fh=i2ADyliLAgPvZlUs8IDPGWFVwGLEUwlrb348pFB5Q/Y=;
        b=VpTgMbIWtFJVtjiHuuKmYL1UsFszw9uVeK3hOOpgYra+655B0VUMCl4chp/LifV303
         qod69ezvo4j4xjKAC+Fg97Z9sTXXV3NAsDPwe5Cbh2AcEZ5YJf76yJNV4fqhEY4++SfM
         F6mDQtMepZt7pwc70wml/gdI9Yus1sC0DyZz3xKyJCgTXwYhwcbiZEDLvIRiiwnUu+WM
         +X/Y7QAeXaVxVUrvz0nAPF1r/OTAIDCRR9w1ndkbH7lylZZF5PJyn1Yc7swrU7km8Ng1
         Q/+3h7rmQ0KemT6jKo6ah0yhycKNcYybY4U8bGO7dCsQK7jYP7Aq/Bv9ny6OCm2By7Zn
         4sqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769170100; x=1769774900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XU7oFAuGDdowYm7s/ifBZpXLE7zt5MY1/p3INyojKA=;
        b=iKz9BiOt+n9qag2KWI9Tqulu/knbb88BaNCSrs6KcWvNXjRpAxGxT6P+FRdlzviu0t
         wiNvbOg087fSFiyeHMI1FQLs+Vd4Z6lyVZ62hzAWep/LfANz2T6R+At17FhLXM0z+A6C
         fSFotmVMOVNywJ9rE0PGN+0LcW6Z8RMPKe7wdc2HTz0y/2ZK+INUHz3mEFzK+AANesCp
         kFbs5wP3Ngs9YqHusNoOWTR02wkns04HcAgrG0khLVByqN8IpHTGkRDh0439Y6v5uUI2
         cJ9jAMThNC1Ae+VEZKlOZD9qkmF4NEfSeFEwSb0G9k/aJVY6BprAiLpQToYlVsoOYUcc
         /1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170100; x=1769774900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XU7oFAuGDdowYm7s/ifBZpXLE7zt5MY1/p3INyojKA=;
        b=BHWr5kwFHAlP7lurToWjV9HOARrFWYpvsajefSzsL4XO/LV7JfHYV1S71qGcLzcEeg
         kul+nGnrCe1+Q32DspzZ35JN3FbU1AW/1SudAmR/ZqpZGZAK06kTe/GqtwpJhSFQZOAh
         aotzJIuM442UKPMjyifSJSJI3a1YilgwqdyVWzsA9+CqkPe4iVBQj/h1eozU9RW0dY0j
         kASxDDoHbMmhn9x/B+rgvrCMkwx+S1LfEGwlJvtLNpQm+z/DoOwjJ0CjNPwhaLVOhS9p
         nlLYu6ZVhiRLU907VMqTgvslDKIW1bvExvyX7rjcufPveWCg7Gsf/zFKsGRM+NgLFK4f
         ytYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd3H+vLHjagSYObHlm67u6WU+JIAYUfZUEq0pN7foHhL+GFU9qsJZnczw6afM+VVjwGATNDXmWIolvzec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUdsquzAOWV6hw+iNadSi1XtQQz03gJfw04n2/1M6L8/A1cFIx
	XvsHtfkCwYSscXwCIFZkpddvQKLgxRMsBMWrjjObApI2KGPs1Ix9ADl64u+dZwhNjxHnLaeuJoP
	FBsuh/dJW0fzlNmqgvTW7c5H5kNEBxUk9prY8
X-Gm-Gg: AZuq6aJz/RkVLBLiwnWhg1uby4D0ZjDCO4owt3uPoo/NdhCKz6mvyfWvFiHcVd4FrcV
	v/bs7p0rcHJQDa9AQktWr9QiWDL7oGYGzOk74hpvcgICXiPWZlxfLIaL9LddqjFekRAlddtJD+e
	W4T00oy0WlQzmC5IvRPXAnH1Or00tKzMWT8/I2J3GB2Ckktre/C9AePaE2TIthboRgWwyd8fWgQ
	ZOjwz7EnDfpAwh6gtGa67HyhbpyVvNK+YJRgmhgSp+/TDsHCHZrnPKQFHY3Hq61zOxOv5TRirF0
	aYBhRY/dTGrjSTxvkiBhhG1/8y3Tr/6Ndb3SwcAcJPvjPb2HIzZ0ZTwlBivnmYzZ6a6MWjI0ThB
	Uf5H0KAFc2xM6
X-Received: by 2002:a05:7301:fa86:b0:2b6:f2d5:2923 with SMTP id
 5a478bee46e88-2b739bef2b5mr562027eec.7.1769170100095; Fri, 23 Jan 2026
 04:08:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
 <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com> <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
 <DFV2IL7N8X9O.2DLY12HALP8AA@gmail.com> <DFVQBFD54CJO.2D3VQ091URH2B@nvidia.com>
In-Reply-To: <DFVQBFD54CJO.2D3VQ091URH2B@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 13:08:06 +0100
X-Gm-Features: AZwV_QhYanZzgfGpIlWH7Zb5rMAiUbD-RC3hkYbiM1qSQ9I72dmpwMUx_J4SgiA
Message-ID: <CANiq72n65eLUmWShvpVBzkbCork_85A8nMZPKdf+rpw-nJ6j_Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot crates
 to sysroot_project
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Tamir Duberstein <tamird@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10837-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C2991758DA
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 6:45=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> I think it's possible to get it to work (at least better - not sure if
> it fully fixes all issues) in RA 1.78.0 without specifying sysroot_src
> if we add include_dirs to allow the relative #[path] references to be
> resolved.

Generally speaking, if a version of rust-analyzer is complex to
support , then it may be best to consider avoid supporting it.

It is an optional development tool and many/most use the latest
version and/or the distro-provided one. Plus we will be moving to the
new minimum soon, and so far we didn't support multi-version for the
tool anyway.

So, in general, if it is something trivial to support, then why not.
Otherwise, I would recommend focusing the support on Rust 1.85 and
later (especially the latest plus versions in popular distributions).

And if a good test can be done in CI for the new multi-version support
etc., then it may make sense to test nightly and things like that too,
and even ask upstream if they would like to add the test in their CI,
like we do for the compiler and bindgen.

Thanks!

Cheers,
Miguel

