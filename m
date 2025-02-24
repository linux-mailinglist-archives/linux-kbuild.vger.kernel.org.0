Return-Path: <linux-kbuild+bounces-5868-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD3A41DC3
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 12:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFC337AA587
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 11:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFFE25D533;
	Mon, 24 Feb 2025 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZeU5eho"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C64125A2D1;
	Mon, 24 Feb 2025 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740396492; cv=none; b=ip1fRJcOzk/v+mYt3dptHSRwU+N0Qp5sx62RO5AMj5Io6XIEFwRUTkFccTJSb8ua+Dm9mQPeHUa6eTsnjfDB2k1oWDH9dfewWqPhEeuVwa5YkIgqQ5xsBy77RVq4kJW/WV+OJUG6meinlg9eHV7CdBwp7jTnitIg5tehuHcPOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740396492; c=relaxed/simple;
	bh=wMBKiyOZ9vgChPGZe1p/asOkvswkGQx02TjhWX4vQ7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ePlRlrMpBvCm9UcjkMKBCussLFbn3GVVgqZc/LMzu5xF5LjXgO/n1qdOdRlgOBZQw891InKueXdzu+QXZnxwnwGj9LyM0J+z62gJYuc50yuBNA9Zp1L8RlGtwyRUiuOsGPrKzgfefdyxZ4RMXngRJy7TLnoBnEZirggJH3seq+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZeU5eho; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE64C4CED6;
	Mon, 24 Feb 2025 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740396491;
	bh=wMBKiyOZ9vgChPGZe1p/asOkvswkGQx02TjhWX4vQ7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PZeU5eho82z/uA42c7FJtxfs66KEeLlHc6fPoxrbm0doYw+YmSoZ+TNrDp5BnU4rw
	 +OMsSSWyORMlYBGTRxnbhhnJd1XjOpPumvBOtVVkSTobY3w5FH8ZFTP/yeWPP/7CnT
	 Kcuks2WmzEG1W1DUCozs1ClAsVijMPhgkQGSyRfQOAtllydQnuA7JlM3SOfFFQt+qD
	 pxqL7RgoC9h2nhMZyplBRsIcJclN419e+lCt+FNuzjJWJftfqovVeT3qd6D32dt/c1
	 4vUN2WSHV5xpQ+IGDptthbFbh7inS4HCeRmpDZrBfjXUVBotccierB6Av23HVbVA8M
	 Fla1sS0TVQtFg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Petr Pavlu" <petr.pavlu@suse.com>
Cc: "Alex Gaynor" <alex.gaynor@gmail.com>,
	"Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
	=?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <benno.lossin@proton.me>,
	"Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
	"Masahiro Yamada" <masahiroy@kernel.org>,
	"Nathan Chancellor" <nathan@kernel.org>,
	"Nicolas Schier" <nicolas@fjasle.eu>,
	"Luis Chamberlain" <mcgrof@kernel.org>,  <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	"Adam Bratschi-Kaye" <ark.email@gmail.com>,
	<linux-kbuild@vger.kernel.org>,
	"Daniel Gomez" <da.gomez@samsung.com>,
	"Simona Vetter" <simona.vetter@ffwll.ch>,
	"Greg KH" <gregkh@linuxfoundation.org>,  <linux-modules@vger.kernel.org>,
	"Miguel Ojeda" <ojeda@kernel.org>, "Sami Tolvanen"
 <samitolvanen@google.com>
Subject: Re: [PATCH v7 0/6] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org> (Andreas
	Hindborg's message of "Tue, 18 Feb 2025 14:00:42 +0100")
References: <JKqjFnoTeEbURcTQ5PpmUZWDS2VMEt0eZl68dWkgk3e8ROFpb2eTWH2mStKkkXJw__Ql5DdYvIR9I7qYks-lag==@protonmail.internalid>
	<20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 24 Feb 2025 12:27:59 +0100
Message-ID: <87ldtv1t1c.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Petr,

"Andreas Hindborg" <a.hindborg@kernel.org> writes:

> This series extends the `module!` macro with support module parameters. It
> also adds some string to integer parsing functions and updates `BStr` with
> a method to strip a string prefix.
>
> This series stated out as code by Adam Bratschi-Kaye lifted from the original
> `rust` branch [1].
>
> After a bit of discussion on v3 about whether or not module parameters
> is a good idea, it seems that module parameters in Rust has a place
> in the kernel for now. This series is a dependency for `rnull`, the Rust
> null block driver [2].


Luis told me you are the one wearing the modules hat for the moment. How
do you want to handle merging of patch 6 and subsequent maintenance of
the code?

I think we discussed you guys taking this under the current module
maintainer entry? If that is correct, will you add the new files to your
entry yourself, or should I include an update to MAINTAINERS in the next
version of this series?

If prefer another solution, let me know and we can figure that out.


Best regards,
Andreas Hindborg




