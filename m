Return-Path: <linux-kbuild+bounces-8819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08047B5681F
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Sep 2025 13:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F97189E0C8
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Sep 2025 11:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44AC1E5B9E;
	Sun, 14 Sep 2025 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxC8xq/7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845DB1D54D8;
	Sun, 14 Sep 2025 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850503; cv=none; b=OpJhznkV9usGnvZvS673u6kTGWypnPkUcShwB84dG+oUfb9a6HgqkP8LX/hRd+KL/QmK7yh09bztLnLjCO5dWkOqjY9vigYP/ZewQLOfqMgdoIIfmTFDou1Zx5bwoh5R4bj3FJxUslIR+YJRQ5z5EmVJ1Meg8Y4TvuYggO3oD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850503; c=relaxed/simple;
	bh=tUZL+0BtcfH9b06XoJzrl+8WStX11Tdi7rsFZKkGtQs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BmrET0d8PPAapLk5y7gMalUbrNdrQzgivM8MeYtebazlIVA+tUaIBUaoFxG4/YdA++Xe5mLMNKi22BlA524Do6VRc92soowOsFl7/6ncDAUw4xmb+7b1StAAbJhvHv2oVVDZt+OrXj0oS6gtQQdWc2UM9ixl9acYJ+icV2D1ej8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxC8xq/7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5461FC4CEF0;
	Sun, 14 Sep 2025 11:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757850503;
	bh=tUZL+0BtcfH9b06XoJzrl+8WStX11Tdi7rsFZKkGtQs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GxC8xq/7jO+uZ3u9s8OZZtITC9F0571hDHVJVyAkvwozKxcTo936ZzqWFwKcIodXM
	 J7xnJ+P+UJcOetMiYMcCa2z5Oh7x/M06L22+a1ZJifIQqZSruqvlIzuBkCkb5vihiF
	 zPxD2DZW0cxTMf4R73lzbbwh7EsB+DrVlp1cTAQnJTSjN6mOt74k39ul6IY9oJQjjq
	 F24Bw8DJGaqUwwFyusqwaIakboTkEwfKWDRjQgcyNipwFb5KOPX+H2Z1So1DBXrfMW
	 rA7ChMcujPw5/k1xGeP0UEqn8nXiZYCaf5X4YHbugcHp2sn9yaWHWLsWARXcm4ZFr4
	 eg7ztrKEbmhQQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev,
 masahiroy@kernel.org, aliceryhl@google.com,
 thomas.weissschuh@linutronix.de, tamird@gmail.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org
Subject: Re: [PATCH] rust: add `rustcheck` make target for check-only builds
In-Reply-To: <CANiq72=zP0TLCjM+ySOu3Zbn_UnU8ntqb2MH58cN60O0Voe+hA@mail.gmail.com>
References: <-ebVaoKp9tTjZGmdSRi8rrH1o7SgmGyyzk-g2ALSCBKPJP44z7dSPCplhwKt-sibwLwqP7IPEml6qCkSpJhd8g==@protonmail.internalid>
 <20250913100847.9234-1-work@onurozkan.dev> <87bjnei6tn.fsf@kernel.org>
 <3bzW7kdvPf7hqSGi-0XYj6_lzi-eNXlOoy2luis1EVghl8OV-IHyZbm4KRf06z73T3sNjPeYDoYbeHXijRAFZg==@protonmail.internalid>
 <CANiq72=zP0TLCjM+ySOu3Zbn_UnU8ntqb2MH58cN60O0Voe+hA@mail.gmail.com>
Date: Sun, 14 Sep 2025 13:48:11 +0200
Message-ID: <87tt15gsqs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Sat, Sep 13, 2025 at 7:46=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> I think this is a good idea! However, it looks like this target only
>> checks rust code that live in rust/. Can we also check code that lives
>> elsewhere, like drivers?
>
> That is more involved, and I don't plan to add features to the current
> system, sorry.

I assume you are referring to the upcoming rust build system changes. Any
idea when these will land? Will it be possible to implement a check
feature when the changes land?

Best regards,
Andreas Hindborg




