Return-Path: <linux-kbuild+bounces-3038-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D9695429C
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 09:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4FA51F2221E
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 07:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6BE12C46F;
	Fri, 16 Aug 2024 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XQUaSq50"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB80286131;
	Fri, 16 Aug 2024 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723792822; cv=none; b=HS6ocbfBCr9eRN1apdMFOmnAcUKyGOtyiLtXEDzLbANdfsHBtw4QjTJpjYaQtN9rB1IGjKFEddVLD+6zTH9jJU8Jmb5jtc2KjUroLsykMyrY4V9DuKeUF86q/3fq9Q2Fu1EqMqwXnIjHNHlvfe15PhP2Q05K5z4khJnSh3tC9uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723792822; c=relaxed/simple;
	bh=ljscXbotnhYskEj8hpcUc/0M9uoUIrVHHpbd44KFbs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWChBR3W4fpFIir6Nu6eFQ/Gu3GPHWrZkC9K9Cf2D9/lrjexs3PB/uav9+zIvh6j9JALnRHAY2Y2ikzHZ1gcdEo623BXZTW+g2WFxgrgTCIBF7/mQCUoGiDPKctxYiO7lNW0ltsv3du/iwBjm50YjUwfgqUwr2FcemOeikse440=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XQUaSq50; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE90C32782;
	Fri, 16 Aug 2024 07:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723792821;
	bh=ljscXbotnhYskEj8hpcUc/0M9uoUIrVHHpbd44KFbs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQUaSq50R0+gNek21T/8KjbTcPvtBXOPia9QUYZkmp44CL+uVNWkfyZ3bjTT2hPVZ
	 6uG8qweT8X17vLqhJN3yIAo9YSvSPWvsBq6gtjKbx0LrePLRbebVhcdIYrdj8R1n23
	 7MS0LsidH9r2dQi1cnc1IhelTG4MGetPanloD36I=
Date: Fri, 16 Aug 2024 09:20:19 +0200
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
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
Message-ID: <2024081600-grub-deskwork-4bae@gregkh>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815173903.4172139-37-samitolvanen@google.com>

On Thu, Aug 15, 2024 at 05:39:20PM +0000, Sami Tolvanen wrote:
> Distributions that want to maintain a stable kABI need the ability to
> add reserved fields to kernel data structures that they anticipate
> will be modified during the ABI support timeframe, either by LTS
> updates or backports.
> 
> With genksyms, developers would typically hide changes to the reserved
> fields from version calculation with #ifndef __GENKSYMS__, which would
> result in the symbol version not changing even though the actual type
> of the reserved field changes. When we process precompiled object
> files, this is again not an option.
> 
> To support stable symbol versions for reserved fields, change the
> union type processing to recognize field name prefixes, and if the
> union contains a field name that starts with __kabi_reserved, only use
> the type of that field for computing symbol versions. In other words,
> let's assume we have a structure where we want to reserve space for
> future changes:
> 
>   struct struct1 {
>     long a;
>     long __kabi_reserved_0; /* reserved for future use */
>   };
>   struct struct1 exported;
> 
> gendwarfksyms --debug produces the following output:
> 
>   variable structure_type struct1 {
>     member base_type long int byte_size(8) encoding(5) data_member_location(0),
>     member base_type long int byte_size(8) encoding(5) data_member_location(8),
>   } byte_size(16);
>   #SYMVER exported 0x67997f89
> 
> To take the reserved field into use, a distribution would replace it
> with a union, with one of the fields keeping the __kabi_reserved name
> prefix for the original type:
> 
>   struct struct1 {
>     long a;
>     union {
>       long __kabi_reserved_0;
>       struct {
>           int b;
>           int v;
>       };
>     };
> 

Ah, ignore my previous email, here's the --stable stuff.

But this all needs to go into some documentation somewhere, trying to
dig it out of a changelog is going to be impossible to point people at.

> +/* See dwarf.c:process_reserved */
> +#define RESERVED_PREFIX "__kabi_reserved"

Seems semi-sane, I can live with this.

I don't know if you want to take the next step and provide examples of
how to use this in "easy to use macros" for it all, but if so, that
might be nice.  Especially as I have no idea how you are going to do
this with the rust side of things, this all will work for any structures
defined in .rs code, right?

thanks,

greg k-h

