Return-Path: <linux-kbuild+bounces-4794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 209639D5C77
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 10:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC2531F22AED
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 09:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991861D9A5F;
	Fri, 22 Nov 2024 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bs5lE6oY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC241D61B9;
	Fri, 22 Nov 2024 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269115; cv=none; b=sks83eyOWzA0d9texaVNpMTbY7X/+T+ivjE/LjtmU7DXawK7IURGPbh3prPXk3ljS4JADFsbNLHAg5HIrsQsxAs+yLa1URHQdcUe2jcrl3M40u43ksjscggQoUQL/M05YZfWT0Leoeoy6YIvkIvJO8f8OP4zb9i4AvzVOefBAZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269115; c=relaxed/simple;
	bh=/nWUS5rYFIuWjAxaMuZpIlsIlB5xKPeguewMnjTnsdg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mZc3B4rx7Ov5IsClmPPG2wUKmMVm6iBYY67nbRfrRMLrN6aSenmltGQRpPFvkQWJ4gcbsaiSzTYJRQZiyAhUGbB5g8hYGFo3fxKdVPNtlUf77dnflSFFjE6a5LcydFFNRZPvXuGTla4sVKSMA4DlkT7WBYpgzKOUm5J421+Aq+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bs5lE6oY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732269114; x=1763805114;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=/nWUS5rYFIuWjAxaMuZpIlsIlB5xKPeguewMnjTnsdg=;
  b=bs5lE6oYFFbadAnCk7dg88tRQIMp778AzOFLIcPc9jKRWsuWwyc4UzZL
   +zTL+t1ACObwuvRtCyc3naiEqxXEJ85y6N+fCMLsRWcv3u5M5NlvKJy7V
   ub5+4jHDrwrcYcJNLRuQmXggIHOxcFxQBc1oGfNNDEDvb0gPl0JxWbC1v
   GjvcFGHqw/y+nEDDORBdOYPQynuJ8W98Lnea2BNqqvYq0YF+46GNMYlHg
   H78bbEHqT9S1b22H2h3VOGbltvvvH8Big5+L2HIkgy/7xNFpvdFb3K29N
   Z8xW6nEa26d/Z1bxF7QLUI/z2GXSri0oXjeAWjoZrJj09TW9jk2NX3uht
   A==;
X-CSE-ConnectionGUID: 02EsrmaYTuann+YYAvo49g==
X-CSE-MsgGUID: wxU/DSLlQzidlVRZS1ty1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32662954"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="32662954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 01:51:53 -0800
X-CSE-ConnectionGUID: mmla24BsS6u+cX48egGaJg==
X-CSE-MsgGUID: SPVDH+22TIWB32SpXqr21A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90895744"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.157])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 01:51:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Petr Vorel <pvorel@suse.cz>
Cc: linux-arm-msm@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark
 <robdclark@gmail.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
In-Reply-To: <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
 <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
Date: Fri, 22 Nov 2024 11:51:43 +0200
Message-ID: <87h67zzjdc.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 22 Nov 2024, Masahiro Yamada <masahiroy@kernel.org> wrote:
> Documentation/process/changes.rst
> documents basic tools necessary for building the kernel.
>
> Python3 is listed as "optional" because it is required
> only for some CONFIG options.
>
> If the exact dependency is unclear, it is better to install
> all tools listed in that table.

I think we're slightly in a limbo with the python build dependency. I
think it got initially merged a bit under the radar. And I don't mean to
imply any ill will here, it just didn't get the attention it maybe
should have. The dependency table got updated afterwards.

Now, what's the status for more modules depending on python? I for one
would like to use it for i915.ko, but I'm a bit uneasy about it as long
as it's "optional". Conversely, how many more users would we need to
switch the status from "optional" to "required"?


BR,
Jani.


-- 
Jani Nikula, Intel

