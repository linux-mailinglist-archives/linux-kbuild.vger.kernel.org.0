Return-Path: <linux-kbuild+bounces-9929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B0DC98A55
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 19:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E05AE4E2564
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 18:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0400C333727;
	Mon,  1 Dec 2025 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YX6f02XF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C7319604;
	Mon,  1 Dec 2025 18:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612187; cv=none; b=E5ZTggzH69Ka+RWFMmRHg47l9Ro64pgHAKnf4boNmX1TVwt2j/s9Jy4m+GCIysL9b5VAD5ttZbs2OtvlEhV+u0McG7R4k7Xqwq3BHkNUVrnrX4eh0nkQjz0M90G2D/GoTaZYg06tXwI2iMYqW6/NJ348q6Dn2rXk+4ioZ186OFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612187; c=relaxed/simple;
	bh=4QRGgk7RkOqav2ktfzkB0NMR1E7YgEZ49dY87GmExMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2qsZIhVRnhQX3TMN7+xR9N1M/1QLTgS7o1WQrw41RtBJ8edWvJQjUDiSFmPZ9821qdmvbsI9GlwJjAkdysc8qVySviWKZMgBHqu20GuredBQo+ELnilW7g+B7IP06R8cTby2OdN32jNgKFEAW8QynDzsxxf38GU9yEmsNT7YLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YX6f02XF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764612187; x=1796148187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4QRGgk7RkOqav2ktfzkB0NMR1E7YgEZ49dY87GmExMs=;
  b=YX6f02XFznbhIpkvln9ZjViVv+NzCDYrHp3LbzEyYSnSlgCEdv6aYtus
   6nnPOXYi1nqa8NNgQTJQrh20D1ZbkmGAiYEKhEQw1ys22scx8wXxIUVBO
   EtY/sZPLBuYF0LmgRHXdJbh523+dQpBADhq/3TuESmF1Gv4sJEzheJYdU
   1U8iLFUS6kh8mV5576I3A7rKmgwovMcYF0G6FdvSFKeGr76f8EIqrLaGd
   C72SkNVkDyGVi7C+rj6sEr0uDorUkKSvb9M/A1mXGJ35tFVlh7irZ68Br
   U/AkeWIV7Nmtzjn1KCwSGTUOm1NjK5EBij5buI6wiMOvYLISomvB/d5oH
   A==;
X-CSE-ConnectionGUID: gwKAsQ6JQL+KY3SXjbI1bQ==
X-CSE-MsgGUID: cKapXr4lRdeV2muHfNsclQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77909931"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="77909931"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 10:03:03 -0800
X-CSE-ConnectionGUID: 5McqD3O7RM6kO7PFtVsFEg==
X-CSE-MsgGUID: 6fJWLh4BSLiAxk3Qlgoq6g==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.4])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 10:02:59 -0800
Date: Mon, 1 Dec 2025 20:02:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: andy@kernel.org, krzk@kernel.org, linus.walleij@linaro.org,
	nathan@kernel.org, nsc@kernel.org, gregkh@linuxfoundation.org,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	abhishekpandit@chromium.org, masahiroy@kernel.org,
	legion@kernel.org, hughd@google.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Subject: Re: [PATCH v2 1/1] mcb: Add missing modpost build support
Message-ID: <aS3YUYtrEn39lUPl@smile.fi.intel.com>
References: <20251201160720.28580-1-dev-josejavier.rodriguez@duagon.com>
 <20251201160720.28580-2-dev-josejavier.rodriguez@duagon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201160720.28580-2-dev-josejavier.rodriguez@duagon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 01, 2025 at 05:07:20PM +0100, Jose Javier Rodriguez Barbarin wrote:
> mcb bus is not prepared to autoload client drivers with the data defined on
> the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
> inside MODULE_DEVICE_TABLE so the data declared inside is ignored.
> 
> Add modpost build support for accessing to the mcb_table_id coded on device
> drivers' MODULE_DEVICE_TABLE.

I believe the idea to add Fixes tag here and make sure it goes to v6.19-rcX.

-- 
With Best Regards,
Andy Shevchenko



