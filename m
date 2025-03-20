Return-Path: <linux-kbuild+bounces-6255-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AB2A6A07B
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 08:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AF1B189338A
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 07:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC2A1EBA03;
	Thu, 20 Mar 2025 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onFCr9dH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7B11E231D;
	Thu, 20 Mar 2025 07:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742456058; cv=none; b=PYLkadXCURXyIs+NULitqdZXmNJ4z5vY8NuYNKaVRvZFdkB3uXjlZt/2iIw5wCxRO1ucza5/Ab5isiELKSh9CwowRdZd1xFgR39WHoDZl6VxkFJlSJvntDHQEDu1+D5nnIT/ffx8xMgCZnYsMhBj7wTsNS5wUAwNmVzbQsmu0Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742456058; c=relaxed/simple;
	bh=M6N7J5PUywXEOdk/KR3TLMgk3P4ZyWRKXuBX75CErr8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c7cpbalF2nTLGDq/bup3hwXoeHk4MeZczp256n1vMdAAkfNEb3gK7s9+6+xryGnLMiH9Dl8IadMq0+eFZkZFQQ55rvG9RwDDJwN33qb4Ulz34BUqpto2TUQPL0jstjF7PrHM8CpP+4WunWBoKF1VPElyYq1UdEa91g3v8OEo+yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onFCr9dH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9FFC4CEDD;
	Thu, 20 Mar 2025 07:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742456055;
	bh=M6N7J5PUywXEOdk/KR3TLMgk3P4ZyWRKXuBX75CErr8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=onFCr9dHMGHOKZRalm1hmNFBccDLCsBWuhg1kPu9JCyenvjtyAu41wgBs0ISOUho1
	 3xPVJeHB5T1nh/z7sk0DGpIDwn2T7qbJeuET8g7LgC8kD+rIB9Grk2jfAxPOrEnIlN
	 eVc4qMEi9b225s1E69RQHVASvxh0mELaMxbcRxHxaU7K1VdXy/chX2GWZ4KQgyU7nr
	 rEWVIJL72GXdb8DS9WkN0hS2zqr1bgv20uoUbuSptRhqD4URw5CgvQkI+ADFwaicf4
	 HgXcMCBy2eBi+tIJwps4wImnB0r2mfa2Wkk/Q0zxpKjKE80F4faBbHuGElANSoyObw
	 KS+U84+se13rA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Antonio Hickey" <contact@antoniohickey.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan
 Chancellor" <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature
In-Reply-To: <20250320020740.1631171-2-contact@antoniohickey.com> (Antonio
	Hickey's message of "Wed, 19 Mar 2025 22:07:20 -0400")
References: <20250320020740.1631171-1-contact@antoniohickey.com>
	<O5hMUm7mU4NXMBZMnT8ybbwuKvOZchnz5liewvE5x7yu6MXH6nllpztH8GH8J-xKn5UGRVwB5n6VcaRgH9fvug==@protonmail.internalid>
	<20250320020740.1631171-2-contact@antoniohickey.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 20 Mar 2025 08:32:51 +0100
Message-ID: <87wmckdun0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Antonio Hickey" <contact@antoniohickey.com> writes:

> Since Rust 1.82.0 the `raw_ref_op` feature is stable.
>
> By enabling this feature we can use `&raw const place` and
> `&raw mut place` instead of using `addr_of!(place)` and
> `addr_of_mut!(place)` macros.
>
> Allowing us to reduce macro complexity, and improve consistency
> with existing reference syntax as `&raw const`, `&raw mut` are
> similar to `&`, `&mut` making it fit more naturally with other
> existing code.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1148
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg




