Return-Path: <linux-kbuild+bounces-13838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l0AoCpHpN2pOVgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13838-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jun 2026 15:39:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 731E86AAF3D
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jun 2026 15:39:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WjSFBVc+;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13838-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13838-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD4C33010163
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jun 2026 13:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72683367B9B;
	Sun, 21 Jun 2026 13:39:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B18242910
	for <linux-kbuild@vger.kernel.org>; Sun, 21 Jun 2026 13:39:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782049160; cv=none; b=M3AFgzp1K4N22vvA0l33ItP3EMJVte0Gat0MCERR/BZ3J1tWVvnGT4u+vwo4eDrERz31hPvEgjoskzFpqYknJyty6cDwcBF0qtQJM6bM7ITxPYXNB26+t7KY/TstGiX2KE0PtnOir+UM4XL3+/FujnhgZvnFTdLq3yavR3FGp8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782049160; c=relaxed/simple;
	bh=PcEURl2W5mmzOY49oIrDgC4sXuUKEmnXJC+EqHFqIx8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXHrCq0mz4ZITMSrlXZt0c4+eRF04D1tAYnQcMALL3EugwlN+g5WpwLhfns6HFE9/WHnIfcgaACiGEGMXO3Wst+WRBEf+IcbY0kxSudCVDHdx1J8ckxiFTObBYE89EKTwW/Vbh7ZCjVAKtJcG1OMFA2grVroTSEX0vSgUe6ZM7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjSFBVc+; arc=none smtp.client-ip=209.85.128.176
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7ff05e5d009so33580397b3.1
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Jun 2026 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782049158; x=1782653958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUsaj7vv5ecLJDUQ0RmLhOH3YlF5lnncSJLJl2FpGbU=;
        b=WjSFBVc+x5PQ4eaJ0Sgq53AeKSuFVqLUXt1bdNxYWDgfM9Gd+cbZm9xNx6j0EHdJPE
         HTww0TPxeWims2viP3NLoABiuxw4YJbyhjsaFbiCmT9CUzuiOMJBall4Ny5+a8n3JoxL
         RAbWijGhJB9Y959HS7qnPSGQSXUMVj4DJPBFAQ54uygppFKbaRn/JaF2eVX9T+oKy55s
         5UuvzBs3n9atksSgvIo+LnDIY6WzFlP9VIiHQn/cekRGZeQ/fCZya9JTR/7Go5adjR4K
         RgwOPTOQfje4Iq1ypeW2heg3nQ4ZNXcxpe/8Sn+A/ACOrH9r4nxxn0LtXIlC4IPvBREK
         JbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782049158; x=1782653958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUsaj7vv5ecLJDUQ0RmLhOH3YlF5lnncSJLJl2FpGbU=;
        b=mNRyxrv6Yc00eSeb+069Yl9/EMCdcdMCtzWz9JZBvPtir4Aygnt36xHCoRsysAuQ6h
         cPxgdIqjl74ow8CI6lr43LxwTCGoVQ9vZMc+y5JX2uOcq/m3UHsiTqua+wmT7wUUg3VP
         2hRVUE7qJOB4Lr+et3e/X+BKKV9xQp0+J2XvB3qODdc/f0+Xy5NjhlfDBp6xxuG5WB1g
         /TjoZtWxl1d3UaCrpKDBGk8NQD/dvti0aaDp98JqCmqBOoJl/2rOrro7KIhOMtTh5BCe
         TYdoCfKlqv3YRMoMXZDDkxKcHwyacMfhEVbCgcfeCV0lfAJto79GDkR5yAzd3LoEPeZI
         9UiA==
X-Forwarded-Encrypted: i=1; AHgh+RqYlIfzaZlZPFRcGc3IJmHHS/5UQqZYRj9BZxh9RuZeS1U9XJvdWkKUYuL3qz/oZ9bhl2I2adZALnrWlVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKy83fYruIjM1V1f0T7pmHPITpIXus3BWwlaqQhRYaUij6y3G
	HaOr2/I+5TDHuQftcBgoEd8kEXjNFgTuknOlURUD6xYDTz9+yhG0J5P6
