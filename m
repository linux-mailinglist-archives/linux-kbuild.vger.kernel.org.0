Return-Path: <linux-kbuild+bounces-3149-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D4795AF46
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 09:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B792860C1
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 07:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E51A13AA4E;
	Thu, 22 Aug 2024 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CenOI7hN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B875713C3CD;
	Thu, 22 Aug 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724311782; cv=none; b=pNWJ9WrGjFrN5VIeiQNDE0WBtyHXlVV84IdGDuboordigRi/XDPRlt65ZiGr2x9n73U2YIx64jLSphHLSbIgOE8e7fSn+4vciBrbYZOZgqXkFVTkE6qo0KjLUOSOD0oKhl9YvzwlJatjTmCJK1+EErYz+avmL2Bxv2XZNOiLrZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724311782; c=relaxed/simple;
	bh=w9XdQWD6yVQTR5oVc6W0zIErtl2bKpEKa4fn20IwpwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfsny3u1JfK14t6G/I8gJVfdSu5t+i7kn+W99bQg7mFiDRZAcWSjZRAXtYsxfXDzXzMUXw2t7Jbq3k1CkVbdL5jHHdJXXk5Afaual7m5A7Wwp6z2Zfos5YJUA5uRCeFfDwU0bLbR4+lqEB1c9WtUZAvtwlkY5BgfKmEij5/AMic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CenOI7hN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC94C4AF09;
	Thu, 22 Aug 2024 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724311782;
	bh=w9XdQWD6yVQTR5oVc6W0zIErtl2bKpEKa4fn20IwpwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CenOI7hNmkkdPQerFofPvI5PWphImINR3YR6l/6bFB6W6+4D6CpX0xNeLP0CQMVbw
	 SLk0DDz2HOMzLoFCVapXtHJi7llGiLMU8DVFx04DSfGxf41xBkVJp2Vo6P+/vEYeSo
	 zVyvum9zIIZPftdk+YNY6AyQhX+gqDqDTl9Y04WU=
Date: Thu, 22 Aug 2024 15:29:39 +0800
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
Message-ID: <2024082257-refrain-subsector-b6c4@gregkh>
References: <20240815173903.4172139-37-samitolvanen@google.com>
 <2024081705-overarch-deceptive-6689@gregkh>
 <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
 <20240819193851.GA4809@google.com>
 <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
 <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com>
 <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com>
 <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me>
 <2024082229-elevation-emporium-8118@gregkh>
 <bc2e02d7-d4a7-4f0f-852c-e26ad6a8688f@proton.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc2e02d7-d4a7-4f0f-852c-e26ad6a8688f@proton.me>

On Thu, Aug 22, 2024 at 05:55:32AM +0000, Benno Lossin wrote:
> On 22.08.24 01:29, Greg Kroah-Hartman wrote:
> > On Wed, Aug 21, 2024 at 11:31:25AM +0000, Benno Lossin wrote:
> >> On 20.08.24 22:03, Matthew Maurer wrote:
> >>>>> The way `KAbiReserved` is implemented is via a `union` (maybe a bit
> >>>>> ironic, considering what I said in my other replies, but in this case,
> >>>>> we would provide a safe abstraction over this `union`, thus avoiding
> >>>>> exposing users of this type to `unsafe`):
> >>>>>
> >>>>>     #[repr(C)]
> >>>>>     pub union KAbiReserved<T, R> {
> >>>>>         value: T,
> >>>>>         _reserved: R,
> >>>>>     }
> >>>>
> >>>> I like this approach even better, assuming any remaining issues with
> >>>> ownership etc. can be sorted out. This would also look identical to
> >>>> the C version in DWARF if you rename _reserved in the union to
> >>>> __kabi_reserved. Of course, we can always change gendwarfksyms to
> >>>> support a different scheme for Rust code if a better solution comes
> >>>> along later.
> >>
> >> Yeah sure, that should also then work directly with this patch, right?
> >>
> >>>> Sami
> >>>
> >>> Agreement here - this seems like a good approach to representing
> >>> reserved in Rust code. A few minor adjustments we discussed off-list
> >>> which aren't required for gendwarfksyms to know about:
> >>> 1. Types being added to reserved fields have to be `Copy`, e.g. they
> >>> must be `!Drop`.
> >>> 2. Types being added to reserved fields must be legal to be
> >>> represented by all zeroes.
> >>> 3. Reserved fields need to be initialized to zero before having their
> >>> union set to the provided value when constructing them.
> >>> 4. It may be helpful to have delegating trait implementations to avoid
> >>> the couple places where autoderef won't handle the conversion.
> >>>
> >>> While I think this is the right solution, esp. since it can share a
> >>> representation with C, I wanted to call out one minor shortfall - a
> >>> reserved field can only be replaced by one type. We could still
> >>> indicate a replacement by two fields the same as in C, by using a
> >>> tuple which will look like an anonymous struct. The limitation will be
> >>> that if two or more new fields were introduced, we'd need to edit the
> >>> patches accessing them to do foo.x.y and foo.x.z for their accesses
> >>> instead of simply foo.y and foo.z - the autoref trick only works for a
> >>> single type.
> >>
> >> We will have to see how often multiple fields are added to a struct. If
> >> they are infrequent and it's fine for those patches to then touch the
> >> field accesses, then I think we can just stick with this approach.
> >> If there are problems with that, we can also try the following:
> >> all fields of kABI structs must be private and must only be accessed
> >> through setters/getters. We can then modify the body the setters/getters
> >> to handle the additional indirection.
> > 
> > That's just not going to work, sorry.  Remember, the goal here is to
> > keep the code that comes from kernel.org identical to what you have in
> > your "enterprise" kernel tree, with the exception of the few extra
> > "padding" fields you have added to allow for changes in the future in
> > the kernel.org versions.
> 
> Yeah, that's what I thought.
> 
> > Requiring all kernel.org changes that add a new field to a structure to
> > only do so with a settter/getter is going to just not fly at all as they
> > will not care one bit.
> > 
> > Or, we can just forget about "abi stability" for rust code entirely,
> > which I am totally fine with.  It's something that managers seem to like
> > for a "check box" but in reality, no one really needs it (hint, vendors
> > rebuild their code anyway.)
> 
> The approach already works for a adding a single field and I got from
> the discussions with Matthew and Sami that that is the most common case.
> We will reach out to the Rust folks and see what we can do about the
> multiple field case.

No, single field is NOT the common case, the common case is reserving
multiple padding variables in a structure as lots of things can change
of the long lifetimes of some of these kernel trees.  Look at the
changes in the Android or SLES or RHEL kernels for specifics.

Here's one example in the android tree where 4 64bit fields are reserved
for future abi changes:
	https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.10/include/linux/fs.h#421

And here's a different place where a field is being used with many
remaining for future use:
	https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.10/include/linux/sched.h#1379

And also, we want/need lots of other space reservation at times, look at
how "Others" can get access to reserved areas in structures that need to
be done in an abi-safe way:
	https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.10/include/linux/sched.h#1375

All of this also needs to be possible in any structures that are
exported by rust code if vendors want to have a way to track and ensure
that abis do not change over time, just like they can today in C code.

Or if not possible, just don't export any rust structures at all :)

hope this helps,

greg k-h

