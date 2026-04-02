Return-Path: <linux-kbuild+bounces-12604-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNgSEn11zmk6nwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12604-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 15:56:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B080438A191
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 15:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E57CC301F482
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 13:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7B230ACE6;
	Thu,  2 Apr 2026 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLzQM8r0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B3364927
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137740; cv=pass; b=CnbmLPrCS8j1D+JrRrtje3LK9quzwaEwYRYAcCE3tg4diaJ1sfUWI2eS/gG+4MaTC9zy+440j7F4O7y11cDhnp6jfnvTTNDb70yKTDEulZReFxVCrPIReUqXYhSpxVYlaakLs1tgGBdVcAVAoL7gxK2D3y5mcxNAHRLRTngeaaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137740; c=relaxed/simple;
	bh=l9tNbApyNKlKEGwYqWI2PPtB9POx0b+CnQVgR7HkWdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZZfwxlByb3dVPh2Xz3X4jkxwjwuAuAe/inXWMgFsPG0k7HamkfHbnZHYlx062pm98SDHTOeWt4SjFbbZSOK1qWJ+vrNlKo5D/FFv8DuI/3ku4o1zjaShEZM1zHXfKL+8ynMDXoDe82fWJ+nEfBR+MLPi2Ti8BsAfkI56gU+W6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLzQM8r0; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12bee82a1ecso2488071c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 06:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775137738; cv=none;
        d=google.com; s=arc-20240605;
        b=F14xuK0SVK1oqOjQxNFZDHngekGFpPz66fOwRDdwiOJIz5kHzjPIHzKlRuLAr5yzN4
         pclZnQTDjyUbAKRTPp0YCpg//3eDyHPrCzQiXIkWD4kZIiJR9MsaVA6mekCZKNGGWbA6
         ofbPnvTfJc17SkmceSnkMersIs1bxyfOs85Fjk3/7J4MwgdsWGQHM+7YMr0zEwRjQYDD
         atnClW6TbGozvGivbCZXybMQ9sD4TKmEMsUMm2n230eYyfZq+Yh5twfc3qd175VEbscv
         I60h3fP9Zz0u4cjcADmK6gUAVeRlh9A2K01gM0wSzGSc2JzpeRuhjYO4vu65kwTVf+lu
         aE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4odl4u5FIkYFl0AjuN4ex6RSgkq9844Lzudav/PrauU=;
        fh=DZ7JeDJzjJzN13X/HofGyC/zE7WO4/LBwhDPJX8ZJyM=;
        b=QATjN39Atc5iM790hypP/jHgBx/6i7xEdzYwi7tisvtmwwHuw6oPz68kIEqM+ODK85
         crPrhjky+FcYICyQ/Ng3LPTDcPsrbm4IuiIawX9Qyun8dEpHV0vh4g3lGlnZbF1rL6Lz
         WUOJHy2WQMqv/cy4TQeHEvwRxA0iJP3ldSNozsCK9zp3gCBVtCdlgDp+8asfvvIgkda5
         yKOwsrkOJWM8gb4EKbOhRBcT6m7ARM66JWIa/t3QVuEChX6oftLVxVVakwMs+z/Sntnu
         oNAd1SkE1ZfjlQtR5yTkjjr7KR0+xeealJRJBUUg0mT0zAKcQERT8QXdwa/pwbzQaR5P
         XYqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775137738; x=1775742538; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4odl4u5FIkYFl0AjuN4ex6RSgkq9844Lzudav/PrauU=;
        b=SLzQM8r04r8ZKVup576jMNr7dy/2s2DCum6qS3DJP77P+5KluGkmNryTfuyPbY6e1C
         uTUexQI3QJX+lDe0h3B4Wbslf2Bb88BFvdiWsCne2Jf0m5uQtDJ1Y3CkKDFmeM98TIG3
         GgaoW5w10PPgh5+HdbbAXevkQT1dzesYmLtjy1JrheujA0zaII1DhaEscciBtMvLWGgi
         H1DUe9/shw38o9qoBdKmgcnfYmt+YcKiFrKvzuOaoNShZHBdm8Gbs7p7J2d72TAotZr4
         C99+2J3YsS65O2JKEfoDlbpjnrhIhqhiEj+H2zcSFc1qwBdi3Ni1c1Ke9+hY6h9+SA+M
         hsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775137738; x=1775742538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4odl4u5FIkYFl0AjuN4ex6RSgkq9844Lzudav/PrauU=;
        b=IRIFFiRNNIAGUn/EFuQppVmdGV9EhmUTUk8yo1u4FqC9o78N6xtWM+yRIYYIBSX5x4
         +ug3+j+XBOGfR5EfF3ciHE5yhBtJW/q4ZiSLJA2V8ZXdW+sdglG/sGZZ+gLypFevNPXR
         AYnVUSidpw9/f1zzC0N6Sv467PISdWsL7r6/QeR52eT7VDV7bURErR+68IZOm4BSdiw3
         AH7hf7xDrFsU/LxOmujLqGl8F7FWH39Jus0wTJyJs6hredgQvetOPdy7PyCXNlln9Vyo
         j7iXiEmm32hPw+G4QNJN2t1d+xg7IuFJI+GNz+YPJEN2ITx4+de3Pgwc6kIwQw5tLvib
         oVEA==
