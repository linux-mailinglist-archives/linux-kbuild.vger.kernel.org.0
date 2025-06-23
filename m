Return-Path: <linux-kbuild+bounces-7618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE6FAE45DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 16:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E4EB3BFA9A
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 13:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25612253340;
	Mon, 23 Jun 2025 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7FxlE2m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F811957FF;
	Mon, 23 Jun 2025 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686944; cv=none; b=NLDEul7fagYw2fzrk+rYh4DV8+Pr+KUDIa5U1I3uylaCUlMVkk+kIL3uw8plbIbgIAKBr2REE7lJ6Uz29Hx/94U85o8kKaHsyT/tBkJayTX/iUPywD4mR0Nz2f5SPxUkCT5H40PmgLhxoU30WTdfcq15F4Lq8TkIA54nVr24Lqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686944; c=relaxed/simple;
	bh=/Ag7v6ZQya0VRiBpyA8Kql7m+wSMLKuyVmJ/dONXjk0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Rz3saIYFB+ZYLq+0tk+dNR3btC2jdPe+0Bk9eIfbOK+JxPWq5K01/Dht3JM3+uVevQlujkLBJkQcEGdwwpwVvYa5+IFjc7d1oBdJr4TxsDEP0EQYQxKg13QoUEDxtWGmpxmVspZevnaamWWin3mqNc9UEdpGmegw9gpbTHAzdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7FxlE2m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BEDC4CEEA;
	Mon, 23 Jun 2025 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750686943;
	bh=/Ag7v6ZQya0VRiBpyA8Kql7m+wSMLKuyVmJ/dONXjk0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=a7FxlE2m6dWEXl7rt1U2aYfWkWlTwLI8NBLXC2n7o0SJ+xDRD4qW8s45fryqENIE7
	 l1Ja7J4V5t5yI25UFpZvujNYCN49P/h/xRUgLW6/gY0p7D9d6+b8CeV/JEEAOGd+Cw
	 HwTNuuTLNOlztLTUqeYxnDOfdDwkjjIdk4F+689dFI52lJ1bPKv79DstmE1P1QT1eS
	 vvhhtVrdgQYph8EASW3Rkmk/LiDICnYpk5P+TOWY8t661kV7tGhvKjhRJtzr7OSI9J
	 Paqp8TdJmnFYrZJAHrBem8KY7SmzLtww+o8W6F9f9ZUWciQuKogif9JYza+AhlC6rs
	 kzV4/msZzJGmw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 15:55:36 +0200
Message-Id: <DATYQ3ZIFGZO.1CLIKLTTO2YM3@kernel.org>
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, "Trevor Gross" <tmgross@umich.edu>, "Adam
 Bratschi-Kaye" <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
 <COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid> <DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org> <smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid> <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org> <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <CANiq72nV3QzpRZTyDTv7Qx-c83jeayUY3nnvhpbtOYXf47EgJA@mail.gmail.com>
In-Reply-To: <CANiq72nV3QzpRZTyDTv7Qx-c83jeayUY3nnvhpbtOYXf47EgJA@mail.gmail.com>

On Mon Jun 23, 2025 at 2:37 PM CEST, Miguel Ojeda wrote:
> On Mon, Jun 23, 2025 at 1:48=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>>
>> Another way would be to use a `Once`-like type (does that exist on the C
>> side?) so a type that can be initialized once and then never changes.
>
> There are `DO_ONCE{,_SLEEPABLE,_LITE}`.

Thanks for the pointer, it is pretty much exactly what the `Once` type
in Rust is.

It's not exactly what I'm thinking of in this case, but since it is
implemented with static key, maybe we can do something similar with a
static key? So switch the return value of the `ModuleParamAccess::read`
function depending on weather the module parameters have been written
and while they haven't just return a dummy value and WARN.

Thoughts @Andreas?

---
Cheers,
Benno

