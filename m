Return-Path: <linux-kbuild+bounces-6832-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFE3AA5BC3
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 09:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D61C3B5DC0
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 07:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3211F276047;
	Thu,  1 May 2025 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0jdlTOE3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD48270EA2;
	Thu,  1 May 2025 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086302; cv=none; b=BzuQfMTIfvhFodII+zVPGPZTkpZ+23fyG8DBdlLHJVrLFex6mhhuf7EWckA15aAoRZvPPkBvcUxzXPiECgNJLe+Ldg8eaiZGTeaFqU90lOmIvhrI1v1fICslBBUgbGM/yaFrLoG7oZcajiR7Ukfr+IFmyxeRDlWep8eolEVZwiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086302; c=relaxed/simple;
	bh=MxJ/O+08GNZMj5OxSNbDrERge+9ToDwe05WZ9K9n780=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5dojtYf5pYlerwzF+tA54V5+56PLt6AWOdtP390sMrC3I5jPFtcxxvxbxEkGob2N+VCBGWFtvGTAXkNJdIB+1weVDJUX0Qh7hRTR+/PAZ0OULPHmUUzlba7HkpzmoSvuCzfNUh6umzse/LsbswZqdv+Ws+RitBaJae2baBz2Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0jdlTOE3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60C8C4CEE3;
	Thu,  1 May 2025 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746086301;
	bh=MxJ/O+08GNZMj5OxSNbDrERge+9ToDwe05WZ9K9n780=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0jdlTOE3nE83cT2ymk50YePRXEjQWJEZGHDZ/8a6xQWEZmKs0YFIz0R7i9/7WLdGD
	 T9YG/QA5gbrQB8JZXfOc3uL5lPqLA2xIABd2oSfktx6LsEUeJraF8KrDVlYpNXk7zf
	 HaLIEv7YMODRj3hMnGXhl2MDIN4emI7Yy0nLAaSU=
Date: Thu, 1 May 2025 09:58:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Fiona Behrens <me@kloenk.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-modules@vger.kernel.org
Subject: Re: [PATCH v10 0/3] rust: extend `module!` macro with integer
 parameter support
Message-ID: <2025050110-overvalue-diffusive-abd2@gregkh>
References: <20250501-module-params-v3-v10-0-4da485d343d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-module-params-v3-v10-0-4da485d343d5@kernel.org>

On Thu, May 01, 2025 at 09:53:36AM +0200, Andreas Hindborg wrote:
> Extend the `module!` macro with support module parameters. Also add some string
> to integer parsing functions and updates `BStr` with a method to strip a string
> prefix.
> 
> Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].
> 
> Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

