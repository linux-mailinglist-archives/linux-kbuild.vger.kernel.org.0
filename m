Return-Path: <linux-kbuild+bounces-9516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F48C46FCC
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 650141882D16
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 13:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2E931197E;
	Mon, 10 Nov 2025 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WYsteZKI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832BB30FC17
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782151; cv=none; b=aGNCAyvHXBzKMH1OsNE7ypi99n0JKZcZI+hTyOPXMh1lkZ8+CGLb7fdTxg7tExPMdJYPL63uLmQVkGmzB9DCJM9XO5t/Czu2XWEAhLDjGQgpPUVE5Ul5gGjY4/0PBg9WZ3emDdw9LDSS9g0DvsuNfJc76rXSfLJxGMUFXAbn0Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782151; c=relaxed/simple;
	bh=PAdjbqg0ugnMG+0+hkw0gIL4xG3r5RPuYT8bL7baWBs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TCTuczq8JjfjD9B8ZzCnYutABZ/d2gE0x7S7aD38eVs+QECHBhDn0hIbTf7UPzwbVJTIeYZuUHLVIkIKKMoiksJ74aTPuERgSSmn/3SvPxR+h7E7UV1bViTY19w5G49BVlZmArGRASkjEqCXaP06TYbtLWrfuzkTq4D/+MUp9vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WYsteZKI; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b3086a055so1320966f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782148; x=1763386948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAdjbqg0ugnMG+0+hkw0gIL4xG3r5RPuYT8bL7baWBs=;
        b=WYsteZKI9i4v4if8baaqBjwkLKPAp7E4xHC906b6CGLP7Gj2G6qsLuYy5YYpHF2t65
         fZPBF0qQWttyAav1lvcoR6ZaVKtcYMdjtJ7kDzVKOGsczC9sYBTIYxBGz4umM0OcK5GP
         yl5Zacr4jenfO30SSii2Z7VDinrObqQYY+imR81ogbE+YpokuHD9aoJiAq1xaM8L9HAs
         bY7AFE7hC8So2fgsPzHT0fE4joeMMvyYQOATj26gI9eUR65tim1TWcFlcxmB3T1wJmoe
         oACoXphst43rMMAN6ttgelZYZ+fW+BJ2dxknu785mJ+fHRSrrRk+7amcq/7XbwruV4pF
         8wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782148; x=1763386948;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PAdjbqg0ugnMG+0+hkw0gIL4xG3r5RPuYT8bL7baWBs=;
        b=RpE2t3E07wXF7LusM1jAgIlC2b8MJP08FINf0+kCpz78BcH13V7ekMUZPn5amGy7Ue
         irJRz1W8CaFcvryqM5f/6S95ngnIIY7SZRDTtiO4z7M4RsaFNro/3H32bGeQH6Pd6avq
         k5t0LDjKDbl4NGP7YZo6KzQ36RQDHWt2e6viRUP7pVNM/7WiiwUm4aNu7uwSqtVP753n
         2eEnhoq/6wBgVz7cNKaXby0mzMVlwDVN1TzaaZxjHR6p7dfWRbP7WBY5qKZuAlb/39eY
         OvFLXbG7fRFgv60nLZZZoQcZmPTW+IAYPNXz8aBlzI0R5DXDV3zFlZUqpFFfP4xRp7F6
         frCw==
X-Forwarded-Encrypted: i=1; AJvYcCW7Q4YpzjpUQWe1szMViqsFmMVIH4ZxINAs0xXQdf/oQlHX9cc5mrVZbWw0pkP3ALScQHtP7RIusMcmTio=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+J6fCIUvRUis7m2BivF7k3zDXzwa/xWOngni8Rk8mFjzOcnsM
	RE6CJFNY/SudIttnn4WVr98e2yhla9SDid7Ny/IBEmiE5tbuEE+OdhF4VRKpg8n6Xc2xH8c5vFt
	qcnYp0dscaJNAtcLaeA==
X-Google-Smtp-Source: AGHT+IGdYLsMwQu7IW6P9IMv+n1Ga2zIS4ZW4YRMrMw3h6aVj+LGhXmv8UdaVn1QueN1sB3azN/HLRdoRa7dYS4=
X-Received: from wrxf7.prod.google.com ([2002:a05:6000:1287:b0:429:de3f:827d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f87:0:b0:425:8bc2:9c43 with SMTP id ffacd0b85a97d-42b2dc12867mr7026361f8f.1.1762782147990;
 Mon, 10 Nov 2025 05:42:27 -0800 (PST)
Date: Mon, 10 Nov 2025 13:42:27 +0000
In-Reply-To: <CANiq72msN1B8c8QFuH2VK40xXY3=uGiGL=YgAo68o92LTO=kLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-19-ojeda@kernel.org>
 <aRHRYbHIfxMQ77eh@google.com> <CANiq72msN1B8c8QFuH2VK40xXY3=uGiGL=YgAo68o92LTO=kLw@mail.gmail.com>
Message-ID: <aRHrw2p2YX5TyDYq@google.com>
Subject: Re: [PATCH 18/18] rust: syn: enable support in kbuild
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 02:38:58PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 12:49=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > This change seems unrelated?
>=20
> It is needed to actually use them in proc macros, e.g. to build the
> new `pin-init`. We could move it to that patch series, but then it
> means it is harder to use this series (e.g. someone was waiting to
> port other macros).
>=20
> I can put it in a final patch or perhaps just mention it in the log,
> similar to the `quote` one.

With that mentioned in the commit message:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

