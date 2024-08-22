Return-Path: <linux-kbuild+bounces-3166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711095C1A2
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 01:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A5DB1C22F64
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 23:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEC1185B66;
	Thu, 22 Aug 2024 23:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gL5S/hgJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B9D17E006;
	Thu, 22 Aug 2024 23:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724370805; cv=none; b=i6kYY16vd51WhEWtlDmbKQZPGfgsdxXDFdS4v2gRHFREORdX+hF573BLuPXJ8UMTTNSGq/OSLzDX/ocesWfl/cXONUhOHByPvBmzXa5WdvFJBf95oN1VRHirbqxvPdoF84liV1ssu/gRQkYu2f0iNdRN7TEArZbIAx5VOi2NjbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724370805; c=relaxed/simple;
	bh=6lD90fEkzk22rUNebd5a66meC08lfiZvH3RkVogixlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lluh4txhydwg5ZB52+jkzZxhYQpzBoikw58JkPfmLdhiQZszmRwdvR6LYmEDIKcvS7YmSyEpQ00eyJzjqsUwrubIh9FkppRgvPdKhIAn4PongZziFFNeoxFwrIO2Uz4IjrOeM8/hugOFFK8NGh9uQaKLprb/EdhGdAfYyHQkhVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gL5S/hgJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43EAC32782;
	Thu, 22 Aug 2024 23:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724370805;
	bh=6lD90fEkzk22rUNebd5a66meC08lfiZvH3RkVogixlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gL5S/hgJuhJamjvZNM2mIyA1udbc07wRmD8aL8KOh3yLGmSuhIV0Ns6EFN1qGOuoN
	 6GWClz1z7RybwUlsSL9W/TWxoBc+4RmreiXT74AsdbvrrXJ+I8ThUo9s1/0rddJU9/
	 /ydCbjU17BMFzqp4hScYodklV8GORuNOCInOG/E0=
Date: Fri, 23 Aug 2024 07:53:22 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Matthew Maurer <mmaurer@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
Message-ID: <2024082356-stowing-endowment-555b@gregkh>
References: <20240815173903.4172139-37-samitolvanen@google.com>
 <20240819193851.GA4809@google.com>
 <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
 <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com>
 <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com>
 <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me>
 <2024082229-elevation-emporium-8118@gregkh>
 <bc2e02d7-d4a7-4f0f-852c-e26ad6a8688f@proton.me>
 <2024082257-refrain-subsector-b6c4@gregkh>
 <77e8e20c-8ca1-4df7-a4d7-ed77454f1754@proton.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77e8e20c-8ca1-4df7-a4d7-ed77454f1754@proton.me>

On Thu, Aug 22, 2024 at 12:00:15PM +0000, Benno Lossin wrote:
> > Here's one example in the android tree where 4 64bit fields are reserved
> > for future abi changes:
> > 	https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.10/include/linux/fs.h#421
> > 
> > And here's a different place where a field is being used with many
> > remaining for future use:
> > 	https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.10/include/linux/sched.h#1379
> > 
> > And also, we want/need lots of other space reservation at times, look at
> > how "Others" can get access to reserved areas in structures that need to
> > be done in an abi-safe way:
> > 	https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.10/include/linux/sched.h#1375
> 
> Let me correct myself, it's only possible to replace one `KAbiReserved`
> by one new field. You can have as many fields of type `KAbiReserved` as
> you want. The thing that you can't do is replace a single `KAbiReserved`
> field by multiple (well you can, but then you have to change the sites
> that use it).

That's odd/foolish, why would that be the case?  Isn't that exactly what
a union is for?  How are you going to know ahead of time what size types
to save space for?

All we really want to do here is "pad out this structure by X bytes" and
then later "take X bytes to represent this variable" at a later point in
time.

Surely rust can do that, right?  :)

> > All of this also needs to be possible in any structures that are
> > exported by rust code if vendors want to have a way to track and ensure
> > that abis do not change over time, just like they can today in C code.
> 
> All of those structs need to be `repr(C)`, otherwise they don't
> have a stable layout to begin with.

Do we have any way to enforce at build time that exports from rust code
are in this format to ensure that this will work properly going forward?
I guess someone is going to have to write the first api in rust that
actually gets used before we worry about this...

thanks,

greg k-h

