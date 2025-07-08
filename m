Return-Path: <linux-kbuild+bounces-7935-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E661EAFCB90
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 15:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 794CA1C20897
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 13:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6406C2DF3C6;
	Tue,  8 Jul 2025 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCTT12mR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C592DECC4;
	Tue,  8 Jul 2025 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980180; cv=none; b=smoam1mrtMws+xfni5vg9b7ogCgvyDwMqUuR7D+s0u2Lyzx6uvqmkHt4ECEbkWx5ugaSGp+OaWjcmvpNFJbhtd0RL6r9I/fsIGCeEcr2ztVaKDQAkTtQ37ZfgRgFgbS/0Hxnjqf40JMUhM1yA0znq3+/N1Y202gClsdsBmudSwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980180; c=relaxed/simple;
	bh=em6CDDok4e4eRQnEnKOyatrW3DlF+63ZOcjwUW/BfdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m32BIvvCoCWRJ8CZCx6LSGflPwyhTWkpPzEpKsE37fh0Uj5LyeHIjD5y/5Vc2YfxqyG+njZFCLByyrw6Ns5JiGdujnjKIGv2uA8gIpHjox4TnVJpVrdZLauE8eE6mIZJBgmKG0M+/dvBNbPvczJjmL6H3edXRD9ZCLi/ELMemHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCTT12mR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702BBC4CEED;
	Tue,  8 Jul 2025 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751980179;
	bh=em6CDDok4e4eRQnEnKOyatrW3DlF+63ZOcjwUW/BfdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qCTT12mR4V/PgGwYFoDC76R2337Y9C3q6GcSmBVhTjpRpQrumQOy5OEY1UHxRuoBy
	 adfkAYjFztx6o3cNAR6nczyTOSz934aIuh/S01UBIZZiUqDsL6ed8Yt6ccRPDCakw/
	 Bu721CHtOsPOye2U88XxTuAVhhMFuKoF4DYJYxQd0CrslxOZyiSKWcofklnamKzyeB
	 5Ti6EQR4925ifjKxZVPknOlKCPz+Am90mNH9KPwYWvKtOSj8VlvBJoGeFqdHwJfe6K
	 CsPja0ASF7R0Xz5Z6oExcq1e284ER1nWEQMiHEDyeDovZue+zLrjn7hxYvwEF19Q6W
	 wy8C/jYttLkKg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,  "Benno
 Lossin" <lossin@kernel.org>,  "Nicolas Schier" <nicolas.schier@linux.dev>,
  "Trevor Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye"
 <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,  "Fiona
 Behrens" <me@kloenk.dev>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v15 0/7] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <CANiq72k5mU7cACFh8TZC1+NfUQpdrZBToZ-jd75DfCNTfMU1fA@mail.gmail.com>
 (Miguel
	Ojeda's message of "Mon, 07 Jul 2025 16:05:56 +0200")
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
	<1vsVHgS-gcJkvff9ZHVrTNATc83NdHhjpU_wmZI0SBLEGyRqIWQ6abSeg5mirXiji2lnuqJorzjD2ow05c9naA==@protonmail.internalid>
	<CANiq72k5mU7cACFh8TZC1+NfUQpdrZBToZ-jd75DfCNTfMU1fA@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 08 Jul 2025 15:09:30 +0200
Message-ID: <87pleaomlx.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Jul 7, 2025 at 3:31=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Based on code by Adam Bratschi-Kaye lifted from the original `rust` bran=
ch [1].
>
> I would suggest adding this sort of note to the commit messages,
> especially since the commits have no Co-developed-by/Link tags
> otherwise.
>
> From our discussion in Zulip: the code itself is older than that the
> merge above. I think you wanted an example sentence for this --
> something simple could be e.g.
>
>     Based on the original module parameter support by Miguel [1],
> later extended and generalized by Adam for more types [2][3].
> Originally tracked at [4].
>
>     Link: https://github.com/Rust-for-Linux/linux/pull/7 [1]
>     Link: https://github.com/Rust-for-Linux/linux/pull/82 [2]
>     Link: https://github.com/Rust-for-Linux/linux/pull/87 [3]
>     Link: https://github.com/Rust-for-Linux/linux/issues/11 [4]
>
> By the way, I guess you should inherit that issue in the last link :)
> It had some details about things we may or may not want to support
> etc. that I looked up back then. If you prefer that we close it or
> that we create sub-issues, that is fine -- up to you!
>
> Finally, if you end up adding strings, please link to Adam's
> https://github.com/Rust-for-Linux/linux/pull/110.

Thanks, I'll add this!


Best regards,
Andreas Hindborg



