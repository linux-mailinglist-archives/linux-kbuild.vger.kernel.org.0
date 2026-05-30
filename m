Return-Path: <linux-kbuild+bounces-13430-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGaNCjNJGmoA2wgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13430-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 04:19:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE060AEF3
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 04:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92747301ABA3
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 02:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41622C11DE;
	Sat, 30 May 2026 02:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="erbyHjtT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FFB26461F;
	Sat, 30 May 2026 02:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107567; cv=none; b=ZcMvcl0I38Cu5RZT9YReE2HU9uIuaKM02bNZGUidpt8cQym15Xj5j6RxfYH0EXIz0q0AGU19W0X9BvRNM884RyjQTvve/lS/NZpy5y7PKytiUbQO85bR0/5ozQCICttIoiwLlVbB4EvHtgPoYmVui8u3iibJrJo9ocXgEXBjZ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107567; c=relaxed/simple;
	bh=Xg2a8hNHQ5uaZkFvdLcutRKJVrYU0sL/4Dj79F8QDBA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mWu2bMn/68ZqUECJK8SO5M6lnlls90/zp05ViVW3hGFuv04U0xyetV4k9JX5ox7ofX0TdH1kMPeSxov0MkN4iLWxtSuKn2JrUOrUIwvsqcz6DE2f/alh9IOkkTzzssFXyTX8TQ0CwGjks1GVIQ9I0ukDGMNxgO+EzvPbIf6ogZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=erbyHjtT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073C81F00893;
	Sat, 30 May 2026 02:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780107566;
	bh=7uWlI30ZeM1vSskDGuQdWFiTFtg3ZZ0jM6ann0fmjwc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=erbyHjtT19qyYzZVcmdF2Z1MH180AiDTEllwlgKoCv+9O7SXDLE2cKsmdLa5tIvWS
	 vJl/epRLeK/8L66Tu+HksZd1nF3ou/Th2OGo03qTIjo9MigGwH1AEUVLU+5giNdaCR
	 cqETECUAHjz08orOgvolLe0b8kxAe79USWd/H9js=
Date: Fri, 29 May 2026 19:19:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: nsc@kernel.org, nathan@kernel.org, paulmck@kernel.org,
 andriy.shevchenko@linux.intel.com, dhowells@redhat.com,
 rdunlap@infradead.org, luca.ceresoli@bootlin.com, chengkaitao@kylinos.cn,
 acme@redhat.com, irogers@google.com, peterz@infradead.org,
 namhyung@kernel.org, swapnil.sapkal@amd.com, linux-kernel@vger.kernel.org,
 muchun.song@linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] list: Add safe entry iterators without an explicit n
 cursor
Message-Id: <20260529191925.914d1cfa2b40b5cec32c0e70@linux-foundation.org>
In-Reply-To: <20260529082149.76764-1-kaitao.cheng@linux.dev>
References: <20260529082149.76764-1-kaitao.cheng@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13430-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:email,linux-foundation.org:mid,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: 8EFE060AEF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 29 May 2026 16:21:49 +0800 Kaitao Cheng <kaitao.cheng@linux.dev> wrote:

> The list_for_each_entry_safe*() helpers are useful for loops which may
> remove the current entry, but they require callers to provide a second
> cursor named by convention as n. Some users do not need to inspect or
> reset that cursor; they only need the iterator to keep the next entry
> available while the current entry may be removed.
> 
> Add entry iterators which hide that temporary next cursor while otherwise
> following the traversal pattern of the corresponding
> list_for_each_entry_safe*() helpers.
> 
> Do not fold this behavior into list_for_each_entry(). That iterator
> advances from pos after the loop body, and a few existing callers rely
> on that semantics to observe list changes made during the body. For
> example, stress_reorder_work() in kernel/locking/test-ww_mutex.c moves
> the current entry to the list head with list_move(&ll->link, &locks) and
> documents that this restarts iteration. If list_for_each_entry() cached
> the next entry before running the body, the loop would continue from the
> stale saved next entry instead of honoring the modified list order.

Oh boy, this is a whole bunch of inscrutable macro magic and AI review
(https://sashiko.dev/#/patchset/20260529082149.76764-1-kaitao.cheng@linux.dev)
is suggesting that it become even moreso.

I suggest that some patches which _use_ these macros would help to
demonstrate the value.  And perhaps use of a clever regexp which tells
us how many sites might benefit.

