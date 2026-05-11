Return-Path: <linux-kbuild+bounces-13122-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDb0FPM1AmocpAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13122-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 22:02:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFC4515670
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 22:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E2F2306BB25
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 20:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B71032AADC;
	Mon, 11 May 2026 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZTnPqJtM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAAF37F72A
	for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2026 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529741; cv=none; b=IXikSVUuIxLJepblxOB98nnmtC8rQJ7q8UFc7HiiBEF/Fd2hc/TtFa3eiyPkS5Nqu9rCAw0164LbfdVKoFH6vRbD+eVFZdmolZfJUPIYH2/uhl5sCN24gZFEqKOnWqiYkHjc+f+f2gKxiV86mnM4QOL8yiU272jM8SxrpoEvyAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529741; c=relaxed/simple;
	bh=nuKnNBRfZjWfumh5xz3YpLiN+7yxxuLTEfzHwAHYAEI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fpx15pD6QmQCBiXQLf2+yUFmCOxexeffjspkoWZrrlskDHhrWzNsQewZpcr87AB1T0BHgwIo5FOBF6L3Bv9gAp/efv7qiqIP/sRvbCbmxCD8EtJ77l0TEanYoL2ChwsEMk24O/wfyj4BbzI9GSgYSd+fgTWsN17ayAsiPhPKxpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZTnPqJtM; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-44d83e45febso4526514f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2026 13:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778529737; x=1779134537; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=COIrc4uMW8PdzVdTIWgCyh1EBSpKptyYSFL7OdZI4gw=;
        b=ZTnPqJtMiI6jGOSo9OCLVvbiJrj7BuGElCSdquvGkGE9QrdeLUP4ZhDmFN7A3JYln+
         2K9+LVnxQZaQ3ZCeZaeoMASQxmsOFAkXk33yVVRSXh8qd2xR3t+PPRpvUsbiEkkvsF7z
         4pblgG8vydEZToArZ0ieW3DH3uOey3ykOcrJIlJw1FtOcHqtCbM107jU1//NqNnQTJYE
         ye2QoeVP0QL8GDqWWixpr1yHZLilF4/cGA8op92sDOrysO8iTVnutAgV5yE8TgTarS11
         4SOLutLOWA7dVk0pqS4UWqqwbAYNc2V1Z/zgMNxinLpFOhDnJPMp9zxShtTdVJwKA0Z/
         cvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778529737; x=1779134537;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COIrc4uMW8PdzVdTIWgCyh1EBSpKptyYSFL7OdZI4gw=;
        b=cu0u40llx/XG8O0glsa5d6boVKOMetlk+4D54D1UKHhZd9MnCmohjZrAh0VJprutCc
         oDAlB6g5fqU6hAcZxNzZTXU/FIPhZMXUIZvIUhf0uJgSVzc8j7BtSG5+O686IeetGbtE
         1Axj4uCo1e6boSpUEpR12n1jA2vUMgYib8ZPgFoamV0bKb2Owag8hmHZCbe8VTgmoGsq
         UpoFq3wXWoGAd/9lZjBHs6ewFkCRJULEbc32jk/nPkkkewKjrgvm2P3vrnXpRamjZerC
         /7W3pwzwv9Yn1SWxaP1bx0fsHHnDnqaARHOZhzj9LS8XHWW5kPJ72pi5bMy+/8GDLcOQ
         wcSg==
X-Forwarded-Encrypted: i=1; AFNElJ8BjLgq9J2BsjyhjhhqTr2hIwyfl2zdQUeRHZayIaSisqTA9EPrFFMBfK0f5uPZrwkgPLLN0EkfZz40K3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVoZAFNSSmbxp50CwWYApyu9WdLbZxuepn8zaUuMWCt1G8bshu
	vN2cHx3RLzMW/L8nIvj61TpsC5c0w0+8Ni27GdzLMXO8DbrIPemOhGgvJg6tky3HlMLcUVVvO67
	jWw==
X-Received: from wroz5.prod.google.com ([2002:adf:f1c5:0:b0:43d:7b52:1f8c])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40c7:b0:449:31ca:5e53
 with SMTP id ffacd0b85a97d-45ac234b93emr1437364f8f.8.1778529736822; Mon, 11
 May 2026 13:02:16 -0700 (PDT)
Date: Mon, 11 May 2026 22:00:50 +0200
In-Reply-To: <20260511200136.3201646-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511200136.3201646-3-elver@google.com>
Subject: [PATCH v4 3/3] slab: fix kernel-docs for mm-api
From: Marco Elver <elver@google.com>
To: elver@google.com, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, 
	David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, 
	Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0FFC4515670
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13122-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The mm-api kernel-docs have been disconnected from their symbols. While
the scripts were previously taught to handle the _noprof suffix added by
allocation tagging (in 51a7bf0238c2 "scripts/kernel-doc: drop "_noprof"
on function prototypes"), this does not handle cases where the internal
implementation function has an additional leading underscore. The added
optional parameters (via DECL_KMALLOC_PARAMS) further complicate parsing
the internal signatures.

When the kernel-doc block remains above the internal implementation
function but uses the public API name, the documentation generator fails
to associate the documented symbol.

Simply moving the docs to the macros in slab.h fixes the association but
causes loss of types in the generated documentation (rendering as e.g.
untyped 'kmalloc(size, flags)' macro).

Fix this by:

1. Moving the kernel-doc comment blocks from slub.c to slab.h, placing
   them directly above the user-facing macros.

2. Providing explicit, typed C prototypes for the documented APIs inside
   '#if 0 /* kernel-doc */' blocks.

3. Converting the variadic macros for the documented APIs to use
   explicit arguments to match the documentation.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Provide typed C prototypes in '#if 0' blocks to properly render API.
---
 include/linux/slab.h | 216 +++++++++++++++++++++++++++++++++----------
 mm/slub.c            |  98 --------------------
 2 files changed, 168 insertions(+), 146 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index efab6b2ccf21..a4bf1585411f 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -530,7 +530,49 @@ void * __must_check krealloc_node_align_noprof(const void *objp,
 					       unsigned long align,
 					       gfp_t flags, int nid) __realloc_size(2);
 #define krealloc_noprof(_o, _s, _f)	krealloc_node_align_noprof(_o, PASS_TOKEN_PARAMS(_s, __kmalloc_token(_s)), 1, _f, NUMA_NO_NODE)
-#define krealloc_node_align(_o, _s, _a, _f, _n)	alloc_hooks(krealloc_node_align_noprof(_o, PASS_TOKEN_PARAMS(_s, __kmalloc_token(_s)), _a, _f, _n))
+#if 0 /* kernel-doc */
+/**
+ * krealloc_node_align - reallocate memory. The contents will remain unchanged.
+ * @p: object to reallocate memory for.
+ * @new_size: how many bytes of memory are required.
+ * @align: desired alignment.
+ * @flags: the type of memory to allocate.
+ * @nid: NUMA node or NUMA_NO_NODE
+ *
+ * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
+ * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
+ *
+ * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
+ * Documentation/core-api/memory-allocation.rst for more details.
+ *
+ * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
+ * initial memory allocation, every subsequent call to this API for the same
+ * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
+ * __GFP_ZERO is not fully honored by this API.
+ *
+ * When slub_debug_orig_size() is off, krealloc() only knows about the bucket
+ * size of an allocation (but not the exact size it was allocated with) and
+ * hence implements the following semantics for shrinking and growing buffers
+ * with __GFP_ZERO::
+ *
+ *           new             bucket
+ *   0       size             size
+ *   |--------|----------------|
+ *   |  keep  |      zero      |
+ *
+ * Otherwise, the original allocation size 'orig_size' could be used to
+ * precisely clear the requested size, and the new size will also be stored
+ * as the new 'orig_size'.
+ *
+ * In any case, the contents of the object pointed to are preserved up to the
+ * lesser of the new and old sizes.
+ *
+ * Return: pointer to the allocated memory or %NULL in case of error
+ */
+void *krealloc_node_align(const void *p, size_t new_size, unsigned long align, gfp_t flags, int nid);
+#endif
+#define krealloc_node_align(p, new_size, align, flags, nid) \
+	alloc_hooks(krealloc_node_align_noprof(p, PASS_TOKEN_PARAMS(new_size, __kmalloc_token(new_size)), align, flags, nid))
 #define krealloc_node(_o, _s, _f, _n)	krealloc_node_align(_o, _s, 1, _f, _n)
 #define krealloc(...)			krealloc_node(__VA_ARGS__, NUMA_NO_NODE)
 
@@ -913,6 +955,23 @@ void *__kmalloc_large_noprof(size_t size, gfp_t flags)
 void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
 				__assume_page_alignment __alloc_size(1);
 
+static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
+{
+	if (__builtin_constant_p(size) && size) {
+		unsigned int index;
+
+		if (size > KMALLOC_MAX_CACHE_SIZE)
+			return __kmalloc_large_noprof(size, flags);
+
+		index = kmalloc_index(size);
+		return __kmalloc_cache_noprof(
+				kmalloc_caches[kmalloc_type(flags, token)][index],
+				flags, size);
+	}
+	return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
+}
+#define kmalloc_noprof(...)			_kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
+#if 0 /* kernel-doc */
 /**
  * kmalloc - allocate kernel memory
  * @size: how many bytes of memory are required.
@@ -968,27 +1027,27 @@ void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
  *	Try really hard to succeed the allocation but fail
  *	eventually.
  */
-static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
-{
-	if (__builtin_constant_p(size) && size) {
-		unsigned int index;
-
-		if (size > KMALLOC_MAX_CACHE_SIZE)
-			return __kmalloc_large_noprof(size, flags);
-
-		index = kmalloc_index(size);
-		return __kmalloc_cache_noprof(
-				kmalloc_caches[kmalloc_type(flags, token)][index],
-				flags, size);
-	}
-	return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
-}
-#define kmalloc_noprof(...)			_kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
-#define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
+void *kmalloc(size_t size, gfp_t flags);
+#endif
+#define kmalloc(size, flags)			alloc_hooks(kmalloc_noprof(size, flags))
 
 void *_kmalloc_nolock_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t gfp_flags, int node);
 #define kmalloc_nolock_noprof(_s, _f, _n)	_kmalloc_nolock_noprof(PASS_TOKEN_PARAMS(_s, __kmalloc_token(_s)), _f, _n)
