Return-Path: <linux-kbuild+bounces-2204-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B4290D9B0
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 18:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FC59281C58
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 16:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B353A12F5B1;
	Tue, 18 Jun 2024 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Foh/x0jN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF541C89;
	Tue, 18 Jun 2024 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729059; cv=none; b=qm5FPhspkzwJfR++q9+PiE7tnE4nUmyZz7UgZOj8g3Q1mUk1mXuZcKKJUB1hGnNsE/c7uXm/ZpYk+FcgZmtv8Fkr6ZP0GgXmMVyu5swRfmlpu7dUkIfzK+q2yszOLAgj//QgSJ3WAoF+f3XTRMosz3ODgD0CZwrLBKLunrqaYKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729059; c=relaxed/simple;
	bh=fid3/V6FxJE496iO1WIJCZ9hVp1vymcmEx0GLQO/KuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qz77glILOX/JAgM4XmEs7Ds9ZmvnkgIY6fsBBheMu2x5nB71iUNZOQywwyyaa1UMOZje7qOJZBhXlGszlkz6fSURtNi5RaWWkW5mXi8OquwEq03yIh5Ay1IXYiB5tSCMl1xxm4r231uoU0dYPN7eUbBxx1vJz1tKbdwUDDczE4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Foh/x0jN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6F3C4AF1C;
	Tue, 18 Jun 2024 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718729059;
	bh=fid3/V6FxJE496iO1WIJCZ9hVp1vymcmEx0GLQO/KuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Foh/x0jNaZe3g5CpjJY/Rn3EeE6n/sW1zLVRAcOi6OMrNMWLCm7+sDJUxbnRs8oZ6
	 WjXX7K7LuYPPBFITocb/Yy3aOBosY4J7E//StccxWsL8iTHJWUzbBfoHUUUJXirjJe
	 kDEJJPZYZRDHq2eiTaT/L8xs+4c9rnZv5Oi++pc8=
Date: Tue, 18 Jun 2024 18:44:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
Message-ID: <2024061842-hatless-viewpoint-5024@gregkh>
References: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>

On Mon, Jun 17, 2024 at 05:58:19PM +0000, Sami Tolvanen wrote:
> Hi folks,
> 
> This series implements CONFIG_MODVERSIONS for Rust, an important
> feature for distributions like Android that want to ship Rust
> kernel modules, and depend on modversions to help ensure module ABI
> compatibility.
> 
> There have been earlier proposals [1][2] that would allow Rust
> modules to coexist with modversions, but none that actually implement
> symbol versioning. Unlike C, Rust source code doesn't have sufficient
> information about the final ABI, as the compiler has considerable
> freedom in adjusting structure layout for improved performance [3],
> for example, which makes using a source code parser like genksyms
> a non-starter. Based on Matt's suggestion and previous feedback
> from maintainers, this series uses DWARF debugging information for
> computing versions. DWARF is an established and relatively stable
> format, which includes all the necessary ABI details, and adding a
> CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> reasonable trade-off.
> 
> The first 12 patches of this series add a small tool for computing
> symbol versions from DWARF, called gendwarfksyms. When passed a list
> of exported symbols, the tool generates an expanded type string
> for each symbol, and computes symbol CRCs similarly to genksyms.
> gendwarfksyms is written in C and uses libdw to process DWARF, mainly
> because of the existing support for C host tools that use elfutils
> (e.g., objtool).

That's cool, can the C code be switched to also use this?  That way we
only have one path/code for all of this?

thanks,

greg k-h

