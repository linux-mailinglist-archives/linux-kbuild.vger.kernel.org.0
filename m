Return-Path: <linux-kbuild+bounces-12995-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMfVH3sO+Wl54wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12995-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 23:24:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC74C415B
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 23:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 269BA3026F02
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 21:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F165B346E68;
	Mon,  4 May 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gAN727wL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D353D16F8
	for <linux-kbuild@vger.kernel.org>; Mon,  4 May 2026 21:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929788; cv=none; b=hiax7kNP3PkoMPzuJP32p94Pz8DfA80hQxiLQ59/wgqfWHibsdy8M8ga6MSummu0FCsGi7Z8EEHGNLbwdeJdxK8KS7meNX8wtYXhQGgzdZP8JQNviS6psI+BH+hUYOhC9I+XlhQo2uWgAflTTsPDmEfT6ypg8j5AsatdMaNTh0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929788; c=relaxed/simple;
	bh=KZ9hGIdTsGnZ8NOGTupuIQLH8lJmHaX97JFhAZBXiOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbWGcQ3ndFrnr4iHqBGhdJoNntgh6bRLDud7ybgIsPj8JHnGC4dW26gNGw0Rrn5XGcZKi2+hFYI75xpfpC7bxxZSVadUtDDCvv14RVG6DD5i4UHdTlvqqYQqa3GU9UNgrBxphloamxThyIKfyO7kU34WyO3bBR5evYaLs5AX6WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gAN727wL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so66470465e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 04 May 2026 14:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929785; x=1778534585; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igyU2nx2iftItHLeQpILR+qCdofiKDiQQ2B3kQIIdT0=;
        b=gAN727wLdVBGRLnCVb/rcO9iZcIiEIGMYtmTGAtlo6VFbrcWOO0htajhVW3PCLFdlx
         g7XytLlFTpE8LAQK1x68Er9l5MQrSg6wGrzq7LVvQyoDX8u8grYJgnn+3flbw8plISjM
         TR+nYc60eL7HWJLxbGx970A2Q0E72665XTPDhS3MCMu01YuHr1Ln6sQ0X6zRT5rfmilo
         Gp18k9WYU5MAz7zE5F/clL6GkEYiHtVMce3600FoCuXB3CLHLrHc4mEBpyDdySYMdLZH
         yvoryNdQibVwDmGJyXg9TvT7IUU7puGOTXSzmiOAnIP6q3vA4OATF83/xZbsRpds5Aig
         QKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929785; x=1778534585;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=igyU2nx2iftItHLeQpILR+qCdofiKDiQQ2B3kQIIdT0=;
        b=kahvJy9UX1TyTHifq+pPvDq3fVAdGw8ReVzWE+CDH1T+nhGdXIJXNmYmD8njgzVlA4
         QiRTkliiB4IXc4BihGq9OAD4nmROTwZY/5S3aDExCNlXN6H3piHATz8/Eaw/MxX2Olbn
         MZCc5CJXYQ7e9d5rMO8nYDX8Ou5nSab3eK3fMA1GPBr5FBBnpRRH9vcfSNU1z+aZ4frQ
         WNP45oCqcR0Lz4a9Brbl5dqetHzh29ZewpsT7in+MM6V7a1bropeutRRN9WJC68TEeaO
         mLt38VOMhzCzV2RhTdEw3sAjq2Q3S8ULb6Plx4dmUCFVHdAiPck69H0Oe8sWu+QHHqz+
         VSng==
X-Forwarded-Encrypted: i=1; AFNElJ80LJZ3CdUQ1Gjq2vZXIq9cRlZMqD1NuFyM4fQZe87Vl88zxcE7RHEjTlMnVd8I/50TjckeZCso2x2f0mA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVv1zKddepvIt60574xpQbheqFxv5imCQn/0sM4A7pkYgyNwuI
	toUpy51N36LM+02rjTrJIIHDlKwz2rimSH4mdlEuGwvBv5CjCK0M5deCtoiVz/PY4g==
