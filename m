Return-Path: <linux-kbuild+bounces-8758-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 145A6B47C20
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Sep 2025 17:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0E318979BC
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Sep 2025 15:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07F8277017;
	Sun,  7 Sep 2025 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWSDIbRd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663921018A;
	Sun,  7 Sep 2025 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757259621; cv=none; b=O6XJi8XkJCKvAPmoVIbG7jfXtJecphY7GBYzH2QQ5oRAolcZxfMn01H7QuXYpkBnVo+5K6nQEiNuAhfVUwwgaHOumNgKcVtb3L7AK4pAbjT45WtXwo/uE4tOkgXIIIgm3QoYc2ql8u1Gs8+LS/1V0HfHMHx2To/5cOHjvSu1ce4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757259621; c=relaxed/simple;
	bh=W83tEYug+zv0fXq+lOMdR31cDiPDBp2hZELVyc+e4rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gS3w0Wmpo6HkLeC6GGiyhu9ZRuivyU3NpM8HjoKclOXUpqBSTuaTmi4YeWZ520g3UMJbvI3jsNLV9zTTjtNPbvSnI0fXGZIKl8tfJ0lnxQPYUki2ZeDYpiQZEHFwOG1MU+OXesrkiTH9exT8wlXvItIb/NGOm0xSUD7M69z3Nsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWSDIbRd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7474C4CEF0;
	Sun,  7 Sep 2025 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757259621;
	bh=W83tEYug+zv0fXq+lOMdR31cDiPDBp2hZELVyc+e4rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pWSDIbRdZ7fBY46KzibixD4k/DK+H7WYqneUfAsUqj5F1oCGWqqcMXQOZhUHoyrpE
	 UwDm754wW9SKavR4NdTaWFUwPsWYZtjUO0QDutzvfXMAS68OtbyJQyCwGaUVDUnmUl
	 1V9PMu4NVf7JaAhOT1aDTx55lBqgxVYhRHLON3BgfpRdaUsZ0Oo326mZlKL4q4uXOp
	 rZY3s/VOarOJWW6p1IdXbqyCtOUp61LkrqOvb+/Fy4WyuFR+/8Tj+6mGgoMAlwINf+
	 A4QXbdVc2QnfclhNLI+5+DveKcYqXB6a7ibNByrGLqGpYN7Qc5JS5fmAgMWgiuE0j3
	 /Y6I0gciRF85A==
Date: Sun, 7 Sep 2025 07:24:07 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <aL0W9xvpktaLE9m2@levanger>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
 <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>
 <20250827224935.GB414199@ax162>
 <20250828083747-e819430a-986f-4f71-bbc8-e402e339c9a2@linutronix.de>
 <20250903223131.GA2264021@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903223131.GA2264021@ax162>

On Wed, Sep 03, 2025 at 03:31:31PM -0700, Nathan Chancellor wrote:
> On Mon, Sep 01, 2025 at 11:51:03AM +0200, Thomas Weißschuh wrote:
> > Exactly. The normal cases can be handled generically. For example the kconfig
> > below works for architectures which only differ in byte order and 32bit/64bit,
> > which are most of them. MIPS should require more logic.
> > Also I'm ignoring x32, as it is never the kernel's native ABI.
> > 
> >  config CC_CAN_LINK
> >         bool
> > +       default $(cc_can_link_user,$(m64-flag) -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
> > +       default $(cc_can_link_user,$(m64-flag) -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
> >         default $(cc_can_link_user,$(m64-flag)) if 64BIT
> > +       default $(cc_can_link_user,$(m32-flag) -mlittle-endian) if CPU_LITTLE_ENDIAN
> > +       default $(cc_can_link_user,$(m32-flag) -mbig-endian) if CPU_BIG_ENDIAN
> >         default $(cc_can_link_user,$(m32-flag))
> > 
> > 
> > > Feels like that could get complicated quickly but this would probably be
> > > the objectively most robust and "hands off" option.
> > 
> > Agreed.
> 
> Nicolas might feel differently but this does not seem terrible to me,
> especially with a macro to wrap the common logic, which is where I felt
> like things could get unwieldy. Feel free to send an RFC if it is not
> too much work.

yes, at a first glance this looks ok to me, too.

Thanks,
Nicolas

