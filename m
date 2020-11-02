Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41332A2ABA
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 13:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbgKBMcR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Nov 2020 07:32:17 -0500
Received: from mga03.intel.com ([134.134.136.65]:29804 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728359AbgKBMcQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Nov 2020 07:32:16 -0500
IronPort-SDR: a0KXmzvgt21QRUlac0t+WtIjVtiFJ92oh4KZnazrbK1EeWsDkwhNOttZ478iNSzqTv4DgJZN2S
 Pk2Xz91vO2sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="168974038"
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="168974038"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 04:32:13 -0800
IronPort-SDR: Ym7Q+yuVHv/sCNLDgYSWuRSoHj7/RWy1GcrzQx0GSSDJRFG8SpQEIWtDB9jQP0B6zITdJHVX5d
 ZCRpGTGsuTsw==
X-IronPort-AV: E=Sophos;i="5.77,444,1596524400"; 
   d="scan'208";a="320048475"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 04:32:11 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kZZ1N-003C94-DS; Mon, 02 Nov 2020 14:33:13 +0200
Date:   Mon, 2 Nov 2020 14:33:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] uuid: Make guid_t completely internal type to the
 kernel
Message-ID: <20201102123313.GH4077@smile.fi.intel.com>
References: <20201030182847.78753-2-andriy.shevchenko@linux.intel.com>
 <202011020307.J2wRQToF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202011020307.J2wRQToF-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 02, 2020 at 03:20:29AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on hch-configfs/for-next]
> [also build test ERROR on linus/master v5.10-rc1 next-20201030]
> [cannot apply to linux/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]

Thanks, there is v2 which should have no such issue.

-- 
With Best Regards,
Andy Shevchenko


