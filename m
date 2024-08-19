Return-Path: <linux-kbuild+bounces-3097-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB3957323
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 20:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEF2C1F2230D
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881D81891C3;
	Mon, 19 Aug 2024 18:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="khTGhjIE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A00184535;
	Mon, 19 Aug 2024 18:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724091927; cv=none; b=K6tG/+3rBJzbL86Lhjuj18tXJZJWBGdK49NkbiSAWbBHfdEBp5eqrcHFbaE1sv1OANdbDWoyQ7h+HuZvLNGMmQbmQBns48SYSfPT4BgA4G4jaY+JX32NFfULmcKTaI5ngPjqoeqkONWVGbbyJGklkUiey+eS61MfqtUWQyIaraw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724091927; c=relaxed/simple;
	bh=yALXwTSmv4+UWSMtBlDSLjJMgKa3P7yXVK4NJJPbVuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+RG4JGpoHLp50FiGqtSsfRecRAoVcNsr2M5p0aM/Xamp4O/n88YnMY0VQdsqUmgXQlX7VxI6SZIa0kqaa3iGCAkbQXQM+EiTk7MzaqC+FgfkAavZVesjUOH7utPtD56tq3fs0WKxti1ogUWGaCS50g7ppqL+XCDgu1PtymxHRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=khTGhjIE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1ADC32782;
	Mon, 19 Aug 2024 18:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724091926;
	bh=yALXwTSmv4+UWSMtBlDSLjJMgKa3P7yXVK4NJJPbVuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khTGhjIEDs49GsU7Lni6hfu2hOgb9DN8IIC1iHGCgjowaDD/BBgdZqJLfwKDBcf4X
	 3+JGjsjbI8oChg72BHP6NxsvypU8TEGyxYKSAN/6WxncMvIj5hiYcANg6AXqGHX3Kn
	 mTbXr6frDV162Gs5cp4VUw7+XzQZUxmkZqkTRXtA=
Date: Mon, 19 Aug 2024 20:25:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
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
Message-ID: <2024081938-lyricist-estimator-c4eb@gregkh>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com>
 <2024081600-grub-deskwork-4bae@gregkh>
 <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>
 <2024081705-overarch-deceptive-6689@gregkh>
 <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>

On Sat, Aug 17, 2024 at 01:19:55PM +0000, Benno Lossin wrote:
> On 17.08.24 09:41, Greg Kroah-Hartman wrote:
> > On Fri, Aug 16, 2024 at 08:50:53AM -0700, Sami Tolvanen wrote:
> >> On Fri, Aug 16, 2024 at 12:20 AM Greg Kroah-Hartman
> >> <gregkh@linuxfoundation.org> wrote:
> >>> On Thu, Aug 15, 2024 at 05:39:20PM +0000, Sami Tolvanen wrote:
> >>> Especially as I have no idea how you are going to do
> >>> this with the rust side of things, this all will work for any structures
> >>> defined in .rs code, right?
> >>
> >> Yes, Rust structures can use the same scheme. Accessing union members
> >> might be less convenient than in C, but can presumably be wrapped in
> >> helper macros if needed.
> > 
> > That feels ripe for problems for any rust code as forcing a helper macro
> > for a "normal" access to a structure field is going to be a lot of churn
> > over time.  Is the need for a macro due to the fact that accessing a
> > union is always considered "unsafe" in rust?  If that's the case, ick,
> > this is going to get even messier even faster as the need for sprinkling
> > unsafe accesses everywhere for what used to be a normal/safe one will
> > cause people to get nervous...
> 
> The reason for union field access being unsafe in Rust is that you can
> easily shoot yourself in the foot. For example:
> 
>     union Foo {
>         a: bool,
>         b: i32,
>     }
> 
>     let foo = Foo { b: 3 };
>     println!("{}", unsafe { foo.a });
> 
> This is UB, since `3` is of course not a valid value for `bool`. With
> unions the compiler doesn't know which variant is active.

Understood, then why attempt to use a union for this type of "abi safe
padding"?

> Since unions are unsafe in Rust, we don't really use them directly (in
> the `kernel` crate, we have 0 union definitions). Instead we use certain
> unions from the stdlib such as `MaybeUninit`. But the fields of that
> union are private and never accessed.
> 
> In general, unions in Rust are very important primitive types, but they
> are seldomly used directly. Instead enums are used a lot more, since you
> don't need to roll your own tagged unions.
> 
> For this use-case (the one in the patch), I don't really know if we want
> to copy the approach from C. Do we even support exporting kABI from
> Rust?

That's the goal here, you want to create an abi that can change over
time without "breaking" the abi.  Usually this is just adding additional
padding in structures to have room for new additions.

> If yes, then we I would recommend we tag it in the source code
> instead of using a union. Here the example from the patch adapted:
> 
>     #[repr(C)] // needed for layout stability
>     pub struct Struct1 {
>         a: u64,
>         #[kabi_reserved(u64)] // this marker is new
>         _reserved: u64,
>     }
> 
> And then to use the reserved field, you would do this:
>     
>     #[repr(C)]
>     pub struct Struct1 {
>         a: u64,
>         #[kabi_reserved(u64)]
>         b: Struct2,
>     }
> 
>     #[repr(C)]
>     pub struct Struct2 {
>         b: i32,
>         v: i32,
>     }
> 
> The attribute would check that the size of the two types match and
> gendwarfksyms would use the type given in "()" instead of the actual
> type.

Remember the "goal" here is to NOT have to modify the places in the
kernel that use the new field in the structure, but for that to "just
work".  Your change here wouldn't allow that as any use of the new "b"
field would have to be through something in "Struct2", not directly in
Struct1, right?

We can mess with the structure definitions but we should not have to
touch the places where the structure fields are used at all.  If that's
going to be a requirement (as it sounds like it would with the use of
unsafe in the union), then this is not going to be a solution at all.

thanks,

greg k-h

