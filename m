Return-Path: <linux-kbuild+bounces-13471-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHLkEK6hHmquDAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13471-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 11:26:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB7A62B73D
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 11:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1542C31B5845
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 09:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717403C9ECF;
	Tue,  2 Jun 2026 09:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVOJC3P1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF384039;
	Tue,  2 Jun 2026 09:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391620; cv=none; b=UncD0ryIqI7V0MKFCrNoz4RofGGKRxqA4sBxZNv/iU/mxZpgJXX8GTDASvwK6iuGov/zPZQiVJJLASyzLQPUGkskfBzaNKyDbrTYpzM1utqMTyL9gcWoADLFuaKJHjzoXXWNL53c+tu9L0o5K8jee8MNg7ctG5nqIfHWOXz2/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391620; c=relaxed/simple;
	bh=N/W5GnT3aYPeOayZmgcsaSiHOGnJk7qmg6loCwMLd8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxAnDQs5+MO6xIUfVdTSnp4cKjhoBuyWiAQJwo9gPT9jhE807nph7e0jaVrr8QiRsTJwmpuQZqq0C3zoGcuNLO8XlyojEfv+U1esC2ra+w/jDXpewFfc0WHd1CsZS8GUtQp2cI/ddwVD5AATwF6Jko/NDKnNPg8WXkhtcKJN4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVOJC3P1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780391618; x=1811927618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=N/W5GnT3aYPeOayZmgcsaSiHOGnJk7qmg6loCwMLd8k=;
  b=kVOJC3P10E6iPnYwxBozX51B2XK8FU1Vs1AIemIhGcw+wzKHEOEPZrYG
   r5ebdZf7S59et8qrTqI8Ekxp+qTQe08bEAADREjT+BvukATiRz+ay/Rzx
   T9f7LGEP5H2A1cg+CSOj/WvPug7u8rm/b0F8MV12URHQ6GbLCz6wFSEI5
   qUqSyQT5Ju+tIYqY7yKgCFbFGISqvK8vPJH/cg4WVg/7HWuX3mcZlkTnc
   niICDd+QcT/avhVttoEZGXiBaMfvwOIRtOyL2ioTo/x96RloLc5qoh7bK
   JnVmsI0IMJBVZwjW1uKQ9g4Vk8LzVgGTuCImuv+kz0Qaq7lGtgXEN0pQe
   w==;
X-CSE-ConnectionGUID: DyUz0Ij4Q/uBTTsaXEE1vw==
X-CSE-MsgGUID: nvDKC2hISq+HN4bizMMeIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68715992"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="68715992"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:13:04 -0700
X-CSE-ConnectionGUID: 3+3R3jxMQMmQZn7bA3CRLQ==
X-CSE-MsgGUID: mMU/fu7MToKTU05qbHFMrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237505018"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:13:00 -0700
Date: Tue, 2 Jun 2026 12:12:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Kaitao Cheng <kaitao.cheng@linux.dev>, nsc@kernel.org,
	nathan@kernel.org, paulmck@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, rdunlap@infradead.org,
	luca.ceresoli@bootlin.com, chengkaitao@kylinos.cn, acme@redhat.com,
	irogers@google.com, peterz@infradead.org, namhyung@kernel.org,
	swapnil.sapkal@amd.com, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] list: Add safe entry iterators without an explicit n
 cursor
Message-ID: <ah6emVXKcAfWNAC0@ashevche-desk.local>
References: <20260529082149.76764-1-kaitao.cheng@linux.dev>
 <2B3BFA1E-08B8-42AB-87D6-A28BF15E5C58@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2B3BFA1E-08B8-42AB-87D6-A28BF15E5C58@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 9CB7A62B73D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13471-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

On Sat, May 30, 2026 at 02:49:14PM +0800, Muchun Song wrote:
> > On May 29, 2026, at 16:21, Kaitao Cheng <kaitao.cheng@linux.dev> wrote:

