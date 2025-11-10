Return-Path: <linux-kbuild+bounces-9470-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 576D4C456EA
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21ACE4E8FA2
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 08:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0EF2FD1B6;
	Mon, 10 Nov 2025 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYBSjkqy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7622FDC5D;
	Mon, 10 Nov 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762764551; cv=none; b=PKpL7p3KvFvdw1J2ypBzKBZno+TAc8ihBJbx9UZ2S4FpI615pN261Hv9h1llqNZufIqBn45DdX73Xf+ONYJpyUCaUiiBKXfr2MR2P9HgANfWHXH6uhjaoLzGbOVU0dQQBWX8BMMk52X7yN80+ArAizzOMMiQ63HT+2WV1ATV7zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762764551; c=relaxed/simple;
	bh=K9Rctm3ReW3H6cGbKXGI+5bCSvdWbsFW1FzU5qJtwVw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PwsSNQA5INlPm0HcRAJMfHU9H6b23Enoi8x5SSWdHcS69cLgYRJCxAjO4oq9NAcbt0HkKCQeuDlIe319Aay8T7jEdzI1KgOiIYd1nG+iV2OpNpsAvGyJ+pzQjJ0e+5/ZqsFSXgZE8OZ26pDnDb0PZicHuwH5cwwf6A+RLBgUzxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYBSjkqy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762764550; x=1794300550;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=K9Rctm3ReW3H6cGbKXGI+5bCSvdWbsFW1FzU5qJtwVw=;
  b=TYBSjkqyoo1FapuqRH3Rdp5ITzYbAXe/w1sjw7BKwiy2sGS3c5ia0wVi
   6ofNCvhgvfJA930Zjlu65xhtxn1pH1rDaAHtmjprpaeRtDWs3MTZcHU4j
   XTPEezMdiD8hFeqiQDrgpZ6r7PY0cKDrWWzIOUIxXqPc2NADOOtYbGZfj
   ShpDvdA2wL8lSl087w9M9jkIwv5yMNwI3VjuawGT6706KUPO7gTe79+q5
   2pU3wFhxZyD47mG9TEGr+kGLvIfPBYAMLVwaZL1qmggC1bFrdMj+7NPow
   H1oE4LJZIxDChg5uEGr8Ydl+M3D0OdFUq962SFD/w6FFIA73CuIgrsJfF
   A==;
X-CSE-ConnectionGUID: 2wpxIAriT7CQED3ua04+NA==
X-CSE-MsgGUID: Z8dfk9hXTNmwxZJnlLak6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="87441884"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="87441884"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 00:49:06 -0800
X-CSE-ConnectionGUID: 9lah94tkTLqE+a5a0mFvpA==
X-CSE-MsgGUID: UpxECGGGRiaNVWY99eIqFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193800664"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.202])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 00:49:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Graham Roff
 <grahamr@qti.qualcomm.com>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] Support conditional deps using "depends on X if Y"
In-Reply-To: <20251109232922.GA2977577@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com>
 <20251109232922.GA2977577@ax162>
Date: Mon, 10 Nov 2025 10:48:59 +0200
Message-ID: <82317993284703834a7b1d8d5ca05b7c646f2795@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 09 Nov 2025, Nathan Chancellor <nathan@kernel.org> wrote:
> I think it would be useful to have a slightly more concrete example in
> the documentation of where this could be useful because even with the
> "if" syntax, it still feels a little confusing to me at least with the
> current example. Since this is just internally converting "depends on A
> if B" to "depends on A || !B", this seems like a low risk addition to
> the Kconfig language but it would be good to have some tests under
> scripts/kconfig/tests like the ones recently added by commit
> f9afce4f32e9 ("kconfig: Add transitional symbol attribute for migration
> support") upstream.

"depends on A || !A" (or A=n) is the most common pattern in Kconfig,
which literally means "depends on A if A".

BR,
Jani.


-- 
Jani Nikula, Intel

