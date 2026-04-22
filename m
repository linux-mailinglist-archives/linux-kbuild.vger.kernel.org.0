Return-Path: <linux-kbuild+bounces-12856-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMtnEefp6Gl4RgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12856-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 17:31:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE089447EEF
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 17:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 256E0306B2D4
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 15:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF7430DD30;
	Wed, 22 Apr 2026 15:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kebRykF/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E4030B514
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Apr 2026 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871604; cv=none; b=me32ZiPvTNcribzQHx8awDjpQODjCxVWMpCNzhv9HItyYoL4hZqod7s+l4kIEULov0sfIoa5PN1M8Ux5is92C1s2uXFAlfDZpdnsJ6AZpchQkC7oJ2DLAwAhhK19y8E8XpCmbYk2NZAkxytoVaf2t6YyG+LaKlqve87u/2l4IBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871604; c=relaxed/simple;
	bh=rdCUpxrjSHkQ3T98egy1ZBC2mo3Rw+rJgkqg+TeHKq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaK9cek21JSIjoou/W7tTA0LUdD7s7npEvNxybtQ4eS2qPwqOmGZAvLycPdjqBCf/leufNm7oli9WREIffXoZQv97qIO4Drwis2ld5m++OEmSwZpSqqDcsfCZXo/hzxmGH8e9jDBFTfQYKZY9Qokd/+c0YfhpwYu9HeChoEbijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kebRykF/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a40b2d26a1so4411681e87.0
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Apr 2026 08:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776871600; x=1777476400; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mguVNYCKn1UqNE6wCiBdJA3G/L2uqCAslGSj7SsF/bg=;
        b=kebRykF/iKN0MOF0TikW5UpSBJzoL0z4MwT8LOiuCL5ocTdPMBaRMSz6hxQ76ZVVev
         iom2xB46niCqzvdGg5KpN4QsUB0pOpjQ1nxH0HAUqq1hVNXBOd5MuSh8UEEwhS755vHm
         roxos3HRQzmUi5jJxCDkhR0MTNEbNnPddA45VssaI5zlb+jnR2gAzsjz83T7X2vDUg5l
         Rd0mALwyPOenYoRbuUhoesKGCrolOYMmEvgYwN/xP7sRIh2CcDiH6ol2Uk2zZsiGeHD3
         p+F5j+O8Ew2wNYJGTuvrzob8ad7U4bGSr6TU40DYBntY1tD9aBUu0vQf3Il94prydNgp
         Tqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776871600; x=1777476400;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mguVNYCKn1UqNE6wCiBdJA3G/L2uqCAslGSj7SsF/bg=;
        b=aIKvRERrVj3EJiawMflBC6kmX2R/q5PE5UAaxIbCZD4UVVp4HUudXkl2xM9DqLBwf3
         0P7vuyWuvYS2O1w4bfC5g0bxUXYPPUR7IJfvPOrS75o1yR5fXO5B/woBwl49s4eThvf+
         +r1gcP4tbjgeBCNNKqA23baZvdJxC837xj2miSHQRnFt9fFRcviE2Riab62uDDzbJgLT
         AWXNGZpdvniJhYHAt72+2uuSFKHmrCLVNpGdYmCBybQWMIbmfeKZ6GKvHIGmxCOgKr+4
         IaU3gKh799ynsrZ894n6C3UExm4rb7v5l8FsAcsXHLTwDjUFENnEJKaToctvI4AnRrTO
         Go/w==
X-Forwarded-Encrypted: i=1; AFNElJ8wrcHparN0zyYuG+yMl9kp0tuAsMX1TjnQ7yg1C6GxWIyfxYvIL1hyOycbz4SCJATH9E/enssvMa29o78=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqAB+Tui7LU8W4DUX7/ggP5HjBrB6oaVIJa+OIj98JPMzxj2nF
	6JyOrPv7pqv8BLJ9sHYkke7yps2LE/iCnWwVBVzNQLeyu3FK9twxfT2Fan+aSc+/tw==
X-Gm-Gg: AeBDieuD+K+j1XLYwuWbZj8siEBp70qOTCXvCVfMqyW5lpgoqc19oDjLZycH6vdEQ8s
	VIqE7CPW3B1QlgKWYysRQZtGX1ro3s2aj6NbMM3AVKxIv6EEKrAjA0TzEQCAnqNd3XXR9+4BuO2
	Hn9TAa+R/zgM/QokP0kJLJhbktfngFxWZXNd8BDo305iSymzOjXbU9aLGC7+dZFelRoUzdyLtoW
	4nHYEH6lUNVvdh+YQf3S1+T7maUx56/TD+Mqq/ENaZQedR0JyICbqMNhqgPXDQl2w/u11lcADya
	b9wd/zQmx5OaQAtsNNaeAyfq4E8cR5d4qcFGZdOFuh8N8C+FjtMtEZwTXPKFEK0iPjz1lMBCHo+
	4U/v/lWG9Prf68d/i7eu+/r/YSgA0OaigvDVWDHJHoOqw0x9/ghJciC1A7FHufgKMbpucg2hnUd
	pIPRS1yFknRijtRekd7VyobfbF+e7HsA8bRuLjTQTRkh7CuALIoHVpbwSiCENHy+rhjrk+oKgLB
	Op6ogAOfCBwgRerKuwA
