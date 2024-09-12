Return-Path: <linux-kbuild+bounces-3531-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB968977333
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2024 22:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 782931F22020
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2024 20:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5324E1C1AB7;
	Thu, 12 Sep 2024 20:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="12qgrbfr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998951C0DD9
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Sep 2024 20:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726174747; cv=none; b=csONEwEekY+dPky7xR4VxO0SXxgFM9I9+TXJhNGzxOQ310Xzq3hYJyIvS4sdhRiF9zInPhTNo1zbQg47VFb2VC87+0sFCEN1TDnpSkz468YdGhj1CebUQYuOYgYX3BgMgzxx8UxWRzL4BOg1Ax7JbR9oFzDdQMRY5BU4Jk9hOps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726174747; c=relaxed/simple;
	bh=BGo4YnBtJLBzALgGPXw2885jarBIn/OgobqfXJlzQZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZL7qGjyAY06EOVWi4gewHWTJdbfeFAe/KJo0xHGDLbaUP5jaZoZ/z4b+tEFtl6guswQfd0meB3LZj75wSjJ9FrNWE5EC3PVkfZeFo1icEgba6O8ghiz9+fSTUQo28uXJUQhUhM631j39oRtgig9VcQLKMX8UZVaXVO1tgYEXGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=12qgrbfr; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4582a5b495cso22811cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Sep 2024 13:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726174744; x=1726779544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsCx7PNwUKDs1VgbiUw0bQvBD47bWmKcNmPPKYW0TEU=;
        b=12qgrbfrttf0OYZuqi6cXwLR8/+GLqh4g74C50/WZTePue6idYRzsnbJ4EaZCz62uy
         Y06BE0k6sGucB9kX3nU/EfeMYuJfzGxPzb9OITmkPOhcmKWBTbMmzRTIkrupDbFIdebd
         NKUnrt5HdCAJNLzh7rnPcxCz2ZpzOcaAtqn3QKxrXKHxOHl1A2DSCatlhzgw5qB0Iqtb
         vEBYyW4+gjmFBO+fvoHAH18UazZMgDMxQ6KMp+jkxz8Gt93Ic1J8+0F3Qfe13F7eZ7g2
         ca9dARo2gPcfmm7gnQJf+KhQiHYHrQIKFNsIu+MK25nM+/3UjH2/Ize02UhRlE9eWXeC
         zFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174744; x=1726779544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsCx7PNwUKDs1VgbiUw0bQvBD47bWmKcNmPPKYW0TEU=;
        b=dDszV6I5gd/7N1zCLq9KMHFUpMsPV2SUY7XnuUdit7qTrKicggg3ezt5DKgZmncanq
         XCi6Tqw2m0OuX01TGKA5iy/pfB/C+tWbtmj44m9o7Xv65mCj3bht363E3lGWfqxbDaoX
         k+WyvD0CVqQUljdFceIfNMuNh4lrNk6gWLxsUWh7SvafXG/1u8xd59001tsAnReYfkdg
         YCwMARXfQQKBA5T9e33KY3Phldmlc9QylXuR1afFNbcTXssEJ3CO+kGT4h8YaCxwt/vD
         FykGk7HAnx6qpKrdgCIW8YMYD1jNngtIvYjAlZTLQtZDSeAITON7O8FAtDWqbpMbQSnL
         vwvg==
X-Forwarded-Encrypted: i=1; AJvYcCV2If0J13x8ViM8InB/Bgm9GynhKUr5tcBe0iDkb0hFDqQFIe07pK61JmSnBi9cpg3pVyQqNf0Y72P8VF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd9qNCIiYmBDkj0hT6+rqTthzRaIwatCC13EubRscaoa7vCWQY
	vrmxBJkOP54bItfs7y9KvL792zwT4ZeCAkDhX1Z/UHWYA4BLRBQ84n4u75Oi+qeqwL9H5C35Klb
	CcJgnxPbBbvvapgcSl3BJ37sR4s3T/mEgbCdL
X-Google-Smtp-Source: AGHT+IGJ2peUmYzPvc/ly/d/Ex14Yi8y3LliEmED5bKrPQbZs3ROv8z0RY2viWsWeA+pvalyZNjXSH9Ak/Cat2QudqE=
X-Received: by 2002:ac8:57d0:0:b0:447:eaaa:c852 with SMTP id
 d75a77b69052e-45864547dedmr4206811cf.23.1726174744257; Thu, 12 Sep 2024
 13:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
 <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com>
 <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com> <CABCJKuer=O3FnLJNGMg2+-HxFJFUrccTuuHt5OiMpRsAJBvBsg@mail.gmail.com>
 <2b2d4953-d2a3-4ea2-98a4-078901cfbda3@proton.me>
In-Reply-To: <2b2d4953-d2a3-4ea2-98a4-078901cfbda3@proton.me>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 12 Sep 2024 13:58:25 -0700
Message-ID: <CABCJKue-YtCQWinad2GW7uJuVN-ZSUmRYttK_PUurJOR51Urgg@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Benno Lossin <benno.lossin@proton.me>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Miroslav Benes <mbenes@suse.cz>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benno,

On Thu, Sep 12, 2024 at 11:08=E2=80=AFAM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> On 12.09.24 18:06, Sami Tolvanen wrote:
> >
> > I thought about this a bit and I wonder if we need a separate
> > mechanism for that, or is it sufficient to just #define any additional
> > hidden values you want to add instead of including them in the enum?
> >
> >   enum e {
> >       A,
> >       B,
> >   #define C (B + 1)
> >   #define D (C + 1)
> >   };
> >
> >
> > Do you see any issues with this approach? I think Clang would complain
> > about this with -Wassign-enum, but I'm not sure if we even enable that
> > in the kernel, and as long as you don't overflow the underlying type,
> > which is a requirement for not breaking the ABI anyway, it should be
> > fine.
>
> Rust has problems with `#define`-style enums, because bindgen (the tool
> that generates definitions for Rust to be able to call C code) isn't
> able to convert them to Rust enums.
>
> So if you can come up with an approach that allows you to continue to
> use C enums instead of `#define`, we would appreciate that, since it
> would make our lives a lot easier.

That's an interesting point. Is the problem that you cannot assign
arbitrary values to the Rust enum that bindgen generates, or is using
a #define the problem? We could probably just make the hidden enum
values visible to bindgen only if needed.

Sami

