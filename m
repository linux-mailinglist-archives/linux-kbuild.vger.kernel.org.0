Return-Path: <linux-kbuild+bounces-2999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB17953501
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 16:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A16AD1C251FC
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 14:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE38F19DFA4;
	Thu, 15 Aug 2024 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="OkM5mQLH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3463D5;
	Thu, 15 Aug 2024 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723732369; cv=none; b=eM6QS9SywpsHrNt2P3iTHMpieyd/6Hx0ucxGQbC0JYJar1LESMNlCJRMY3KDc6/Y0tY/A3cK1zP31DNTNffqgETL3xH0H+yWzig/2lrDUPoSIQINcBK7uIkzfsnCbc1NmQmenbVfNTLGi2noMp/Ohp734Tn61gllQFzP6Ki7Rh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723732369; c=relaxed/simple;
	bh=wkUzvqCtu+wpi3BEp07oiljISHO9vt/TcVXV6KAxcuM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cEiqO5nQlAIQG6Ayc0xYvTndRO6iaaRBVlNiLFgQyr9/NYKFd1C0t/p+EUT0PeqYLlUv64Y1a9nz8/QGcml4xJ7hCVmxxZyPcl0uezzgP2jBvBw8bm6a3uilPoki1xWL1d3idL+Q17wb6IDHX6xgx4m1aONhbHaP/2D6UoAH3gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=OkM5mQLH; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723732365; x=1723991565;
	bh=5hEzlNomb4W1zQMDLk7SwBhBL9j2hyKIONtSLeO3jn0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OkM5mQLHxfAnbTFITUMhTjg1NsfJTsEewYJihxT/qaMFCD4dAeY/PGKvswvv2/jLz
	 8lRKk2DmiKbKVDR5Nh+V7WMW4wGpCnZ4LOkBKeW53l5GIJ4deIAaEmfYeTs+nyLKO3
	 Hxqux2tg/LHRuky1WG2ruF0okilkMqcX1QUau4u5oesYjrAa5Ctx+uEcCgLazzbfG/
	 W6SRazzpS/1B7Gf5ImyGQkd3as0Pvr2rXsThhwIy5L/J1y9c3hrM97sioHSJa4641k
	 PvFlnF1Mwm2eLPnjYE+EigRyXFMovWqlKJ86/nxZFisPfZF0wEY1CNYJmPO9S/hIvk
	 3hbe9VrPlV/hg==
Date: Thu, 15 Aug 2024 14:32:40 +0000
To: Andreas Hindborg <nmi@metaspace.dk>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, =?utf-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: rust: split up helpers.c
Message-ID: <65f8a922-c0dc-4b7e-b701-5f8fd84b5b81@proton.me>
In-Reply-To: <20240815103016.2771842-1-nmi@metaspace.dk>
References: <20240815103016.2771842-1-nmi@metaspace.dk>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ece9b106659f7cf1b14b91ef5b177dec132cba8b
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15.08.24 12:30, Andreas Hindborg wrote:
> From: Andreas Hindborg <a.hindborg@samsung.com>
>=20
> This patch splits up the rust helpers C file. When rebasing patch sets on
> upstream linux, merge conflicts in helpers.c is common and time consuming
> [1]. Thus, split the file so that each kernel component can live in a
> separate file.
>=20
> This patch lists helper files explicitly and thus conflicts in the file
> list is still likely. However, they should be more simple to resolve than
> the conflicts usually seen in helpers.c.
>=20
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/=
topic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>

Looks good with `--color-moved`.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

I got one comment suggestion below, but feel free to take it without.

> ---
>=20
> Changes since v2 [2]:
> - Rebase on 6.11-rc3.
> - Use `cpp` instead of Makefile scripting to concatenate files.
>=20
> Link:
> https://lore.kernel.org/rust-for-linux/20240507210818.672517-1-ojeda@kern=
el.org/ [2]
> ---
>  rust/Makefile               |   6 +-
>  rust/helpers.c              | 239 ------------------------------------
>  rust/helpers/README.md      |  17 +++
>  rust/helpers/blk.c          |  16 +++
>  rust/helpers/bug.c          |   9 ++
>  rust/helpers/build_assert.c |  25 ++++
>  rust/helpers/build_bug.c    |  10 ++
>  rust/helpers/err.c          |  22 ++++
>  rust/helpers/helpers.c      |  18 +++
>  rust/helpers/kunit.c        |  10 ++
>  rust/helpers/mutex.c        |  10 ++
>  rust/helpers/page.c         |  24 ++++
>  rust/helpers/refcount.c     |  22 ++++
>  rust/helpers/signal.c       |  10 ++
>  rust/helpers/slab.c         |  10 ++
>  rust/helpers/spinlock.c     |  27 ++++
>  rust/helpers/task.c         |  22 ++++
>  rust/helpers/uaccess.c      |  17 +++
>  rust/helpers/wait.c         |  10 ++
>  rust/helpers/workqueue.c    |  16 +++
>  20 files changed, 298 insertions(+), 242 deletions(-)
>  delete mode 100644 rust/helpers.c
>  create mode 100644 rust/helpers/README.md
>  create mode 100644 rust/helpers/blk.c
>  create mode 100644 rust/helpers/bug.c
>  create mode 100644 rust/helpers/build_assert.c
>  create mode 100644 rust/helpers/build_bug.c
>  create mode 100644 rust/helpers/err.c
>  create mode 100644 rust/helpers/helpers.c
>  create mode 100644 rust/helpers/kunit.c
>  create mode 100644 rust/helpers/mutex.c
>  create mode 100644 rust/helpers/page.c
>  create mode 100644 rust/helpers/refcount.c
>  create mode 100644 rust/helpers/signal.c
>  create mode 100644 rust/helpers/slab.c
>  create mode 100644 rust/helpers/spinlock.c
>  create mode 100644 rust/helpers/task.c
>  create mode 100644 rust/helpers/uaccess.c
>  create mode 100644 rust/helpers/wait.c
>  create mode 100644 rust/helpers/workqueue.c

[...]

> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> new file mode 100644
> index 000000000000..74dd4275c233
> --- /dev/null
> +++ b/rust/helpers/helpers.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +

Should there be a comment here noting that these includes are sorted
alphabetically? Since then (most) conflicts in this file can simply be
solved by concatenating all hunks and doing `:'<,'>!sort | uniq`?

---
Cheers,
Benno

> +#include "blk.c"
> +#include "bug.c"
> +#include "build_assert.c"
> +#include "build_bug.c"
> +#include "err.c"
> +#include "kunit.c"
> +#include "mutex.c"
> +#include "page.c"
> +#include "refcount.c"
> +#include "signal.c"
> +#include "slab.c"
> +#include "spinlock.c"
> +#include "task.c"
> +#include "uaccess.c"
> +#include "wait.c"
> +#include "workqueue.c"


