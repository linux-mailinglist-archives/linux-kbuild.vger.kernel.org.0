Return-Path: <linux-kbuild+bounces-8473-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFCAB26EED
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 20:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C19460031C
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 18:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62E122FE0F;
	Thu, 14 Aug 2025 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwB6MTHX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7848022B5A5;
	Thu, 14 Aug 2025 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196218; cv=none; b=UAQoPd3JF/aTe2YKtScoSQ7shuOUNNDmBLU1mXjj38WZUihkVD882f05al5oe7g0RQ2+EOQfWEOLK9nLaCrl3mhX+Ia7RtRsXC3KyLwyH1jYncjelKqyVB5YVcZ5HWNhv3plq/EjMJ0Z4jJREVk0xUDiZbMQJnhryTRRLnk5UwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196218; c=relaxed/simple;
	bh=m9m4HMvmAXmOERYnd+wXpX4cqNVpnOXyC89EBlT8C5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvd7p9gV4vfjTA0ASZ5ww9kNjoyvda+Llxi1ThJVOIrS7T9PPW5dket797pSz++8Pa0BJxNS4QGx5Awz931EyEhg9IFjsyoZBwjbAB7SV+1N2342qyIPQl5b4IPebbUn+lMnu9NOKyntzaAkLHHb6C7zozjgCDvo5r7p9tfcOWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwB6MTHX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F27C4CEED;
	Thu, 14 Aug 2025 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755196218;
	bh=m9m4HMvmAXmOERYnd+wXpX4cqNVpnOXyC89EBlT8C5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwB6MTHXeD94tWS7c6T1eBZRJQHIHFxgx2oIzYvyMCuZN8xj4TLx9MYge4HpEbvk5
	 XZ2boP++hgPqTDX8q9Yh5mRzz66XeV/DNFOFQrQSqLzD0Tu/uc+Fbc8S1BtiFLFUij
	 txdPhpWtwk/Z49eaKY51z6rNIYR0Lbvcj5l+SNbnKvL60nn4FsoXyO4AT4/VpiWl/c
	 WmO/tBq2HfX2wt3B6IeAjZRIbUZJwlU7mCjDNWalP9YaCM/4j8Zi9eRZYp9YVRlqzm
	 1OCU/RCoThPTd8euBpsGvsLDQKXcOLEACYrjha3+8jxd2KEuYnN9l2DTxakbtF3XpJ
	 TEFlUuZsW/NJA==
Date: Thu, 14 Aug 2025 11:30:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
Message-ID: <20250814183012.GB3825814@ax162>
References: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
 <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
 <aJ3SJWu8-o2S-KU5@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ3SJWu8-o2S-KU5@levanger>

On Thu, Aug 14, 2025 at 02:10:13PM +0200, Nicolas Schier wrote:
> On Thu, Aug 14, 2025 at 12:14:46PM +0200, Thomas Weiﬂschuh wrote:
> > The hostprog compilers and linkers do not share the regular compiler flags,
> > so they are not affected by CONFIG_WERROR or W=e. As hostprogs are used
> > during the bootstrap of the build, they can't depend on kconfig options.
> > 
> > Enable -Werror unconditionally.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > 
> > ---
> > For testing in -next, as discussed in
> > https://lore.kernel.org/lkml/20250812-kbuild-werror-v1-2-36c9ff653700@linutronix.de/
> 
> yeah, I am not sure if this is a good change, but I am ok with testing
> it in next, as Nathan suggested.

Yeah, I will leave this as the top patch in kbuild-next for now so that
we can easily back out if it is disruptive.

> For the rest of the series:
> 
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

I applied this tag to patches 1 through 5 and left it off of this one,
based on "for the rest of the series". Let me know if that was
unintentional.

Cheers,
Nathan

