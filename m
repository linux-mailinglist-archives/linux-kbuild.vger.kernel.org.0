Return-Path: <linux-kbuild+bounces-13085-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCuVF4Tx/WlxlAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13085-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 16:21:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B88064F7A56
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 16:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B67D3031800
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 May 2026 14:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAA03E3C5C;
	Fri,  8 May 2026 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lxmCDmGM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8893E0C52
	for <linux-kbuild@vger.kernel.org>; Fri,  8 May 2026 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250111; cv=none; b=XSbivrXtdTvHbNutt2zXdzFBotgYh2TPMIIYlf1JNtQRwFlDN8qt77Ox9/qFOIooG4H8eSQEzvjkZOck8kNpEX3h81G8hqa9C+gOv5rZhd+0ONMj8s5GF4687Rt/e63QyBLBiwkE1hUQsbxEKyrbWMzKpdiH36Vg0g+IkvmPtU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250111; c=relaxed/simple;
	bh=noJSLUYrP0lnI0v/DfCD3Pyd2+I5E3Z3OZvUKXERpyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2AOQc3Afgh2o53t+sF03IvaxYar574JWHs0b4ehUVa1idy555FrUJ5c0UBtoAVjpMvMYys+uR+2Tz3pQpT/fXMitqFjB/IELtztyu0BjtamPdCWENJct0gyIqwZesGF0ALrSX5kLaWYsgwfMbRd+6UAJYlvBfayt52oVKucARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lxmCDmGM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso13144465e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 08 May 2026 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778250107; x=1778854907; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVtMnBbfRCAgkpWYc10MAqsksMPJC+rFMf+ol8dg7l8=;
        b=lxmCDmGMyqnDZx/7wAsUNvGpsRQzBgpWiC3vG+0LnvmUXUP4H3Pgg0L9dUIDxRIN+1
         SnXRRzhO/qEtgSJIRchjBXQSvgUGJcofJN7fG3DIH/P38Z8t+H3WZ8zaUi1homdr5PiQ
         BxKqSBlV4QTLOw7pHF1d4ymwqIFQMrY/rqHTDZp/J+J7uW0rK9vLHn1FqpZOF99KZyuH
         h7eABtdT2Lawe1EJq//aqWTvTHUNYiXtPQTDi84W0r9CJ5rUySvJSx0TrorXjVEjyQlk
         Dq0i9wfOM8J38V2AkClBedjSU2tBCwrfQ36QfKQedurn6XJDSoYAHgenR9PrSSdXaVVc
         SA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778250107; x=1778854907;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVtMnBbfRCAgkpWYc10MAqsksMPJC+rFMf+ol8dg7l8=;
        b=J11GM2fBMsp6nthe8SU8PYEMBxpwYR0XhSi7LDValOkvGe2mDfhEGj92gAl0zhKaur
         J2K/nTstVnWBSovVEdxp9tmvbS6UqT2EhsAhsO6/53ppqRz9GK34VwnIudkWOcBREeY1
         /NjLHMEhgnio7JMcNgIT6WD2g8V/zg3r9OgYHQH7wnYluJnamZh8giK5wOV1zujEQ70L
         zfk0nNtLPdDLT18/Xl7moJQkbOW8ukv73L9Bjeg8jVPjqBDs9Ag+3Quymu8RAnGFCowK
         a8l2wFw2X9vX30gkMLY12AQm7tRCtQsxKN3Bw4hL7U52vFliBIL8U7ilbaUWs8Zdj98i
         a+/g==
X-Forwarded-Encrypted: i=1; AFNElJ/e6cWoXME79YIydLKyj2eSTF7WDrUBF530qB/c8GUdE+sCYyzkxdBP3DY6h/2RxKKGeljS12HT5+GIsXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4wwDbmkAo20JYaHvDVtUUhPwsQWpb1DWJbrNwbUdFUw4llx8M
	efMxts5RXNm/f49bCmpj4wgOIfNdOw0xSywdPtHwto+7+JoU9LELnVSH8nSAIpAIdw==
