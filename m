Return-Path: <linux-kbuild+bounces-4218-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1C9A729F
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 20:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08AEA1C22915
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 18:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2341F9420;
	Mon, 21 Oct 2024 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRt5zLpY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73E0173;
	Mon, 21 Oct 2024 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729536621; cv=none; b=YRCz77+6knP5PkZgdd5+e7kL2PboUyTUfjvJtUgoiJ5CgrckYvMRrBr8JB0TBbckVBWFjHLz4a6hJwosvVnxgeYRN/4UicEK47mfgibI0gbZ9TIJKxpPBDEKWBjwXaQjFkqpOxfGz6VzoKQJeA705wF/UFh/XFAeUy5hzEwJ3Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729536621; c=relaxed/simple;
	bh=qgyG8Kaa/YtH51Hlpd3SjiwLQqr3adzTo83sdSlMQx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWW8GRCYWInWSQwXnAIqOAQe2NyuSpuMs3mEWubfgAsVXqoNPTUkcTeD5NG5AOQ+TMN081cyKSsj/zdifYFJrdFVmOt5b8YuufA+ifm5by1tzTSTyCi2CFvFMKNOnnBw+uBdXTHehQ+98XzhB2Om1qRDf5iqeSg7bcHtKniz7/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRt5zLpY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C723EC4CEC3;
	Mon, 21 Oct 2024 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729536620;
	bh=qgyG8Kaa/YtH51Hlpd3SjiwLQqr3adzTo83sdSlMQx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRt5zLpY0+WS2sYGXU65HxGytlhkxgBDvLXMwIo9WG8d57C5caCA4R2AIzbrpiViW
	 2ZTRM310ZHGH9Js5UlHYo6CQDS3x8YnvdRpQfDtU2wkYYNSuiAEBWtephNwoVNllzR
	 hLgH/YKKckxmfOAmGhTYtZJD7USq0XgppQafPy5m6E0uF6aIXwD782oW159FTezwy7
	 eSsQaJBXgLJXOXp8yV1GM6Gz1KzNJ6uJ07F36z2fH6rp+Yd0za//O3ebyO1TP/04k3
	 K7MdDhOn8bY1rLKNtTTaj00Us29H3HpBmoebwck/qEEIQ2okUaGWDmNOuRq2PXuCJT
	 KTaVAtijTxhFg==
Date: Mon, 21 Oct 2024 11:50:18 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Alex Gaynor <alex.gaynor@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st,
	j@jannau.net, asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	samitolvanen@google.com, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v6 4/5] modpost: Produce extended MODVERSIONS information
Message-ID: <ZxaialZA7rCrwlHL@bombadil.infradead.org>
References: <20241015231925.3854230-1-mmaurer@google.com>
 <20241015231925.3854230-5-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015231925.3854230-5-mmaurer@google.com>

On Tue, Oct 15, 2024 at 11:18:59PM +0000, Matthew Maurer wrote:
> Generate both the existing modversions format and the new extended one
> when running modpost. Presence of this metadata in the final .ko is
> guarded by CONFIG_EXTENDED_MODVERSIONS.
> 
> We no longer generate an error on long symbols in modpost if
> CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
> encoded in the extended section. These symbols will be skipped in the
> previous encoding. An error will still be generated if
> CONFIG_EXTENDED_MODVERSIONS is not set.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

If nothing is selecting EXTENDED_MODVERSIONS then this is dead code and
should not be submitted unless we have a user, if that's the case then
this series should be folded into Sami's.

  Luis

