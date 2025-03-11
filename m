Return-Path: <linux-kbuild+bounces-6076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D440BA5D153
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 22:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD27189E88C
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 21:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0280D224AEB;
	Tue, 11 Mar 2025 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="APt9RGl0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E429222572;
	Tue, 11 Mar 2025 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741727100; cv=none; b=aDp1owstudP5gxT0xN5bTyMmpaJo6MZ0mPBpnca2bamRUllOVMIF7Xp/efONZfMeNwKwaVICPKjK9jYX7mnUmq/I82RfYCxJqZu8dXCBY7oAepXmLk1hRGgb5QAmOsZT+ijgTDMNST2cHoghN8qOzGcR40SmwD38TnnTsBO6Pvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741727100; c=relaxed/simple;
	bh=PbrbTkpkyfNdlih0/V9VTYpRyWEsPGhl4jbqwjfOzS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBi3YKsWPK3PFrjnTXcNKbqWB8oizHDY/Vuc/1yRDEpgiXvLSPPQMGcPiX+JOPNsMo+rbVyUhPBNIgSU9CsSFA2dtqOVI9L6nK2iTHZ/XxntvYlLFJJEbO9sDnnxNu8BhY+7ZEvVnWwrCSbuwoSuDro8rqpYGaj2rSO8KSFjUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=APt9RGl0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741727097;
	bh=PbrbTkpkyfNdlih0/V9VTYpRyWEsPGhl4jbqwjfOzS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APt9RGl0K7e6V6tAglj0pmLww/GIZ1pLxh4x5Nw4NaMGTMwMtIk42wJ4Cl8IUoq/I
	 e1Hb3OINFntBeG99F2S4vY+QG3sIOuhYj43WSQeXZ8u2xIj9fhAHbQQ7c38W7aUznf
	 opECeFb/PU2LM3mVVpio3JrrhM5Pa5riJ+dXli40=
Date: Tue, 11 Mar 2025 22:04:56 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Urgau <urgau@numericable.fr>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths
 relative
Message-ID: <ed6acfb2-f1a0-4713-8401-60b0cfcd2e91@t-8ch.de>
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
 <CANiq72mcpVL1YXyDFi-PrbQ2Uh0WUA_VNqLZaOeqQnpY5HnX8Q@mail.gmail.com>
 <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com>
 <c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk>
 <CAK7LNARdPcnsaP-z7tZUQLqAgBXD90XsEWAtTy8aTwDpTqMo9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARdPcnsaP-z7tZUQLqAgBXD90XsEWAtTy8aTwDpTqMo9A@mail.gmail.com>

On 2025-03-12 04:07:51+0900, Masahiro Yamada wrote:
> On Wed, Mar 12, 2025 at 2:36 AM Ben Hutchings <ben@decadent.org.uk> wrote:
> >
> > On Tue, 2025-03-11 at 20:03 +0900, Masahiro Yamada wrote:
> > > On Mon, Feb 17, 2025 at 10:23 PM Miguel Ojeda
> > > <miguel.ojeda.sandonis@gmail.com> wrote:
> > > >
> > > > On Mon, Feb 10, 2025 at 6:11 PM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > > > >
> > > > > Remap source path prefixes in all output, including compiler
> > > > > diagnostics, debug information, macro expansions, etc.
> > > >
> > > > Hmm... We don't do all the cases in the C side -- the docs ask to use
> > > > `KCFLAGS` when one wants to remove them in the debug info:
> > > >
> > > >     https://docs.kernel.org/kbuild/reproducible-builds.html#absolute-filenames
> > > >
> > > > I am not sure if there is a reason not to cover all cases in C (Cc'ing Ben).
> >
> > I think we should use the prefix-map options by default, for both C and
> > Rust code.
> 
> A patch is appreciated.
> (top-level Makefile change with updates
> in Documentation/kbuild/reproducible-builds.rst)

I'm happy to send a patch.
The new patch will conflict with the rust patch.
Could you push the current kbuild tree to git.kernel.org so the new
patch can be based on top of it?

> > The default of using absolute filenames only works when the build and
> > debug systems have their sources in the same absolute directory.  For
> > some developers this will always be true because they're the same
> > system.  In the general case, and particularly in production, it's
> > unlikely to be true.  See below.
> >
> > > GCC manual mentions the below about the -fdebug-prefix-map=old=new
> > >
> > >
> > > "It can also be used to change an absolute path to
> > > a relative path by using . for new.
> > > This can give more reproducible builds, which are location
> > > independent, but may require an extra command to tell GDB
> > > where to find the source files."
> > >
> > >
> > > I guess "the extra command" might be a bit annoying.
> >
> > The command in question is "dir <source-root-directory>".  It's not
> > particulary annoying.  It also isn't needed when invoking gdb with the
> > kernel source root as its current directory.
> >
> > Running that command adds the directory to gdb's source search path,
> > causing it to look for sources referenced in debug info by:
> >
> > 1. Appending the full filename to that directory
> > 2. Appending the base filename to that directory
> >
> > (This is slightly simplified from the docuemntation at:
> > <https://sourceware.org/gdb/current/onlinedocs/gdb.html/Source-Path.html#Source-Path>.)
> >
> > When the debug info has relative filenames, case 1 should always work.
> >
> > When the debug info has absolute filenames, case 2 can work if all
> > sources are in the same directory.  But the kernel has source files
> > spread across many directories, so there's no general way to make gdb
> > find them all.
> >
> > Ben.
> >
> > --
> > Ben Hutchings
> > A free society is one where it is safe to be unpopular.
> >                                                       - Adlai Stevenson

