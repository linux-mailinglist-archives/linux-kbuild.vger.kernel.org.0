Return-Path: <linux-kbuild+bounces-13432-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHkQMLKIGmpt5QgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13432-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 08:50:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E760B7F8
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 08:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0C053052B66
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 06:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A96335C180;
	Sat, 30 May 2026 06:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r4u5rkvW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1D92D978A
	for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 06:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780123816; cv=none; b=klj0x1xwTksPGJigAVbS6YECY0UzjPVNOsIH2p94vwi79ND5isaO/ShHrCa5ir3LMO/d8BXKkkPG+ONQH6X1nXWF1RSgRRjS7BkeKWyFCAKkRaH1pbbrjSosl1NhqImLZ+/S8OeJbmVD6gS45FC9SbiP9QK+H1On+WUQP3GnIzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780123816; c=relaxed/simple;
	bh=gB6gpoPYMFrXkOpVS2tvMXmaYcI/1+sEt1wDp83Egig=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=BZF+kxY1G4sseugyAfPx2i6w0KkjqJbKo5pH27e+P4BVhXxzjkardhpUwHsbLN9hwwr2bi59yTClkax36C2Rqi57KsdTDHtuqW6TByD1D01EecwxNFDUkTpKMQ0xW4DPJIoMaMHQMFfao3YxRRCkoW5vPZGBc90WRqeJnpGeYd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r4u5rkvW; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780123802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GsD1ihvBH0zX0aLypHM5TAGcn9xQ09k+UXjApI56wfk=;
	b=r4u5rkvWVKKHarFHBkZemSsa32mAH9l8KPso8tp8+quPqkZQxFx83VTfylrf8Qy2TsjeYX
	5CDYeLmJE2+zDTDQUc4xO9b+ivP/f76vsRlynUEJNnwTWuFgjEfcThgDcgMwsvy5XutWmk
	TLQIgsPp1TOZ5S2Pm727GEjkYePCC8o=
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] list: Add safe entry iterators without an explicit n
 cursor
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260529082149.76764-1-kaitao.cheng@linux.dev>
Date: Sat, 30 May 2026 14:49:14 +0800
Cc: nsc@kernel.org,
 nathan@kernel.org,
 paulmck@kernel.org,
 andriy.shevchenko@linux.intel.com,
 akpm@linux-foundation.org,
 dhowells@redhat.com,
 rdunlap@infradead.org,
 luca.ceresoli@bootlin.com,
 chengkaitao@kylinos.cn,
 acme@redhat.com,
 irogers@google.com,
 peterz@infradead.org,
 namhyung@kernel.org,
 swapnil.sapkal@amd.com,
 linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B3BFA1E-08B8-42AB-87D6-A28BF15E5C58@linux.dev>
References: <20260529082149.76764-1-kaitao.cheng@linux.dev>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13432-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muchun.song@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 182E760B7F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On May 29, 2026, at 16:21, Kaitao Cheng <kaitao.cheng@linux.dev> =
wrote:
>=20
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> The list_for_each_entry_safe*() helpers are useful for loops which may
> remove the current entry, but they require callers to provide a second
> cursor named by convention as n. Some users do not need to inspect or
> reset that cursor; they only need the iterator to keep the next entry
> available while the current entry may be removed.
>=20
> Add entry iterators which hide that temporary next cursor while =
otherwise
> following the traversal pattern of the corresponding
> list_for_each_entry_safe*() helpers.
>=20
> Do not fold this behavior into list_for_each_entry(). That iterator

On the contrary, it might be better to modify list_for_each_entry() =
itself.
This prevents us from introducing multiple new interfaces, which could =
be
overwhelming and confusing for new users.

If we do this, almost most callers of list_for_each_entry_safe() can be
replaced by list_for_each_entry(), as the new modification enables it to
properly handle the removal of the current loop cursor. As you'd expect,
this would simplify usage to some extent by eliminating the need to pass
a temporary variable.

