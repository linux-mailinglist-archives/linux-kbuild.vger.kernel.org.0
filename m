Return-Path: <linux-kbuild+bounces-4064-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B91999AEAC
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 00:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C6061C2178D
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 22:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482011D2707;
	Fri, 11 Oct 2024 22:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDHAF+ne"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A61D1E8F;
	Fri, 11 Oct 2024 22:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728685786; cv=none; b=AuYyp5Ss1BQT9uVb3gVGPEWtGuOYIeVhtd5E1EzCM+Bs0Q4e7XnqI+yJDi2B/QxHjCBHw8/8MwV01vJT6qjDjNZv5W2BE5qgMuOseAfsh0uD6YC1hkLK34b9E8OKxp1GI3AuZ9LocbM2bl+oUJ+37RJuYI1d8ECFixUMtbJCvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728685786; c=relaxed/simple;
	bh=wZS4VQegsNngLJ9V7EauM0gh2ui7E6Eg3FpMuFwjhdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQniALRz9Jlg/eFWV2XdpR98e55WecxJN4hA/CZiLkrEMsfgmVr8+0bW8Q9zQmTGJz2d3AkG9ZTE/Bazcp8c+ZxKksJrPf6vjt20kZLoVj4QYAF79nuJ4WAZsx7MdxaGR4i0Vs0RO1eKXR3bFyMldY0jHVYyKAnMesMg8SbSr1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDHAF+ne; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CCCC4CEC3;
	Fri, 11 Oct 2024 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728685785;
	bh=wZS4VQegsNngLJ9V7EauM0gh2ui7E6Eg3FpMuFwjhdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDHAF+ne/FwxRwj0AijUlHHb4TIETTUPF1XaKzprLDQyyjdE/+7UzJaCVk6KnJVjz
	 ljfE1fQxsuQsI7uC3ssJbh8eTqCt32WIBG2V9j1nMCn5LcScM08wp2ltS5rMQXn81A
	 aGQPwdLmtPs/1yNBIU9YAt/gpK2hqYAhe1R7M/+kVncKeeGR8JLVSANSHVw7nZmell
	 PmFh5FPq5zHBgAX9YHiNsMwppnWB80DR+tvq8JKAB4Rm/8KyaEKLp6lhXFAG68Jo1Z
	 qXIZ5YHbUJNBut1LunRmNZNodbZIQtYbZW3Z7T5+ef71dbagEkbiXBQebJnUjLT8Zj
	 AOdhktTipnWgQ==
Date: Fri, 11 Oct 2024 15:29:43 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Alex Gaynor <alex.gaynor@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st,
	j@jannau.net, asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v5 13/16] export_report: Rehabilitate script
Message-ID: <Zwmm1yN1udGuGn7T@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-14-mmaurer@google.com>
 <Zwmi-MEVE_E4nkzl@bombadil.infradead.org>
 <CAGSQo03H=O5id=bdRorHmRLNzGM9njcRradQUvjpngk3sXfViw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo03H=O5id=bdRorHmRLNzGM9njcRradQUvjpngk3sXfViw@mail.gmail.com>

On Fri, Oct 11, 2024 at 03:22:54PM -0700, Matthew Maurer wrote:
> On Fri, Oct 11, 2024 at 3:13 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Wed, Sep 25, 2024 at 11:38:28PM +0000, Matthew Maurer wrote:
> > > * modules.order has .o files when in a build dir, support this
> >
> > The commit log is not clear, is it that it's always had *.o files, and
> > you're adding them now, why? Why is the .ko search now removed?
> 
> The script was broken when I found it,

My point is that commit messages should describe all this.

> but it was a script that
> analyzed MODVERSIONS, so I tried to ensure it would still work with my
> changes.

OK yes please add this informaiton into the comit log.

Also expand on it as to to *why* this was not a critical issue.

> This necessitated rehabilitating it first. I did not touch
> `.modules.order` files, but they contained `.o` and so this script
> wouldn't run correctly.

Just elaborate on the commit log. We cannot guess what is happening, and
so bringing clarity into exactly what you are doing and *why* is helpful
to determine the impact of not applying this.

> > > * .mod.c source layout has changed,
> >
> > When, why did this change not happen at that time?
> 
> It was changed for readability [1] back in 2019. I assume the change
> did not happen at that time because this script is rarely run.

This is crucial information to include in the commit log. When *would*
you use it? So that use case was broken since 2019? What negative
effects has this implicated?

> If we'd
> prefer to discard this patch and ignore the script instead (or remove
> it?), that's fine.

The feedback is for you to improve the commit logs, not to tell you to
not do something. We cannot read your mind, and this smelled like a fix,
but without a true evaluation and documentation of the impact of not
having this in place. These things need to be thought out and written
in the comit log.

> 
> [1]: https://lore.kernel.org/all/20190909113423.2289-2-yamada.masahiro@socionext.com/
> 
> >
> > > update regexes to match
> >
> > Why did this not break anything before ? Is this fixing something, or
> > is it prep work?
> >
> > > * Add a stage 3, to be more robust against additional .mod.c content
> >
> > Future .mod.c changes?
> 
> The rest of this series adds additional `.mod.c` content to support
> the string names. This stage 3 is intended to prevent that from
> causing the script to choke.

The commit log should clarify all this.

  Luis

