Return-Path: <linux-kbuild+bounces-7456-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D8AD56F9
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 15:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09D1317C772
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 13:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B35B28935F;
	Wed, 11 Jun 2025 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCpfIroU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3BD286D45;
	Wed, 11 Jun 2025 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648542; cv=none; b=B0DrGeZztynpEETvXyejm6c5N2Vov4RfQmJhQPFzeIaxDXPA34n1XpEx5oyGaHFeKnCYl/6rZ166/XYmTw1xEQZpdVKuKnTYCE3S6tUsUMmGC+9FZ340SvFa5/uUp8jhZ40x2eGIazE7YpmpvQDddCtNb0MVxqd8VUknj3nJM0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648542; c=relaxed/simple;
	bh=RClr3x0WNuSzf2ZubOLtWGjnZaITNyNPnDjjvfXlAiE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mnZWEN6Xq/QfdDYPBqRp1fNGp7Wzb844xl7wfe6EE0yGwHBF/c8JgdLDSV6pcvbxKlCcbmhOdrEVuP6b6+GeTg3+f5LiXbRxKdQ+R46wZWpMnmWNIG15g842cVG33S/+k+h4zx/d+lQUmJ/gw8ZSHPHg+NzNNmhXyUH0FiXXsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCpfIroU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75377C4CEEE;
	Wed, 11 Jun 2025 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648541;
	bh=RClr3x0WNuSzf2ZubOLtWGjnZaITNyNPnDjjvfXlAiE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hCpfIroUSDomqKWzgRniCxFLoGglynZVDJ50MwjJxbeGhOkqqUQWQcJn5UowuQ07E
	 8nkTyV0TuzRJDSAQTpjmgpUAjQKFw/320QBultivGDJP52FKuNElnUbV9DRvjMITyH
	 Q1FWnHRgHsxODGZqXgU3ihX6fKMz/6USBfa2srVfnEc51jYdtCAlDGmBHxOn1axdpM
	 wzmp5KIovoiE1jXglpwbuN0cPN8eYkoSVImYg5ITC25ae+BcnxnYomdSdF24iAnFqX
	 9nkELSuKEZXuWbGnr5pUQmJORqabdR6FtbguEE9HPfIFt3+jI+vZvmeN2rMzBVXnk5
	 4Qw/WXGeXLXIA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Benno Lossin" <lossin@kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Nicolas Schier" <nicolas.schier@linux.dev>,  "Trevor Gross"
 <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v12 2/3] rust: add parameter support to the `module!` macro
In-Reply-To: <CANiq72kJtA3L3ja9ff7GuNUD8YW=Zd9bMycjMupgSaaaU_uufw@mail.gmail.com>
 (Miguel
	Ojeda's message of "Wed, 11 Jun 2025 14:36:01 +0200")
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
	<20250506-module-params-v3-v12-2-c04d80c8a2b1@kernel.org>
	<D9PW1NI2S6FV.8LA53J87VCML@kernel.org> <87plfazi13.fsf@kernel.org>
	<87wm9ixy8n.fsf@kernel.org>
	<lCbs63S4-QAb6tcnRuG7iQ6JIDnB5VbSqfCplFN7QmvJBXURj2IWSiowJPLH-OfOlWFITmU9XMqBE66e_07hYQ==@protonmail.internalid>
	<CANiq72kJtA3L3ja9ff7GuNUD8YW=Zd9bMycjMupgSaaaU_uufw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 11 Jun 2025 15:28:46 +0200
Message-ID: <87o6uuxv8x.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Jun 11, 2025 at 2:24=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> So either we need to `#[allow(missing_docs)]` or just add the line back.=
 What do you prefer?
>
> Do you mean if you remove the `concat!` too, right?

Yes, all of it.

>
> It would need to be `expect`, but I think even an
> `expect(missing_docs)` is not really useful vs. having some docs.
>
> But another question is: if the docs are not useful, should an item be
> hidden to begin with?

That is probably the best solution, yes.

> (By the way, that one is `rustc`, not Clippy)

Right.


Best regards,
Andreas Hindborg



