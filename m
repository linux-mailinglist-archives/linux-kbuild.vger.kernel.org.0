Return-Path: <linux-kbuild+bounces-8415-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC0AB23A41
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 22:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3613188AD1F
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 20:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84B22D0624;
	Tue, 12 Aug 2025 20:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aci32url"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94342F0666;
	Tue, 12 Aug 2025 20:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032171; cv=none; b=ZtmmmSdRCbJwSGpSDPmxwp9NyZM8qErk5Ljnq0XAfG/fekDQFt8SGOfRbJQJCBWFwj+Ws/IH391cA3FY25SkVofPx2RahL/q3Zt4TLQ/yTO5MxtXGGxdhu75Ol967bEdSkKU4uiJPGRZ4yElD4Uv3L1nVe37L7WcRPb2QoKgIuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032171; c=relaxed/simple;
	bh=oDx/4yjF6fOIMLyafK6z36XCnn2dAEJD56/3U6byJhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q911vhZOE+YV3W5WGxKQEP02MQ7ZajyBsScy3hIZy+C0qgKwXDAJmCygefgr+9K8FVHt4QpJ0sloPZB2IM+yHi8fj9aD9zyX+ADXyp6Atc9ihi8YPPT+eQSNZC1B0vgUn6EsdKD7XxP9EVMekwNkT1CHWkxbbYCsGAs2poU5g04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aci32url; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B44CC4CEF0;
	Tue, 12 Aug 2025 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755032170;
	bh=oDx/4yjF6fOIMLyafK6z36XCnn2dAEJD56/3U6byJhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aci32urlrI9CgDWLLZVE10UPVqDe2MuCNb7FoPCabmVIHnD2dNYTBYIDd9rymhZOn
	 +a3CykFh184IeqAog5f/VAmRx++PklO1nWODv/on3WAGwhyitMTujNyt6XqdZhHFEz
	 xWZQ962qlvMX6GwCKbv0yVR0F/fxvmMti10W0YMtTmGMTfAtGJMprjLU7r2dywA0oA
	 8L+A0S6Wx5/380Esa0eS02O6q9H8l2zEvaeFIcN/w0GUSaLde/wZxNI3IoKam0WtCx
	 fCy9mEAvvYLx92Sskkk0eQIEFQ84T1taZJKNbQ/oKzSdlWrKQDPyMTTK+Ng1i7CARu
	 +r7orZEZFPFWw==
Date: Tue, 12 Aug 2025 13:56:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: enable CONFIG_WERROR for more build steps
Message-ID: <20250812205604.GA532342@ax162>
References: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
 <CANiq72k-PdSH2BNgbq=X+FhpyEErifSCKfO5ObXz6bu9_J8+fA@mail.gmail.com>
 <20250812121545-f00f588b-2239-4d96-baeb-55cbf4914556@linutronix.de>
 <CANiq72=rhY_k1RRJoTzsY8PnEW5D=m2Org9m0v3erJsWxW4HkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=rhY_k1RRJoTzsY8PnEW5D=m2Org9m0v3erJsWxW4HkQ@mail.gmail.com>

On Tue, Aug 12, 2025 at 12:50:44PM +0200, Miguel Ojeda wrote:
> On Tue, Aug 12, 2025 at 12:25 PM Thomas Weißschuh
> > Another possibility would be to use -Werror
> > for hostprogs unconditionally. Various tools/ are doing that for example.
> 
> Not sure what Kbuild thinks about that -- we have a small risk of
> breaking things with newer compilers, but that may be not too bad for
> just hostprogs (unlike when it was attempted to make it default `y`).
...
> appear -- so that should be fine, but it does make it way more urgent
> if they are errors every time, though, since it blocks other testing
> too).

Yeah I am conflicted. On the one hand, KBUILD_HOSTCFLAGS only has -Wall
and a couple of extra warnings so the risk of new warnings breaking the
build is pretty low. You can see the rate at which warnings get added or
removed from -Wall in clang in the warning-wall.c test:

  https://github.com/llvm/llvm-project/commits/main/clang/test/Misc/warning-wall.c

I'm obviously on top of testing upstream LLVM against hostprogs because
LLVM= makes it easy to set HOSTCC. I suspect that GCC trunk sees less
testing against the hostprogs unless the user has it in their PATH
somehow.

On the other hand, the recent changes to -Wuninitialized and the
addition of -Wuninitialized-const-pointer were extremely disruptive only
because of -Werror... I would have no problems with fast tracking fixes
for hostprogs -Werror usage but I am not sure all maintainers will. This
would also impact vendored host programs like dtc, which may be harder
to update.

We could try it for a development cycle in -next to see if anything gets
noticed. Always easy to back out retrospectively as well. Alternatively,
we could just recommend people use HOSTCFLAGS=-Werror if they desire it.

Cheers,
Nathan