X-Gm-Gg: AeBDievAOEHXjXz+VpA8pow4bSy4CmMrksFVOOe1ER7FnAhvk3DaJeS64l28evBKrAW
	XLvUvZl8rf1LUfmHnONk95SclWqaqgkUPmfxrh3T68ypoihmQH3+p6CLwmdCSw7pNzDkp06QtQk
	Q4e3883gY7009ioIs4F3u3mJHnTA0/no8Asj9/DjMoXaugeWgVSmyKjnV48boIWkUemeKUKevrA
	DgncQojnBunG+7rviuYO1bW54yFwHeQpsNt5Erjz3OU4LwG0uCIsLrnKdcA3B5RP+WqmOf2yVN9
	DFx5XQjoihAdkJICvlo68hJ1en/4Epm8wgDmAuFFo47RMLJL6WJeo8ujVdFaXNOVNe9KR6EBSb9
	p24t41h0ICMlBHXpaHuxPfMn1FyxRXX46kPBc7/81+KIXlESFEIQXy2LZsUkzJ1rarXqfHhTZ4A
	uhHudaf0ZgIID0CZc92IVvHPycsEoaknvkI7PK/jKE/2/Ikq9nBk6LiNByt8Knv4IZmVHEbuvVz
	Wa1k/0WmQ==
X-Received: by 2002:a05:600c:6290:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48e51f3fd58mr229916195e9.20.1778250105972;
        Fri, 08 May 2026 07:21:45 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:d73a:30f6:7b4c:5d8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8d3113sm1750015e9.2.2026.05.08.07.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:21:44 -0700 (PDT)
Date: Fri, 8 May 2026 16:21:36 +0200
From: Marco Elver <elver@google.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>,
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>,
	KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH v3 1/2] slab: support for compiler-assisted type-based
 slab cache partitioning
Message-ID: <af3xcFjrZSZFG846@elver.google.com>
References: <20260424132427.2703076-1-elver@google.com>
 <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
 <afkOMIPu1WNFE9MS@elver.google.com>
 <CANpmjNM261J5qefMvmUXWZGBVz-KBs7GkbpdNMfTOvNJ-=LiZQ@mail.gmail.com>
 <afz7pZADZPD4mKJr@MacBook-Air.tail10959e.ts.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afz7pZADZPD4mKJr@MacBook-Air.tail10959e.ts.net>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Rspamd-Queue-Id: B88064F7A56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	TAGGED_FROM(0.00)[bounces-13085-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,elver.google.com:mid]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 11:49PM +0200, 'Harry Yoo (Oracle)' via kasan-dev wrote:
