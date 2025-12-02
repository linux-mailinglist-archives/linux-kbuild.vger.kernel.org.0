Return-Path: <linux-kbuild+bounces-9943-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3881EC9BCE8
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 15:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D316D345888
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Dec 2025 14:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2886521CC71;
	Tue,  2 Dec 2025 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzHLLdYb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE486202F65;
	Tue,  2 Dec 2025 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764686290; cv=none; b=h4HPdOrgLV6zbNfguyk+KTDUuZFnfaFrR6XQ3mS4bEgljeQa/yEY94hf3mBYIEjrdPMnOec0G7uc0iI82HhHRJgsOn91ef2jqee9GBtK6P5UBvROEyfT/OREmAeohEvDDNVMWi8Enh6kb+uUKlDUs6lMars1tehAHViqIo4Yq48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764686290; c=relaxed/simple;
	bh=SFbPgjm0EcQ7xPpKvEq01I2zDaYZD3A6lPPjnSzrRJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pO0uEgZvoGw5XKAlliaRz82+mpE7I9ALYvJozDS57IuXYoCEy/PJgVq4uOYIrjO1Cm/t90dOOB+DjLjaZt2hzWDb6jD/4O5n9MQO7hzqRiGMAMvkCviVdppJEqRSySnpSKnHtiIbzb6E+6ODswebHdyoAY3G8krl3VJGhlQTu9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzHLLdYb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764686288; x=1796222288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SFbPgjm0EcQ7xPpKvEq01I2zDaYZD3A6lPPjnSzrRJ4=;
  b=CzHLLdYbkmzvu7aArN6gVtReAFTRNH6q5LWOINukoClIE+f6wKeXeIgx
   skWvKhd7GSyGHgv34HBiZES+fOI+5U9rTOu+0ksJ2jP1+E4QuftD/yOWU
   o6Lu83WVfYvYm+E+NKNdpWRlZnMF2OK0Jm/X05itbtAbQq0UqLDPKet7u
   GLVDHNi9gOzCy3Od8Y5wy+P9yCKg1HgFk0lGRM98vD+bodhkmAbJU7RhB
   Xp+pLMwRb397ZiNDy3ADJRx1ynlxtFcCwLeAB4LgFDWw/8ctg7ncDxuqB
   FfhG6LH3bUiM1uecoOnt8VdZ0InbnB4lkFGmc7MfiZq1U0pdkH1m3AwW3
   g==;
X-CSE-ConnectionGUID: f9XvewcETTCQDtTYEyd8Pw==
X-CSE-MsgGUID: 0tlxCj85S/+C5PC+MFRffQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66541574"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66541574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 06:38:04 -0800
X-CSE-ConnectionGUID: ayyNk0luTZG16DJBHjHrNg==
X-CSE-MsgGUID: t+8pC+gLRi+mok0h/2soyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="231704162"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.91])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 06:38:01 -0800
Date: Tue, 2 Dec 2025 16:37:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: andy@kernel.org, krzk@kernel.org, linus.walleij@linaro.org,
	nathan@kernel.org, nsc@kernel.org, gregkh@linuxfoundation.org,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	abhishekpandit@chromium.org, masahiroy@kernel.org,
	legion@kernel.org, hughd@google.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Subject: Re: [PATCH v3] mcb: Add missing modpost build support
Message-ID: <aS75xjPB6GC_b9hI@smile.fi.intel.com>
References: <20251202084200.10410-1-dev-josejavier.rodriguez@duagon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202084200.10410-1-dev-josejavier.rodriguez@duagon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 02, 2025 at 09:42:00AM +0100, Jose Javier Rodriguez Barbarin wrote:
> mcb bus is not prepared to autoload client drivers with the data defined on
> the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
> inside MODULE_DEVICE_TABLE so the data declared inside is ignored.
> 
> Add modpost build support for accessing to the mcb_table_id coded on device
> drivers' MODULE_DEVICE_TABLE.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



