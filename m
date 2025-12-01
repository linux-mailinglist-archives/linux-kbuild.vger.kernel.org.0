Return-Path: <linux-kbuild+bounces-9930-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FB6C98A5E
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 19:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 20C1D4E1D19
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 18:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874B0337101;
	Mon,  1 Dec 2025 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BES/n56g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9455333733;
	Mon,  1 Dec 2025 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612292; cv=none; b=W1LIal3g9/H8aimvc8NFoe6G4j+5EVcoj+lhoZLyluBJ5FSiQUoV6snA+efmoFgGhfqkadIuxWE/09O6kEAlCQFeYuwgl869WnDXtMcVehEuSTFBKLgkTvzoCv6mEvC/sV8W3uRfZBWnkl22C74nK2GxwVjmQV9/iyeCmX7lZTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612292; c=relaxed/simple;
	bh=rfsiS+EdIODNDKr3F3CYm8TNErvIrM9cBSMoSsPh0oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UefTSAwMClhj5R4zB7l9zvQfcC14TjARDm1wluwZAHMh49hS/uNXxcsUThrITLnaSQEy3J6w6HOw62A+n33EbfW9cscDshhApFqc2xRQCtf1Fr6oU74eaphmLgdlo5iZSV/gsJS0XKp+JX4AzXZmo9GVrkIr9lUFStnO3vgLLyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BES/n56g; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764612291; x=1796148291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rfsiS+EdIODNDKr3F3CYm8TNErvIrM9cBSMoSsPh0oQ=;
  b=BES/n56gHJfBp8nN5DsNtDaYDqA7OUMA8t+UgM3siQpqPXol2R+F+aDC
   4Cezbfx9RUWu7HseNqZF7RbaBcl9To2uIeNcN4p07IobhB21EsJ7T10OV
   bqgTykvj/i8C2p85Vj+N73u0c9F8WIVj7Afx6HYl3DEeHm8XnNTI2tNeA
   Ky2R3MlIB0S6DZ4CmB6sS10EbYEPKAmV0Q+ojFi1GHWJMk/0kI+VocwDJ
   xeaFruCafR6UQVCZBiozCxxcKI4dUvrs9jKDVR0JtFcFENjchNlik5TCG
   etrVwCw7NMHIAxXJ+aPK32wtWnlonnq8bjVv6mD4hO0x7Cv3eAvO48LiR
   g==;
X-CSE-ConnectionGUID: kDf8BzbKTx+w2VscGI2SqQ==
X-CSE-MsgGUID: E6l6urj1TJu5oxRiXiWmeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77910101"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="77910101"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 10:04:51 -0800
X-CSE-ConnectionGUID: RC9XSoHpRAOcAsRhMBFXXQ==
X-CSE-MsgGUID: Xn9GVNMDShaGB8g2uQfB/g==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.4])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 10:04:47 -0800
Date: Mon, 1 Dec 2025 20:04:45 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: andy@kernel.org, krzk@kernel.org, linus.walleij@linaro.org,
	nathan@kernel.org, nsc@kernel.org, gregkh@linuxfoundation.org,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	abhishekpandit@chromium.org, masahiroy@kernel.org,
	legion@kernel.org, hughd@google.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] mcb: Add modpost support for processing
 MODULE_DEVICE_TABLE
Message-ID: <aS3YvQMhbmnYiZrm@smile.fi.intel.com>
References: <20251201160720.28580-1-dev-josejavier.rodriguez@duagon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201160720.28580-1-dev-josejavier.rodriguez@duagon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 01, 2025 at 05:07:19PM +0100, Jose Javier Rodriguez Barbarin wrote:
> During the process of update of one of the device drivers that are part of
> mcb bus (gpio-menz127.c), Krzysztof from GPIO subsystem asked me
> why I was adding new MODULE_ALIAS when I also added the same new
> information on MODULE_DEVICE_TABLE.
> 
> You can find the messages here:
> 
> https://lore.kernel.org/linux-gpio/80a20b13-7c6a-4483-9741-568424f957ef@kernel.org/
> 
> After a deeper analysis, I came across that the mcb_table_id defined inside
> MODULE_DEVICE_TABLE on all device drivers was being ignored as modpost was
> not processing the mcb MODULE_DEVICE_TABLE entries. For this reason, former
> contributors were using MODULE_ALIAS for enabling mcb to autoload the
> device drivers.
> 
> My proposal with these changes is to complete the mcb bus by adding
> modpost support for processing mcb MODULE_DEVICE_TABLE.
> 
> Once this patch is merged, I will send patches one by one for removing
> MODULE_ALIAS from all device drivers as they are no longer needed
> (as Andy Shevchenko suggested in v1 review).

Not sure if we need a cover letter for a single change, but yes, this
what I think the best approach and code wise it's fine to me:

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

(but we still need a Fixes tag I assume).

-- 
With Best Regards,
Andy Shevchenko



