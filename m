Return-Path: <linux-kbuild+bounces-5117-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 420169F0B92
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FDA31884152
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 11:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555C51C3C16;
	Fri, 13 Dec 2024 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QW64Q4U9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DCD4A21;
	Fri, 13 Dec 2024 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090378; cv=none; b=mJamNjZH9UhsXQU8vtsRT7ZtSGw8GmV/0zaroPA8xhgVgAnzCN1uG4pLbgLbnd/BWuhSIyHg2koRl1B/Nr7ftqVVO7QZS4jHD8EhlZuVkdsqTVWR/qlphsfQ+tKZK7pUilSOsnteS/00aMwUWmdrLvEqmbREIY6FRTZRNRKD6E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090378; c=relaxed/simple;
	bh=8I2WOxBCpiJk/vx8BuUgAahu4pS5nzEFeAlUisNqg8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Otz7nmnjxY1IaWip8w0cyHe9+U78f7UDR+dhLsjvHfoI0k8GsuEmAPX5cGrI6dAZdXvO/GYRIsk7gt3y4wp+0uwHWgF2LCZLWZKEOg21juSycpkmVNBzKWtZ3Y8zERyODSJDgMxog7JOGdXsH1MmTMXIROSrgCVdYUOLzwof4x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QW64Q4U9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAAAC4CED0;
	Fri, 13 Dec 2024 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734090376;
	bh=8I2WOxBCpiJk/vx8BuUgAahu4pS5nzEFeAlUisNqg8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QW64Q4U9ZRlk6Ov/FMmTfZNawUgwFHBgq8hXbVj4vgNvLc4PUiQTtpGrQe+k3CKyj
	 S6bgYjPpKIWJqiw27hQXc4+C6GTX01hHoC9fNTxHGdq7lpGMs4ro/jUXdSX7wGrKUC
	 4LVzkEg1TStBoHwL/VcqxRJOH4vjqUI7AWKExi5M=
Date: Fri, 13 Dec 2024 12:46:13 +0100
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
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 4/4] rust: add parameter support to the `module!` macro
Message-ID: <2024121324-ravine-kinswoman-c0d1@gregkh>
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org>

On Fri, Dec 13, 2024 at 12:30:49PM +0100, Andreas Hindborg wrote:
> This patch includes changes required for Rust kernel modules to utilize
> module parameters. This code implements read only support for integer
> types without `sysfs` support.

read-only is VERY limited, and as such, only good for boot options,
which as I mentioned before, is not how any "modern" kernel driver
should be doing things.

And no sysfs interaction?  That's going to confuse the heck out of
people wondering why the option they added doesn't show up in the same
place it normally would if they did it in C, right?  Not that I'm saying
this should be done at all, just that this is going to be confusing
right off the bat which is probably not a good idea.

Friends don't let friends add new module parameters to the kernel :)

thanks,

greg k-h

