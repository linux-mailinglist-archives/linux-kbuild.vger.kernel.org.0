Return-Path: <linux-kbuild+bounces-5116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F39F0B83
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42295283654
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 11:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E620B1DE899;
	Fri, 13 Dec 2024 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NOM5UwnE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF91AB528;
	Fri, 13 Dec 2024 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090223; cv=none; b=NkPE6knEkETcGLIO78MxdM9bF6/VPSvLDto+yBXDAPNwgT5PoHP1N3N6hZ8JJnSjPLaFevVgcAm4j1ZxfAYvVcUpeQGNh9wovT5xmoFA17VvSub1H0MmZ9RJQ8gxKQ1gZQ9XxV1FszASH27CYFt7Aw2PYpvy5P/z0SCYbDzARP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090223; c=relaxed/simple;
	bh=cjRjp/Xse2fxvqepIjHcf3vL97ttat9N5UPpJjOyyYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hf6a+3Tcv6tzJZa5YzlWYJbhVdLGuN1QcP1xorqpLvcuO+NtXrZR+UmnesbjryGyZfxC2u/trBN3qJehtvf9+gLbjPYmD7WpoZ38hceuuQLl7pnFTzP/ES3JyNpQZzMawJJxoKsSjyr6nmMfmuWIPAjZ4G3n5oxfAAVx06JdtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NOM5UwnE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1E1C4CED0;
	Fri, 13 Dec 2024 11:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734090223;
	bh=cjRjp/Xse2fxvqepIjHcf3vL97ttat9N5UPpJjOyyYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOM5UwnEn2U5tGOJZ13vJval1uW1zxj9jvN9Jk9+efNsEkjCBgAmJF+SEEuRk4KFt
	 YLo2WN2VCRflhqoakOF/Qo2eMvYrksjQ2EH2jcW0vFnqwMDlwRjQrvMCy/Z5/DvfsP
	 kOWmOTlg5GOzkvUr7GrcbVGXPp2gWl+p4h9A1Dq0=
Date: Fri, 13 Dec 2024 12:43:40 +0100
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
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
Message-ID: <2024121324-overdue-giggly-bdb8@gregkh>
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>

On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
> This series extends the `module!` macro with support module parameters.

Eeek, why?

Module parameters are from the 1990's, back when we had no idea what we
were doing and thought that a simple "one variable for a driver that
controls multiple devices" was somehow a valid solution :)

Please only really add module parameters if you can prove that you
actually need a module parameter.

thanks,

greg k-h

