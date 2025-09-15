Return-Path: <linux-kbuild+bounces-8821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71868B5718A
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 09:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 258A93AB3B9
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 07:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F192D1F64;
	Mon, 15 Sep 2025 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="fYvPgjPd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06E1F0E29;
	Mon, 15 Sep 2025 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921568; cv=none; b=Sd1Kfo2QBSvniwLGfWH70NPP6gnBdKtdy2au9zF5aaAFkG2eRGKbIEaohMggnwCuvHWBmBBZmPLZAYso7N608GTLr5VFDJlLtJyi0CrqK/SGy6D733uPryewSKc8nL+aXPv7ZwXgLvlGMGKj1APT6bv5wgrWpHMsaO+DvJmCRsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921568; c=relaxed/simple;
	bh=yRUQqd7L/C0ZEHwXsB76iJRkPJ9cD4gFhMNAyDhkkgE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MLTpRgj8uDOzeKUtVQKbFIM4D4yOAAwvp1LYcjw79i8VGGNCDjdCAWSfZCyHQ8yDL6s9cnusOfsv6mp+cQkfkrejBJyFTpGktyBGntWh5LOR7TWWWvWGyeveBrotSpzGiYsrlNgTPYmpkPO9y5jsFen/ZB30fFOAnQrbs9fsvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=fYvPgjPd; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:418:0:640:bb5:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 87C3180BFF;
	Mon, 15 Sep 2025 10:32:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id cWJaRfgM1qM0-t207wbne;
	Mon, 15 Sep 2025 10:32:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1757921563;
	bh=yRUQqd7L/C0ZEHwXsB76iJRkPJ9cD4gFhMNAyDhkkgE=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=fYvPgjPd6fpXQNoR+EVjg6mOCa1fKKKs3QKTXk7oEAltC4I24Sq1Mbvh6Vs2gSR+5
	 t9RMGleEU5WQOuvViH+Uqb6WFa3HoGpaWJmLZalEv3KwsnmaR21pwH+HXGX2xqceez
	 LNqJzcYsER5Tx01Lk9goTT5Bf7Uw4d6LPThCweag=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 15 Sep 2025 10:32:38 +0300
From: Onur <work@onurozkan.dev>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, nathan@kernel.org,
 nicolas.schier@linux.dev, masahiroy@kernel.org, aliceryhl@google.com,
 thomas.weissschuh@linutronix.de, tamird@gmail.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org
Subject: Re: [PATCH] rust: add `rustcheck` make target for check-only builds
Message-ID: <20250915103238.3263445e@nimda.home>
In-Reply-To: <87bjnei6tn.fsf@kernel.org>
References: <-ebVaoKp9tTjZGmdSRi8rrH1o7SgmGyyzk-g2ALSCBKPJP44z7dSPCplhwKt-sibwLwqP7IPEml6qCkSpJhd8g==@protonmail.internalid>
	<20250913100847.9234-1-work@onurozkan.dev>
	<87bjnei6tn.fsf@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 13 Sep 2025 19:46:28 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Onur =C3=96zkan <work@onurozkan.dev> writes:
>=20
> > Adds a new `rustcheck` make target to run a check-only build
> > similar to `cargo check`. This allows us to verify that the Rust
> > sources can build without building/linking final artifacts,
> > which speeds up the iteration (a lot) during development.
> >
> > The target supports the same flags as other Rust build rules, so
> > it can also be used with `CLIPPY=3D1` (e.g., `make LLVM=3D1 rustcheck
> > CLIPPY=3D1) to run Clippy in a faster way.
> >
> > Also, unlike `make LLVM=3D1`, it doesn't compile large amounts of C
> > code (on a fresh checkout) when the goal is only to check that
> > Rust builds are not broken after some changes.
> >
>=20
> I think this is a good idea! However, it looks like this target only
> checks rust code that live in rust/. Can we also check code that lives
> elsewhere, like drivers?
>=20

My work depends on the existing build system and that system doesn't
allow me to do that (yet).

Regards,
Onur

>=20
> Best regards,
> Andreas Hindborg
>=20
>=20


