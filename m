Return-Path: <linux-kbuild+bounces-2550-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2922C9320FF
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 09:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9D8FB2115B
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252C6208BA;
	Tue, 16 Jul 2024 07:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iG3d7sGP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B66225A8;
	Tue, 16 Jul 2024 07:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721113947; cv=none; b=EkrOQJ5wKdsz4d15qeX0XHgX0MSHVm7J6a7EvAhKT46Ywb1HPskaGvSBINAnFRQnApXU9S4aa5Gadfa3uWtYpCT8CqoT9Z/7kaC+5Y/IU+nmBEh1roEnpKRUUb+n5UmFObGvrQO6/o5PT5+45RFCFd6sbKLodL91O6XJ6Sz2eY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721113947; c=relaxed/simple;
	bh=78U4m1ep53Zq6/5AXJs1cwRSOc03EfOxeMNNRKdtJbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBMp31qnT4k/rz5UsRmgaQmR/evpUTq7pq0yI37CRXlUWyD1SFH0U6QHfEPV4ywG9a0fI0Onx9zQZWxUZtZ1GmHLBPgALa+7plumiDiPB7pEl6Cfwz+JE9SllymWBSCO1+U/ohctq8bpJuMFU8Ceqe+q9c75lhRCLUmv4N+l1jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iG3d7sGP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4313DC116B1;
	Tue, 16 Jul 2024 07:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721113946;
	bh=78U4m1ep53Zq6/5AXJs1cwRSOc03EfOxeMNNRKdtJbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iG3d7sGPKcubWbLntz9f8rvFLxB/pfik+BzdH0A6oIrArbh0cgrY/iLkxl9z6g45q
	 unabXTJUDoQkryc8ebDFmj1HOi5CYBNGqcTiXht9zN/xHG+t8jGWDVFudY7yzAwXBK
	 TNxnRKLN2HJTNh2Bj5WnKrrOB6scKyKmYW4aV24I=
Date: Tue, 16 Jul 2024 09:12:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
Message-ID: <2024071643-washcloth-patronize-ce6b@gregkh>
References: <20240617175818.58219-17-samitolvanen@google.com>
 <0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com>
 <CABCJKueGRBdFfGW-cvOvqxc-a85GpxtwPmLdE_1RiAkNLrEg+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKueGRBdFfGW-cvOvqxc-a85GpxtwPmLdE_1RiAkNLrEg+g@mail.gmail.com>

On Mon, Jul 15, 2024 at 08:39:59PM +0000, Sami Tolvanen wrote:
> If using unions here is acceptable to everyone, a simple solution
> would be to use a known name prefix for the reserved members and teach
> gendwarfksyms to only print out the original type for the replaced
> ones. For example:
> 
> The initial placeholder:
> 
>     u8 __kabi_reserved_1[8];

Don't use u8, use u64 please, it makes things simpler :)

> After replacement:
> 
>     union {
>             u64 new_member;
>             struct {
>                     u8 __kabi_reserved_1[8];
>             };
>     }

Note, such a thing would only be for the distros that want it, you can
add support for this to the tool, but there is no need for any
__kabi_reserved fields in mainline.

> Here gendwarfksyms would see the __kabi_reserved prefix and only use
> u8 [8] for the CRC calculation. Does this sound reasonable?
> 
> Greg, I know you've been dealing with this for a long time, any thoughts?

It's a good start, yes.  Also watch out for when structures go from
"anonymous" to "fully described" when new #include lines get added to
files.  The current tooling has issues with that, so we need to use
__GENKSYMS__ #ifdef lines in some places to keep crc generation stable.
Don't know if dwarf output would be susceptible to the same issues with
that or not, but you should check.

thanks,

greg k-h

