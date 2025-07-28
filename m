Return-Path: <linux-kbuild+bounces-8231-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CECB143C2
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 23:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5A5B189C274
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 21:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919EE230D35;
	Mon, 28 Jul 2025 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="3WSnZiTv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E6B223DF5
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Jul 2025 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753737591; cv=none; b=K09nCxFbbi7cjj7QmCe5lJWO+fpqHvrH1IcISGPdcg1jgaQbuMNhVUCgazCjHSM4/eP9bIIZKgJTEEND36VVVcB9gy+spzQvwVXqIvXhFyAdNooEiK2YnrhEhJew3eNgsJMKVjzZ9UZuFDqx/YxlySaT71IP08APmoNF5zmW9es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753737591; c=relaxed/simple;
	bh=dy758V6JISbk0OyvLkOFxA2WH0nPLorgxe+HKMTULx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQHH/T36AEVqA4A1amh5F5ZEhVR2CR1Tqpe9dZxkZMeH62A+cKydnjuhqr+7W1hXULCdrXA8NG41oAhHyqPAWr7dq+NMv3OHIZzYEiY8HbqfiFzMeRl3C5hk1GQ2SQzI3sVwpxNioTvTJUF1Gv7w6Yxpi8+/sLWfrYagDmcBiF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=3WSnZiTv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76858e9e48aso1167976b3a.2
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Jul 2025 14:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753737589; x=1754342389; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fk12aZ1hILTEk1VujnCvLZyceUntOHKQSLYJRpJHq1U=;
        b=3WSnZiTvUI4vlJTqkiilEy9vBKPBPNhrge7RdKeIIR7sP0Y194Qh0nV9489dtOcv/W
         QmRLEzuhLfS4hD8BAMxBJDTw821z0e5sYm+4y2xVCO1JgoWT9TyxkWFdF3qswTq5g8lI
         CMIrOiczX1167UauFJIGwdkkrCSUrUHtSNB/VrfL93ohnTtD2n2j1huMCW6VUnn7Bb0q
         bk0MOd60/NGnkMfbjSI+Y7bqY+74muHUgAZCCfKPjGzxmHANgmKYAtFljNd/5lGYWKM4
         v1TA6kVL0JVYy/8XUXukOs1E9dxubaWsZP8Uxim2dhd9TAPflTNzhixgXJ/Z1E1Ykcg/
         jalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753737589; x=1754342389;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fk12aZ1hILTEk1VujnCvLZyceUntOHKQSLYJRpJHq1U=;
        b=U1aNOPwkjdHgkgz48RY+hvNvA83+j2Vjjidwpok2j/g2pxsQ74ODiWXRyYWieLXYXg
         T1X4LYDRb4dDBRorCdR4+ZgRd0RS0oZWOj64Xgy1An4/aV5IcXpj6e97KZWoRDOL9M7T
         y3qVzR+WuDX6kORE+3yQlOQZzsUEk03FlzFNdA4Hj2UEThs1BDBnTuAZbDzpRothHOqZ
         2by+vL4BzKP3X4srg0DqNXrVBumiIU/dQuTnD1y9afyhVAYplgTsq83Ct9sCcvc7oadG
         0vYaYx0hgBeAs006phlhpQ6ruBmKV6UaqZ/w5wRyZe+uD+CUiQQzK666oRDh83HSs6z/
         V2rw==
X-Forwarded-Encrypted: i=1; AJvYcCU695BVnrQnKmJBtoaP0nJ1PXj9hjByZdaT1l44IsfZWB6O8Qc0CAMzfjzquqXn74knovQVm5vyu6Ic4WY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4J+gdlaBgkBFdBdCo2w9i77xPY5p4Q6K0JG1F4fi+VYW2pEb8
	uVC1TfZG6EprtEahDoSAAvvE2h/jNjG9gxgY2Wv1p6DcHtqIS8UGBVDRWd2PNkVMGO0=
