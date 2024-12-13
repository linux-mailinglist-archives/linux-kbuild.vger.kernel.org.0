Return-Path: <linux-kbuild+bounces-5131-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7B9F1699
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 20:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45247286FD3
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 19:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12951EC4FF;
	Fri, 13 Dec 2024 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5dpB9SL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAF1EF0B0;
	Fri, 13 Dec 2024 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734118867; cv=none; b=tNZ2nuDoat0CG34derytOH6Seov+XU7VQ/LAr+2zMQt/K3vhEAtvkEGwGJfGIY/c908Rnj2oXSiN/Wkn7Wu3aj+8PGBAjX4ZIc2clcDOYe9Um7fFkwWRwbAlIDBxg1v6eiPmAENOqa9t0Xe7Ip6dWemfsFjno3RR70xtGj5CbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734118867; c=relaxed/simple;
	bh=sWRxcuS7aYrOVTz1zArZCe1GvCu8/32TCwPStGAG0SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MK/92ZllUHejd2y4Ry0w3wlmScv0Ik+QKWPotoflR9K4CJ4VEFQUXAN5sOjKHeYczYyeyi6/Z+b9J7U37zQNbxTdXV+uXjz6Oc685Bml0+41ykSiH0C60NSC8ktSc+hSFp1kP8bjcru0OJyM8iWyvX9OOmNaWdGm30Q9q64FU4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5dpB9SL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD1CC4CED0;
	Fri, 13 Dec 2024 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734118867;
	bh=sWRxcuS7aYrOVTz1zArZCe1GvCu8/32TCwPStGAG0SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5dpB9SL29juyuTEERAzdVEpcNVB8nkkYiGNEuVCUcRHn4T0ZUYLRRXmbECgpa+pV
	 zImQR+4nFI41MFNc2Au3IbGJ57p/Iw3KZbTrzJsP27dYuo/22yTHMtCdebgvqJG+mz
	 pfeGOlP96q8pgAEbhLBRfDlIxfqpZ0lcrDcE7NjvwM+i4przJDDI6o4HyQYtlFJiG1
	 +7LoxJ0VnKXVNvYkCm/3pCkLNVs1eujeM97z2GhLkXd0y+HVqqGKtH46FhtThkdd4m
	 o128EdAES492pv2RVU2abVahz0X/jYbTpbWadsAizVU3yXdkHyULpQ7AC+w8Y0FjUu
	 EGnwZZbxIoTLg==
Date: Fri, 13 Dec 2024 11:41:05 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
Message-ID: <Z1yN0ZB_ghIwRG-m@bombadil.infradead.org>
References: <xK59-BGgPeRPn4PEeT498C5hexwXQ1H5sDle5WuMs3OtTzS0cA4NTRiBh1zLr_4p6o64eXKYOlEka_xzUHG5jA==@protonmail.internalid>
 <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <87bjxfephw.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjxfephw.fsf@kernel.org>

On Fri, Dec 13, 2024 at 01:28:27PM +0100, Andreas Hindborg wrote:
> 
> Hi Luis, Petr, Sami, Dani,
> 
> I just noticed that I failed in email and forgot to add you to the
> recipient list of this series. Do you want a resend, or is this
> sufficient?

If the patches didn't go to linux-modules, then yes, a resend would be
good so that others subscribed to that list can also review. You can
also wait for a v2. Up to you. I won't read it until I get it on my
inbox.

  Luis

