Return-Path: <linux-kbuild+bounces-3037-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B6A954282
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 09:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C2941F2132E
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 07:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCA1127B56;
	Fri, 16 Aug 2024 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w6zeWp30"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57473C24;
	Fri, 16 Aug 2024 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723792521; cv=none; b=Sm6GCbMcj0V9FE1v8g67eYLxPZPLWW7GI/wWNF97qSm0NYP5uc4wlogTB9chp8SDEIzgzY1hzZtRJQOGxlTKW5a63BmYtX4NfAaAWkWOKg0WXMEfBSQoXB7NtTVS9pD6UEd7E1opH3ADOyqH3d9nhWByunF211C/4d8B7OfaQ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723792521; c=relaxed/simple;
	bh=47X60R0Fmlg9l6knJEWfWH0dtxzdAGSPiE5UIA4nGjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UP1d7MUm4bM7n4Bb0JhRDhT6KLgqAmnVHzzb9byzBoTt++SeC+l6ziUbb7WTAxCnuIfsGk844KV1+aD3M8q/8O+Q/z7oRQ8jXmF6587pERAZMWLZYgUClaN7cgkYazjvbhU8I3GxGcT+BG08fGLdY/ni5UTag/nqQKqJSJDz6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w6zeWp30; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E972CC32782;
	Fri, 16 Aug 2024 07:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723792521;
	bh=47X60R0Fmlg9l6knJEWfWH0dtxzdAGSPiE5UIA4nGjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w6zeWp30kxKjlYjdgadp/TXzcMNNX2uspwFGBQBBcum4ikJH1REIef18P7P6sleAv
	 5HV6ArUbUsHrX69jY2boZ4eScP1bVld5JXauTegKbONmvvcJOhY6B/v8q5mwSuubMj
	 EAx8vWbm1YjOctV/0D4+DcjV5bm2mrGCB28HNCdw=
Date: Fri, 16 Aug 2024 09:15:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
Message-ID: <2024081632-straw-animate-689f@gregkh>
References: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>

On Thu, Aug 15, 2024 at 05:39:04PM +0000, Sami Tolvanen wrote:
> Changes in v2:
> - Per Luis' request, dropped Rust-specific patches and added
>   gendwarfksyms as an alternative to genksyms for the entire
>   kernel.
> 
> - Added support for missing DWARF features needed to handle
>   also non-Rust code.
> 
> - Changed symbol address matching to use the symbol table
>   information instead of relying on addresses in DWARF.
> 
> - Added __gendwarfksyms_ptr patches to ensure the compiler emits
>   the necessary type information in DWARF even for symbols that
>   are defined in other TUs.
> 
> - Refactored debugging output and moved the more verbose output
>   behind --dump* flags.
> 
> - Added a --symtypes flag for generating a genksyms-style
>   symtypes output based on Petr's feedback, and refactored
>   symbol version calculations to be based on symtypes instead
>   of raw --dump-dies output.
> 
> - Based on feedback from Greg and Petr, added --stable flag and
>   support for reserved data structure fields and declaration-onl
>   structures. Also added examples for using these features.

I missed the examples for this, is there a Documentation/ update
somewhere to explain this?  What patch of the series handles this?

thanks,

greg k-h