X-Gm-Gg: ASbGnct9W/ncmlFB3DS+Gf3cS+UEd8XmppN1GPPjlpoCVEtuDqS4u+nXBCzBF/u2Cqh
	BKdMAuBDky4yBZ2j4FR4TgmLLHx5ITNAYPamDtJTES65GJljoVD6heDD4jk/mq0BqYkkimApWVs
	S3u+TeXdt2oamfhSlpdt1jlMfKTv/4YraqwS85sf90TOUODSytvtFAF/JbzLxdu0Lhs+og4Owe/
	L22QWuzEi60uav+IzfUoW3xh0ZYNK5L0ZARsMtg++CPYYeZTlcx8YeS8vp2YpY66FB5Qjrt95Hz
	daIJsG7JVMm2PQaRc0JSGkumLIi86UExZqVsKcgwBCJxELBwEiUPD43IdZBfSBDJDTA8KyDEthe
	Y0k36IFYP50kSvHNQ4bR4ZuS1T/tOReKh
X-Google-Smtp-Source: AGHT+IEnErxkfYjX+YJp8zR8qc4hw1otEJKlPu8QNYCPVpJ95RsieRy81jtW+UwHk4fD0hbvpRX7Lg==
X-Received: by 2002:a05:6a00:c89:b0:748:fcfa:8bd5 with SMTP id d2e1a72fcca58-7633636aefemr19113589b3a.3.1753737588883;
        Mon, 28 Jul 2025 14:19:48 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408cf7759sm6272300b3a.31.2025.07.28.14.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 14:19:48 -0700 (PDT)
Date: Mon, 28 Jul 2025 14:19:45 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "nathan@kernel.org" <nathan@kernel.org>,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"jeffreyalaw@gmail.com" <jeffreyalaw@gmail.com>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"mhocko@suse.com" <mhocko@suse.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>,
	"david@redhat.com" <david@redhat.com>,
	"masahiroy@kernel.org" <masahiroy@kernel.org>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"nicolas.schier@linux.dev" <nicolas.schier@linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew@sifive.com" <andrew@sifive.com>,
	"monk.chiang@sifive.com" <monk.chiang@sifive.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"morbo@google.com" <morbo@google.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"ved@rivosinc.com" <ved@rivosinc.com>,
	"heinrich.schuchardt@canonical.com" <heinrich.schuchardt@canonical.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"surenb@google.com" <surenb@google.com>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIfpcUmNtLFPd2cO@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
 <aIO8uSqiplnyyNOd@debug.ba.rivosinc.com>
 <a19c1338f2fa4cb19a4f8b7552ff54ded20b403a.camel@intel.com>
 <aIfOTC6CfyCsaEpv@debug.ba.rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIfOTC6CfyCsaEpv@debug.ba.rivosinc.com>

