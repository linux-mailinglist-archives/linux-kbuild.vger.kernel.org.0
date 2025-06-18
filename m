Return-Path: <linux-kbuild+bounces-7554-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20956ADF76B
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 22:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9D7B3A3480
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 20:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E99B211706;
	Wed, 18 Jun 2025 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKp6pm53"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6B3085AE;
	Wed, 18 Jun 2025 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750277254; cv=none; b=GJD5XLvB0LZUdw1eRu8G0zYGPJNHT7w8dAtRLch3WCZf5ZG9hTDsOJE1bBlJ4a62RSYBMzgHf/p3qgLpeTOQe6PfFvwEUsuJ+XZK0cnIwGrRVxsyxCgZq9Vuu5edOKsYzt6jjb5NPMeKUNQZgHvlaCL4sibTL9QztyWJgU2K7d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750277254; c=relaxed/simple;
	bh=pe/D3aK7E2KqycjU17InQaljrh/E+TTIlJ8sKTyIbMI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=HIQggiETOTysihqS3vEeEBx6gSiF1gTgFEESa5scbSEhD6vXgGrxgj2qRWoWDDZhTX21AELVvDNeBrLrViUwEVxlvl/ojPqMw5auMZoZVUNh3Yc3cTHOsJ8wDzgRBHU553vcpuY7DCoikVJ7wP9nKb7vuhPHCyzsoDmwO9xWATA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKp6pm53; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726A7C4CEE7;
	Wed, 18 Jun 2025 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750277254;
	bh=pe/D3aK7E2KqycjU17InQaljrh/E+TTIlJ8sKTyIbMI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ZKp6pm53XFydz8fo/Ww3bpLR8CJUP+xQyesOCm5lZwBf7IQRQINhO8cW99zo9tLla
	 462zOgP/LjIWEcsHYQp1pNRorA7PRDrB1Nvnp4kRRLPjIXv9idaUxWOpmPRKGBtnkL
	 Lvo5eQ0SQHOlzRMkYCbP2pELHTFT63mMDfwptNlIMWP6CIvYc9aEcXjO2IB0bVxY1T
	 Z/RJ9sW5KF/d0W8AqiOtfeDokba4M3nSy1Hdf36AjX127tmz36mace6R/skmeTXr2b
	 PqScbi6B2REw4/flDgoT5i6mLyHq76GoGJdpvSUaGhhbpyjbOeIajmkIceShkJeq0c
	 CrW0vZPYZCRTQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 22:07:27 +0200
Message-Id: <DAPXI37UISEF.3CQNJHU2FTY76@kernel.org>
Subject: Re: [PATCH v13 3/6] rust: module: use a reference in
 macros::module::module
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-3-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-3-bc219cd1a3f8@kernel.org>

On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
> When we add parameter support to the module macro, we want to be able to
> pass a reference to `ModuleInfo` to a helper function. That is not possib=
le
> when we move out of the local `modinfo`. So change the function to access
> the local via reference rather than value.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/macros/module.rs | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

