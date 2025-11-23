Return-Path: <linux-kbuild+bounces-9778-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F3C7E245
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 16:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 98A054E1A67
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 15:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73551F5842;
	Sun, 23 Nov 2025 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="VlkQBt2c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DAA145355
	for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763910572; cv=none; b=ntch2c+i/wHqfuzCigWV5eallgduSRaun6s+ygPeSXWA+KNeuUd2DHFw99C3UtHwJV1PX2i0zVaktzj5rhwbdkYFJqExh5owf6abUQsACmC09Nq2KdODaKf/ppyZeKND/CTz+r5Ng009U26MRFq1S/z3xPLqqlN0+r93Q4Rswt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763910572; c=relaxed/simple;
	bh=tzK5vWIfvYqgkHQfHyrR6Djvmm582Z3zuElhaNh4R6o=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ntt6UHqI5Mr1GjG1mpQpwYaDpO9G3UfZCa7qYRVgjD6yH/odLRXHVTeeGJkhtc//mtEkeeXY4dpAGVYGem3mHZURXnuCi5VIzFEBsm52D0lW54loHihQ2/FP37xVhCAZDSvx7MG/+mVGyU/07jBCXzSZXQQ76kKgqXQJEtoOhCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=VlkQBt2c; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pYnxXGxePcmKdMcZ0fCAr8Y5GRyhHX6Qfr662/zdMhQ=; b=VlkQBt2c+utwInwyKCitudKBuA
	QriOyXsszVm6wezL4cIGzhNo8IovQGyXhl4cQLsHcTOPBNFSFq9SCr03R2YsC23A+q1op56S1d+vI
	RGOpETaemVEchbl8k5DPwuLme4sofAVHOsBtOeCxdWFaHVQC+OrfS42nX1+s4lK0Tc0GT+ckBWyKf
	eSZMOhfpYNIJ7dH+WQNNpuF7iERdvd6u/LEKjxKKd7L617+vX1laImWTe/VD7w82zewl74FMTPY0P
	StygOieVpHi/dZ33tbD//lQk+fjIECnGvMbrZ7CyJkUMoRk9kTkNZTXeR2q2edWyoQOC3ZnGZHpa6
	OukzIU7g==;
Date: Sun, 23 Nov 2025 16:09:41 +0100 (CET)
Message-Id: <20251123.160941.475051668667578407.rene@exactco.de>
To: chleroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
References: <20251123.131330.407910684435629198.rene@exactco.de>
	<d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,

On Sun, 23 Nov 2025 15:57:24 +0100, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> Le 23/11/2025 à 13:13, René Rebe a écrit :
> > Building a size optimized ppc64 kernel (-Os), gcc emits more FP
> > save/restore symbols, that the linker generates on demand into the
> > .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
> > too. They are needed for the amdgpu in-kernel floating point support.
> 
> Would have been interested to know with which version of GCC the
> problem started.

idk, maybe forever, or at least a decade fo GCC? Most devs probably
don't build size optimized, and addtionally we only use in kernel
floating point for amdgpu since recently? Should I add Fixes: for the
in-kernel FP hash?

> By the way you seem to fix the problem for modules, but does it also
> work when amdgpu is in kernel ? I would have expected a need to add
> functions in arch/powerpc/lib/crtsavres.S as well, just like following
> commits:
> 
> 8fe9c93e7453 ("powerpc: Add vr save/restore functions")
> 7fca5dc8aa7a ("powerpc: Fix module building for gcc 4.5 and 64 bit")
> da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc
> versions")

idk, I avoid linking that big stuff directly into the kernel and would
need to specically test that, too. I guess I go do that now, too, ...

> > MODPOST Module.symvers
> > ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > undefined!
> > WARNING: modpost: suppressed 56 unresolved symbol warnings because
> > there were too many)
> > Signed-off-by: René Rebe <rene@exactco.de>
> > ---
> > V2: description
> > Theoretically for -stable, but no previous commit that broke it.
> 
> In that case you have to add Cc: stable@vger.kernel.org
> Add indeed it is likely a gcc upgrade that broke it, not a previous
> commit.

Should I then simply use enabling amdgpu dc_fp and in-kernel FP as the
breaking commit for Fixes:?

Thanks!

	René

> > ---
> >   scripts/mod/modpost.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 47c8aa2a6939..133dfa16308a 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info
> > *info, const char *symname)
> >   		/* Special register function linked on all modules during final link of
> >   		.ko */
> >   		if (strstarts(symname, "_restgpr0_") ||
> >   		    strstarts(symname, "_savegpr0_") ||
> > +		    strstarts(symname, "_restgpr1_") ||
> > +		    strstarts(symname, "_savegpr1_") ||
> > +		    strstarts(symname, "_restfpr_") ||
> > +		    strstarts(symname, "_savefpr_") ||
> >   		    strstarts(symname, "_restvr_") ||
> >   		    strstarts(symname, "_savevr_") ||
> >   		    strcmp(symname, ".TOC.") == 0)
> 

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

