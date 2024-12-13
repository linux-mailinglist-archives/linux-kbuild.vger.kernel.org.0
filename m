Return-Path: <linux-kbuild+bounces-5120-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E59F0C9B
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 13:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABB4616342D
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7601DFD8D;
	Fri, 13 Dec 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzLFMXV3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDECF1547CA;
	Fri, 13 Dec 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093767; cv=none; b=dlfLcgl1yFW4f76mUxEE8+mtKpUzgRcHjIll9+M0zyaH5BIMcGcm7STBiEby3QJ+pLwgEHyLpsBtCVIHBhvDQMeerTm9wiS2I3nYFdebtju3ViggC+2yn/WPO36wmDFyNKSVIx6D71APlA6LloVkXy7TA+OcTrofuiV27l+v/dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093767; c=relaxed/simple;
	bh=5LnOks83tJiUJQ/hqa6qlPkuoi59TR5A0TBTEtlupew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cGOKK5pAw8UbF6cP5Po6mKss59eCEZ/+TBGTn0DMx6LwhoEzXtAACFPI/wb4silDrd1+7jw9WPs4N62QDinicbdZiVW7FLTVZX7RKR3qir8f5vD4AcVtZ2KtMOUqv4eTL1J1NC7EvPgwR3Kcv9ngAwL1zoA2huw24rv+tr39ctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzLFMXV3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A49EC4CED0;
	Fri, 13 Dec 2024 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734093767;
	bh=5LnOks83tJiUJQ/hqa6qlPkuoi59TR5A0TBTEtlupew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lzLFMXV3bxf8X/e5fkkLsB6aPnLMw/HJEznHGvCM629GZWma+M4dQMkfajCWIVmHP
	 Pb4id/2tgVy/LdMLfLLP5OFybBEvOHLhZlTKUPsyOFAR3aIVIWHiVNnG844kfbIrmQ
	 XvcR5HJ+nyaYyBXHtJD9/wF4b3u5Wij0c0cRvqjLQlxNRJdjN4GagNyKxfV7kWqHAJ
	 dG+eXgosF7MDFfvZm+/HF1z+KCqgHyCNFuVV4jUrDRagISFTo0RSlTFmjTpsgN2KvM
	 zU3rcNY1v5Zz3mhLkaVdt/0zhiCxckPGf062hrNUHbebCJPVBiv3RcgNBbjbeDEcJk
	 uN3n5flCRm7Nw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH v3 4/4] rust: add parameter support to the `module!` macro
In-Reply-To: <2024121324-ravine-kinswoman-c0d1@gregkh> (Greg KH's message of
	"Fri, 13 Dec 2024 12:46:13 +0100")
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
	<20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org>
	<awVcHcjxc0Q67ZefTn9cIb0LYzo881oLzGHP7dDnE2osOrgV7M6VJxjmiF65Uyj1Lo0JumqoDtOYbfVIth7HMA==@protonmail.internalid>
	<2024121324-ravine-kinswoman-c0d1@gregkh>
Date: Fri, 13 Dec 2024 13:42:35 +0100
Message-ID: <877c83eouc.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Greg KH" <gregkh@linuxfoundation.org> writes:

> On Fri, Dec 13, 2024 at 12:30:49PM +0100, Andreas Hindborg wrote:
>> This patch includes changes required for Rust kernel modules to utilize
>> module parameters. This code implements read only support for integer
>> types without `sysfs` support.
>
> read-only is VERY limited, and as such, only good for boot options,
> which as I mentioned before, is not how any "modern" kernel driver
> should be doing things.

I only added what is required to get rust null block compatibility
going. I did not want to add dead code - I heard that is frowned upon.

> And no sysfs interaction?  That's going to confuse the heck out of
> people wondering why the option they added doesn't show up in the same
> place it normally would if they did it in C, right?  Not that I'm saying
> this should be done at all, just that this is going to be confusing
> right off the bat which is probably not a good idea.

No, these work the same way as their counter parts in C. They reuse the
same C machinery. They just only allow the user to specify a subset of
the permission flags.

The C null_blk parameters are actually configured to appear read-only in
sysfs. I guess I should add that in a follow-up.

> Friends don't let friends add new module parameters to the kernel :)

OK, that makes sense. But I'm trying to build something that plugs
in where we currently have a piece of C code that relies on module
parameters.

Jens, would you be OK with Rust null block only providing configuration
through configfs?


Best regards,
Andreas Hindborg






