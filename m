Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A6B2A0D80
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Oct 2020 19:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgJ3Sfu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Oct 2020 14:35:50 -0400
Received: from mga18.intel.com ([134.134.136.126]:32235 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726704AbgJ3Sfu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Oct 2020 14:35:50 -0400
IronPort-SDR: Uc37Kg3lxeULabXK4s/x18We0GtplkapAtaAXzT2sFXKuTFu2rB8pF6tW2H2gkawWAot0MAsNy
 OhwfJFhRevwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="156423697"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="156423697"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 11:35:49 -0700
IronPort-SDR: 6mJ2oVgHdD7BkpEIbV5of800mmDBMZ6eQH4DTFeHWoqBrhBEDAUEmSyB6nLeBlRFDCvKK1vzTi
 QCeeUd4+mEQg==
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="324164975"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 11:35:48 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kYZGc-002RgL-Fd; Fri, 30 Oct 2020 20:36:50 +0200
Date:   Fri, 30 Oct 2020 20:36:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v1 2/2] uuid: Make guid_t completely internal type to the
 kernel
Message-ID: <20201030183650.GT4077@smile.fi.intel.com>
References: <20201030182847.78753-1-andriy.shevchenko@linux.intel.com>
 <20201030182847.78753-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030182847.78753-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 30, 2020 at 08:28:47PM +0200, Andy Shevchenko wrote:
> The guid_t type was defined in UAPI by mistake.
> Keep it an internal type and leave uuid_le UAPI
> for it's only user, i.e. MEI.

...

>  static inline int uuid_le_cmp(const guid_t u1, const guid_t u2)
>  {
>  	return memcmp(&u1, &u2, sizeof(guid_t));

This also has to be changed... (though it compiles).

I'll send v2.

-- 
With Best Regards,
Andy Shevchenko


