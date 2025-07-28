Return-Path: <linux-kbuild+bounces-8223-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07922B13ABB
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 14:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45B69189A763
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 12:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EAE265CA0;
	Mon, 28 Jul 2025 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVrLDUF6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89E813D51E;
	Mon, 28 Jul 2025 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753706844; cv=none; b=lmcHkoFtruIoXKWtkRKhaAcQgIQbmrhfDfcwoT72CQKdluuePXd/vRUVLa5sZrzYXw+lZ/frfX7zzsOF0+C9O+95lTSOfwkrpUV0s/oE/UFSDd855kAA+uBd+r8Lk7pYI+ZuRWa97JFB//k8bAeHdzH3F7rRSMbLLwkOEV3kBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753706844; c=relaxed/simple;
	bh=8erufKMpAOmnBQJD5AQN3zyqiuSStzu2grxssP0lTyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKaub0glttFTOtgqaPSV6fK78ojVwjmcMVLzs6l+8F8fb8GfGVNqcPxZjomAoTFrDQQZem3icWONdnG9lz/+D/NpuXvJkRCoGF4/vI3/dVt5Hyt0e/NIJTtJLtoYEN8+bMWPJ+vDRo1srJo11s/QefwyPyMIhwzcSzqVozZa49w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVrLDUF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A14C4CEE7;
	Mon, 28 Jul 2025 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753706844;
	bh=8erufKMpAOmnBQJD5AQN3zyqiuSStzu2grxssP0lTyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVrLDUF6ALvU1+rw08l0PQQfJJ7diMMEUvcuQzJIilzrRSpYwOlOYK2n15xwoyML4
	 D4v1V5ouoPMP5Uz79ByW5/BerCfgE3utI4NZmRpjthPrhH6zfjhuvxxdwBw/nduyx5
	 BrLlHsjfIfQLUwiEsrKJ7Z00EUM59kWy8WUBrjuxruXI8VGjRYFATJyEOBskkNPuBj
	 cOwpUVMCLcgqoD5XxSL62JtvLUxMBr1zB0b3M8fPyxY2JnP4ebqJETtie1/WquwywI
	 lFApDm1CkeeTMlruPIC1tMlq6jstGhB1R7LebnE8eV6IkSurORWhWXOaOc/cTwOFqR
	 53bl3DIV1aZJA==
Date: Mon, 28 Jul 2025 13:47:14 +0100
From: Will Deacon <will@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Deepak Gupta <debug@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIdxUpSc-Co8wLYE@willie-the-truck>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <20250725161327.GC1724026@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725161327.GC1724026@google.com>

On Fri, Jul 25, 2025 at 04:13:27PM +0000, Sami Tolvanen wrote:
> On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
> > diff --git a/include/linux/scs.h b/include/linux/scs.h
> > index 4ab5bdc898cf..6ceee07c2d1a 100644
> > --- a/include/linux/scs.h
> > +++ b/include/linux/scs.h
> > @@ -12,6 +12,7 @@
> >  #include <linux/poison.h>
> >  #include <linux/sched.h>
> >  #include <linux/sizes.h>
> > +#include <asm/scs.h>
> >  
> >  #ifdef CONFIG_SHADOW_CALL_STACK
> >  
> > @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
> >  	 * Reset the shadow stack to the base address in case the task
> >  	 * is reused.
> >  	 */
> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> > +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
> > +#else
> >  	task_scs_sp(tsk) = task_scs(tsk);
> > +#endif
> >  }
> >
> >  static inline unsigned long *__scs_magic(void *s)
> >  {
> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> > +	return (unsigned long *)(s);
> > +#else
> >  	return (unsigned long *)(s + SCS_SIZE) - 1;
> > +#endif
> >  }
> >  
> >  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
> >  {
> >  	unsigned long *magic = __scs_magic(task_scs(tsk));
> > -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
> > +	unsigned long sz;
> > +
> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> > +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
> > +#else
> > +	sz = task_scs_sp(tsk) - task_scs(tsk);
> > +#endif
> >  
> >  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
> >  }
> >  
> > +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
> > +{
> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> > +	arch_scs_store(s, magic_val);
> > +#else
> > +	*__scs_magic(s) = magic_val;
> > +#endif
> > +}
> > +
> 
> I'm not a huge fan of all the ifdefs. We could clean this up by
> allowing architectures to simply override some these functions, or at
> least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
> this?

Yeah, I agree that allowing architectures to provide overrides makes
sense, however I also suspect that some of this needs to be a runtime
decision because not all CPUs will support the hardware-accelerated
feature and will presumably want to fall back on the software
implementation.

Will

