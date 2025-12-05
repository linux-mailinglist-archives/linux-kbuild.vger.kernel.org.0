Return-Path: <linux-kbuild+bounces-10006-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A77CA6DD7
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Dec 2025 10:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35685303999E
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Dec 2025 09:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B869831985C;
	Fri,  5 Dec 2025 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtVoXKcV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D24631987D;
	Fri,  5 Dec 2025 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925637; cv=none; b=GPrje7C4yK4Ti+QO42Yyz7ksnZ97P9jh9It3DkPtDjULSG0ueObb+8oBWe6FAW5Rl5K9GWwmTdWyiy3tP7dzuo58zQKacGT0KJ3y1vkG290seZBUjFH2g9TbZWedQ++ObCfyg65zVW6aSGkxk8qVY7YSMNX0dN8qgPs4Ov95azw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925637; c=relaxed/simple;
	bh=C0RbxPC28GOLYwmRvOSJQcwXXLldSUCsslbfNVLR3eY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LQcUt9F8fyRMosYfRNwmwW9Iobwe4ClOpcQOBuNSlQRFXFEFThHjrLv6tJR2H3cxN4i+ksFLoRZbkuQx2X8zfdr8gO2y+DR44yisAWkChblA/Y6wF8bITRNI8U1QfRp14GDFkoG3XUGfKUdniN6Nc3AxzGko7+aCc5DBBA/RHHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtVoXKcV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764925632; x=1796461632;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=C0RbxPC28GOLYwmRvOSJQcwXXLldSUCsslbfNVLR3eY=;
  b=MtVoXKcVdrCEAuEm44MKJvteEMzqJ1zVF6OvStCUpDLuUqDrb17ju6Kf
   6HKDffXtYjEQw2fi9JlrbT+MuBXWfxy9asrlE6jcolDgSPyP8mFW8zfYy
   k76ScYkqdF6jbu5arFmsh0l6erkOcBz/PJdrIsmHEYC8cBRCKaopd71tZ
   k75wMAJUtFz4SHFgev67dbMQ1S2xCaL2WybjhZxWetvtlnV0yn7rJnpTv
   jTiulutrtnEr0EzNABH1msDVSmCZqlN2fDC4EhQ6JtV7KnUoZ4FaFVKDJ
   8RLjQseEvahGorBPFzEB5McnMqOBCS1rCUExT1s6M+UT15QHTwlyQadJs
   Q==;
X-CSE-ConnectionGUID: PEFhoWDdQPSOENlpGk5Zqw==
X-CSE-MsgGUID: lWXuIuDVQ6yJu+LYm60+xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66681029"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66681029"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:07:04 -0800
X-CSE-ConnectionGUID: 18+yhUhtSzCQp1rD6PRmzg==
X-CSE-MsgGUID: tPiVUz8hTj20A8MrBvV+CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="199682432"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.65])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:07:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Graham Roff <grahamr@qti.qualcomm.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Graham
 Roff <grahamr@qti.qualcomm.com>
Subject: Re: [PATCH v2] Support conditional deps using "depends on X if Y"
In-Reply-To: <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com>
Date: Fri, 05 Dec 2025 11:06:56 +0200
Message-ID: <19f6c99dfcc2a9c2ca4c43ba0ad352fc978c1cc9@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 18 Nov 2025, Graham Roff <grahamr@qti.qualcomm.com> wrote:
> @@ -602,8 +612,14 @@ Some drivers are able to optionally use a feature from another module
>  or build cleanly with that module disabled, but cause a link failure
>  when trying to use that loadable module from a built-in driver.
>  
> -The most common way to express this optional dependency in Kconfig logic
> -uses the slightly counterintuitive::
> +The recommended way to express this optional dependency in Kconfig logic
> +uses the conditional form::
> +
> +  config FOO
> +	tristate "Support for foo hardware"
> +	depends on BAR if BAR
> +
> +This slightly counterintuitive style is also widely used::
>  
>    config FOO
>  	tristate "Support for foo hardware"

Thanks for adding this documentation hunk.


BR,
Jani.


-- 
Jani Nikula, Intel

