Return-Path: <linux-kbuild+bounces-12618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EvqIfe+zmmDpwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12618-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 21:09:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B838D8E5
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 21:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 249043026179
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 19:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A800C3F20F4;
	Thu,  2 Apr 2026 19:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VGMOaEkS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3991B379EEC
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775156964; cv=pass; b=uEHmmYrbwGk3NxL1jlfylVovV4FnkymNfG4sisCENBD4hJ7pn3Rp5TxpBEwe/JjQ9yKl1UwDEx06aRM7854y8BtZBQbR2/1DunmNMXhaFZJUxv8XSbEteIwmWu8UvQSYft4UrpTLNhctbPP4ThtXjmPr1OSs6dWQUjxxesJrnys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775156964; c=relaxed/simple;
	bh=AkTXuskHgqFSHuPaesiQpEtKQBcqndFo0G825t42ZQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/0axHeI3UEwwUyR1hFD7aJhs7wQ5Kx+WzYqAFuuxeS/HRQRUo81c4Qa23zMUj0cUHFdYis3ipvUPna38VpzeBDwe4XvRkOVukUrEvGi/wb8cKLpzT5Bbq1uiLlujLKBBW8p/fwQLG0FCuyHSTmHK1uPVKMv3zr1kDfAvd06Rt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VGMOaEkS; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12732165d1eso1884863c88.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 12:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775156961; cv=none;
        d=google.com; s=arc-20240605;
        b=c9LKPc2liGympCG5VYKkdovbY7FMnWYdfWc6k9PbwUG0eutTuJP9e7+UtQOJnsnBH4
         s9v0rN7Ps8/q3zhRxnNNL6gftVLiD2/O7L45gwX2UO9oJGbsONOETUkhez4wX3OPGSQl
         XOIGnVIOMwyv92niX8E/NcxZAw2bXUq0RX/e00kvvJwd5uIPpbUlUoYsvtk4GtitGxb7
         Tu32NHfNXuIOAP5zwbaw9iKvyjtk6rF35Ka7fn4NHrcd6EwZlhpf6HlRfciNLdt44Neh
         Qo6jJME4XqTBPWX6L8WY7mxecblcJM2CmyOGN6HPEznewai4nqXTVGzczeTatv61/9nW
         LyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=26jnDOH9sfu0NBZTRbOR7+Wdjzvvt/AkBoHu3e7kTgM=;
        fh=o7qkjTS1bfQ5SU1zM9oL4CCkwDM5TfpK/d9SX5zA1o0=;
        b=dWurUczrqWWlS3/1GEiMdZif8Rarwrz2zxQdFIUYucBdtdyw5PR0TQo/gQNOQHYqds
         DkVx/1KJHwKXcE8KvnASTN+/0ZDh0vXvN+YMB+lpuyGAzl4zXljN7i2+r7mhql8WzdPD
         42DwkM9pj+y8+M8M9GkS/N3AcDXKg+ru8UadGzUe5a8KAG7DTahRl9R+E2wUlxt6LKiw
         FZDEqd2xd76WXhWgqnf6UsR9FcYnl9ASTM2EAwPD34BpY9rLuY0LphQ/Ec/gW4rbcxve
         MYv+HZnGf4nPjMykmVUjKptWtf++41uUOSZNIZpKzsbzeoISgi2Zs3H9I65WG5fzivMc
         bW1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775156961; x=1775761761; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26jnDOH9sfu0NBZTRbOR7+Wdjzvvt/AkBoHu3e7kTgM=;
        b=VGMOaEkSOxjy1YLxZiA4Fm3sc8vHVgOV6Tk9/NjLqNcZfTVB6s1lbaadXm7knQhHJV
         eHTDdP2wMHlKHlylZcsHC2Krr/NHovpEuVmHBiyJE9+kDXS7mu6ArhnljKG52SbJbL69
         mBxdjgBKmNV5n1Gtfy3hLD/m9eUXc5MvR/HJEVclfpEZgpc+Zi94GXuOJZjRNZkEjcSk
         wAc++e8gEFB2Sv3reOU3QU44q/CRauE4wCBtOxp+xnPyPacCvOpnKq43H40AyarCP48W
         2IEZRiVBzWcPvoKpZm5m0df0xPTfC2iANN9tq6R6BhI8gcJ07Vmzq8KOLhMeyM7oN3PW
         jJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775156961; x=1775761761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26jnDOH9sfu0NBZTRbOR7+Wdjzvvt/AkBoHu3e7kTgM=;
        b=nrtHPmBZlLkz/l81AOMUWBrcIO6im6vdZamyu+dKjo2VdqwB4jKJELcenojy+c4sto
         80HZI4UB4iHm4bchpn06CA/LzAii+Zs69iglTgyzgOQ82e1CahG8YgWGzVxbRNrLFhAf
         WvVExRkkL5Mz+WaJjs6Ao+W3KJjDmaBmDwZJMRwJqu7urKR4MWk3DmTcyMny4XMpu2g7
         OL9VmcoK285ArH8CbuN6PJWVqCI/Lr7xiNU2kUG0degTeVqBDf9r7187w1ZgP/f1fXSq
         ZZ8Pu4RNJPpZgJr+/LwDnY1jolYBx/LK6ahwWJ2nQDTHYqqtyFKLbi/DNbL6QHx9nIZM
         qt3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgp+mnfYBeSW+LlR72G3Ba/FZDzfGpWcA4mhfKKNBIWjvkOYMk2umUONc+p+ZKY4FM06doghDzOUnaweQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5yq8x/4AdGGkAX3p6q4M+kZIhOqOHZTmw5YbvoLNV8vQ8U+j
	bf1szxmWGu/FcF4blZNRwD11Ol1cUXcPqLbB/OEp4Y9gHFVoD85PA1rHmB+P/IsH3+DYvXA0qBT
	2V8Jl2ahE1wUWwCtTELWoGWnJOuXXzV5uBbvKdFB2
