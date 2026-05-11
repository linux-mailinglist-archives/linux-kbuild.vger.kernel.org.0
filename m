Return-Path: <linux-kbuild+bounces-13110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIu0DTSoAWrlhQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13110-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 11:58:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CECF250B6FD
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 11:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3E68300B180
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 09:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2FD3BD63C;
	Mon, 11 May 2026 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSQUBZhD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311E23C3BE6;
	Mon, 11 May 2026 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493486; cv=none; b=Ka9s4ldsMgme/5t9D7op31Fd40dQT51X0m0iXkWczPfUYjoMuIMkFvHEjEyRKXlWvtNs4iJwLhR/3wnrro/cpfKFZpnMyqQYCThBwKjGcR476XDoS7EHM8q55Z+H6cR28IILThLGVYh5AkHHA1I0lImRED8mmHPwDj5ZEU66c0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493486; c=relaxed/simple;
	bh=bhoh93yELQIvZKyus30qmOl5Bhe57DHnA+KZnNM6/ao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H9xg/TFMeR2/NiGjpf8cssPCmWz7oAfdG/ZZYkrssAHd7sZ+iAuTJi2x91OAdMBqV0spNn5johI9mO77nlNc5RPnyu9mPkT3PxihwYLV45+jOoqknUHGwwgSMR/MAahnDu0hKX8HpMnl2UnpEEk/kpFX7h5MRMfjhFdhOFB7EKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSQUBZhD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778493484; x=1810029484;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=bhoh93yELQIvZKyus30qmOl5Bhe57DHnA+KZnNM6/ao=;
  b=MSQUBZhDbZ3D22F0egutl50i6IsudEDKKdlzmbLqtBKyBhswNuBNfKNK
   It4uOsqqfoZoG927kDHxWc62fRk/iooYcBQBz6lCNBmSp6ESNZ8etIVFG
   71xBgcaVVu0OP6Rv1cQLx0+5lwcOoSVnLOET/ccbHJqE4j6vUBNltpR7D
   XM4VDDMVMNtSxbmTweADpSnYN5DXUkEPtJPK5hBHIDDxjjU/TFj937C1d
   siwcLX1l9ni8I9xCqJLzVCh5P0e9+QbwgugNO3q3nRrVWBPljeOYIPdVI
   tODMqusYy8X33QO2qE4/pvZ7PSMSwx6XvQiT5/MLN3b+DefrRDlTEZN8T
   g==;
X-CSE-ConnectionGUID: IPdya3uaQOOscNaN4VaukA==
X-CSE-MsgGUID: i36YAHlrRqmatwovuDoX6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="78404041"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="78404041"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 02:58:03 -0700
X-CSE-ConnectionGUID: kzKFkpCTQVmEZw7CT62dvQ==
X-CSE-MsgGUID: wBo5arnoR/Wn5eyZlNtNtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="231022418"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.253])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 02:57:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
 ojeda@kernel.org, corbet@lwn.net, qingfang.deng@linux.dev,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Julian Braha
 <julianbraha@gmail.com>
Subject: Re: [RFC PATCH v2 1/2] scripts: add kconfirm
In-Reply-To: <20260509203808.1142311-2-julianbraha@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <20260509203808.1142311-2-julianbraha@gmail.com>
Date: Mon, 11 May 2026 12:57:56 +0300
Message-ID: <4579a61db0975b967e8063661be77bb439283fd7@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: CECF250B6FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,garyguo.net,kernel.org,arndb.de,linuxfoundation.org,lwn.net,linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-13110-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Sat, 09 May 2026, Julian Braha <julianbraha@gmail.com> wrote:
>  scripts/kconfirm/LICENSE                      | 339 +++++++++

Why?

See LICENSES/preferred/GPL-2.0.


BR,
Jani.


-- 
Jani Nikula, Intel

