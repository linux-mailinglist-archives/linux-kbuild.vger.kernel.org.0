Return-Path: <linux-kbuild+bounces-2207-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE3490DA6D
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 19:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 792721F22121
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 17:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564C913C80E;
	Tue, 18 Jun 2024 17:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nUHs44q8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E922626;
	Tue, 18 Jun 2024 17:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718731123; cv=none; b=BkeapD99BNM1lEl517qvCYluQD2wACGEM2tmYZm/eGfrh60a9eiMup911fa5kLAeYEQMnRYLC2QPbXv2Vt1s2IQ9+89nswMi64S/J3SloTrhRtX20GteXL3JTjzr924qUsz1TbK5/B8oa9bXrfbNk6iRAuH8N1Oc5gWA1S8srUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718731123; c=relaxed/simple;
	bh=Fd6qzSNzEMV8858Bh6VBUQbUwbOFiC+vQqdgJm3030E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyU0L4BPq4hDNw4yeIINWPzc+WAH8EHdisPIx1bbZsCelK17e7u6u2qurUXDFOddkARU9Fg341ett0pIbJIxQfalBZ88xhjlQ14CpV6WRoStQBS9xOYcThyi1IEEi5t5D3ro9CmtN6+wDOudVJG6R1lglkX5R2nhAnHXOE/QdSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nUHs44q8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82AFC3277B;
	Tue, 18 Jun 2024 17:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718731122;
	bh=Fd6qzSNzEMV8858Bh6VBUQbUwbOFiC+vQqdgJm3030E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUHs44q85clcuV6tyEc4MWYb/rLO0WegRjMs87eC357iktfkc4YLmxGXn0N6ynnrS
	 NUTUQ01Trf1upYqJ1Iik1Do4Tj8euycLpCiIx+LiQWgPP2MZ/i8EgbEIrm0DLN3Vi0
	 hkbwHdQ1cl//LtKEMm0f2sJOjHrcPVhyeN2FkoL4=
Date: Tue, 18 Jun 2024 19:18:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
Message-ID: <2024061828-tricky-playtime-f844@gregkh>
References: <20240617175818.58219-17-samitolvanen@google.com>
 <2024061842-hatless-viewpoint-5024@gregkh>
 <CAK7LNAS_OsXeoDRoMbdXUGY=-jhuoHgo-L6W79n+Kb4G4xEBwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS_OsXeoDRoMbdXUGY=-jhuoHgo-L6W79n+Kb4G4xEBwQ@mail.gmail.com>

On Wed, Jun 19, 2024 at 01:50:36AM +0900, Masahiro Yamada wrote:
> On Wed, Jun 19, 2024 at 1:44 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jun 17, 2024 at 05:58:19PM +0000, Sami Tolvanen wrote:
> > > Hi folks,
> > >
> > > This series implements CONFIG_MODVERSIONS for Rust, an important
> > > feature for distributions like Android that want to ship Rust
> > > kernel modules, and depend on modversions to help ensure module ABI
> > > compatibility.
> > >
> > > There have been earlier proposals [1][2] that would allow Rust
> > > modules to coexist with modversions, but none that actually implement
> > > symbol versioning. Unlike C, Rust source code doesn't have sufficient
> > > information about the final ABI, as the compiler has considerable
> > > freedom in adjusting structure layout for improved performance [3],
> > > for example, which makes using a source code parser like genksyms
> > > a non-starter. Based on Matt's suggestion and previous feedback
> > > from maintainers, this series uses DWARF debugging information for
> > > computing versions. DWARF is an established and relatively stable
> > > format, which includes all the necessary ABI details, and adding a
> > > CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> > > reasonable trade-off.
> > >
> > > The first 12 patches of this series add a small tool for computing
> > > symbol versions from DWARF, called gendwarfksyms. When passed a list
> > > of exported symbols, the tool generates an expanded type string
> > > for each symbol, and computes symbol CRCs similarly to genksyms.
> > > gendwarfksyms is written in C and uses libdw to process DWARF, mainly
> > > because of the existing support for C host tools that use elfutils
> > > (e.g., objtool).
> >
> > That's cool, can the C code be switched to also use this?  That way we
> > only have one path/code for all of this?
> 
> 
> As the description says, it requires CONFIG_DEBUG_INFO.
> We can strip the debug info from the final vmlinux, but
> I guess the build speed will be even slower than the current genksyms.

For people who want genksyms (i.e. distros), don't they normally already
enable DEBUG_INFO as well?  The problems of genksyms are well known and
a pain (I speak from experience), so replacing it with info based on
DWARF would be great, I'll gladly trade off the DEBUG_INFO issue for
stablilty!

thanks,

greg k-h

