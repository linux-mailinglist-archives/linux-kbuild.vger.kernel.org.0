Return-Path: <linux-kbuild+bounces-5411-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40507A074A9
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 12:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41F90165E02
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 11:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B12217727;
	Thu,  9 Jan 2025 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tbcf2vvl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C0121771A;
	Thu,  9 Jan 2025 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736422034; cv=none; b=UbSj+VuGr4ijEvNM1DpuEhkPXdC6KIjVneu1/Oik6FVJwY2Fnww9KKIcvp8rUhhy9Oe9Qf86olWoC1fYHix5VWHqTbnpL8uVQyUp4Z7o9aGOsVlboDCR/98a25BtDb4KkTo8Scgx23g81LbvxysmffVTho/JmpYym0mXiaAz/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736422034; c=relaxed/simple;
	bh=ILRlRIa1jRM1P14HNrP6UD1z8rRCyQOmu/xEQKZxiSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NycDCyz3BP6Q23pNdYP2XHlFgjN4MSS0xqSWsOd/z/XSBIXC8aHU1Xrd8YYP1umTgUf7r887tKSuQqyk0BPb5PgsxyFwNMsEOBoEgGN/cuc5UsCl13mPk/jcsfvB2Y9rJAHpHt4TKXyZODUKlNBfPalURECP22JRo38f6D6Eivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tbcf2vvl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DDDC4CED2;
	Thu,  9 Jan 2025 11:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736422033;
	bh=ILRlRIa1jRM1P14HNrP6UD1z8rRCyQOmu/xEQKZxiSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbcf2vvlZbgwQLanpONka752zyXOMMnS2h7Mdbwc1t3GU1XuU4D2h59dqmPmHtyBN
	 NqqnNOYPwyp87OXxnifY0RY+o7p8D6hw+DiJdzxzfBIMm6O5vycNkPaO7KGGPWQ6M8
	 pdw+B07jG2cZgBwJkmM91jxo0mdmr+97oSqONiik=
Date: Thu, 9 Jan 2025 12:27:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-modules@vger.kernel.org
Subject: Re: [PATCH v4 4/4] rust: add parameter support to the `module!` macro
Message-ID: <2025010953-saint-share-fc41@gregkh>
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
 <20250109-module-params-v3-v4-4-c208bcfbe11f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-module-params-v3-v4-4-c208bcfbe11f@kernel.org>

On Thu, Jan 09, 2025 at 11:54:59AM +0100, Andreas Hindborg wrote:
> This patch includes changes required for Rust kernel modules to utilize
> module parameters. This code implements read only support for integer
> types without `sysfs` support.

I know you want to keep this simple for now, but will you have to go and
touch all users of this when you do add the sysfs support later?  sysfs
wants the mode of the file to be set here, so how do you think of that
happening?  And don't you need that for your null block driver?

Also, what about all the other "types" of module parameters that are
currently able to be done, like call-back, hardware control, and unsafe?
Are we just not going to do that for rust code (no objection from me,
just wanting to be sure.)

thanks,

greg k-h

