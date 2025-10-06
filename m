Return-Path: <linux-kbuild+bounces-9004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5233BBDAB0
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 12:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 984CF1896D87
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 10:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26EB2264B9;
	Mon,  6 Oct 2025 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iBtFvHCr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BI3bW8fZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD9B223DF6;
	Mon,  6 Oct 2025 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759746039; cv=none; b=HKIzbpGOJ7QSUY8NsR3XRBoh+LMMESiN0Ci4TSrrv/RdRsE1JyQ6QgSmXwpKEbdI9u/3G840aNWcU+99j5Em7/AnbvutkrqWKd7ep+T4c0OvU3hIsX4g1IHhw0Hdr63Egz/tpVOkq4bpHClBCZjgcDIE1PP49mbvdZ6Su954268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759746039; c=relaxed/simple;
	bh=7tUIVOnBx2u/uu7Z13kNQw14prnwiGlGx7B9Lxz4QB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6/c90QDC+C4X5V4Cfns0ymI+C7//8H2iDBQW/QwYeyQjKO2OYk/st4LibAI9v5ZU2VyEe/DtMxr82J5Cen+QqIhBSdll+2npnGIJAzOose4fo84mRs1rdkVwV6ErW8r0ocSEVR6S3FqlgWu3xbmGr6zm1K714Yzxx2gGv+6tFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iBtFvHCr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BI3bW8fZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 6 Oct 2025 12:20:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759746035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7pwVoSdv1X5HI3eQKvSi2SkXzIB5AnrHLTDBFpfnXxs=;
	b=iBtFvHCr+HAlrc15Bs6fFMlAo9ESmAfL/Ty/LFZZWke/WgqQTbsc5MTIxW6rfqX9b7pK0S
	Ezq+i5UzVx3Cd10aci7LOV/eJzcJIBR14WRMYCXE9F8fBmjOms7Sz/cmhXyquYXtREvMin
	UlAYAv9+sGoWy7ecqoeinRleLzOJVx8FcUFZJyzzHh+Gaw8P/zOICCd7qiMxJSNsKLH0HH
	UAy0glOl7BQjFdgVdeS+78EIBgXenZ/ceT22ApyuSLcYFYQvtCC0fNyBXARRNLfn45nxgv
	NRERiDQsd2+R7BnwCiXBkn916ZJaZCVStNrcmT6NuRlDEjXd+lr91xc86IELxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759746035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7pwVoSdv1X5HI3eQKvSi2SkXzIB5AnrHLTDBFpfnXxs=;
	b=BI3bW8fZsx40S1pOx7Kc7phTjbm5TW9S1wOL3g2UUn9Wzifj4/EMnVgBwf449rsw/OdrUq
	T2PXqUFnHjayWhAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>, Nicolas Schier <nsc@kernel.org>, 
	a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	sam@gentoo.org
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
Message-ID: <20251006121330-1ca87091-ad31-4691-b3e8-a08ec02cd15b@linutronix.de>
References: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
 <20251005011100.1035272-1-safinaskar@gmail.com>
 <20251005205335.GA2561157@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005205335.GA2561157@ax162>

On Sun, Oct 05, 2025 at 01:53:35PM -0700, Nathan Chancellor wrote:

(...)

> In looking further into this, I noticed that in its current state,
> -Werror is not getting applied to scripts/basic/fixup or
> scripts/kconfig/*.o files (seems $(include-y) happens to late?), which
> was one of the reasons to avoid making it depend on CONFIG_WERROR or
> W=e. If that's the case, we could probably make it opt in like the rest
> of the warnings for the kernel, which should be a fair compromise
> between wanting to make potential issues more obvious while not
> impacting people who build old sources with new compilers.
> 
> Thomas and Nicolas, thoughts?

Yeah, fixdep and script/kconfig seem to be specifically handled in the
'ifdef config-build' block in Makefile. And this happens explicitly
before 'include .../auto.conf'. So your diff below looks like the
correct solution. Thanks for taking a look!


Thomas

