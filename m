Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47D4B126651
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 17:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfLSQA6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 11:00:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:10235 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726789AbfLSQA6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 11:00:58 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 08:00:54 -0800
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; 
   d="scan'208";a="210502024"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 08:00:52 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org
Subject: RE: [PATCH 1/2] kbuild: remove header compile test
In-Reply-To: <e13bb7e03399471d87230d2c6296c767@SOC-EX01V.e01.socionext.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191107071441.1067-1-yamada.masahiro@socionext.com> <87a7982hwc.fsf@intel.com> <e13bb7e03399471d87230d2c6296c767@SOC-EX01V.e01.socionext.com>
Date:   Thu, 19 Dec 2019 18:00:50 +0200
Message-ID: <87tv5wwbil.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 08 Nov 2019, <yamada.masahiro@socionext.com> wrote:
> Could check the attached three patches?
>
> i915 is the only driver passionate about the header self-contained'ness.
> It would not be horrible to implement a own build rule in i915 Makefile.
>
> 0003 decreases the amount of code.
>
> 0001 and 0002 are trivial and can go in independently.
> ( I just send them to intel-gfx ML)

Sorry for the delayed response!

Thanks for doing this. I saw patches 1 and 2 were merged already.

I tweaked patch 3 slightly and resent it to intel-gfx [1].

BR,
Jani.


[1] http://patchwork.freedesktop.org/patch/msgid/20191219155652.2666-3-jani.nikula@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
