Return-Path: <linux-kbuild+bounces-9779-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2761AC7E28D
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 16:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A0F05340799
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 15:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4AB1EB5FD;
	Sun, 23 Nov 2025 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="Tpb/gHw0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B411DE3DC
	for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763911540; cv=none; b=SLgKnYR3DaF16wRinX6onVzoez7KxP3VaOnh9GbpBduYzUIwqtkJh9yGmSubXuvnq7TMs+rbUbUhEXgx/1qTNvtPkN+taItAs9Dgwn38+XNgULz/eC4wtWoLXt89H46jvrot8O0pFni/BTM4yS7KEJEv8Bmv9ahw8whuKMNUpO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763911540; c=relaxed/simple;
	bh=fc6x2IHOWwVBZstnmL+CH1AXGHKVmKWdnSTmn0CDGyg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bbLqMMr0UstFxYhPoUzQkGDswYrT3yUYdBry4etTTdApEYUVJLyKIXVw2ubLP5NoQhvig2uw89jIR+s1y1T52dZ/60N9AAldHuXEImv9CEhRbqApQwyUN69xqQX6X8AEtpirtvceuAGY36quzywMB66bJmNlx0Lpu+IHggy0pBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=Tpb/gHw0; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=aUc3P9ysPZDm92XYCdc8+nGHGL1i/S6DJc77k8uuxBg=; b=Tpb/gHw0qdwL8dHvFhQJ9pNDk3
	rUFL1jOmjY5harVw1Vav6f/OyEpEssXvatrnQqvVi+Plk5FUtCvgsAv2aZmDxfPHs3TPYVWpvnNLv
	GrEHJbyzZkJXcmO6ccfPNIG4VFIwTsTsIH0MURlRj4LZS1JkZ0MjevIJVp/y+Qt3Gz4mOdf6nMloy
	izrzcPAhqaxLrJUUpWIErT4UoMM47X5/s6bl6f++KlPWkwMVGftxhPwkranCadW4+xF4v38Eggk9X
	/qsX6Y7ZVcMQdWNAvubtjc4IMfdM3ZwnXHiy75+fVlrlQh9f4BXzOAH7RGOBMBcM8zNBczZ8rEsEM
	pQAxzYcA==;
Date: Sun, 23 Nov 2025 16:25:51 +0100 (CET)
Message-Id: <20251123.162551.979799191208988118.rene@exactco.de>
To: chleroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <20251123.160941.475051668667578407.rene@exactco.de>
References: <20251123.131330.407910684435629198.rene@exactco.de>
	<d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
	<20251123.160941.475051668667578407.rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hey,

On Sun, 23 Nov 2025 16:09:41 +0100 (CET), René Rebe <rene@exactco.de> wrote:

> On Sun, 23 Nov 2025 15:57:24 +0100, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> 
> > Le 23/11/2025 à 13:13, René Rebe a écrit :
> > > Building a size optimized ppc64 kernel (-Os), gcc emits more FP
> > > save/restore symbols, that the linker generates on demand into the
> > > .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
> > > too. They are needed for the amdgpu in-kernel floating point support.
> > 
> > Would have been interested to know with which version of GCC the
> > problem started.
> 
> idk, maybe forever, or at least a decade fo GCC? Most devs probably
> don't build size optimized, and addtionally we only use in kernel
> floating point for amdgpu since recently? Should I add Fixes: for the
> in-kernel FP hash?
> 
> > By the way you seem to fix the problem for modules, but does it also
> > work when amdgpu is in kernel ? I would have expected a need to add
> > functions in arch/powerpc/lib/crtsavres.S as well, just like following
> > commits:
> > 
> > 8fe9c93e7453 ("powerpc: Add vr save/restore functions")
> > 7fca5dc8aa7a ("powerpc: Fix module building for gcc 4.5 and 64 bit")
> > da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc
> > versions")
> 
> idk, I avoid linking that big stuff directly into the kernel and would
> need to specically test that, too. I guess I go do that now, too, ...

It appears built-in amdgpu FP somehow magically works for me:

debug-linux:[linux-6.17]# grep DRM.*AMD .config
CONFIG_DRM_AMDGPU=y
CONFIG_DRM_AMDGPU_SI=y
CONFIG_DRM_AMDGPU_CIK=y
CONFIG_DRM_AMDGPU_USERPTR=y
CONFIG_DRM_AMD_ACP=y
CONFIG_DRM_AMD_DC=y
CONFIG_DRM_AMD_DC_FP=y
CONFIG_DRM_AMD_DC_SI=y
...
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_execution.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transition.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_execution.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_transition.o
  AR      drivers/gpu/drm/amd/amdgpu/built-in.a
  AR      drivers/gpu/drm/built-in.a
  AR      drivers/gpu/built-in.a
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  GEN     modules.builtin.modinfo
  GEN     modules.builtin
  MODPOST vmlinux.symvers
  CC      .vmlinux.export.o
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  KSYMS   .tmp_vmlinux0.kallsyms.S
  AS      .tmp_vmlinux0.kallsyms.o
  LD      .tmp_vmlinux1
  NM      .tmp_vmlinux1.syms
  KSYMS   .tmp_vmlinux1.kallsyms.S
  AS      .tmp_vmlinux1.kallsyms.o
  LD      .tmp_vmlinux2
  NM      .tmp_vmlinux2.syms
  KSYMS   .tmp_vmlinux2.kallsyms.S
  AS      .tmp_vmlinux2.kallsyms.o
  LD      vmlinux.unstripped
  NM      System.map
  SORTTAB vmlinux.unstripped
make[3]: Nothing to be done for 'vmlinux.unstripped'.
  OBJCOPY vmlinux

So I guess the patch is good to go after clarifying which kind of
Fixes: to use?

Thanks!
       René

> > > MODPOST Module.symvers
> > > ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
> > > undefined!
> > > WARNING: modpost: suppressed 56 unresolved symbol warnings because
> > > there were too many)
> > > Signed-off-by: René Rebe <rene@exactco.de>
> > > ---
> > > V2: description
> > > Theoretically for -stable, but no previous commit that broke it.
> > 
> > In that case you have to add Cc: stable@vger.kernel.org
> > Add indeed it is likely a gcc upgrade that broke it, not a previous
> > commit.
> 
> Should I then simply use enabling amdgpu dc_fp and in-kernel FP as the
> breaking commit for Fixes:?
> 
> Thanks!
> 
> 	René
> 
> > > ---
> > >   scripts/mod/modpost.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index 47c8aa2a6939..133dfa16308a 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info
> > > *info, const char *symname)
> > >   		/* Special register function linked on all modules during final link of
> > >   		.ko */
> > >   		if (strstarts(symname, "_restgpr0_") ||
> > >   		    strstarts(symname, "_savegpr0_") ||
> > > +		    strstarts(symname, "_restgpr1_") ||
> > > +		    strstarts(symname, "_savegpr1_") ||
> > > +		    strstarts(symname, "_restfpr_") ||
> > > +		    strstarts(symname, "_savefpr_") ||
> > >   		    strstarts(symname, "_restvr_") ||
> > >   		    strstarts(symname, "_savevr_") ||
> > >   		    strcmp(symname, ".TOC.") == 0)
> > 
> 
> -- 
> René Rebe, ExactCODE GmbH, Berlin, Germany
> https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

