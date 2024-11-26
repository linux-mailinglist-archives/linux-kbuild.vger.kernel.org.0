Return-Path: <linux-kbuild+bounces-4870-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A99D99E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 15:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43A26B23A61
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 14:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F7419BA6;
	Tue, 26 Nov 2024 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cold-front.org header.i=@cold-front.org header.b="jFDs0K6O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="blkMquBK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B6F9454
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Nov 2024 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732632325; cv=none; b=AvOLDwx01+QwKswmp/pVxpS6JbWFImUAZmxSzs9b/skQ9gVmcVjD3SOykCcPuV7eH+9z0JgArK4ojfOxKzJL63Y8DPKevYFQjm8/hD/W0poJ4U1FmYgFlIqFJ2e+VhVBBAkUVHyC8tPPSE7ZQ3wbcAWFfc7jg/cT5JwCZFEKBU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732632325; c=relaxed/simple;
	bh=nKRCls9WZtOCSDmVC0lk6D+PogVP2imeJilK09AV11Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZKgIPOQcCiRd/8WQWnC4e0INHDu2TGl5Vr4eQWmQ7QsSPlL61dwtA+8jE9XEBe/g0/b9KAp+Maabk0SxrnhprWEV+jGkTw6xrEHGxXZOB+sZCKnzMm4WLL4q1NtBF7xedSLXWCC8TFHgEFwr9phes1vbM1ReE0+eIA37QzWDHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cold-front.org; spf=pass smtp.mailfrom=cold-front.org; dkim=pass (2048-bit key) header.d=cold-front.org header.i=@cold-front.org header.b=jFDs0K6O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=blkMquBK; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cold-front.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cold-front.org
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 5276B114019E;
	Tue, 26 Nov 2024 09:45:22 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 26 Nov 2024 09:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1732632322; x=1732718722; bh=FlAf2rksFHcXh7bdjkWfESCw/E1eXhdR
	XjPw7yTLv9A=; b=jFDs0K6OIpoYcll9qwOsFWJDKFr/ucT9ODy8dZIpHEUUDWRT
	UOUeh03tNN/02IqEwXgRYlwwbz1p/2yVNUEwhywAwg1eAmzt9LC1zGtX7R7eZaEL
	GOBPpwR4hdUhqh0HDAp2gHhXisUyowQwbHT3TD97lZxLTIgt6vBe6XeZEdn7fx1Y
	IhRbsWP6PUlye71nFmFWGXN1IEix/O+qgCIQoDYE2JyIiva9GvwHjN25U3UAghZc
	GEocyAL+G1TkFckHu4JpiqMkTolv/UR+aEcWYR/2isLkiL1NjqGLjX/EwovkCOXv
	DjCaQ2kk+44CcZMDLFKYcm7psNDnxxMBiljlNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732632322; x=
	1732718722; bh=FlAf2rksFHcXh7bdjkWfESCw/E1eXhdRXjPw7yTLv9A=; b=b
	lkMquBKlkfLNBDl15oigt+TTCnDTLRk8xZCZEbRvQsQZKkv8ypxndb8XNrlg67l0
	R94NRj1MnFe3tFjClG1thaAhys1e9m/3a0/oeuTM8Kc5CZ8Vw0NLddfabl2r7616
	t0fapcr9WQhn8ogr+ZsbXrkSAyX1HEYvzZuqpX/HOodnkT4mD/SS9sNzAZ23B+lA
	KwTKhMx7IpJqCMQUqQvq/bk6aMJNyoV+78IncVcNxnG22qI9vtw83wPq/fS8PAH6
	+5MKi7+lpcEQeQss5ezlEdgP9Co9ny5snQZPkNNpv80waOtAYdua/rLB47Sh1hOw
	54nJDWpVYfI5yttSClaPA==
X-ME-Sender: <xms:Ad9FZxJftxgYKUE4-RCDlrzGYcQIzAq78mhuuD5lyt7A0kPAN6vpfw>
    <xme:Ad9FZ9LCC84t93Y_IN9II8CLRGe3AlKP7gDH1aWLFL-1BbS66BQL71XCCY-CzxMqP
    WTcweTSu0jQM4-sVg>
X-ME-Received: <xmr:Ad9FZ5v3AvkQxgtoZTnyUoJ1khF2qDt3MVLfde_Fqt-TSoNVM50-8tdFDoMRL028H107gyoSIvLUJJ2yMdDe-j9N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeejgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhestgholh
    guqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeevtddvgfefleffgeethfef
    feehjeefvdffieekfefgtdegjefhffdtteevteffjeenucffohhmrghinhepghhithhhuh
    gsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdroh
    hrghdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    mhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Ad9FZyYbgKL9X5mmf1dBE833nfJuVjmYVm8imi_HLCwNulogqVYXHg>
    <xmx:Ad9FZ4Z3O4COlJaGkquCQR3HqeLngwHqSDWhcvAzr-WhRwPcHQfIvQ>
    <xmx:Ad9FZ2DkIuve8zClDTLlON9rvU_dDYthr0f4y9pI9XoBkL5mLyp4aA>
    <xmx:Ad9FZ2YOJ7JGsFkZSzNciqG-W5gZX9eVwIoQhB-WXOxh_aWhUxoNMg>
    <xmx:At9FZ3mvD7QDuDicgm6AQQdoPBMZc0WnmhnWLNVRGP-ieZRlSdBMJXyZ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Nov 2024 09:45:21 -0500 (EST)
Date: Tue, 26 Nov 2024 09:45:21 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Subject: Re: kbuild: use lz4 instead of lz4c
Message-ID: <Z0XfAbL5LbZjzISw@ravine.members.linode.com>
References: <20241125171800.1131761-1-jsbronder@cold-front.org>
 <CAK7LNARCB0Ce=gYjEZE1uSP0_Oyht91zxTQ1RZrMiChe3vgy+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARCB0Ce=gYjEZE1uSP0_Oyht91zxTQ1RZrMiChe3vgy+g@mail.gmail.com>

On 26/11/24 13:26 +0900, Masahiro Yamada wrote:
> On Tue, Nov 26, 2024 at 2:18 AM Justin Bronder <jsbronder@cold-front.org> wrote:
> >
> > lz4c has been considered deprecated by upstream since at least 2018 [1]
> > and has been disabled by default recently [2].  openSUSE Tumbleweed is
> > no longer packaging the deprecated version and others will likely
> > follow.
> >
> > Going back as far as Ubuntu 16.04/Fedora 25, both lz4 and lz4c are
> > installed as part of the same package and both accept -9 to enable high
> > compression so switching should be safe.
> >
> > 1. https://github.com/lz4/lz4/pull/553
> > 2. https://github.com/lz4/lz4/pull/1479
> >
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> 
> 
> I already applied a similar patch.
> 
> https://lore.kernel.org/linux-kbuild/CAK7LNAS0VzqcKDz_1ds5qJcASqxVizE3kkdRk1Yiidch9KMxEQ@mail.gmail.com/T/#t

Ah, apologies for not noticing that.  That patch definitely covers what I was
trying to achieve, so this one can be can be dropped.

Thanks!

-- 
Justin Bronder

