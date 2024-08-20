Return-Path: <linux-kbuild+bounces-3126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421A958F02
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 22:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1E331F235BF
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 20:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5912165EE8;
	Tue, 20 Aug 2024 20:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m0mFQfRG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF1E154C15
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 20:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724184249; cv=none; b=fr6/BRDOTiV0GeOply20W5OEQ+SKTvideISrdxyzDn0dynrXgsYbBwkYIErMfMl1cGmMYmvSDMWHe3X2sd4Px50kkKoEILjE2cg7ZulPUIHW8TWwvGq0f6Z0gRu4vjWhEWS9MJ/2wnxsTTV1IFrgIou66KLYKGzs+nxzIDKTN3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724184249; c=relaxed/simple;
	bh=yIsSyfviDurZmXmSYbUpZGkU3uUIQIszSbu7SpzwhjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ+fLVn0XCSqw5IB8bSMq/9U1Fhv3bRZLYyIBRiyHQwCjng49byqvIOv/nQ/26oNqf27gXQSx04IWX267V4f2Q74Ly5aYu2xyNC4li+GBoErV7FevqaITZAc1Opnlibkd1Koyx3oY8EiVNXPaU979TaQ9/GkkrhH5I/X6tEuNhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m0mFQfRG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bec7c5af2aso823a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 13:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724184246; x=1724789046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBGLTWPAaobHWpK0PLexiPFsVPJzHgwXjGqO2pdg9Uo=;
        b=m0mFQfRGozTQOzmyIfA0Gq8CDwSF18Y6k1PKM4NhyYJz9MxBM4P94BLJVnEb0U61vs
         AXC5iyWrSch2Bz0jrfWPXNJzseDT8BLgeBDnoCD81eL3OLyclH5QvbLigDQ9Q2lbRtG8
         rh/fV+hK8JoV1Runs2P9gqYZMR+wVfR8KwaiUAoESyrRWlQXiyWFB7lc9jvLNg5A+xQ9
         Lyn6QJpM5WGqR+o8ukDAhK7fPSge4ToJykPlcjf1eIS9fusJhgRjm1Xe+p7FSBBhrxmw
         9ohSgMKYxE0F0oWBIHVVfKJwCCgmQ2bxIfIQR1ZEOfKGhfnzgXK6O/YFPiEPbF4M3c/h
         +OQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724184246; x=1724789046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBGLTWPAaobHWpK0PLexiPFsVPJzHgwXjGqO2pdg9Uo=;
        b=EJmXO4QctMzpM/jwk/1MKc//K7FOQNe3rUjMUsWXoeCBQhaLjSqNB06+X/dGxf67SO
         UqMPVokTaiBu3dQvnUXiPqXOS08v+F5VSPXPdnAlTcJMaT2jZWXhw44gfb4ZAFlK1xpj
         cJAAe/1U2MzHjvfbxCE3T6v1w0bh3j4ct5p6be3rE5gPTpUb2F6z9NWcUUsbNluE2QaU
         bZAlIlYpFXJ4KYB5Y1E+djgZI2BxEMITnIgAmNj4qdmYVj6gjMqU+9o2nPTl+0JDwx15
         drJflXgnZHIN4R2yU9f/U41mjsvnPI2je48M5nMZctVjNyMuBTGl9KLFC1v9amiXzF8J
         FwbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8K7gvnGAi7CjBBwVJWrO+zH7nzaWlQbzl4qix20D8oP6U1s/fpqY5WcRW1A5RlYRWg/aRyn2QrJENdhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/N5gHpeiv7KXXuwC7PO6HhrApfrL5kJOKCcJfESZd6JUDO/t
	su4vlkzDgmCTbdFTh9SZ4u6SlG+pQ0Qu3ouS5AgaBmV69ws/TkXAKo/wCbw1W1QLDjEAkjqPFqd
	MxCwQwgfgDHz+WDSikovSIBjlT/RgyyJo1mBp
X-Google-Smtp-Source: AGHT+IHBOlxTMezCxNobnsUoiZeYOd0qoLxq7X7TniTea0TiWM+nj9FCIhtHSOc2++3F/63SSSPXEzlYu0HBLCkngtQ=
X-Received: by 2002:a05:6402:524d:b0:5b8:ccae:a8b8 with SMTP id
 4fb4d7f45d1cf-5bf0e590ea8mr155516a12.3.1724184245967; Tue, 20 Aug 2024
 13:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <2024081600-grub-deskwork-4bae@gregkh>
 <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>
 <2024081705-overarch-deceptive-6689@gregkh> <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
 <20240819193851.GA4809@google.com> <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
 <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com>
In-Reply-To: <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 20 Aug 2024 13:03:53 -0700
Message-ID: <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > The way `KAbiReserved` is implemented is via a `union` (maybe a bit
> > ironic, considering what I said in my other replies, but in this case,
> > we would provide a safe abstraction over this `union`, thus avoiding
> > exposing users of this type to `unsafe`):
> >
> >     #[repr(C)]
> >     pub union KAbiReserved<T, R> {
> >         value: T,
> >         _reserved: R,
> >     }
>
> I like this approach even better, assuming any remaining issues with
> ownership etc. can be sorted out. This would also look identical to
> the C version in DWARF if you rename _reserved in the union to
> __kabi_reserved. Of course, we can always change gendwarfksyms to
> support a different scheme for Rust code if a better solution comes
> along later.
>
> Sami

Agreement here - this seems like a good approach to representing
reserved in Rust code. A few minor adjustments we discussed off-list
which aren't required for gendwarfksyms to know about:
1. Types being added to reserved fields have to be `Copy`, e.g. they
must be `!Drop`.
2. Types being added to reserved fields must be legal to be
represented by all zeroes.
3. Reserved fields need to be initialized to zero before having their
union set to the provided value when constructing them.
4. It may be helpful to have delegating trait implementations to avoid
the couple places where autoderef won't handle the conversion.

While I think this is the right solution, esp. since it can share a
representation with C, I wanted to call out one minor shortfall - a
reserved field can only be replaced by one type. We could still
indicate a replacement by two fields the same as in C, by using a
tuple which will look like an anonymous struct. The limitation will be
that if two or more new fields were introduced, we'd need to edit the
patches accessing them to do foo.x.y and foo.x.z for their accesses
instead of simply foo.y and foo.z - the autoref trick only works for a
single type.