-#define kmalloc_nolock(...)			alloc_hooks(kmalloc_nolock_noprof(__VA_ARGS__))
+#if 0 /* kernel-doc */
+/**
+ * kmalloc_nolock - Allocate an object of given size from any context.
+ * @size: size to allocate
+ * @gfp_flags: GFP flags. Only __GFP_ACCOUNT, __GFP_ZERO, __GFP_NO_OBJ_EXT
+ * allowed.
+ * @node: node number of the target node.
+ *
+ * Return: pointer to the new object or NULL in case of error.
+ * NULL does not mean EBUSY or EAGAIN. It means ENOMEM.
+ * There is no reason to call it again and expect !NULL.
+ */
+void *kmalloc_nolock(size_t size, gfp_t gfp_flags, int node);
+#endif
+#define kmalloc_nolock(size, gfp_flags, node)	alloc_hooks(kmalloc_nolock_noprof(size, gfp_flags, node))
 
 /**
  * __alloc_objs - Allocate objects of a given type using
@@ -1115,23 +1174,40 @@ static __always_inline __alloc_size(1) void *_kmalloc_node_noprof(size_t size, g
 #define kmalloc_node_noprof(...)		_kmalloc_node_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
 #define kmalloc_node(...)			alloc_hooks(kmalloc_node_noprof(__VA_ARGS__))
 
+static inline __alloc_size(1, 2) void *_kmalloc_array_noprof(size_t n, size_t size, gfp_t flags, kmalloc_token_t token)
+{
+	size_t bytes;
+
+	if (unlikely(check_mul_overflow(n, size, &bytes)))
+		return NULL;
+	return _kmalloc_noprof(bytes, flags, token);
+}
+#define kmalloc_array_noprof(...)		_kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
+#if 0 /* kernel-doc */
 /**
  * kmalloc_array - allocate memory for an array.
  * @n: number of elements.
  * @size: element size.
  * @flags: the type of memory to allocate (see kmalloc).
  */
