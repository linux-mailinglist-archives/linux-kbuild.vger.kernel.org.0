Return-Path: <linux-kbuild+bounces-10380-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40ECEA9AB
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 21:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A50933016DCE
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 20:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A57D2E6CA5;
	Tue, 30 Dec 2025 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv7foRQJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86C22D7B5;
	Tue, 30 Dec 2025 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767126209; cv=none; b=AY/pl7HVEDr+9TKz152DaqWu8yniUWhswuDE4b63YeXBEm5NE4jqe51ZcD0SZV+cWxl2eLQrG0w9ONz/vLHSBF9kpsNRKVa86JPwkZBeAnss35C1iH3rA57vGbj/4Z4GpVXOuoY1Hr78+Z54GGhohc4L0/6UEnGeR237QXiXaqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767126209; c=relaxed/simple;
	bh=1Zv2k7ah9l3UzPsLJ7NnWCOTmIAJnHwP0BwRDWVJOGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyWoM/bPmLLDEkliECBXf0xvIAxs+tu4DmQ8weUJdnXb8PvkbzZgVFmPeFOsJesUNXlWn89bbJD2VCHeuTZmPBkAmXaYe+YDmK+WIKe7hSFHujb2YzYs4zzawvapW66Syfu1azRRvQDAwKJWpDI1p3Yx7tUziuRZauJ80ho1lWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv7foRQJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B823BC4CEFB;
	Tue, 30 Dec 2025 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767126208;
	bh=1Zv2k7ah9l3UzPsLJ7NnWCOTmIAJnHwP0BwRDWVJOGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bv7foRQJQ7WyuAXSw7oSbzxIxXeoY73lV7Q6YYCXxFj9hgRYi0WWY2aonNUa9GlXT
	 WRnks4FADlpsyAVvYRCFM8SYmcH2IrdkOrxUwZyjARrYm06k+OLYA9k9wRihd+/LOy
	 z94UjUmzDdic6u8wo3mkxAUjOEhk70KOyNVz9vHLyJ1MQjlF/U0YFPVWK2VxRD5uXR
	 t0OOk1doWJAQ7QeCLEueyJb3oHBryAdMzFwCa6QVTCfwhJyQzNk32KOyg8Mn6ZUbUV
	 rW38w9LuO/zj2t8awKtqpuh/Em+c60iuSfmdS2+JEhmS2hcukXs66FbNH8+TcC2eHN
	 rmi1qj2J+zaSA==
Date: Tue, 30 Dec 2025 13:23:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
Message-ID: <20251230202324.GC4062669@ax162>
References: <cover.1766061692.git.gtucker@gtucker.io>
 <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
 <20251219212731.GC1407372@ax162>
 <50ee5ec6-ca9b-486d-ac7e-5a896006a9de@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50ee5ec6-ca9b-486d-ac7e-5a896006a9de@gtucker.io>

On Sun, Dec 21, 2025 at 09:09:17PM +0100, Guillaume Tucker wrote:
> On 19/12/2025 10:27 pm, Nathan Chancellor wrote:
> > On Thu, Dec 18, 2025 at 01:49:52PM +0100, Guillaume Tucker wrote:
> > ...
> > > +    def __init__(self, args, logger):
> > Adding something like
> > 
> >      self._args = [
> >          '--rm',
> >          '--tty',
> >          '--volume', f'{os.getcwd()}:/src',
> >          '--workdir', '/src',
> >      ]
> > 
> > here then adding an __init__() in the subclasses to append the runtime
> > specific arguments would allow _do_run() to be moved into
> > ContainerRuntime(). Otherwise, this looks pretty good and extensible.
> 
> Yes, I left these very similar parts as-is on purpose to make it very
> clear what the command line arguments are for each container runtime.
> It's a good idea to refactor this though as you mention, and I'll add
> a debug log message to print the command line instead.
> 
> I'm also anticipating that other runtimes will be quite different,
> Podman and Docker just so happen to have many options in common.
> Things like runc or containerd are very different beasts so I don't
> want to over-generalise.  But this is straightforward enough for now.

Yeah, I had figured that might have been the reason for keeping these
things separate, which does make sense. At the same time, I would rather
keep things simple and shared now since we can with no other runtimes
supported. If we want to add new runtimes in the future, undoing this
should be simple enough and make it obvious to see why the separation is
happening.

> So I'll rework this a bit in a v3.

Thanks a lot!

Cheers,
Nathan

