Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F87686309
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2019 15:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732990AbfHHNYX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 09:24:23 -0400
Received: from mga05.intel.com ([192.55.52.43]:2532 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728327AbfHHNYX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 09:24:23 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 06:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,361,1559545200"; 
   d="scan'208";a="199043407"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2019 06:24:19 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hviOv-0003YM-Kx; Thu, 08 Aug 2019 16:24:17 +0300
Date:   Thu, 8 Aug 2019 16:24:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
Message-ID: <20190808132417.GU30120@smile.fi.intel.com>
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
 <20190731194419.GB4084@kunai>
 <f4a78e93-6aaa-bc72-cf94-06fc2574451c@redhat.com>
 <CAMuHMdUA-hjVqSP_c0cB=76cfrucF6xxRi3ymVoEsJ2hbkfT=A@mail.gmail.com>
 <51451f89-9193-2be6-e724-e9ca44a25f52@redhat.com>
 <620e0aec-e3d8-7289-6525-b720013e8dfa@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <620e0aec-e3d8-7289-6525-b720013e8dfa@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 08, 2019 at 03:12:47PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 06.08.19 19:12, Javier Martinez Canillas wrote:
> 
> > Right, we could add a macro for that. Although it should probably be called
> > I2C_OF_MODULE_DEVICE_TABLE() or something like that since is specific to OF.
> 
> At that point it should be completely noop when OF is disabled, so we
> also can get rid of many ifdef's.

Why?

> I've got some patch somewhere for introducing a MODULE_OF_TABLE() macro
> as replacement for many MODULE_DEVICE_TABLE(of, ...) cases, which noops
> when CONFIG_OF is disabled. (and similar ones for other table types).

It's simple wrong to have #ifdef CONFIG_OF without counterpart of_match_ptr().
And taking into consideration that ID table itself doesn't depend to OF at all,
why not simple drop that #ifdef and of_match_ptr() all together?


-- 
With Best Regards,
Andy Shevchenko