-static inline __alloc_size(1, 2) void *_kmalloc_array_noprof(size_t n, size_t size, gfp_t flags, kmalloc_token_t token)
+void *kmalloc_array(size_t n, size_t size, gfp_t flags);
+#endif
+#define kmalloc_array(n, size, flags)		alloc_hooks(kmalloc_array_noprof(n, size, flags))
+
+static inline __realloc_size(2, 3) void * __must_check _krealloc_array_noprof(void *p,
+								       size_t new_n,
+								       size_t new_size,
+								       gfp_t flags, kmalloc_token_t token)
 {
 	size_t bytes;
 
-	if (unlikely(check_mul_overflow(n, size, &bytes)))
+	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
 		return NULL;
-	return _kmalloc_noprof(bytes, flags, token);
-}
-#define kmalloc_array_noprof(...)		_kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
-#define kmalloc_array(...)			alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
 
+	return krealloc_node_align_noprof(p, PASS_TOKEN_PARAMS(bytes, token), 1, flags, NUMA_NO_NODE);
+}
+#define krealloc_array_noprof(...)		_krealloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
+#if 0 /* kernel-doc */
 /**
  * krealloc_array - reallocate memory for an array.
  * @p: pointer to the memory chunk to reallocate
@@ -1149,20 +1225,9 @@ static inline __alloc_size(1, 2) void *_kmalloc_array_noprof(size_t n, size_t si
  * In any case, the contents of the object pointed to are preserved up to the
  * lesser of the new and old sizes.
  */
-static inline __realloc_size(2, 3) void * __must_check _krealloc_array_noprof(void *p,
-								       size_t new_n,
-								       size_t new_size,
-								       gfp_t flags, kmalloc_token_t token)
-{
-	size_t bytes;
-
-	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
-		return NULL;
-
-	return krealloc_node_align_noprof(p, PASS_TOKEN_PARAMS(bytes, token), 1, flags, NUMA_NO_NODE);
-}
-#define krealloc_array_noprof(...)		_krealloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
-#define krealloc_array(...)			alloc_hooks(krealloc_array_noprof(__VA_ARGS__))
+void *krealloc_array(void *p, size_t new_n, size_t new_size, gfp_t flags);
+#endif
+#define krealloc_array(p, new_n, new_size, flags) alloc_hooks(krealloc_array_noprof(p, new_n, new_size, flags))
 
 /**
  * kcalloc - allocate memory for an array. The memory is set to zero.
@@ -1214,17 +1279,20 @@ static inline __alloc_size(1, 2) void *_kmalloc_array_node_noprof(size_t n, size
  */
 #define kmem_cache_zalloc(_k, _flags)		kmem_cache_alloc(_k, (_flags)|__GFP_ZERO)
 
-/**
- * kzalloc - allocate memory. The memory is set to zero.
- * @size: how many bytes of memory are required.
- * @flags: the type of memory to allocate (see kmalloc).
- */
 static inline __alloc_size(1) void *_kzalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
 {
 	return _kmalloc_noprof(size, flags | __GFP_ZERO, token);
 }
 #define kzalloc_noprof(...)			_kzalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
-#define kzalloc(...)				alloc_hooks(kzalloc_noprof(__VA_ARGS__))
+#if 0 /* kernel-doc */
+/**
+ * kzalloc - allocate memory. The memory is set to zero.
+ * @size: how many bytes of memory are required.
+ * @flags: the type of memory to allocate (see kmalloc).
+ */
+void *kzalloc(size_t size, gfp_t flags);
+#endif
+#define kzalloc(size, flags)			alloc_hooks(kzalloc_noprof(size, flags))
 #define kzalloc_node(_size, _flags, _node)	kmalloc_node(_size, (_flags)|__GFP_ZERO, _node)
 
 void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long align,
@@ -1233,7 +1301,29 @@ void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long
 	__kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, NULL, __kmalloc_token(_size)), _align, _flags, _node)
 #define kvmalloc_node_align(...)		\
 	alloc_hooks(kvmalloc_node_align_noprof(__VA_ARGS__))