> advances from pos after the loop body, and a few existing callers rely
> on that semantics to observe list changes made during the body. For
> example, stress_reorder_work() in kernel/locking/test-ww_mutex.c moves
> the current entry to the list head with list_move(&ll->link, &locks) =
and
> documents that this restarts iteration. If list_for_each_entry() =
cached
> the next entry before running the body, the loop would continue from =
the
> stale saved next entry instead of honoring the modified list order.

I used an AI to scan the entire repository, and the results are as =
follows
(analyzed based on commit e98d21c170b0):

There are 9,925 list_for_each_entry() call sites in total. Among them,
9,919 do not require any adaptation, and only 6 need to be refactored:

    =E2=80=A2 sound/soc/soc-dapm.c:258
    =E2=80=A2 drivers/firewire/core-topology.c:275
    =E2=80=A2 drivers/gpu/drm/i915/i915_scheduler.c:193
    =E2=80=A2 drivers/gpu/drm/ttm/ttm_execbuf_util.c:89
    =E2=80=A2 kernel/locking/locktorture.c:647
    =E2=80=A2 kernel/locking/test-ww_mutex.c:522

As for list_for_each_entry_safe(), there are 4,572 callers. 4,550 of =
them
can be directly replaced by the new list_for_each_entry(), while 22 =
cannot
be replaced:

    =E2=80=A2 drivers/gpio/gpiolib.c:527
    =E2=80=A2 drivers/gpu/drm/i915/gem/i915_gem_context.c:1437
    =E2=80=A2 drivers/gpu/drm/i915/gem/i915_gem_object.c:249
    =E2=80=A2 drivers/gpu/drm/i915/gt/intel_gt_requests.c:143
    =E2=80=A2 drivers/gpu/drm/i915/gt/intel_timeline.c:423
    =E2=80=A2 drivers/gpu/drm/i915/i915_perf.c:2715
    =E2=80=A2 drivers/gpu/drm/i915/pxp/intel_pxp.c:501
    =E2=80=A2 drivers/gpu/drm/ttm/ttm_execbuf_util.c:90
    =E2=80=A2 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:7762
    =E2=80=A2 drivers/net/wireless/marvell/mwifiex/init.c:559
    =E2=80=A2 drivers/net/wireless/mediatek/mt76/mt7915/mac.c:2195
    =E2=80=A2 drivers/net/wireless/mediatek/mt76/mt7996/mac.c:3066
    =E2=80=A2 drivers/scsi/lpfc/lpfc_hbadisc.c:2574
    =E2=80=A2 drivers/target/iscsi/iscsi_target.c:4693
    =E2=80=A2 drivers/usb/c67x00/c67x00-sched.c:985
    =E2=80=A2 drivers/usb/isp1760/isp1760-hcd.c:1060
    =E2=80=A2 fs/btrfs/extent-tree.c:4666
    =E2=80=A2 kernel/locking/locktorture.c:647
    =E2=80=A2 kernel/locking/test-ww_mutex.c:522
    =E2=80=A2 kernel/rcu/tasks.h:1059
    =E2=80=A2 mm/page_reporting.c:183
    =E2=80=A2 mm/shmem.c:1552"

During the AI's retrieval process, I noticed that it writes a script to
perform a simple syntax analysis. This script filters out call sites =
within
loops that don't involve any modifications to the list being iterated =
over
(such as add, del, or move). In fact, this already eliminates the vast
majority of call sites. As a result, there are very few instances that
require manual or AI verification, which significantly improves the
reliability of the AI's analysis.

"Of course, the results above are just for reference, and there's no
guarantee that the AI won't miss something. My suggestion is to have the
AI write the script first. Once we human-verify that the script is =
correct,
we can run it to collect the remaining call sites that need manual =
review.
After that, the AI can assist us in analyzing those remaining sites to
minimize the risk of introducing new issues.

Muchun
Thanks


