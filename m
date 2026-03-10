Return-Path: <linux-kbuild+bounces-11793-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHTQCGRqsGmNjAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11793-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:00:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BBD256C6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E9C93021C23
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 19:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45D43BBA0C;
	Tue, 10 Mar 2026 19:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I1B3pBU4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D69823DD;
	Tue, 10 Mar 2026 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169235; cv=none; b=KMTqvwZbb19NnA3mMa/tLk4t2JtS9+8pa79JdZi0me5suQtE8bdgiKGCXnhRI2xFVdV1ZCZQU5ika8iLhdnETvn+icrnSdXzpaYB/gMWXxZoLYUzUTu+3+0s8oqXeNc49frzBqtucNbV/iKcBn2+rHLF+P432O2bWP+nTaYzitA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169235; c=relaxed/simple;
	bh=h1kVvZyG+gLLU/7Q842ol8WN1mRiir9mvGE/U/D8Pdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgFJXjHfIhVWWU49WrOxBdhl/UZ+2xXwiymKkI3oDcyKZU8VXe080ztLdhg2ry+xdpISUKTWxJ5YWGFfiCGV6NRpSIHvOJrCQTR4sVl2x6YLKbkrXVn8JrenihCLPkq4nFrjbd3Z09Rb55gl4BkdhVg70KMFtamiUCP6setGjr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I1B3pBU4; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h1kVvZyG+gLLU/7Q842ol8WN1mRiir9mvGE/U/D8Pdk=; b=I1B3pBU4UYjCgIOiFQquNxowFU
	RRssVaBvfYrtohLCATxol+BdsAHe7XEyls/u2M1I99afwktfS9KbOKmScbLlYidLUdZQZgTN3zUsb
	eefhhedYqQAT45PrzVcBO19+XRWTFm18dnL6AlMxQbPbyk/B01vMQR98YYtdG9sd5N1qDctsOKofy
	zT7ObILGRanjp9wPZ8DPi+x6brneDR8PGoT3fLbfO0SCO3PfVb/xKTuDYnOYMR5+qBwC1ffPGdy5b
	fqn8Ec9SHFo4/sOSv8ilac92NByzOkJpRMlRQTlguM5p+3VhVmZw+8Quka7Fc22G8hzGMWalYIUVW
	JeUL21tg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Jb-00000008P9i-3Po3;
	Tue, 10 Mar 2026 19:00:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2857B300462; Tue, 10 Mar 2026 20:00:22 +0100 (CET)
Date: Tue, 10 Mar 2026 20:00:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: urezki@gmail.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
	samuel.holland@sifive.com, dave.hansen@linux.intel.com,
	jeremy.linton@arm.com, weixugc@google.com, ljs@kernel.org,
	ryabinin.a.a@gmail.com, rppt@kernel.org, bp@alien8.de,
	luto@kernel.org, jan.kiszka@siemens.com, mingo@redhat.com,
	david@kernel.org, mhocko@suse.com, akpm@linux-foundation.org,
	andreas@gaisler.com, kas@kernel.org, Liam.Howlett@oracle.com,
	morbo@google.com, thuth@redhat.com, catalin.marinas@arm.com,
	ankur.a.arora@oracle.com, kbingham@kernel.org,
	nick.desaulniers+lkml@gmail.com, andreyknvl@gmail.com,
	dvyukov@google.com, corbet@lwn.net, leitao@debian.org,
	hpa@zytor.com, tglx@kernel.org, yuanchu@google.com, ardb@kernel.org,
	vincenzo.frascino@arm.com, tabba@google.com, joey.gouly@arm.com,
	nsc@kernel.org, will@kernel.org, yeoreum.yun@arm.com,
	nathan@kernel.org, maciej.wieczor-retman@intel.com,
	skhan@linuxfoundation.org, axelrasmussen@google.com, osandov@fb.com,
	surenb@google.com, justinstitt@google.com, kees@kernel.org,
	vbabka@kernel.org, hsj0512@snu.ac.kr, trintaeoitogc@gmail.com,
	jackmanb@google.com, maz@kernel.org, glider@google.com,
	linux-doc@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v11 00/15] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <20260310190022.GI606826@noisy.programming.kicks-ass.net>
References: <cover.1773164688.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773164688.git.m.wieczorretman@pm.me>
X-Rspamd-Queue-Id: 28BBD256C6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,sifive.com,linux.intel.com,google.com,kernel.org,alien8.de,siemens.com,redhat.com,suse.com,linux-foundation.org,gaisler.com,oracle.com,lwn.net,debian.org,zytor.com,intel.com,linuxfoundation.org,fb.com,snu.ac.kr,vger.kernel.org,googlegroups.com,lists.linux.dev,lists.infradead.org,kvack.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11793-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,noisy.programming.kicks-ass.net:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 05:51:19PM +0000, Maciej Wieczor-Retman wrote:

> ======= Compilation
> Clang was used to compile the series (make LLVM=1) since gcc doesn't
> seem to have support for KASAN tag-based compiler instrumentation on
> x86. Patchset does seem to compile with gcc without an issue but doesn't
> boot afterwards.

Can you put all that under a specific CONFIG and make that depend on
CC_IS_CLANG?