-#define kvmalloc_node(_s, _f, _n)		kvmalloc_node_align(_s, 1, _f, _n)
+#if 0 /* kernel-doc */
+/**
+ * kvmalloc_node - attempt to allocate physically contiguous memory, but upon
+ * failure, fall back to non-contiguous (vmalloc) allocation.
+ * @size: size of the request.
+ * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
+ * @node: numa node to allocate from
+ *
+ * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
+ * Documentation/core-api/memory-allocation.rst for more details.
+ *
+ * Uses kmalloc to get the memory but if the allocation fails then falls back
+ * to the vmalloc allocator. Use kvfree for freeing the memory.
+ *
+ * GFP_NOWAIT and GFP_ATOMIC are supported, the __GFP_NORETRY modifier is not.
+ * __GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
+ * preferable to the vmalloc fallback, due to visible performance drawbacks.
+ *
+ * Return: pointer to the allocated memory of %NULL in case of failure
+ */
+void *kvmalloc_node(size_t size, gfp_t flags, int node);
+#endif
+#define kvmalloc_node(size, flags, node)	kvmalloc_node_align(size, 1, flags, node)
 #define kvmalloc_node_noprof(size, flags, node)	\
 	kvmalloc_node_align_noprof(size, 1, flags, node)
 #define kvmalloc(...)				kvmalloc_node(__VA_ARGS__, NUMA_NO_NODE)
@@ -1266,8 +1356,38 @@ _kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node, kmallo
 
 void *kvrealloc_node_align_noprof(const void *p, DECL_TOKEN_PARAMS(size, token), unsigned long align,
 				  gfp_t flags, int nid) __realloc_size(2);
-#define kvrealloc_node_align(_p, _s, _a, _f, _n)	\
-	alloc_hooks(kvrealloc_node_align_noprof(_p, PASS_TOKEN_PARAMS(_s, __kmalloc_token(_s)), _a, _f, _n))
+#if 0 /* kernel-doc */
+/**
+ * kvrealloc_node_align - reallocate memory; contents remain unchanged
+ * @p: object to reallocate memory for
+ * @size: the size to reallocate
+ * @align: desired alignment
+ * @flags: the flags for the page level allocator
+ * @nid: NUMA node id
+ *
+ * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If @size is 0
+ * and @p is not a %NULL pointer, the object pointed to is freed.
+ *
+ * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
+ * Documentation/core-api/memory-allocation.rst for more details.
+ *
+ * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
+ * initial memory allocation, every subsequent call to this API for the same
+ * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
+ * __GFP_ZERO is not fully honored by this API.
+ *
+ * In any case, the contents of the object pointed to are preserved up to the
+ * lesser of the new and old sizes.
+ *
+ * This function must not be called concurrently with itself or kvfree() for the
+ * same memory allocation.
+ *
+ * Return: pointer to the allocated memory or %NULL in case of error
+ */
+void *kvrealloc_node_align(const void *p, size_t size, unsigned long align, gfp_t flags, int nid);
+#endif
+#define kvrealloc_node_align(p, size, align, flags, nid)	\
+	alloc_hooks(kvrealloc_node_align_noprof(p, PASS_TOKEN_PARAMS(size, __kmalloc_token(size)), align, flags, nid))
 #define kvrealloc_node(_p, _s, _f, _n)		kvrealloc_node_align(_p, _s, 1, _f, _n)
 #define kvrealloc(...)				kvrealloc_node(__VA_ARGS__, NUMA_NO_NODE)
 
diff --git a/mm/slub.c b/mm/slub.c
index a6e9015601d6..00cb88af79f8 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5310,17 +5310,6 @@ void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
 }
 EXPORT_SYMBOL(__kmalloc_noprof);
 