> On Wed, May 06, 2026 at 03:03:27PM +0100, Marco Elver wrote:
> > On Mon, 4 May 2026 at 23:23, Marco Elver <elver@google.com> wrote:
> > > On Thu, Apr 30, 2026 at 03:03PM +0200, Vlastimil Babka (SUSE) wrote:
> > > > On 4/24/26 15:24, Marco Elver wrote:
> > > > > @@ -948,14 +978,16 @@ static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t f
> > > > >
> > > > >             index = kmalloc_index(size);
> > > > >             return __kmalloc_cache_noprof(
> > > > > -                           kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
> > > > > +                           kmalloc_caches[kmalloc_type(flags, token)][index],
> > > >
> > > > While reviewing this, it occured to me we might have been using _RET_IP_
> > > > here in a suboptimal way ever since this was introduced. Since this is all
> > > > inlined, shouldn't have we been using _THIS_IP_ to really randomize using
> > > > the kmalloc() callsite, and not its parent?
> > > >
> > > > And after this patch, we get the token passed to _kmalloc_noprof()...
> > > >
> > > > >                             flags, size);
> > > > >     }
> > > > > -   return __kmalloc_noprof(size, flags);
> > > > > +   return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
> > > >
> > > > ... and used also here for the non-constant-size, where previously
> > > > __kmalloc_noprof() (not inline function) would correctly use _RET_IP_ on its
> > > > own ...
> > > >
> > > > >  }
> > > > > +#define kmalloc_noprof(...)                        _kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
> > > >
> > > > ... and the token comes from here. With random partitioning that's
> > > > #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> > > >
> > > > so that AFAIK makes the situation worse as now the cases without constant
> > > > size also start randomizing by the parent callsite and not the kmalloc callsite.
> > > >
> > > > But there are many users of __kmalloc_token() and maybe some are corrent in
> > > > using _RET_IP_, I haven't checked, maybe we'll need two variants, or further
> > > > change things around.
> > >
> > > Good catch. I don't think we need multiple variants (otherwise the TYPED
> > > variant would be broken) - we're moving token generation to the callers
> > > (not even inlined anymore) with all this macro magic.
> > >
> > > I think this is all we need:
> > >
> > > --- a/include/linux/slab.h
> > > +++ b/include/linux/slab.h
> > > @@ -503,7 +503,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
> > >  typedef struct { unsigned long v; } kmalloc_token_t;
> > >  #ifdef CONFIG_KMALLOC_PARTITION_RANDOM
> > >  extern unsigned long random_kmalloc_seed;
> > > -#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> > > +#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
> > >  #elif defined(CONFIG_KMALLOC_PARTITION_TYPED)
> > >  #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
> > >  #endif
> > >
> > > Plus a paragraph in the commit message.  Let me add that.
> 
> Err, I was like "yes, this is the way to go!"
> 
> and then...
> 
> > Bah, this is why it doesn't work:
> > 
> > >> drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect goto statement to one of its possible targets
> >      272 |                         drm_exec_retry_on_contention(&exec);
> >          |                         ^
> >    include/drm/drm_exec.h:123:4: note: expanded from macro
> > 'drm_exec_retry_on_contention'
> >      123 |                         goto *__drm_exec_retry_ptr;             \
> >          |                         ^
> >    drivers/gpu/drm/msm/msm_gpu.c:304:16: note: possible target of
> > indirect goto statement
> >      304 |                 state->bos = kcalloc(submit->nr_bos,
> >          |                              ^
> >    include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
> >     1173 | #define kcalloc(n, size, flags)         kmalloc_array(n,
> > size, (flags) | __GFP_ZERO)
> >          |                                         ^
> >    include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
> >     1133 | #define kmalloc_array(...)
> > alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
> >          |                                                             ^
> >    include/linux/slab.h:1132:71: note: expanded from macro
> > 'kmalloc_array_noprof'
> >     1132 | #define kmalloc_array_noprof(...)
> > _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
> >          |
> >                        ^
> >    include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
> >      506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
> >          |                                                       ^
> >    include/linux/instruction_pointer.h:10:41: note: expanded from
> > macro '_THIS_IP_'
> >       10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned
> > long)&&__here; })
> >          |                                         ^
> >    drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement
> > expression
> > 
> > Apparently using _THIS_IP_ creates a possible indirect jump target,
> 
> Didn't even realize people use indirect gotos, heh :)
> 
> > but because it's in a statement expression, it's invalid, so the
> > compiler complains. This is obviously nonsense, because the actual
> > indirect jump in this gpu driver code would never jump to the
> > _THIS_IP_ __here label, but that's what it is.
> 
> Yeah, I guess it's quite tricky to handle when you don't know where
> it'd jump to as it's an indirect one, and there's an invalid jump
> label...
> 
> > Given this pre-existing issue, we probably need to continue using
> > _RET_IP_, as before.

I think I have a solution for this mess, see below.

I would not send it as 1 series, but only include the slab changes (+
instruction_pointer.h change to introduce _CODE_LOCATION_) as one
series, to go through the slab tree. The rest of the patches would go to
respective arch maintainers.

------ >8 ------

diff --git a/arch/alpha/include/asm/linkage.h b/arch/alpha/include/asm/linkage.h
index aa8661fa60dc..88617cfaa0f7 100644
--- a/arch/alpha/include/asm/linkage.h
+++ b/arch/alpha/include/asm/linkage.h
@@ -6,4 +6,6 @@
 #define SYSCALL_ALIAS(alias, name)					\
 	asm ( #alias " = " #name "\n\t.globl " #alias)
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("br %0, 1f\n1:" : "=r" (__ip)); __ip; })
+
 #endif
diff --git a/arch/arc/include/asm/linkage.h b/arch/arc/include/asm/linkage.h
index ba3cb65b5eaa..3fb91d1672ba 100644
--- a/arch/arc/include/asm/linkage.h
+++ b/arch/arc/include/asm/linkage.h
@@ -75,6 +75,8 @@
 #define __arcfp_data __section(".data")
 #endif
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("mov %0, pcl" : "=r" (__ip)); __ip; })
+
 #endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/arm/include/asm/linkage.h b/arch/arm/include/asm/linkage.h
