Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421FB2B4306
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Nov 2020 12:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbgKPLjG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Nov 2020 06:39:06 -0500
Received: from mga18.intel.com ([134.134.136.126]:8535 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728352AbgKPLjF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Nov 2020 06:39:05 -0500
IronPort-SDR: Na+v7fDcgbiqTUVB5mHKsO205B0zoG0013KYSbEAE55Io5SFy2utJBlzOQ5BdM3Ry2ZBQDExxq
 E7QXFMhN+5iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="158509420"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="158509420"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 03:39:05 -0800
IronPort-SDR: alMVetcwEL0eJZ62JsWJho2Z1I0mZrTfNRwflG+Es+nFfGp6G9shN9IsfU0h8bTvHbacQ7kX01
 r1G+UGeW6PEg==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="324773084"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 03:39:03 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kecrd-0073G6-Ri; Mon, 16 Nov 2020 13:40:05 +0200
Date:   Mon, 16 Nov 2020 13:40:05 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/2] uuid: Make guid_t completely internal type to the
 kernel
Message-ID: <20201116114005.GY4077@smile.fi.intel.com>
References: <20201030184950.26732-1-andriy.shevchenko@linux.intel.com>
 <20201030184950.26732-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030184950.26732-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 30, 2020 at 08:49:50PM +0200, Andy Shevchenko wrote:
> The guid_t type was defined in UAPI by mistake.
> Keep it an internal type and leave uuid_le UAPI
> for it's only user, i.e. MEI.

Any comments on this series?

-- 
With Best Regards,
Andy Shevchenko


