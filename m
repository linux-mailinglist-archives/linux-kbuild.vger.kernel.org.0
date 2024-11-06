Return-Path: <linux-kbuild+bounces-4534-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 099069BFA49
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 00:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B30481F22438
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 23:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AC620E01C;
	Wed,  6 Nov 2024 23:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNcDhYDU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09508383;
	Wed,  6 Nov 2024 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730936526; cv=none; b=qKToZjfEAlpkQ1ovQjBOxeh2zpcm0DlW6Y3KqwPCMYM8aNZoTjdeLpVNUGIi/3JSCHankiu20j4Nyf9+Pro3ZM5z94HNDPVl62agy216JDW0B73+KxCtLTwz9ExHxQWM0PXd68iMzX2s27JTHOkDdzsHxSSi8berExnverkRHIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730936526; c=relaxed/simple;
	bh=kwrvRtpnL9wQxwLPaB3tUfEYfC0qsi4v9251ehrqVeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD4xv17BXDghJNDpHEr8L5ZO64hlZ0NhL99jb9lB5mJL3rPcbCHI9behQkA06L2Lui110aue4O7BpGu+/lMKdFSzSgT+VFINgdYKd4FHU0Rs41LnCqMRQyvQwmX5hq+vJQfbQMJVjKO+YwFAlfoxNYTUdEm8ensbd7OLzwtNck4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNcDhYDU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B36CC4CEC6;
	Wed,  6 Nov 2024 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730936525;
	bh=kwrvRtpnL9wQxwLPaB3tUfEYfC0qsi4v9251ehrqVeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNcDhYDUdSPyfOdgNO8jvSiKfDe8h+ARB1B6QxdNU03dkrPGlTLnzCvdRheiGYXx1
	 B0fy/y+1nCzSja3bozoUAkxbMghhz24mKLBCO4D+eUvdFDm7T9bDj+0ttPwPCxyXbe
	 XI75HpGg+mXySsz+X8F+xGdbTewJAyk8FcjC3aEeB/cv2I1xb1XZaiA53EWRr/Et9H
	 1UA2V4JDnDklDyVod1sHvdZnBvd+Z3qRDqKsyhqblgtYa7iBUPbr4uz8fFxZi5m3gX
	 yKEr18QDqBxO3Kj4sWi0BdvCsFTzEmoCDVWPgn9ptfS0Mchoikhs3uTgGYj0RsbjPQ
	 DAXgeyF+NcTpA==
Date: Wed, 6 Nov 2024 15:42:03 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC] module: Strict per-modname namespaces
Message-ID: <Zyv-yxClglfwvmUa@bombadil.infradead.org>
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106190240.GR10375@noisy.programming.kicks-ass.net>

On Wed, Nov 06, 2024 at 08:02:40PM +0100, Peter Zijlstra wrote:
> Hi,
> 
> I've been wanting $topic for a while, and having just stumbled into the
> whole namespace thing by accident, I figured I'd give it a go, most if
> the hard parts seem to have already been done.

Neat, hch suggested something similar a while back

https://lore.kernel.org/all/ZCIiBHyrzDoTJPXT@bombadil.infradead.org/

> It reserves and disallows imports on any "MODULE_${name}" namespace,
> while it implicitly adds the same namespace to every module.

That's simple enough, I like it.

> This allows exports targeted at specific modules and no others -- one
> random example included. I've hated the various kvm exports we've had
> for a while, and strictly limiting them to the kvm module helps
> alleviate some abuse potential.

Yeah we also want:

EXPORT_SYMBOL_NS_GPL(bdev_disk_changed, MODULE_loop);
EXPORT_SYMBOL_NS_GPL(bdev_disk_changed, MODULE_dasd_kmod);

But we might as well have EXPORT_SYMBOL_GPL_FOR() with the implied
module list. We could then add just:


EXPORT_SYMBOL_GPL_FOR(bdev_disk_changed, loop);

But it would be nice to just also support this as well:

EXPORT_SYMBOL_GPL_FOR(bdev_disk_changed, loop, dasd_kmod);

That's possible perhaps something grotesque like this:

#define _EXPORT_SYMBOL_GPL_FOR_EACH(name, module) EXPORT_SYMBOL_NS_GPL(name, MODULE_##module);

#define _GET_MACRO(_1, _2, _3, _4, _5, NAME, ...) NAME

#define _EXPORT_SYMBOL_GPL_FOR1(name, a) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, a)

#define _EXPORT_SYMBOL_GPL_FOR2(name, a, b) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, a) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, b)

#define _EXPORT_SYMBOL_GPL_FOR3(name, a, b, c) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, a) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, b) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, c)

#define _EXPORT_SYMBOL_GPL_FOR4(name, a, b, c, d) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, a) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, b) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, c) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, d)

#define _EXPORT_SYMBOL_GPL_FOR5(name, a, b, c, d, e) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, a) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, b) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, c) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, d) \
    _EXPORT_SYMBOL_GPL_FOR_EACH(name, e)

#define EXPORT_SYMBOL_GPL_FOR(name, ...) \
    _GET_MACRO(__VA_ARGS__, \
               _EXPORT_SYMBOL_GPL_FOR5, \
               _EXPORT_SYMBOL_GPL_FOR4, \
               _EXPORT_SYMBOL_GPL_FOR3, \
               _EXPORT_SYMBOL_GPL_FOR2, \
               _EXPORT_SYMBOL_GPL_FOR1)(name, __VA_ARGS__)

  Luis