X-Forwarded-Encrypted: i=1; AJvYcCU4t4jsz8aladdaPCAmS4ZgXUkaHtTXNRswURF1v9XutzRpAxMrH90i7mfKlRLxi/7L/0GcDgQCnsaHcGA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+h7OsjzLZam9c0uLB+GeY0qsD6LxZVyWN87SKuKg4wN4U7hSG
	e2N6w5d8XqSPWamamrIWLrq9KLcnT4hbE8p54UoK9swggTbbQ49jj5pyhIlfX322jiqv7e465YN
	nqih5JJVuTjQLYhh6UzVli1ldNDSv6SZio5O4NlKt
X-Gm-Gg: ATEYQzyW/b8/ODBNblK6wtw5uVZ3uoVza/9Q6DOS7Tp4BO10m6kWYGYoeVrBqpnAKIP
	5cq2Q5EN0zTe+QmQMSwk0EYVXH7QCkjLodga1+6geFyeK4YiH9b2g4UqtJ9/lohTzobB7fbo8BE
	KSiXgpd9dKKA9keujIdih3/wg5w270v9rqPZdiVUPCliOQCyFpw8QaXxtt1/BZvbTvduTyTo4SU
	V3WkZ9+lMjAh/DuG1sJayuVuNdWbZkko+QiNjoMVFL7RY0dAby/AvFaqGzs/u0nO6xeuc3mZLdw
	lUfZXw6U9yrn7rto6AXeHSCDdpywiOpnKrkLrtk=
X-Received: by 2002:a05:7022:4582:b0:11d:c86c:652e with SMTP id
 a92af1059eb24-12be64206a6mr4246421c88.5.1775137736932; Thu, 02 Apr 2026
 06:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <202604020400.jEq32K95-lkp@intel.com>
In-Reply-To: <202604020400.jEq32K95-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Thu, 2 Apr 2026 15:48:20 +0200
X-Gm-Features: AQROBzBTzNfYUXOsbmlfPQCs1PnLUVzNWPXPqQybMa2GKboY40C31FthWXXrJZ4
Message-ID: <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux-foundation.org>, Harry Yoo <harry.yoo@oracle.com>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12604-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,linux-foundation.org,intel.com,kvack.org,oracle.com,linux.dev,google.com,suse.com,gmail.com,vger.kernel.org,googlegroups.com];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B080438A191
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 at 15:33, Dan Carpenter <error27@gmail.com> wrote:
>
> Hi Marco,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
> patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
> config: um-randconfig-r072-20260401
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> smatch: v0.5.0-9004-gb810ac53
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/
>
> New smatch warnings:
> drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)

