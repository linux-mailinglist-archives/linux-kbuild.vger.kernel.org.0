Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3159B1B5BB5
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 14:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgDWMrn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 08:47:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:14351 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbgDWMrn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 08:47:43 -0400
IronPort-SDR: 37yWpQLvQ0Fr1Iqn3cZJiALaNbPcW1k8ItK6tyWWI3vO14tMOHF+kl/iUwy9e2AjV9ne4bOdj8
 pEjRb36VYhnA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 05:47:42 -0700
IronPort-SDR: f+KAi70uV0Z7oJiuWn+7llEPpD/uGkvDkbYxGjwukDvyWt2dP0M7BErrnyNX6zBY7zydlEx93s
 RfzvpSOZnJnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="430307557"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 23 Apr 2020 05:47:41 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jRbGa-002dUg-P4; Thu, 23 Apr 2020 15:47:44 +0300
Date:   Thu, 23 Apr 2020 15:47:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v1] modpost: file2alias: Kill the old UUID type
Message-ID: <20200423124744.GU185537@smile.fi.intel.com>
References: <20200422141034.15097-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422141034.15097-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 22, 2020 at 05:10:34PM +0300, Andy Shevchenko wrote:
> There is dangling old UUID type, i.e. uuid_le, which is defined in the same way
> as new ones, so, we may safely drop it. There is no ABI change!

Unfortunately it can't be done like this.
Needs a bit more preparations first.

Sorry for the noise.

-- 
With Best Regards,
Andy Shevchenko


