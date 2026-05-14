Return-Path: <linux-kbuild+bounces-13152-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPruBmKGBWr5XwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13152-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 10:22:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED5F53F382
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 10:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E1903011BE0
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 08:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9724F3D7D64;
	Thu, 14 May 2026 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsBzbse7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1F13C199E
	for <linux-kbuild@vger.kernel.org>; Thu, 14 May 2026 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746973; cv=none; b=KgDfVih9QwuDTCTu+M7/3Rn5RxhzGXWdahizvrskRcY1v5tfol2TGfciDPAeqLLKgDvLHHP0NdPa5F/sGjugVpx2c9liQNqaLmSUCRO5KFJJhmL99SRyhrn/ibNrslQs8+3JmsEog2zAUt7UBY/LQFz1DNvLjkFD4rQ8HsDebBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746973; c=relaxed/simple;
	bh=3WjDEzCHsM60UDSdPtY66/xViUYjVkKVnCvLEkxbKG8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MeRGsL3GA17Q0W+9K8uR2LUTfZ+Vm09PROmBZMOm5V9HlVZ0VcS7dWe/MRuat2KKH+JqJI46Ja1Kr8iTN7zOLjM9Pdx0Q0eEQgKDHNt/UjMP8ZMwSR9+CNKjp3c1XS7d26M3v7ddiZns6WZB2FEaC6qBoDVWEKq5W5X7AhOmWjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsBzbse7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ad135063so62253545e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 14 May 2026 01:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778746970; x=1779351770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnnqbs2N6v6CmeDw57e03ve8ioJE3EIg9PporZt60VY=;
        b=jsBzbse74tGfrnjDhmHYu9SXtq2DJ6g/z5074656Zu/s2BfB0mS3jiL36gfNpdtRJw
         lAj7RWTmmk2NczHARYwE3FJ+2bz+cLlN9G2V2R6Vusl55TbgG2AUM+ZvnqGF6QfeEHec
         ESfT3lMpDLbeZwUnkTua/rY+ksxEzbLC7rWtTiE4ena39cijI3koGQU6l5h78QWatU96
         87I9Ifg6dQuDqMjk3NZanKuabqVIVNmHlHjcxugww4WbrSnJyUxyqajdHnwrPjNDtATW
         8elV7rIq5CpXwexbpZyZkK0ZMUHvOekzXtF6JoCIwejCnO7KY7Xg2SuzvBMZEZAC1ARZ
         FIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778746970; x=1779351770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jnnqbs2N6v6CmeDw57e03ve8ioJE3EIg9PporZt60VY=;
        b=G2J1CiWxifcn61qN0qqKkKzJkobxz+k/uoZXY1PexHgl0QHEmF16HZC7PdNxhtcyNR
         q//GouBPQOxKRgf8vXnm36cyl5gGDaNKXjiOEolIFhrv6YB2byEq9CXDW4mipsYoHMf0
         5W3mehg0//GRZbYbQmZa9vx1acXWyYAota8LKCAvimNN8TrYAsV9sIDX+C67imOGCM6y
         ljJ6IaunmpWFYO8whPHTCJlRnxQ9ggrhGnu6B8U1qFAmqxb0b1W25FrGqY2zyJfXzu8Z
         TxWaSXfeCF/UFg/MWkjKe7BX38Fah8AGLiIxtVUECz8WjaM+LoF1PVESRv+8f25lquWD
         jVMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HybA30s52gJkk31dEZ9QBXFrw8piaFO90upXzSJPqN7lctjC3bgEW3jrM2f5sGH7aSE/kygEvGdwZe0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPHW+phLso8wFjVj6SgAAXVoPgnYQgvOEmUuVs/BFs20VoiOd
	Eo2i+2wZ0uAACdlVbFgqjUYT776UWD40OiO9q1wSrRDWML+qaH+BCcYz
X-Gm-Gg: Acq92OFOCeA0PB1kAE5qAssHmkLMqH54dUOstqNoV6UUFMLhWXCVYgzgDqYFxPF/Pw6
	P3hNrKMfAPhpLMEBO/vGTsD6XsmDRecoQuNxznNwZ/o13qAo5LWcJsiG8h2tv3yGDFjg8a4VuQS
	Nc2v+x9F6QYeO8oYY9Eq/CtNY7DFcqw2pDvhjzL19nbgHkjeQskLW6ZUGOBJG27+4Fhuk3JJ6DS
	zwvcIl+dBHsNSKc9rsV4KlVEgJWyfrPhF4aHQrJ/ABPJFdI3OMIjTbw47e0/n9kTj68ggrDUdBa
	slT+YbiOsZxqDNddcWTTOulxsLzGFsr57O03nNrBcQ1QadZtRnrtFOSxplb4HPxNcJUomZie1Lf
	uSxUCrcy9LvNnXTz0kQw/RI8qcg3jxRKcEh590n7QgJUZPSU2elgBQqkwFFN39H9eqHwLR9m9aF
	0CvWqCK90CGwHwemWRC92y57wIPMgY/NwdzhpaIIITmf+a9dyxiOJOgkFv+k05
X-Received: by 2002:a05:600c:45c8:b0:48d:35e:84a0 with SMTP id 5b1f17b1804b1-48fcea151fbmr93519065e9.28.1778746970041;
        Thu, 14 May 2026 01:22:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd64a22a9sm49882335e9.8.2026.05.14.01.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:22:49 -0700 (PDT)
Date: Thu, 14 May 2026 09:22:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, David Hildenbrand
 <david@kernel.org>, David Rientjes <rientjes@google.com>, Dmitry Vyukov
 <dvyukov@google.com>, Jann Horn <jannh@google.com>, Justin Stitt
 <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook
 <kees@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo
 <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, Mike Rapoport
 <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Suren Baghdasaryan <surenb@google.com>,
 linux-hardening@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, Dennis
 Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter
 <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko
 <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
Subject: Re: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM
 randomness
Message-ID: <20260514092246.12b7d1ee@pumpkin>
In-Reply-To: <20260511200136.3201646-2-elver@google.com>
References: <20260511200136.3201646-1-elver@google.com>
	<20260511200136.3201646-2-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6ED5F53F382
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13152-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 11 May 2026 22:00:49 +0200
Marco Elver <elver@google.com> wrote:

> When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> to identify the allocation site. _RET_IP_, however, evaluates to the
> caller's parent's instruction pointer rather than the actual allocation
> site; this would lead to collisions where a function performs multiple
> allocations.
> 
> With the generalization to kmalloc_token_t, we now generate the token at
> the outermost macro, and using _THIS_IP_ would fix this for all cases.
> 
> Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> the address of a local label, which is considered broken by both GCC [1]
> and Clang [2] because label addresses are only expected to be used with
> computed gotos. While the generic version more or less works today, it
> is known to be brittle. For example, Clang -O2 always returns 1 when
> this function is inlined:
> 
>         static inline unsigned long get_ip(void)
>         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> 
> To provide a reliable unique identifier without breaking architectures
> relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> to _THIS_IP_ where architectures provide a safe implementation, and
> falls back to a zero-cost static marker where _THIS_IP_ is broken.

Doesn't that mean that all the other uses of _THIS_IP_ (which seem to mostly
be tracking lock requests) are basically broken on everything except x86-64.

Would it be better to actually fit that?
It isn't as though it is hard asm, you just need to look at how gcc generates
PIC references to static data.

-- David

