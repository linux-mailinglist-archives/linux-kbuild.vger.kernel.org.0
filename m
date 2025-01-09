Return-Path: <linux-kbuild+bounces-5415-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36142A07E8C
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 18:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6D0188CA58
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 17:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B298118B467;
	Thu,  9 Jan 2025 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JlqmFwfl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708CF16FF4E;
	Thu,  9 Jan 2025 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736443038; cv=none; b=REUyWE1/naJ4MF0AckPiF9JmCFmTHbT0sZ0SkSrw712nJERFm7E7OM+DyFulYdb1BNl/Dn/D3nDQ8Oiyn7vLIsWSD3B4oRd09x5zs/G3srV60DvD4ddMFH0Lgs0XtM6pfpSAwCAqyBSIB8SmYcOgJYJIbJ2djO8zROBX91sMvkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736443038; c=relaxed/simple;
	bh=33jy1b3fU1jeQwZO2S3vKNWhuMXkiGQ1PMqFYMvAe2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejtMxc138oezlESEp/41MMn+JPaQJ4UIPH81cf9Ud8qBYeitQVQXkIDJn6CI+SHqEZ7ckhYInj/B7zqPYVzPvEAQzLHxnYwWzysIvTEiYywsz9p0CMuWiG/ENWXRxB/qtZGkK3SKn85+Ld48x6f9K8JgfafB7EYNnpZABzF3QXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JlqmFwfl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CC7C4CED2;
	Thu,  9 Jan 2025 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736443037;
	bh=33jy1b3fU1jeQwZO2S3vKNWhuMXkiGQ1PMqFYMvAe2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlqmFwflus/5CuV0kN/elQ3xEtf1EpkyYsC05hOSC0WTHiXto083GiGUev1LgFH/J
	 mqAbp/MJjTsptu+WE6yfbowJZCmTvvrs5N/H4lqJfLl9Zm62WXlv8KvEqTqXP3Vcx5
	 vkEPu+gBFnGfD3goatvfhT3LYfH//Ym5BEpp1I+w=
Date: Thu, 9 Jan 2025 18:17:14 +0100
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
Message-ID: <2025010957-danger-squeak-46e7@gregkh>
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
 <20250109-module-params-v3-v4-4-c208bcfbe11f@kernel.org>
 <wC8h91AfnWSBFa03McC40iatGVtxZIiezOJ2etM0H4rvoRkvoI50VOELVTmhk3VDHjF7UR3rIlezUyHLP9H_aA==@protonmail.internalid>
 <2025010953-saint-share-fc41@gregkh>
 <87h6689m1g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6689m1g.fsf@kernel.org>

On Thu, Jan 09, 2025 at 02:03:39PM +0100, Andreas Hindborg wrote:
> "Greg KH" <gregkh@linuxfoundation.org> writes:
> 
> > On Thu, Jan 09, 2025 at 11:54:59AM +0100, Andreas Hindborg wrote:
> >> This patch includes changes required for Rust kernel modules to utilize
> >> module parameters. This code implements read only support for integer
> >> types without `sysfs` support.
> >
> > I know you want to keep this simple for now, but will you have to go and
> > touch all users of this when you do add the sysfs support later?  sysfs
> > wants the mode of the file to be set here, so how do you think of that
> > happening?
> 
> We would add the required fields to the `module!` macro as optional
> fields. No need to touch everyone. Leaving out the sysfs file permission
> field would cause the parameter to not show up in sysfs.

Ok, that sounds reasonable, thanks!

greg k-h

