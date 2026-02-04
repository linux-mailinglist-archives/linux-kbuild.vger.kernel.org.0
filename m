Return-Path: <linux-kbuild+bounces-11028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJyBFk8Og2k+hAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11028-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 10:15:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02980E3B11
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 10:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 772DE30D1351
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 09:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36493A1CF3;
	Wed,  4 Feb 2026 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLvsdkiU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF139C659;
	Wed,  4 Feb 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770196245; cv=none; b=LpBx+LuzNPrJq43w1a6hjNkCj0Ckp7wNIjipo4g8blZe1OyJVAditbqNWXnr5XCyYy0SuHoczIhqtynnXMt9w7g0BZ8CJ9edV2VnpTddd/GV5PXoKdXcVp9nfdEPfztq9H2x2SnKVzlvt/CJbnVXiGbpJ8MbI5ntmYyJ3wr+jgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770196245; c=relaxed/simple;
	bh=k1hCD3sRLb1bgoyDYd8m0cN3T2po12B5Nj6OjrVvrV4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O7If7J/qC9Xy5i1soPz0/Fm1fbwfkWZ1M4pX7QOE9GM43HbMVLcg8WeVB5vwSPV3HJArUS5D1RsQlVbJXnGiyDoSuuf5NUd1fTy1PNeb8iYoDWLhwhtsTd1veNaIviZdm3BIQKSEprZjURlHc2jV64VT0llTT97FAN+BFQcKtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLvsdkiU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770196245; x=1801732245;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=k1hCD3sRLb1bgoyDYd8m0cN3T2po12B5Nj6OjrVvrV4=;
  b=nLvsdkiUj2en0AdIPzr3OdTGCfgEScEw508cbfZ4cMOFxcDNNpeb3SwE
   nrfT1z38Hfawd22zVP6YhkmuY4DfqH2yTmcdaiChXffRsf2CxXXWQ3DXW
   vEsgGFpXKmrmPkkkR5RL6oZd86phMqdysMBqNR0qGYMcLRa6tMN8QJsOO
   4bOhoQz6/EqRjCACO+Mw0o5WQAxV6tezssegclVL1Ap24RtvX2zR0210q
   w720w3XTYB0+Cv3c60gCalZjXm8zuzGAo0+IjC2dVNEPFYNcmtbSzyPfd
   UQ/6e8iSgbN99XnJJ3VFYee60uJLd7qrNAaNpIoIsqTudvxVSKQ6tHNcL
   A==;
X-CSE-ConnectionGUID: U+7mFVSNRoy8AAf0JGrbTw==
X-CSE-MsgGUID: b4R9L/+RRS2819FBhXFt/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73982251"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="73982251"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 01:10:44 -0800
X-CSE-ConnectionGUID: DxIIet9IQQSBQ3hM4ZzwcA==
X-CSE-MsgGUID: 8dpVCxvAREOtK7ii3IlhtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210172735"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 01:10:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rong Zhang
 <i@rong.moe>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external
 modules
In-Reply-To: <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
 <176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
 <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
Date: Wed, 04 Feb 2026 11:10:37 +0200
Message-ID: <6387ba7b99fb952a59932c3a851dfd0ecc4dfb2c@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11028-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 02980E3B11
X-Rspamd-Action: no action

On Wed, 04 Feb 2026, Masahiro Yamada <masahiroy@kernel.org> wrote:
> Since kernel-doc is a part of Kbuild,
> all dependent libraries should exist under scripts/.

Huh. I've always wondered why all the Kbuild makefiles are placed in
scripts/, which appears to be a haphazard collection of, well, scripts
and tools. But then you also have tools/.

I've followed the kernel-doc refactoring from the sidelines, commenting
on some things, but it never crossed my mind the build shouldn't depend
on something outside of scripts/. (That's what I'm inferring here
anyway.) And apparently that thought didn't occur to a lot of other
people either, with even more kernel experience than myself.

Sounds like the kernel config and build system would deserve a top-level
directory like build/ or kbuild/, which collects everything needed for
the build, nothing more, nothing less. Because scripts/ is not *that*.

I understand all of this may be a historical accident, and possibly too
painful to fix now, but is any of this documented anywhere either?


BR,
Jani.


-- 
Jani Nikula, Intel