-/**
- * kmalloc_nolock - Allocate an object of given size from any context.
- * @size: size to allocate
- * @gfp_flags: GFP flags. Only __GFP_ACCOUNT, __GFP_ZERO, __GFP_NO_OBJ_EXT
- * allowed.
- * @node: node number of the target node.
- *
- * Return: pointer to the new object or NULL in case of error.
- * NULL does not mean EBUSY or EAGAIN. It means ENOMEM.
- * There is no reason to call it again and expect !NULL.
- */
 void *_kmalloc_nolock_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t gfp_flags, int node)
 {
 	gfp_t alloc_gfp = __GFP_NOWARN | __GFP_NOMEMALLOC | gfp_flags;
@@ -6721,44 +6710,6 @@ __do_krealloc(const void *p, size_t new_size, unsigned long align, gfp_t flags,
 	return ret;
 }
 
-/**
- * krealloc_node_align - reallocate memory. The contents will remain unchanged.
- * @p: object to reallocate memory for.
- * @new_size: how many bytes of memory are required.
- * @align: desired alignment.
- * @flags: the type of memory to allocate.
- * @nid: NUMA node or NUMA_NO_NODE
- *
- * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
- * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
- *
- * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
- * Documentation/core-api/memory-allocation.rst for more details.
- *
- * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
- * initial memory allocation, every subsequent call to this API for the same
- * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
- * __GFP_ZERO is not fully honored by this API.
- *
- * When slub_debug_orig_size() is off, krealloc() only knows about the bucket
- * size of an allocation (but not the exact size it was allocated with) and
- * hence implements the following semantics for shrinking and growing buffers
- * with __GFP_ZERO::
- *
- *           new             bucket
- *   0       size             size
- *   |--------|----------------|
- *   |  keep  |      zero      |
- *
- * Otherwise, the original allocation size 'orig_size' could be used to
- * precisely clear the requested size, and the new size will also be stored
- * as the new 'orig_size'.
- *
- * In any case, the contents of the object pointed to are preserved up to the
- * lesser of the new and old sizes.
- *
- * Return: pointer to the allocated memory or %NULL in case of error
- */
 void *krealloc_node_align_noprof(const void *p, DECL_TOKEN_PARAMS(new_size, token), unsigned long align,
 				 gfp_t flags, int nid)
 {
@@ -6801,28 +6752,6 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
 	return flags;
 }
 
-/**
- * __kvmalloc_node - attempt to allocate physically contiguous memory, but upon
- * failure, fall back to non-contiguous (vmalloc) allocation.
- * @size: size of the request.
- * @b: which set of kmalloc buckets to allocate from.
- * @token: allocation token.
- * @align: desired alignment.
- * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
- * @node: numa node to allocate from
- *
- * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
- * Documentation/core-api/memory-allocation.rst for more details.
- *
- * Uses kmalloc to get the memory but if the allocation fails then falls back
- * to the vmalloc allocator. Use kvfree for freeing the memory.
- *
- * GFP_NOWAIT and GFP_ATOMIC are supported, the __GFP_NORETRY modifier is not.
- * __GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
- * preferable to the vmalloc fallback, due to visible performance drawbacks.
- *
- * Return: pointer to the allocated memory of %NULL in case of failure
- */
 void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long align,
 			     gfp_t flags, int node)
 {
@@ -6904,33 +6833,6 @@ void kvfree_sensitive(const void *addr, size_t len)
 }
 EXPORT_SYMBOL(kvfree_sensitive);
 
-/**
- * kvrealloc_node_align - reallocate memory; contents remain unchanged
- * @p: object to reallocate memory for
- * @size: the size to reallocate
- * @align: desired alignment
- * @flags: the flags for the page level allocator
- * @nid: NUMA node id
- *
- * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If @size is 0
- * and @p is not a %NULL pointer, the object pointed to is freed.
- *
- * Only alignments up to those guaranteed by kmalloc() will be honored. Please see
- * Documentation/core-api/memory-allocation.rst for more details.
- *
- * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
- * initial memory allocation, every subsequent call to this API for the same
- * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
- * __GFP_ZERO is not fully honored by this API.
- *
- * In any case, the contents of the object pointed to are preserved up to the
- * lesser of the new and old sizes.
- *
- * This function must not be called concurrently with itself or kvfree() for the
- * same memory allocation.
- *
- * Return: pointer to the allocated memory or %NULL in case of error
- */
 void *kvrealloc_node_align_noprof(const void *p, DECL_TOKEN_PARAMS(size, token), unsigned long align,
 				  gfp_t flags, int nid)
 {
-- 
2.54.0.563.g4f69b47b94-goog