X-Gm-Gg: AfdE7clH79LDzSxM+LPaRuhOBTe+DVGW1SY5+liCxXRQQ1jnfGFgxDpbQadzUcCnEbq
	bbbCUbyDzdiKOID1zo3Nixarj9m0YW2UyV0hmO+esMTQZk2IO99NhsE0c6fKW9tcnJXV3A+QtVs
	uUqV7LkhvfzgXagDJrrUF0RN8Rj/bUBVDbBvQNqSGPNhp601PyjnRe5zDNcbhHyYoQzVDPrtk6e
	v9j+O3HWVNgNtzpz/oNcj8JYrjAoVjAeOVKdhNg9ij+S86n8buEAvIhNs2PH4/YHeLpwkXdgNzD
	LB8zLmHcWkj80y6lLytGBH88JSco89nuXe9jsYBWD69GCj43vczhF3qImNEVJ/0O2jumzdj9Qoz
	uAw5YS5NLnYKAjeEMGPm84hRkvU4UyTkM6jJa6gdzc/ZBoJsTDY4Z1rqdHT127Vgy5v9TbHbNM/
	Nnw3KkP4z1Kjv9D0wEzGSPHFcBRdPxdo3s5YM=
X-Received: by 2002:a05:690c:e347:b0:7db:ccda:a409 with SMTP id 00721157ae682-801759e5070mr88778787b3.9.1782049157948;
        Sun, 21 Jun 2026 06:39:17 -0700 (PDT)
Received: from localhost (user-24-214-85-55.knology.net. [24.214.85.55])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025f8dde30sm20893067b3.27.2026.06.21.06.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:39:17 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Sun, 21 Jun 2026 09:39:17 -0400
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Yury Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean
 up kernel.h
Message-ID: <ajfphe4Z8BrfYoUX@yury>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.168514984@kernel.org>
 <20260621054721.7cde38f0@fedora>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621054721.7cde38f0@fedora>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13838-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:mhiramat@kernel.org,m:mark.rutland@arm.com,m:mathieu.desnoyers@efficios.com,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:bigeasy@linutronix.de,m:john.ogness@linutronix.de,m:tglx@kernel.org,m:peterz@infradead.org,m:julia.lawall@inria.fr,m:yury.norov@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rdma@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:kvm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yurynorov@gmail.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,arm.com,efficios.com,linux-foundation.org,linutronix.de,infradead.org,inria.fr,gmail.com,lists.ozlabs.org,lists.freedesktop.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yurynorov@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 731E86AAF3D

On Sun, Jun 21, 2026 at 05:47:21AM -0400, Steven Rostedt wrote:
> On Sun, 21 Jun 2026 05:34:32 -0400
> Steven Rostedt <rostedt@kernel.org> wrote:
> 
> > Instead of having trace_printk.h included in kernel.h, create a config
> > TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> > Makefile to allow developers to add trace_printk() without the need to add
> > the include for it. Having it included in the Makefile keeps it from being
> > in the dependency chain and it will not waste extra CPU cycles for those
> > building the kernel without using trace_printk.
> 
> Bah, I only tested with the config option enabled, and missed some
> dependencies with it disabled.

Yes you did.
 
> For instance, rcu.h also uses ftrace_dump() so that too needs to go
> into kernel.h.

No, it shouldn't.

> I also need to add a few more includes to trace_printk.h.

> OK, I need to run this through all my tests to find where else I missed
> adding the includes. But the idea should hopefully satisfy everyone.

If you include it under config in kernel.h, to make the kernel buildable,
you need to include trace_printk.h explicitly where it's actually used.
IOW, apply my patch v4-7.

Then, developers who use trace_printk() on their development machine,
will be really frustrated when their debugging code will break client
build just because CONFIG_TRACE_PRINTK_DEBUGGING is disabled there.
They will spend a day, at best, communicating with remote managers,
and end up with adding #include <linux/trace_printk.h> in the files
they touch. Is that your plan?

If I was one of those developers, the solution would be simple for me:
don't use trace_printk() at all.

Thanks,
Yury

