Return-Path: <linux-kbuild+bounces-11032-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNY4OFYig2nWhwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11032-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 11:41:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DEE4AED
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 11:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A728E3018BEA
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 10:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C798C3E8C54;
	Wed,  4 Feb 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0XqCq8j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDEF3E8C52;
	Wed,  4 Feb 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201569; cv=none; b=BK1FYZipX1ZfCsUtKUVPncJ8egVBWS27Opcl+ifvy6GQRo2KQxE8iRyhhAz4YmYR9dlTsnImqGXw+xmeTtRSjyj4yTQEY+c9gEXkmR119ruDWsThaCQ0iQZwNsmTraC/if2upgbQM00GqKBvkBhYItuBSr0kS1HCyO19Y/podyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201569; c=relaxed/simple;
	bh=vo4WwGmhf6OpzG9zCzVL7qY/pjFyhwTho854s4f44Bo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RZW4edYdqCzmLnqZzSiCQomWFxpYHlNJtlxB6mDDc4JJlE7+FI7X5sC5KnyASXoEgGVpFzEmmfNUuhjLbycZBSVMVjESdoYagU0C3KgyYzQEQFOXUadStB9jEp8jGbgpGMZA8wokfG8sqsIdI0TE6eFyzhAv56AtiR4+gXw8cPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0XqCq8j; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770201569; x=1801737569;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=vo4WwGmhf6OpzG9zCzVL7qY/pjFyhwTho854s4f44Bo=;
  b=f0XqCq8jS+hL+Y3fVXF44N4TEeFADiBk949wdjWza0eJKVVIgToivZLm
   8vJBzM75FOnuc4PiaLDVS05zPhCmQfxLwzpZaqumUU9R7cts0B5OzO1z0
   nrx6coiVJj9XWQnCfFcw1jYDX37CbP7U3ZwXCRWqx3ctrfSMWbnRDz3Lj
   gZyqI66F2/ub8o0Ri9Lp5t+6ySgk3osZmhfAUwYl6N9AMV9pdQYIKbYqJ
   2Pp3eozjZ8+EEAC41MOHkhf4OhsB+NkkfhuzfF+R8epaSe195fKrse7+X
   MChagIpCuYS9nDdkpCe46JH5yNaFxVaBVZH/zWkifP+EmZ4+jqcmDuUFo
   Q==;
X-CSE-ConnectionGUID: SmxHKrslRN+ocDJGKbg7Uw==
X-CSE-MsgGUID: iqUujCucQLqlE91Tcg78LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75240971"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="75240971"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:39:29 -0800
X-CSE-ConnectionGUID: tDzMGhejSXSgzsp2k0AdEw==
X-CSE-MsgGUID: YSd8FQeGQJ60LYuoxo4YOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="215107780"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:39:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rong Zhang
 <i@rong.moe>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external
 modules
In-Reply-To: <aYMbVcNvJPlLPaaG@derry.ads.avm.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
 <176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
 <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
 <6387ba7b99fb952a59932c3a851dfd0ecc4dfb2c@intel.com>
 <aYMbVcNvJPlLPaaG@derry.ads.avm.de>
Date: Wed, 04 Feb 2026 12:39:22 +0200
Message-ID: <dc38c823832997bc5f15dd9020e2e80c526f1b8a@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11032-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 478DEE4AED
X-Rspamd-Action: no action

On Wed, 04 Feb 2026, Nicolas Schier <nsc@kernel.org> wrote:
> Well, sounds straight forward at first, but where should we make the
> cut between kbuild and non-kbuild?

I'll reply hypothetically, just for the sake of discussion, because
realistically, I don't think any of this is going to happen.

IMO the cut should be, "Is this required for configuring and building
the kernel"?

scripts/ just sounds like a dumping ground for random scripts, and
kbuild should be somewhere else. And let scripts/ be the dumping ground
that it is. If kbuild was under kbuild/, nobody in their right mind
would suggest adding random unrelated scripts there.

If kbuild depends on some things like objtool from somewhere else, so be
it, but at least don't pollute kbuild with unrelated things.

> I admit that there are some scripts below scripts/ that I'd rather
> label as "contrib", but I don't think that these are too much.

I've got to disagree there. I think there's so much that it's hard to
follow what is and isn't actually required for build.

At a *very* quick glance, there are things like checkpatch.pl,
get_maintainer.pl, anything coccinelle, bash-completion, Lindent,
macro_checker.py, bloat-o-meter, bootgraph.pl, etc, etc.

BR,
Jani.

-- 
Jani Nikula, Intel