On Mon, Jul 28, 2025 at 12:23:56PM -0700, Deepak Gupta wrote:
>On Fri, Jul 25, 2025 at 06:05:22PM +0000, Edgecombe, Rick P wrote:
>>On Fri, 2025-07-25 at 10:19 -0700, Deepak Gupta wrote:
>>>> This doesn't update the direct map alias I think. Do you want to protect it?
>>>
>>>Yes any alternate address mapping which is writeable is a problem and dilutes
>>>the mechanism. How do I go about updating direct map ? (I pretty new to linux
>>>kernel and have limited understanding on which kernel api's to use here to
>>>unmap
>>>direct map)
>>
>>Here is some info on how it works:
>>
>>set_memory_foo() variants should (I didn't check riscv implementation, but on
>>x86) update the target addresses passed in *and* the direct map alias. And flush
>>the TLB.
>>
>>vmalloc_node_range() will just set the permission on the vmalloc alias and not
>>touch the direct map alias.
>>
>>vfree() works by trying to batch the flushing for unmap operations to avoid
>>flushing the TLB too much. When memory is unmapped in userspace, it will only
>>flush on the CPU's with that MM (process address space). But for kernel memory
>>the mappings are shared between all CPUs. So, like on a big server or something,
>>it requires way more work and distance IPIs, etc. So vmalloc will try to be
>>efficient and keep zapped mappings unflushed until it has enough to clean them
>>up in bulk. In the meantime it won't reuse that vmalloc address space.
>>
>>But this means there can also be other vmalloc aliases still in the TLB for any
>>page that gets allocated from the page allocator. If you want to be fully sure
>>there are no writable aliases, you need to call vm_unmap_aliases() each time you
>>change kernel permissions, which will do the vmalloc TLB flush immediately. Many
>>set_memory() implementations call this automatically, but it looks like not
>>riscv.
>>
>>
>>So doing something like vmalloc(), set_memory_shadow_stack() on alloc and
>>set_memory_rw(), vfree() on free is doing the expensive flush (depends on the
>>device how expensive) in a previously fast path. Ignoring the direct map alias
>>is faster. A middle ground would be to do the allocation/conversion and freeing
>>of a bunch of stacks at once, and recycle them.
>>
>>
>>You could make it tidy first and then optimize it later, or make it faster first
>>and maximally secure later. Or try to do it all at once. But there have long
>>been discussions on batching type kernel memory permission solutions. So it
>>would could be a whole project itself.
>
>Thanks Rick. Another approach I am thinking could be making vmalloc
>intrinsically aware of certain range to be security sensitive. Meaning during
>vmalloc initialization itself, it could reserve a range which is ensured to be
>not direct mapped. Whenever `PAGE_SHADOWSTACK` is requested, it always comes
>from this range (which is guaranteed to be never direct mapped).
>
>I do not expect hardware assisted shadow stack to be more than 4K in size
>(should support should 512 call-depth). A system with 30,000 active threads
>(taking a swag number here), will need 30,000 * 2 (one for guard) = 60000 pages.
>That's like ~245 MB address range. We can be conservative and have 1GB range in
>vmalloc larger range reserved for shadow stack. vmalloc ensures that this
>range's direct mappping always have read-only encoding in ptes. Sure this number
>(shadow stack range in larget vmalloc range) could be configured so that user
>can do their own trade off.
>
>Does this approach look okay?

Never mind, maintaining free/allocated list by vmalloc would be problematic
In that case this has to be something like a consumer of vmalloc, reserve a
range and do free/alloc out of that. And then it starts looking like a cache
of shadow stacks without direct mapping (as you suggested)


>
>>
>>>
>>>>
>>>> >
>>>> >   out:
>>>> > @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>>>> >   	if (!s)
>>>> >   		return NULL;
>>>> >
>>>> > -	*__scs_magic(s) = SCS_END_MAGIC;
>>>> > +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>>>> >
>>>> >   	/*
>>>> >   	 * Poison the allocation to catch unintentional accesses to
>>>> > @@ -87,6 +100,16 @@ void scs_free(void *s)
>>>> >   			return;
>>>> >
>>>> >   	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
>>>> > +	/*
>>>> > +	 * Hardware protected shadow stack is not writeable by regular
>>>> > stores
>>>> > +	 * Thus adding this back to free list will raise faults by
>>>> > vmalloc
>>>> > +	 * It needs to be writeable again. It's good sanity as well
>>>> > because
>>>> > +	 * then it can't be inadvertently accesses and if done, it will
>>>> > fault.
>>>> > +	 */
>>>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>>> > +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
>>>>
>>>> Above you don't update the direct map permissions. So I don't think you need
>>>> this. vmalloc should flush the permissioned mapping before re-using it with
>>>> the
>>>> lazy cleanup scheme.
>>>
>>>If I didn't do this, I was getting a page fault on this vmalloc address. It
>>>directly
>>>uses first 8 bytes to add it into some list and that was the location of
>>>fault.
>>
>>Ah right! Because it is using the vfree atomic variant.
>>
>>You could create your own WQ in SCS and call vfree() in non-atomic context. If
>>you want to avoid thr set_memory_rw() on free, in the ignoring the direct map
>>case.