X-Gm-Gg: ATEYQzz49DVC8YbPY2Nj9mpGMGg/VmYWC1EWlDZFthkVdwyC1G9pwFBhPBBmsLty0pP
	VWrjnJnlG1t2TtrsrqA0soqw5WXfLZMmqFn6EaTKoma64OnodX0XFcUJiaUgjfkzlvh/Z1Yfe03
	VboS7C5paVc5s61PAxyhj/S6eNXG3SxPAQ85wQLbaexYjEZkSQeTNwkIr+sV1Zcm5PUgDcBoK1D
	JeUGS1IB79WpDkUUQPT4b9bNpav9ZBt3+ibHpvWbxTxegwV9eyFygJ1h3SPAbo4ePx2nOqk77WC
	gSX88sGyt1K/feElAV8dL9Uy6QO4/KhdKPUUrLnRt8F3BpzafA==
X-Received: by 2002:a05:7022:ec17:b0:12b:ebb8:e518 with SMTP id
 a92af1059eb24-12bfb779d53mr79037c88.35.1775156960783; Thu, 02 Apr 2026
 12:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <202604020400.jEq32K95-lkp@intel.com>
 <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com> <ac6h2jF-KJ5pm1WM@stanley.mountain>
In-Reply-To: <ac6h2jF-KJ5pm1WM@stanley.mountain>
From: Marco Elver <elver@google.com>
Date: Thu, 2 Apr 2026 21:08:44 +0200
X-Gm-Features: AQROBzAm7ykm8zO9ipWjQHBso2-gdwz4n-a0cr85SYjLzctukNDeZ0kKGTltKIc
Message-ID: <CANpmjNPME07RK+jKnw233BYHX7wVMqCzFYpB2cSN4+DMgTSpuQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12618-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email,git-scm.com:url]
X-Rspamd-Queue-Id: DC3B838D8E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 at 19:05, Dan Carpenter <error27@gmail.com> wrote:
>
> On Thu, Apr 02, 2026 at 03:48:20PM +0200, Marco Elver wrote:
> > On Thu, 2 Apr 2026 at 15:33, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > Hi Marco,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > > patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
> > > patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
> > > config: um-randconfig-r072-20260401
> > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > > smatch: v0.5.0-9004-gb810ac53
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > | Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/
> > >
> > > New smatch warnings:
> > > drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> > > drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> >
> > How is this related to the patch I sent? Did the <linux/slab.h> change
> > force rechecking of all these files and it found latent issues?
> >
>
> Oh, crud.  It turns out that for this check Smatch allows
> integer_array[sizeof()]so long as we know that the index is within
> bounds.  What happened is that your patch renamed the kmalloc()
> function so Smatch stopped knowing the size of the buffer.

Oh, I see. Smatch doesn't respect the __alloc_size attribute then?

> For these zero day bot warnings, the emails are automatically generated
> so I don't have any context outside what's in the email.  I saw that
> Kees wrote the code, but I figured maybe you forwarded it or something.
> Sorry about that.

No worries and thanks!

