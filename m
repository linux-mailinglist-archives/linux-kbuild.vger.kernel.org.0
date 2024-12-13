Return-Path: <linux-kbuild+bounces-5118-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8E39F0C2E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 13:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7F00286614
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45171DF991;
	Fri, 13 Dec 2024 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7GFwEG2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856991DF728;
	Fri, 13 Dec 2024 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734092692; cv=none; b=g4/6FmAiyiniPO4aVmeNvGNJlaT5lpWKalNyJnK63CBzw3gGUGTYrC71zl01587BfhT7NnJ7vvmODrzCEWI11VQn10o17T4wDH5Q6KL8MOfqWUv8Fz4ZSyrGFY5rjbEsjN9cvDlhPGwBZqkVRetCK2IqTfmTyQVbHcP98fChZbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734092692; c=relaxed/simple;
	bh=rBm6VmK5092sy9qhzdeHWbMEyUBtzplqF0duZjHqUnE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MgcIqp4IRzk7TjbOWBLLkeM56iHLIfkSQu+4Fbn2YMsALTx44cXtC/wlE9ioUtLhoqIODo03v6zU1oDdfquyX+FTdTwcIC2aUhqw/7HCZTyTeNunyooFVluohYnmlKkZlPtyNPNYzDaJcRA+9A7W1bOgiMkw8Y77PxoegIKnL1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7GFwEG2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E733C4CED6;
	Fri, 13 Dec 2024 12:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734092692;
	bh=rBm6VmK5092sy9qhzdeHWbMEyUBtzplqF0duZjHqUnE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=G7GFwEG24h5J3/UaCEZwsDFXOtBkhH+nOtCSRtfB94p0RRA2P4ifouu6dIZJ/tzkk
	 hXCVVAE7bzCo7/SWaS0qWPz+TniK6CmidPPBwXyPNF7TBri80cmTEDJqj662zX7uUW
	 xdliXFT32flfsCHYYcopBs1cIvbToPUDnUDraVSzkWKnmkXowvjPScV6FuPo5Jr5cV
	 0H7qM/NO9I1ImVnXs0DErVH8pR5V7TgbGdCf7vFcf1sT9JQUP5vjiAO1es0a6Ps2PW
	 ubg7CxYk8DrKvNg3Me8E7cMSXrJtfOFHYdiZLxUqNpNo8WqrjUXE3VOWP9gz+XZYpI
	 dR5xVJ1RWbauA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <2024121324-overdue-giggly-bdb8@gregkh> (Greg KH's message of
	"Fri, 13 Dec 2024 12:43:40 +0100")
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
	<4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
	<2024121324-overdue-giggly-bdb8@gregkh>
Date: Fri, 13 Dec 2024 13:24:42 +0100
Message-ID: <87frmrepo5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Greg KH" <gregkh@linuxfoundation.org> writes:

> On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
>> This series extends the `module!` macro with support module parameters.
>
> Eeek, why?
>
> Module parameters are from the 1990's, back when we had no idea what we
> were doing and thought that a simple "one variable for a driver that
> controls multiple devices" was somehow a valid solution :)
>
> Please only really add module parameters if you can prove that you
> actually need a module parameter.

I really need module parameters to make rust null block feature
compatible with C null block.

Let's not block interfacing parts of the kernel because we decided that
the way we (well not me, I was not around) did things in the 80's was
less than stellar. I mean, we would get nowhere.


Best regards,
Andreas Hindborg