How is this related to the patch I sent? Did the <linux/slab.h> change
force rechecking of all these files and it found latent issues?

> vim +118 drivers/misc/lkdtm/heap.c
>
> 73f62e60d80c2d drivers/misc/lkdtm/heap.c Kees Cook    2022-03-03   92  static void lkdtm_READ_AFTER_FREE(void)
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   93  {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   94   int *base, *val, saw;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   95   size_t len = 1024;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   96   /*
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   97    * The slub allocator will use the either the first word or
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   98    * the middle of the allocation to store the free pointer,
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   99    * depending on configurations. Store in the second word to
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  100    * avoid running into the freelist.
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  101    */
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  102   size_t offset = sizeof(*base);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  103
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  104   base = kmalloc(len, GFP_KERNEL);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  105   if (!base) {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  106           pr_info("Unable to allocate base memory.\n");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  107           return;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  108   }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  109
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  110   val = kmalloc(len, GFP_KERNEL);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  111   if (!val) {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  112           pr_info("Unable to allocate val memory.\n");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  113           kfree(base);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  114           return;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  115   }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  116
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  117   *val = 0x12345678;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26 @118   base[offset] = *val;
>
> This doesn't really matter, but the comment says we are writing to the
> second word.  The base[] array holds 256 integers, so:
>
>         base[sizeof(int)] = *val;
>
> would be the third word, right?  A word is unsigned long, right?  All
> of a sudden I am unsure.  :P

???

So this is clearly a minor defect in this existing code (comment wrong
or code might want to match what the comment said), but "slab: support
for compiler-assisted type-based slab cache partitioning" didn't touch
that.

> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  119   pr_info("Value in memory before free: %x\n", base[offset]);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  120
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  121   kfree(base);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  122
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  123   pr_info("Attempting bad read from freed memory\n");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  124   saw = base[offset];
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  125   if (saw != *val) {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  126           /* Good! Poisoning happened, so declare a win. */
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  127           pr_info("Memory correctly poisoned (%x)\n", saw);
> 5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  128   } else {
> 5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  129           pr_err("FAIL: Memory was not poisoned!\n");
> 5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  130           pr_expected_config_param(CONFIG_INIT_ON_FREE_DEFAULT_ON, "init_on_free");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  131   }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  132
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  133   kfree(val);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  134  }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  135
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  136  static void lkdtm_KFENCE_READ_AFTER_FREE(void)
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  137  {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  138   int *base, val, saw;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  139   unsigned long timeout, resched_after;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  140   size_t len = 1024;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  141   /*
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  142    * The slub allocator will use the either the first word or
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  143    * the middle of the allocation to store the free pointer,
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  144    * depending on configurations. Store in the second word to
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  145    * avoid running into the freelist.
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  146    */
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  147   size_t offset = sizeof(*base);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  148
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  149   /*
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  150    * 100x the sample interval should be more than enough to ensure we get
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  151    * a KFENCE allocation eventually.
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  152    */
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  153   timeout = jiffies + msecs_to_jiffies(100 * kfence_sample_interval);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  154   /*
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  155    * Especially for non-preemption kernels, ensure the allocation-gate
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  156    * timer can catch up: after @resched_after, every failed allocation
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  157    * attempt yields, to ensure the allocation-gate timer is scheduled.
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  158    */
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  159   resched_after = jiffies + msecs_to_jiffies(kfence_sample_interval);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  160   do {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  161           base = kmalloc(len, GFP_KERNEL);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  162           if (!base) {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  163                   pr_err("FAIL: Unable to allocate kfence memory!\n");
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  164                   return;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  165           }
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  166
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  167           if (is_kfence_address(base)) {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  168                   val = 0x12345678;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29 @169                   base[offset] = val;
>                                                                                         ^^^^^^^^^^^^^^^^^^
> Same here.

Unrelated to "slab: support for compiler-assisted type-based slab
cache partitioning".