> > The list_for_each_entry_safe*() helpers are useful for loops which may
> > remove the current entry, but they require callers to provide a second
> > cursor named by convention as n. Some users do not need to inspect or
> > reset that cursor; they only need the iterator to keep the next entry
> > available while the current entry may be removed.
> > 
> > Add entry iterators which hide that temporary next cursor while otherwise
> > following the traversal pattern of the corresponding
> > list_for_each_entry_safe*() helpers.
> > 
> > Do not fold this behavior into list_for_each_entry(). That iterator
> 
> On the contrary, it might be better to modify list_for_each_entry() itself.
> This prevents us from introducing multiple new interfaces, which could be
> overwhelming and confusing for new users.

+1 here.

> If we do this, almost most callers of list_for_each_entry_safe() can be
> replaced by list_for_each_entry(), as the new modification enables it to
> properly handle the removal of the current loop cursor. As you'd expect,
> this would simplify usage to some extent by eliminating the need to pass
> a temporary variable.
> 
> > advances from pos after the loop body, and a few existing callers rely
> > on that semantics to observe list changes made during the body. For
> > example, stress_reorder_work() in kernel/locking/test-ww_mutex.c moves
> > the current entry to the list head with list_move(&ll->link, &locks) and
> > documents that this restarts iteration. If list_for_each_entry() cached
> > the next entry before running the body, the loop would continue from the
> > stale saved next entry instead of honoring the modified list order.
> 
> I used an AI to scan the entire repository, and the results are as follows
> (analyzed based on commit e98d21c170b0):
> 
> There are 9,925 list_for_each_entry() call sites in total. Among them,
> 9,919 do not require any adaptation, and only 6 need to be refactored:
> 
>     • sound/soc/soc-dapm.c:258
>     • drivers/firewire/core-topology.c:275
>     • drivers/gpu/drm/i915/i915_scheduler.c:193
>     • drivers/gpu/drm/ttm/ttm_execbuf_util.c:89
>     • kernel/locking/locktorture.c:647
>     • kernel/locking/test-ww_mutex.c:522
> 
> As for list_for_each_entry_safe(), there are 4,572 callers. 4,550 of them
> can be directly replaced by the new list_for_each_entry(), while 22 cannot
> be replaced:
> 
>     • drivers/gpio/gpiolib.c:527
>     • drivers/gpu/drm/i915/gem/i915_gem_context.c:1437
>     • drivers/gpu/drm/i915/gem/i915_gem_object.c:249
>     • drivers/gpu/drm/i915/gt/intel_gt_requests.c:143
>     • drivers/gpu/drm/i915/gt/intel_timeline.c:423
>     • drivers/gpu/drm/i915/i915_perf.c:2715
>     • drivers/gpu/drm/i915/pxp/intel_pxp.c:501
>     • drivers/gpu/drm/ttm/ttm_execbuf_util.c:90
>     • drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:7762
>     • drivers/net/wireless/marvell/mwifiex/init.c:559
>     • drivers/net/wireless/mediatek/mt76/mt7915/mac.c:2195
>     • drivers/net/wireless/mediatek/mt76/mt7996/mac.c:3066
>     • drivers/scsi/lpfc/lpfc_hbadisc.c:2574
>     • drivers/target/iscsi/iscsi_target.c:4693
>     • drivers/usb/c67x00/c67x00-sched.c:985
>     • drivers/usb/isp1760/isp1760-hcd.c:1060
>     • fs/btrfs/extent-tree.c:4666
>     • kernel/locking/locktorture.c:647
>     • kernel/locking/test-ww_mutex.c:522
>     • kernel/rcu/tasks.h:1059
>     • mm/page_reporting.c:183
>     • mm/shmem.c:1552"
> 
> During the AI's retrieval process, I noticed that it writes a script to
> perform a simple syntax analysis. This script filters out call sites within
> loops that don't involve any modifications to the list being iterated over
> (such as add, del, or move). In fact, this already eliminates the vast
> majority of call sites. As a result, there are very few instances that
> require manual or AI verification, which significantly improves the
> reliability of the AI's analysis.
> 
> "Of course, the results above are just for reference, and there's no
> guarantee that the AI won't miss something. My suggestion is to have the
> AI write the script first. Once we human-verify that the script is correct,
> we can run it to collect the remaining call sites that need manual review.
> After that, the AI can assist us in analyzing those remaining sites to
> minimize the risk of introducing new issues.

Do not forget that we have coccinelle and semantic grep & patch.

-- 
With Best Regards,
Andy Shevchenko



