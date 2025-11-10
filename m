Return-Path: <linux-kbuild+bounces-9527-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 281EBC483D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 18:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C78CA3BEC19
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 17:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6902928B7DB;
	Mon, 10 Nov 2025 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="othVWEOM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DDE274659;
	Mon, 10 Nov 2025 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762794295; cv=none; b=VKDvCqr5qCddFhr7kcbioqlHttvQPeo1X70tcsYEonDQw2StE0gTLfgSe7Kz6TutJlS5kQM7A+Nd1JJfh+PXa3uXi0S2efH89FHqiHK2Pj1X2D1x3O8ErLnoSRKr8XIbYUyY8Qoxk998mG5ocT0D6936p3wQoRjAWwl5/9+oVII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762794295; c=relaxed/simple;
	bh=vDbEes5fnXSUpfBVBMEFezccxAYID8VwKrFPQtJa5Ps=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=uAvu3v/IIkr630GJLIGDBQUdNO/2MV9jdNZo+vKIZGf2XdoTJFO5BRFsmVS4GWbfCXaEbwwipRDdUgAibm2x5Nf0X2F4277/eSCmxEYWAeWd67eff+m2q76x+zG8aFTeVBCx2sW0UtUQvEzwEWhMODSZ+rWzQmEmBL/ZsK5rhU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=othVWEOM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15521C16AAE;
	Mon, 10 Nov 2025 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762794294;
	bh=vDbEes5fnXSUpfBVBMEFezccxAYID8VwKrFPQtJa5Ps=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=othVWEOMeElHMVGqML27gIxzOsNysNlEkntnu4yuonoPzOBzDE+LLsmOhaYxha/kf
	 k2t0Pmzuwmar1hY8fcSaK3+ywpp/Pyzu9d7oa7Fpsvsbn/4EWXtpMQ9fhwOgU/S7dW
	 GDcBhuWSseg36wnTtZ5mR6aEKMxWEhN6p3wK+efNRNTo0X+t/G7djTYATv3115MwjS
	 HUeVbs6k1vvSLm2w952UQfcwhYS+D+UehC4/GIpeYOpXdZAYK6FzdzBeiB+LYFxwGn
	 F6+/HeWlhII44tEqNQdcI0vlmtVmZJReH231Oj/urLr8CJYu4IVtbLEE96bZXCMPcj
	 DHmY8LvjLo7Fg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Nov 2025 18:04:48 +0100
Message-Id: <DE56F8M2XC29.2U6TIDNJ0U6DZ@kernel.org>
Subject: Re: [PATCH 00/18] `syn` support
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nicolas@fjasle.eu>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <patches@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20251110095025.1475896-1-ojeda@kernel.org>
 <874ir1zxng.fsf@trenco.lwn.net>
 <CANiq72==SimzoQARA5uprXs0-iKnBNS+EiKCz1L9V3K6LO1ftw@mail.gmail.com>
In-Reply-To: <CANiq72==SimzoQARA5uprXs0-iKnBNS+EiKCz1L9V3K6LO1ftw@mail.gmail.com>

On Mon Nov 10, 2025 at 5:27 PM CET, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 4:59=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> =
wrote:
>>
>> Just in case I'm not the only ignorant person who didn't immediately
>> know what "syn" is and why we might want 57,000 lines of it in the
>> kernel... :)
>
> Thanks -- I will add something like that.
>
> It has been such a long and recurrent topic in our discussions that I
> guess I was writing from inside the Rust for Linux's bubble.
>
> Just to give a bit more context, it is the most downloaded Rust crate
> (according to crates.io). It (or something like it) is essentially a
> necessity for writing complex macros without too much pain.

It also is used by the Rust compiler itself for some proc-macros of
their own.

Cheers,
Benno