index c4670694ada7..416e6a242dc4 100644
--- a/arch/arm/include/asm/linkage.h
+++ b/arch/arm/include/asm/linkage.h
@@ -9,4 +9,6 @@
   .type name, %function; \
   END(name)
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("1: adr %0, 1b" : "=r" (__ip)); __ip; })
+
 #endif
diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index 40bd17add539..73eabc82a6bb 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -43,4 +43,6 @@
 	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
 	bti c ;
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("adr %0, ." : "=r" (__ip)); __ip; })
+
 #endif
diff --git a/arch/csky/include/asm/linkage.h b/arch/csky/include/asm/linkage.h
new file mode 100644
index 000000000000..04afd3583e25
--- /dev/null
+++ b/arch/csky/include/asm/linkage.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_CSKY_LINKAGE_H
+#define __ASM_CSKY_LINKAGE_H
+
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("grs %0, ." : "=r" (__ip)); __ip; })
+
+#endif /* __ASM_CSKY_LINKAGE_H */
diff --git a/arch/hexagon/include/asm/linkage.h b/arch/hexagon/include/asm/linkage.h
index ebdb581939e8..b3808f093e62 100644
--- a/arch/hexagon/include/asm/linkage.h
+++ b/arch/hexagon/include/asm/linkage.h
@@ -9,4 +9,6 @@
 #define __ALIGN		.align 4
 #define __ALIGN_STR	".align 4"
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("call 1f\n1: %0 = r31" : "=r" (__ip) : : "r31"); __ip; })
+
 #endif
diff --git a/arch/loongarch/include/asm/linkage.h b/arch/loongarch/include/asm/linkage.h
index a1bd6a3ee03a..f175b25068d7 100644
--- a/arch/loongarch/include/asm/linkage.h
+++ b/arch/loongarch/include/asm/linkage.h
@@ -77,4 +77,6 @@
 
 #define SYM_SIGFUNC_END(name) SYM_FUNC_END(name)
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("pcaddi %0, 0" : "=r" (__ip)); __ip; })
+
 #endif
diff --git a/arch/m68k/include/asm/linkage.h b/arch/m68k/include/asm/linkage.h
index c8b84282764c..9ed2f36830d0 100644
--- a/arch/m68k/include/asm/linkage.h
+++ b/arch/m68k/include/asm/linkage.h
@@ -35,4 +35,6 @@
 	__asmlinkage_protect_n(ret, "m" (arg1), "m" (arg2), "m" (arg3), \
 			      "m" (arg4), "m" (arg5), "m" (arg6))
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("lea %%pc@(.), %0" : "=a" (__ip)); __ip; })
+
 #endif
diff --git a/arch/microblaze/include/asm/linkage.h b/arch/microblaze/include/asm/linkage.h
new file mode 100644
index 000000000000..fc3873e0e9b6
--- /dev/null
+++ b/arch/microblaze/include/asm/linkage.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_MICROBLAZE_LINKAGE_H
+#define _ASM_MICROBLAZE_LINKAGE_H
+
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("mfs %0, rpc" : "=r" (__ip)); __ip; })
+
+#endif /* _ASM_MICROBLAZE_LINKAGE_H */
diff --git a/arch/mips/include/asm/linkage.h b/arch/mips/include/asm/linkage.h
index fd44ba754f1a..0579eac57def 100644
--- a/arch/mips/include/asm/linkage.h
+++ b/arch/mips/include/asm/linkage.h
@@ -10,4 +10,14 @@
 #define SYSCALL_ALIAS(alias, name)					\
 	asm ( #alias " = " #name "\n\t.globl " #alias)
 
+#define _THIS_IP_ ({				\
+	unsigned long __ip;			\
+	asm volatile("bal 1f\n\t"		\
+		     " nop\n\t"			\
+		     "1: move %0, $ra"		\
+		     : "=r" (__ip) : : "$ra"	\
+	);					\
+	__ip;					\
+})
+
 #endif