X-Received: by 2002:a05:6512:3d20:b0:5a3:ff44:f019 with SMTP id 2adb3069b0e04-5a4172ca21dmr9302999e87.11.1776871599679;
        Wed, 22 Apr 2026 08:26:39 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:ec7d:19d1:709a:2171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad30asm4558169e87.16.2026.04.22.08.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:26:38 -0700 (PDT)
Date: Wed, 22 Apr 2026 17:26:30 +0200
From: Marco Elver <elver@google.com>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
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
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>,
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>,
	KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH v2] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <aejopk23CsntyFOB@elver.google.com>
References: <20260415143735.2974230-1-elver@google.com>
 <202604210954.84C57E5E0@keescook>
 <CANpmjNO8CcR56LXAQf4GQhGcbU4MQkRCa7gVvwuAfvVrzEUhQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNO8CcR56LXAQf4GQhGcbU4MQkRCa7gVvwuAfvVrzEUhQg@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
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
	TAGGED_FROM(0.00)[bounces-12856-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[llvm.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE089447EEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 09:13PM +0200, Marco Elver wrote:
[...]
> > And actually, perhaps a global rename of the options so the selection
> > naming is at the end of the CONFIG phrase, and bundle the on/off into
> > the choice:
> >
> >
> > choice
> >         prompt "Partitioned slab cache mode"
> >         depends on PARTITION_KMALLOC_CACHES
> >         default KMALLOC_PARTITION_TYPED if !SLUB_TINY && CC_HAS_ALLOC_TOKEN
> >         default KMALLOC_PARTITION_RANDOM if !SLUB_TINY
> >         default KMALLOC_PARTITION_NONE
> >
> > config KMALLOC_PARTITION_NONE
> > ...
> > config KMALLOC_PARTITION_RANDOM
> >         depends on !SLUB_TINY
> > ...
> > config KMALLOC_PARTITION_TYPED
> >         depends on !SLUB_TINY && CC_HAS_ALLOC_TOKEN
> 
> There was a comment somewhere else that even introducing
> PARTITION_KMALLOC_CACHES might confuse users of RANDOM_KMALLOC_CACHES.
> I think completely getting rid of and renaming RANDOM_KMALLOC_CACHES
> has marginal benefit, and will cause friction for existing users (even
> moreso than already). I see little benefit here, and would prefer not
> to break user configs more than needed: configs that already set
> RANDOM_KMALLOC_CACHES, upon rebuild will be prompted to enable
> PARTITION_KMALLOC_CACHES; if user says Y, then their previous
> selection (RANDOM) would already be picked and they don't have to
> rediscover that it exists under a new name.
> 
> I can make this change, but only if you're sure the benefit outweighs
> the downsides here.

Upon further reflection, since the transition isn't smooth anyway, I'm
probably going to rename, but have them all use the PARTITION_KMALLOC_*
prefix so it's easy to just search for "CONFIG_PARTITION_KMALLOC_". I
don't see the need for a "NONE" variant - I've seen this pattern
elsewhere, and then you end up with users reading the .config and
concluding "CONFIG_PARTITION_KMALLOC_CACHES is enabled ... but oh never
mind actually it isn't" which I find confusing. This could be useful if
we had a dynamic on/off toggle and the default is NONE, but that's not
the case here.

diff --git a/Makefile b/Makefile
index f70170ed1522..d1f63ffb85f0 100644
--- a/Makefile
+++ b/Makefile
@@ -989,7 +989,7 @@ KBUILD_CFLAGS	+= $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
 endif
 endif
 
-ifdef CONFIG_TYPED_KMALLOC_CACHES
+ifdef CONFIG_PARTITION_KMALLOC_TYPED
 # PARTITION_KMALLOC_CACHES_NR + 1
 KBUILD_CFLAGS	+= -falloc-token-max=16
 endif
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 0537c3596163..b46300037ca5 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -501,10 +501,10 @@ int kmem_cache_shrink(struct kmem_cache *s);
 
 #ifdef CONFIG_PARTITION_KMALLOC_CACHES
 typedef struct { unsigned long v; } kmalloc_token_t;
-#ifdef CONFIG_RANDOM_KMALLOC_CACHES
+#ifdef CONFIG_PARTITION_KMALLOC_RANDOM
 extern unsigned long random_kmalloc_seed;
 #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
-#elif defined(CONFIG_TYPED_KMALLOC_CACHES)
+#elif defined(CONFIG_PARTITION_KMALLOC_TYPED)
 #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
 #endif
 #define DECL_TOKEN_PARAM(_token)	, kmalloc_token_t (_token)
@@ -732,11 +732,11 @@ static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, kmalloc
 	 * with a single branch for all the relevant flags.
 	 */
 	if (likely((flags & KMALLOC_NOT_NORMAL_BITS) == 0))
-#ifdef CONFIG_RANDOM_KMALLOC_CACHES
+#ifdef CONFIG_PARTITION_KMALLOC_RANDOM
 		/* PARTITION_KMALLOC_CACHES_NR (=15) copies + the KMALLOC_NORMAL */
 		return KMALLOC_PARTITION_START + hash_64(token.v ^ random_kmalloc_seed,
 							 ilog2(PARTITION_KMALLOC_CACHES_NR + 1));
-#elif defined(CONFIG_TYPED_KMALLOC_CACHES)
+#elif defined(CONFIG_PARTITION_KMALLOC_TYPED)
 		return KMALLOC_PARTITION_START + token.v;
 #else
 		return KMALLOC_NORMAL;
diff --git a/mm/Kconfig b/mm/Kconfig
index 6d44bd2633bb..d8510913fbeb 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -265,12 +265,12 @@ config PARTITION_KMALLOC_CACHES
 choice
 	prompt "Partitioned slab cache mode"
 	depends on PARTITION_KMALLOC_CACHES
-	default TYPED_KMALLOC_CACHES if CC_HAS_ALLOC_TOKEN
-	default RANDOM_KMALLOC_CACHES
+	default PARTITION_KMALLOC_TYPED if CC_HAS_ALLOC_TOKEN
+	default PARTITION_KMALLOC_RANDOM
 	help
 	  Selects the slab cache partitioning mode.
 
-config RANDOM_KMALLOC_CACHES
+config PARTITION_KMALLOC_RANDOM
 	bool "Randomize slab caches for normal kmalloc"
 	help
 	  Randomly pick a slab cache based on code address and a per-boot
@@ -282,17 +282,17 @@ config RANDOM_KMALLOC_CACHES
 	  the randomization by retrying attacks across multiple machines until
 	  the target objects are co-located.
 
-config TYPED_KMALLOC_CACHES
+config PARTITION_KMALLOC_TYPED
 	bool "Type based slab cache selection for normal kmalloc"
 	depends on CC_HAS_ALLOC_TOKEN
 	help
 	  Rely on Clang's allocation tokens to choose a slab cache, where token
 	  IDs are derived from the allocated type.
 
-	  Unlike RANDOM_KMALLOC_CACHES, cache assignment is deterministic based
+	  Unlike PARTITION_KMALLOC_RANDOM, cache assignment is deterministic based
 	  on type, which guarantees that objects of certain types are not
 	  placed in the same cache. This effectively mitigates certain classes
-	  of exploits that probabilistic defenses like RANDOM_KMALLOC_CACHES
+	  of exploits that probabilistic defenses like PARTITION_KMALLOC_RANDOM
 	  only make harder but not impossible. However, this also means the
 	  cache assignment is predictable.
 
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 21ab7dd79b5e..ca5e2a6d4e46 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -742,7 +742,7 @@ kmem_buckets kmalloc_caches[NR_KMALLOC_TYPES] __ro_after_init =
 { /* initialization for https://llvm.org/pr42570 */ };
 EXPORT_SYMBOL(kmalloc_caches);
 
-#ifdef CONFIG_RANDOM_KMALLOC_CACHES
+#ifdef CONFIG_PARTITION_KMALLOC_RANDOM
 unsigned long random_kmalloc_seed __ro_after_init;
 EXPORT_SYMBOL(random_kmalloc_seed);
 #endif
@@ -1010,7 +1010,7 @@ void __init create_kmalloc_caches(void)
 		for (i = KMALLOC_SHIFT_LOW; i <= KMALLOC_SHIFT_HIGH; i++)
 			new_kmalloc_cache(i, type);
 	}
-#ifdef CONFIG_RANDOM_KMALLOC_CACHES
+#ifdef CONFIG_PARTITION_KMALLOC_RANDOM
 	random_kmalloc_seed = get_random_u64();
 #endif
 

