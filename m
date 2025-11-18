Return-Path: <linux-kbuild+bounces-9671-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC2C6AF10
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 18:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 3E0D22D1C7
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 17:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9174833C19E;
	Tue, 18 Nov 2025 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="Yx2WBjr0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC86433C1AF
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486362; cv=none; b=fXLswkZ+09FL4cM9yhbFuDbJUG+h1zEdbcZfpPHyBKmAX11SkxXQHEQsErlB8nxqedCjEG2dQp2nNpcx7oGcLHcJQytbB+H9mXuNFwEOcDni7kDXtBT/7H3asuwUPlBpeZ3Fgwc8884m5Ac5ZyN2EeDSSVK9uok9gLe9PbFpu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486362; c=relaxed/simple;
	bh=KwPJaWM1JaotREDHzT9ew5cNRJpg+qhxZGBELdFseGc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jQ/ErGEl8iqoFIosdh+g0cPO4S/bY8jaOLvi7GJ3Z7IWkQ5BbEW52ADXh3g8qgvnJ8IpCjDCRpPvHPZ3pl53kcAXKybpKV84J4Gc5NU74A2w5M3IaWDar/YLTHljfwZ6EXYQBw5v2YON7qlmFeB8r2+mxzVFBzTnm4YWNUDmH4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=Yx2WBjr0; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bP7IS4BNaU4htgSTSaOq9yg1qieTaZzZOWRZt7CyTqI=; b=Yx2WBjr03mdDSpA89fUq2JlJQP
	bV1AmC54RbdHbFNLvuflIdEng9WJPc7MZ/uFw/aa2h8nPYo838w+OA8f0EnxtXBDi81fb4RhIHUuM
	MGXA5lXt2gaOGP42LKQzVbYT1tT5qbxLNcqA/MsmQzxA4YQoFIJ3ZOis5c6HS8mC0gAj6kqwPuiIZ
	gvuXU6g/k7KbDao9mwJWV0olNsAfoMCTogRLOoFJRaNR1W/9NBODGR87G3LnzY0L+gNmwvlMSXfIg
	ID7/MKhX6MT3CCoskN8jgMrRCzG7nO5Is7LbZqWGseLz1jnZaWhTp2HiGHw1brzplAETU92oa8a7b
	SrYFOyOA==;
Date: Tue, 18 Nov 2025 18:19:28 +0100 (CET)
Message-Id: <20251118.181928.392761539252490710.rene@exactco.de>
To: christophe.leroy@csgroup.eu
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH] modpost: amend ppc symnames for -Os build
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <748c8f8c-23ed-4589-9521-a948cce40922@csgroup.eu>
References: <20251118.131735.802732108462696577.rene@exactco.de>
	<748c8f8c-23ed-4589-9521-a948cce40922@csgroup.eu>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hey Christophe,

thank you for your quick review!

On Tue, 18 Nov 2025 15:25:14 +0100, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 18/11/2025 à 13:17, René Rebe a écrit :
> > [Vous ne recevez pas souvent de courriers de
> > rene@exactco.de. Découvrez pourquoi ceci est important à
> > https://aka.ms/LearnAboutSenderIdentification ]
> > Building a size optimized ppc kernel, gcc emmits more symbols than
> > currently allowed listed in scripts/mod/modpost.c. Add to fix:
> 
> You should say when the problem started to happen, and what those

I guess always, or at least for a long time with -Os functions have a
certain pattern or size. Maybe the size of amdgpu and certainly the
DC_FP use triggered the floating point ones for me.

> functions are supposed to save and restore.
> 
> As an exemple see commit 8fe9c93e7453 ("powerpc: Add vr save/restore
> functions")
> 
> Also confirm it is only needed on powerpc64, if so make it clear in
> the commit message.

The fp ones can only occur for ppc64 right now as long as:
ARCH_HAS_KERNEL_FPU_SUPPORT      if PPC64 && PPC_FPU

If the gpr ones are emitted by gcc for ppc(32) I would need to
specifically review. As it is mostly the more modern ppc64, I'll use
that for v2 then, ...

	     René

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

