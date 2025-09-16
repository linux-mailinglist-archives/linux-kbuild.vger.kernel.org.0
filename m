Return-Path: <linux-kbuild+bounces-8831-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7AB595BE
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 14:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E1A322800
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 12:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F54C2D24B3;
	Tue, 16 Sep 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Utf/5/ks"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward500a.mail.yandex.net (forward500a.mail.yandex.net [178.154.239.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D572C3272;
	Tue, 16 Sep 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758024384; cv=none; b=PrPYFNGac1+rjqdqi05aL/h+6qlEsqCrjN2BXhhNgfhTZnyXAzVSecKobXP3RBmIWT9BcnqKebhgEGbFOEncjWVDz4BicV1G1Bx7czm8O9+xXC/GuUGLyMk980Sn7774f7tggChcidDQKo8NEzaKNbNEQ2wWTRVFy4t6GUJMKUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758024384; c=relaxed/simple;
	bh=aV81kExVrMjIzYolLKVaKcqJpjPt7J0SUF+mvWDVe0g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EhCLwlPxMKRKebrQyeGcL8dfVbK9iUTktdDW5B/kgoY3kLbnywCyZI+U+fuXeGE9wsxu+PQhsK8cKfF/glHaiYDM609Six9CzUnSrHlAKA1n9FubeBUyQwvZEbySNeagvbNE1f0MkHs97C7RhdNrfRj/3Ggj5paoUxchGdUufN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Utf/5/ks; arc=none smtp.client-ip=178.154.239.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1d:6148:0:640:ada2:0])
	by forward500a.mail.yandex.net (Yandex) with ESMTPS id BFBED81BD9;
	Tue, 16 Sep 2025 15:06:12 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 76PUUpCLo0U0-uhFlNXOP;
	Tue, 16 Sep 2025 15:06:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1758024371;
	bh=fGrVfPGr5w2/y6PdLHlBhzXjj9KC99u7DtBE5Ei4Fxk=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=Utf/5/ksFeV3Um+mYQUc7YGcyN3HjYuszJRXk3ONQQQ3Nnr5iQkegNu/G5AY8Kp7P
	 roC8/d9dKSi3aOIjXi9YaitvGyHJszwBWPvsXUrofmUx5NRk07UsBlWt4GRVbE2TcJ
	 iH73SI3HICJuZmOPT1vxujlP18Z6td31v/+Q9UPI=
Authentication-Results: mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 16 Sep 2025 15:06:07 +0300
From: Onur <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev,
 masahiroy@kernel.org, aliceryhl@google.com,
 thomas.weissschuh@linutronix.de, tamird@gmail.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v2 0/1] rust: add `rustcheck` make target for check-only
 builds
Message-ID: <20250916150607.1133894d@nimda.home>
In-Reply-To: <20250915115311.3025-1-work@onurozkan.dev>
References: <20250915115311.3025-1-work@onurozkan.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Sep 2025 14:53:10 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> Changes in v2:
>   - Couple of indentation fixes in rust/Makefile.
>=20
> Onur =C3=96zkan (1):
>   rust: add `rustcheck` make target for check-only builds
>=20
>  Makefile      |  7 +++++
>  rust/Makefile | 73
> +++++++++++++++++++++++++++++++++++++++++++++++++++ 2 files changed,
> 80 insertions(+)
>=20

Should we document this target on [0]? I think it will be used quite
frequently by Rust developers on the kernel once we land it, so I
think it's worth documenting. I can include a patch for that if others
would agree.

[0]: https://docs.kernel.org/rust/quick-start.html

Regards,
Onur

