Return-Path: <linux-kbuild+bounces-13846-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VY2fM600OWoPogcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13846-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:12:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B976AFB4F
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 15:12:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="k/i5uTze";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13846-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13846-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0497C300B9F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jun 2026 13:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484113B19D0;
	Mon, 22 Jun 2026 13:11:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1F371053
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2026 13:11:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133913; cv=none; b=i8lFmVhbHdEI4RT8EQ77QH1vF8qRPvzFKMij6aXkHKMF+pkU1ZicM/Qr5xek6HkRlJ1PJsHkIdq1+Nvd4ox0ZvSEb4E5zK0Ll3aCQrheIK/xfikM716IYFv4QyDJbi4mdAhqlVgOsgIWIoyUnitZMSoDihDkNaDE/Lm/j5xmiPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133913; c=relaxed/simple;
	bh=HQz5Bgb9Ix6CxIn/K74tfrlANhIDMynRIFpNpd4eCGE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9/iltRR7zu/SavVswJ2ioc14sON18PqPCBkSAR8oSKuo1uBx8DIioJGeSx+ZRMaPhLs7nxj3IqgXLxYnPVbHewYoC6joUxDaBgvEYbijDDSLXKGzuQdCJqX4SlE5vNhAadVchBP99Pa/Jsljj9iSTHYf8U10L5/tpMbAj6sWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/i5uTze; arc=none smtp.client-ip=74.125.224.50
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66077e888b2so4125548d50.3
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2026 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782133911; x=1782738711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkaEWxUJkCuHp/17+ud4oWXJ3qqAKnltzqopfMTtFIs=;
        b=k/i5uTzeJQR4+7Wet36cQgSo4sxL7JHnWkI80+xtkrP/9oBTFyHZ8X3t1Q2CnMTDp6
         Psigzn+fygxUIibpKJV8vugNaeMafjx2dbtYSsLvity3z1Woqbw59/7qieJHFyH4Adan
         iIRyDi8CMOCz/az4EFMKhiAYGCpfEhizDTOzb65ymOvZsLNvI1F9BvcwvMSLbbcXXmc6
         lyPBLK7m1zPmKDIwdT1nVVOesfeemXdJZa83ea/kP7geAEZB8UZ24UFkA43weVCRdqNX
         kqhXI7Jym8KGVdZHNk1qUH7mqWCLBnaTI9Bl96kF6LQYh6lfzYB59dUz5+jAHbpHTf5O
         SP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133911; x=1782738711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkaEWxUJkCuHp/17+ud4oWXJ3qqAKnltzqopfMTtFIs=;
        b=LmjMoWYDw8VpvLuoDqSkx5T0q4gC5GDCfmmcpIcQC9DOj3nT6tiYHDDCTXG1FQ3ut1
         BrC43sANAXNIdjR45n2lg7cGe7ywJYEkU/Yj54npNVMqs04UvcyK367AXkEP+KL45Vpy
         sD5hkm3H3APU28jodcGl+4kELpjwtci4nNKDIZcYIPD5MYtvuODGE3lRZKhhXB0VOr/+
         YDZt/odybrLmaSdmTqgr9c1OADCRbCimWe4nkN+Bqryjp87mk6E1uf9+4MrACaLhR4E/
         QWlriwoTQDKyUQyOTShEwP5So/OAS+AaIsLUlR7057RxdX+lnu767OEpu9RO5jAD265g
         uHVg==
X-Forwarded-Encrypted: i=1; AHgh+RoTxNDaZJIKnP3sFQXG6lZuNuVMbMCnrCgXAeh9c403EVM2pmoD5oh3fabmNOKUi0sCojI4NOMaK1OIRdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53qOnWwXAnhsnzB3zCkUv+O2hOqsW9iFfIkDNKt3kBjM+a/ZQ
	dM/2MEPzQt3BDwonAN7Rr4gFCCsbR0I3wnCSUHfwTyYtDQ2i8Txi9iKT
X-Gm-Gg: AfdE7clxYWQ8K+4Hi9c9jhkAq9tW2tXUxdoaHLCjskdWlrQNKIMAlm4npOjU2wHdKm9
	PMRB5IAinyF6hJj9d4mR8oy5A7lOfv/EoQsIJH440NrcZAc/uIq1Zv9seSpnKi5FFxA+5Kyo/g2
	2U5K9Wj+Md+X+EaF1gCXazJXlxhWnPp7UiEQO6/3vk48Gtnrv2u+A3gChfPKyydrC0Yg/qcDfUt
	vznECLL7DMNwPISBmSbB4TsmaRoaKkeEDYHo2tfSZg1fjvqz5s35Jahwr4lLUSBvyA1oGmloBQg
	JlZSYmEEMpYdpCu0bbliqrJha0dMIsM2yEDVyWlvxH083gR132rDakNFTcpirXehVFHmI2RbbD3
	bkKfWpVFpcxOkJFu6m5Fd6ggl4PymO9pQSZ3w/RTrmw/GBl0e/S9dYzAXvncva3oHe+oIKkdq5d
	IpD2uKvTw=
X-Received: by 2002:a05:690e:120c:b0:660:54e4:5dd1 with SMTP id 956f58d0204a3-6630333ac1bmr11505521d50.44.1782133910591;
        Mon, 22 Jun 2026 06:11:50 -0700 (PDT)
Received: from localhost ([38.101.158.131])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66314ac3f96sm3600882d50.1.2026.06.22.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:11:50 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Mon, 22 Jun 2026 09:11:49 -0400
To: Steven Rostedt <rostedt@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH 0/2] tracing: Move trace_printk.h out of kernel.h
Message-ID: <ajk0lT9P0SeuD94j@yury>
References: <20260621093430.264983361@kernel.org>
 <dbb5915e-6587-4de9-87f3-76bea5024da8@kernel.org>
 <20260622090826.20efadb3@fedora>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622090826.20efadb3@fedora>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13846-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yurynorov@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:rostedt@kernel.org,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:mhiramat@kernel.org,m:mark.rutland@arm.com,m:mathieu.desnoyers@efficios.com,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:bigeasy@linutronix.de,m:john.ogness@linutronix.de,m:tglx@kernel.org,m:peterz@infradead.org,m:julia.lawall@inria.fr,m:yury.norov@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rdma@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:kvm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yurynorov@gmail.com,linux-kbuild@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,arm.com,efficios.com,linux-foundation.org,linutronix.de,infradead.org,inria.fr,gmail.com,lists.ozlabs.org,lists.freedesktop.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yury:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4B976AFB4F

On Mon, Jun 22, 2026 at 09:08:26AM -0400, Steven Rostedt wrote:
> On Mon, 22 Jun 2026 10:05:13 +0200
> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> 
> > > There's been complaints about trace_printk() being defined in kernel.h as it
> > > can increase the compilation time. As it is only used by some developers for
> > > debugging purposes, it should not be in kernel.h causing lots of wasted CPU
> > > cycles for those that do not ever care about it.  
> > 
> > Do we have a measurement of the increased compilation time ?
> 
> I believe Yury does.

I re-run compilation is a more strict environment, and the difference
is negligible.

