Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186A819BE8D
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 11:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387707AbgDBJ2A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 05:28:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:48560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgDBJ2A (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:00 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 549A4206D3;
        Thu,  2 Apr 2020 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585819679;
        bh=J7RWyOxaAGre4b4DdTI7i7aOZrxrkooqXFQyOQ4KOsY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=B1DZr68ChWCITpuRnRBqBRzDSD79fRF1eAmBOzvVfh1ZuzY/ux6jiR79aVLi2tOFe
         gjFMQy69GpienXO8q+G6gNoOoriqO9E3NxUHxiqwhL7cG2IRMyrQAJ/3qA81DSw5ur
         lxsFptASA8ewYAjY+LqZyk0fwAo2xOP5axd8ePV8=
Date:   Thu, 2 Apr 2020 11:27:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pavel Machek <pavel@ucw.cz>, devel@driverdev.osuosl.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund@ragnatech.se>,
        Yong Deng <yong.deng@magewell.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Heungjun Kim <riverful.kim@samsung.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Shawn Guo <shawnguo@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/4] media Kconfig reorg - part 2
Message-ID: <20200402112747.57dd1cfe@coco.lan>
In-Reply-To: <20200401105949.GB2001@kadam>
References: <cover.1585151701.git.mchehab+huawei@kernel.org>
 <6fadc6ea-8512-03ba-da30-43c64d7562f6@collabora.com>
 <20200401105949.GB2001@kadam>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Wed, 1 Apr 2020 13:59:49 +0300
Dan Carpenter <dan.carpenter@oracle.com> escreveu:

> On Wed, Mar 25, 2020 at 04:36:31PM -0300, Helen Koike wrote:
> > Hello,
> > 
> > On 3/25/20 1:03 PM, Mauro Carvalho Chehab wrote:  
> > > That's the second part of media Kconfig changes. The entire series is
> > > at:
> > > 
> > > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=media-kconfig  
> > 
> > I made a quick experiment (using this branch) with someone who works
> > with the kernel for his master degree, but doesn't have much experience in kernel development in general.
> > I asked him to enable Vimc (from default configs, where multimedia starts disabled).  
> 
> The whole config system is really outdated.

Agreed. 

Btw, when compiled against Qt 5.14, "make xconfig" is currently
broken. I'm sending in a few some fixup patches for it.

> It should be that this task was done with a command like "kconfig enable
> vimc".  It would ask necessary questions and pull in the dependencies
> automatically.

Yes. That's something that it is missing for a long time. There were
some efforts to add a SAT solver at the Kernel that could be used for
that, but I dunno what's current status.

> Twenty years ago it made sense to go through the menus and select things
> one by one.  Does anyone really start from defconfig any more?  Surely
> everyone starts with a known working config and just enables specific
> options.

Yeah, that's my feeling too.

> I started to hack together some code to create a kconfig program to
> enable and disable options.  The problem is that all library code
> assumes we want to display menus so it was a lot of work and I gave up.

:-(

Thanks,
Mauro