X-Gm-Gg: AeBDietkTBawhGXYKdDOg9ynU74/UOJ2wD8v07L/KzHfbCNIVNAIwFUOVKSCpRf8nFo
	rfAhaikgAsuwIfD5ngN3ANjrsfSxg886vJmkZ5hQZUMJZEvq669HstG5H9zzCbIchiS6F/dzN+U
	a0aJnGHst5vvFT00NABnsP0eW+NRdHhSvQihCmAV6M9E00oSmReXYBQLy0w3m6pCt8GSfoM3ohY
	Fz1u0C7XuVIIWHmkD3fceXGkYOqoOyX4C/Ar8MU9RVI3bM+HWYf9RnrGjkAkiKfZSjUpabGt1cd
	LIuMhMLwrRmcyMmdNVNm6SOSFW4w5jGYCjJYvM5odO5JM1mSojWnlzQ4+bG9FIrkIU1JR085THU
	oHMULzHExdmPs1HWsSGaXV/lcTAxBlNB6kVoyi0C2FU/eHhxH0mgk4kbQFi9Yf6ApsjWwruT97+
	vzVY7DWURjjRqww+8VthAW6M9P0Qg+EJnvQ/YWJvJ49rpD9hMW9z74broj9tmJNh3QbsEmmkQtu
	lhRS2PV5w==
X-Received: by 2002:a05:600c:a30a:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48d18cea8damr2194915e9.26.1777929784562;
        Mon, 04 May 2026 14:23:04 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:fba5:1281:871d:3fd6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm323128615e9.3.2026.05.04.14.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 14:23:03 -0700 (PDT)
Date: Mon, 4 May 2026 23:22:56 +0200
From: Marco Elver <elver@google.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
	David Rientjes <rientjes@google.com>,
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
Message-ID: <afkOMIPu1WNFE9MS@elver.google.com>
References: <20260424132427.2703076-1-elver@google.com>
 <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Rspamd-Queue-Id: EAAC74C415B
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	TAGGED_FROM(0.00)[bounces-12995-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 03:03PM +0200, Vlastimil Babka (SUSE) wrote:
> On 4/24/26 15:24, Marco Elver wrote:
> 
> > @@ -938,7 +968,7 @@ void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
> >   *	Try really hard to succeed the allocation but fail
> >   *	eventually.
> >   */
> > -static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
> > +static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> >  {
> >  	if (__builtin_constant_p(size) && size) {
> >  		unsigned int index;
> > @@ -948,14 +978,16 @@ static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t f
> >  
> >  		index = kmalloc_index(size);
> >  		return __kmalloc_cache_noprof(
> > -				kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
> > +				kmalloc_caches[kmalloc_type(flags, token)][index],
> 
> While reviewing this, it occured to me we might have been using _RET_IP_
> here in a suboptimal way ever since this was introduced. Since this is all
> inlined, shouldn't have we been using _THIS_IP_ to really randomize using
> the kmalloc() callsite, and not its parent?
> 
> And after this patch, we get the token passed to _kmalloc_noprof()...
> 
> >  				flags, size);
> >  	}
> > -	return __kmalloc_noprof(size, flags);
> > +	return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
> 
> ... and used also here for the non-constant-size, where previously
> __kmalloc_noprof() (not inline function) would correctly use _RET_IP_ on its
> own ...
> 
> >  }
> > +#define kmalloc_noprof(...)			_kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
> 
> ... and the token comes from here. With random partitioning that's
> #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> 
> so that AFAIK makes the situation worse as now the cases without constant
> size also start randomizing by the parent callsite and not the kmalloc callsite.
> 
> But there are many users of __kmalloc_token() and maybe some are corrent in
> using _RET_IP_, I haven't checked, maybe we'll need two variants, or further
> change things around.

Good catch. I don't think we need multiple variants (otherwise the TYPED
variant would be broken) - we're moving token generation to the callers
(not even inlined anymore) with all this macro magic.

I think this is all we need:

--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -503,7 +503,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
 typedef struct { unsigned long v; } kmalloc_token_t;
 #ifdef CONFIG_KMALLOC_PARTITION_RANDOM
 extern unsigned long random_kmalloc_seed;
-#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
+#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
 #elif defined(CONFIG_KMALLOC_PARTITION_TYPED)
 #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
 #endif

Plus a paragraph in the commit message.  Let me add that.