diff --git a/arch/nios2/include/asm/linkage.h b/arch/nios2/include/asm/linkage.h
index 211302301a8a..c4073235852b 100644
--- a/arch/nios2/include/asm/linkage.h
+++ b/arch/nios2/include/asm/linkage.h
@@ -12,4 +12,6 @@
 #define __ALIGN .align 4
 #define __ALIGN_STR ".align 4"
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("nextpc %0" : "=r" (__ip)); __ip; })
+
 #endif
diff --git a/arch/openrisc/include/asm/linkage.h b/arch/openrisc/include/asm/linkage.h
index 25aa449ac30e..a96e808b5d1a 100644
--- a/arch/openrisc/include/asm/linkage.h
+++ b/arch/openrisc/include/asm/linkage.h
@@ -18,4 +18,14 @@
 #define __ALIGN      .align 0
 #define __ALIGN_STR ".align 0"
 
+#define _THIS_IP_ ({				\
+	unsigned long __ip;			\
+	asm volatile("l.jal 1f\n\t"		\
+		     " l.nop\n\t"		\
+		     "1: l.ori %0, r9, 0"	\
+		     : "=r" (__ip) : : "r9"	\
+	);					\
+	__ip;					\
+})
+
 #endif /* __ASM_OPENRISC_LINKAGE_H */
diff --git a/arch/parisc/include/asm/linkage.h b/arch/parisc/include/asm/linkage.h
index d4cad492b971..d4d8ff7735c7 100644
--- a/arch/parisc/include/asm/linkage.h
+++ b/arch/parisc/include/asm/linkage.h
@@ -37,4 +37,12 @@ name:		ASM_NL\
 
 #endif /* __ASSEMBLER__ */
 
+#define _THIS_IP_ ({                           \
+	unsigned long __ip;                     \
+	asm volatile("b,l 1f, %0\n\t"           \
+		     " nop\n\t"                 \
+		     "1:" : "=r" (__ip));       \
+	__ip;                                   \
+})
+
 #endif  /* __ASM_PARISC_LINKAGE_H */
diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
index b71b9582e754..aa469e7bef0b 100644
--- a/arch/powerpc/include/asm/linkage.h
+++ b/arch/powerpc/include/asm/linkage.h
@@ -13,4 +13,13 @@
 	     "\t.globl ." #alias "\n\t.set ." #alias ", ." #name)
 #endif
 
+#define _THIS_IP_ ({				\
+	unsigned long __ip;			\
+	asm volatile("bcl 20,31,1f\n\t"		\
+		     "1: mflr %0"		\
+		     : "=r" (__ip) : : "lr"	\
+	);					\
+	__ip;					\
+})
+
 #endif	/* _ASM_POWERPC_LINKAGE_H */
diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
index 9e88ba23cd2b..7e0210ef4eb4 100644
--- a/arch/riscv/include/asm/linkage.h
+++ b/arch/riscv/include/asm/linkage.h
@@ -9,4 +9,6 @@
 #define __ALIGN		.balign 4
 #define __ALIGN_STR	".balign 4"
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("auipc %0, 0" : "=r" (__ip)); __ip; })
+
 #endif /* _ASM_RISCV_LINKAGE_H */
diff --git a/arch/s390/include/asm/linkage.h b/arch/s390/include/asm/linkage.h
index df3fb7d8227b..1b3ac553a642 100644
--- a/arch/s390/include/asm/linkage.h
+++ b/arch/s390/include/asm/linkage.h
@@ -7,4 +7,6 @@
 #define __ALIGN .balign CONFIG_FUNCTION_ALIGNMENT, 0x07
 #define __ALIGN_STR __stringify(__ALIGN)
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("larl %0, ." : "=d" (__ip)); __ip; })
+
 #endif
diff --git a/arch/sh/include/asm/linkage.h b/arch/sh/include/asm/linkage.h
index 7c2fa27a43f8..af56b38b6001 100644
--- a/arch/sh/include/asm/linkage.h
+++ b/arch/sh/include/asm/linkage.h
@@ -5,4 +5,6 @@
 #define __ALIGN .balign 4
 #define __ALIGN_STR ".balign 4"
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("mova 1f, %0\n1:" : "=z" (__ip)); __ip; })
+
 #endif
diff --git a/arch/sparc/include/asm/linkage.h b/arch/sparc/include/asm/linkage.h
new file mode 100644
index 000000000000..3f24e2da88be
--- /dev/null
+++ b/arch/sparc/include/asm/linkage.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_SPARC_LINKAGE_H
+#define _ASM_SPARC_LINKAGE_H
+
+#ifdef CONFIG_SPARC64
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("rd %%pc, %0" : "=r" (__ip)); __ip; })
+#else
+#define _THIS_IP_ ({				\
+	unsigned long __ip;			\
+	asm volatile("call 1f\n\t"		\
+		     " nop\n\t"			\
+		     "1: mov %%o7, %0"		\
+		     : "=r" (__ip) : : "o7"	\
+	);					\
+	__ip;					\
+})
+#endif
+
+#endif /* _ASM_SPARC_LINKAGE_H */
diff --git a/arch/x86/include/asm/linkage.h b/arch/x86/include/asm/linkage.h
index a7294656ad90..bce3c6f4b94f 100644
--- a/arch/x86/include/asm/linkage.h
+++ b/arch/x86/include/asm/linkage.h
@@ -13,11 +13,12 @@
  * The generic version tends to create spurious ENDBR instructions under
  * certain conditions.
  */
-#define _THIS_IP_ ({ unsigned long __here; asm ("lea 0(%%rip), %0" : "=r" (__here)); __here; })
+#define _THIS_IP_ ({ unsigned long __here; asm volatile("lea 0(%%rip), %0" : "=r" (__here)); __here; })
 #endif
 
 #ifdef CONFIG_X86_32
 #define asmlinkage CPP_ASMLINKAGE __attribute__((regparm(0)))
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("call 1f\n1: pop %0" : "=r" (__ip)); __ip; })
 #endif /* CONFIG_X86_32 */
 
 #define __ALIGN		.balign CONFIG_FUNCTION_ALIGNMENT, 0x90;
diff --git a/arch/xtensa/include/asm/linkage.h b/arch/xtensa/include/asm/linkage.h
index 0ba9973235d9..9e6f5cc81964 100644
--- a/arch/xtensa/include/asm/linkage.h
+++ b/arch/xtensa/include/asm/linkage.h
@@ -6,4 +6,6 @@
 #define __ALIGN		.align 4
 #define __ALIGN_STR	".align 4"
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("call0 1f\n1: mov %0, a0" : "=r" (__ip) : : "a0"); __ip; })
+
 #endif
diff --git a/include/linux/instruction_pointer.h b/include/linux/instruction_pointer.h
index aa0b3ffea935..dfe73aafddb8 100644
--- a/include/linux/instruction_pointer.h
+++ b/include/linux/instruction_pointer.h
@@ -8,6 +8,30 @@
 
 #ifndef _THIS_IP_
 #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
+/*
+ * The current generic definition of _THIS_IP_ is considered broken by GCC [1]
+ * and Clang [2]. In particular, the address of a label is only expected to be
+ * used with a computed goto.
+ *
+ *   [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071
+ *   [2] https://github.com/llvm/llvm-project/issues/138272
+ *
+ * Mark it as broken, so that appropriate fallback options can be implemented
+ * for architectures that do not define their won _THIS_IP_.
+ */
+#define HAS_BROKEN_THIS_IP
+#endif
+
+/*
+ * _CODE_LOCATION_ provides a unique identifier for the current code location.
+ * When _THIS_IP_ is broken (generic version), we fall back to a static marker
+ * which guarantees uniqueness and resolves to a constant address at link time,
+ * avoiding runtime overhead and compiler optimizations breaking it.
+ */
+#ifdef HAS_BROKEN_THIS_IP
+#define _CODE_LOCATION_ ({ static const char __here; (unsigned long)&__here; })
+#else
+#define _CODE_LOCATION_ _THIS_IP_
 #endif
 
 #endif /* _LINUX_INSTRUCTION_POINTER_H */
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 5e1249e36b0d..a4bf1585411f 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -503,7 +503,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
 typedef struct { unsigned long v; } kmalloc_token_t;
 #ifdef CONFIG_KMALLOC_PARTITION_RANDOM
 extern unsigned long random_kmalloc_seed;
-#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
+#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _CODE_LOCATION_ })
 #elif defined(CONFIG_KMALLOC_PARTITION_TYPED)
 #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
 #endif

