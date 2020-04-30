Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714B01BFC96
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2020 16:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgD3Nwo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Apr 2020 09:52:44 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26111 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728361AbgD3Nwo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 09:52:44 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 03UDqPGZ032676;
        Thu, 30 Apr 2020 22:52:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 03UDqPGZ032676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588254745;
        bh=9ltjNZ8e4vrC7cBbZIWrYc76JCI/RhItJRQkfkK98AE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R86dw4zvy/H/eesDgAJVTUk+Cc3K8OruRnFRIPPbqkF2uwBuu/wY+B+V4UjIWmLhN
         BQFyZu3SzNgetMRDO4PIKfSKHbINrQWqRo3hNRs2MLPN3rFP519zMJ87heGncNA4o1
         2BZbh2kq+XE44vTGGI1CD1F6ahvvJCL6kUuMqp+Jv8kSWC8WhxEr2FbhhY0x1eiR1y
         Y6U1XLNZterOCcl9k5ZEgrBhTS8u/6Jq5QwrOkH8xwVn6qglGcc/Q1r25LRylvhKTB
         z7HetM64+oxIMuFXv+euF7Q++/ouE4u8b274o+t26rFsiXltG005+jS/GUfObL905B
         ywdYixoSH1poA==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id e10so1273031vsp.12;
        Thu, 30 Apr 2020 06:52:25 -0700 (PDT)
X-Gm-Message-State: AGi0PuYjcm1oxK+UPt+X8xsEf1IA2SyrBwikPi9VuZyICQ5e/0Tj+Jul
        GA8SSD4zn6GoyHT40duoD+pdBPPjESdRfGYrbLE=
X-Google-Smtp-Source: APiQypIy9756CPvWD3ER84r/D6PmKnL8yZmjLBInKlAqsGjqLulysxLmU7+IFcPqJmEmIY/ijlBjOyjjXpQdbOHVeZc=
X-Received: by 2002:a05:6102:240f:: with SMTP id j15mr3325751vsi.155.1588254744247;
 Thu, 30 Apr 2020 06:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200430131715.32c1a1f6@coco.lan>
In-Reply-To: <20200430131715.32c1a1f6@coco.lan>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 30 Apr 2020 22:51:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
Message-ID: <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
Subject: Re: bug: Kbuild seems to require "make prepare-objtool" in order to
 use (some) new config vars
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Mauro,


On Thu, Apr 30, 2020 at 8:17 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Hi Masahiro,
>
> Not sure if this was already reported (or eventually fixed) upstream.
>
> While doing a Kconfig reorg on media, I noticed a few weird things,
> requiring me to call, on a few situations, "make modules_prepare"
> manually after some changes.
>
> I'm now working on a patchset to yet to be merged upstream aiming to
> resurrect a driver from staging. It is currently on this tree
> (with is based at the media development tree, on the top of 5.7-rc1):
>
>         https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2
>
> There, I was able to identify a misbehavior that it is probably
> what forced me to need calling "make modules_prepare".
>
> The atomisp driver is on a very bad shape. Among its problems, it has a
> set of header definitions that should be different for two different
> variants of the supported devices. In order to be able to compile for
> either one of the variants, I added a new config var:
> CONFIG_VIDEO_ATOMISP_ISP2401.
>
> The problem is that calling just
>
>         ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401
>
> or
>         ./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401


scripts/config does not take the dependency into consideration
at all.

You need to enable/disable other options that it depends on.


./scripts/config -e STAGING -e STAGING_MEDIA -e MEDIA_SUPPORT -e
MEDIA_CONTROLLER -e INTEL_ATOMISP -e VIDEOBUF_VMALLOC -e VIDEO_ATOMISP
-d MEDIA_SUPPORT_FILTER -e VIDEO_DEV -e VIDEO_V4L2 -e
VIDEO_ATOMISP_ISP2401

allows me to enable VIDEO_ATOMISP_ISP2401.


It is painful to debug such complicated dependency graph, though.


>
> is not enough anymore for the build to actually use the new config value.
>
> It just keeps silently using the old config value.
>
> I double-checked it by adding this macro at the Makefile:
>
>         $(info ************ ISP2401: $(CONFIG_VIDEO_ATOMISP_ISP2401) ************)
>
> The Makefile doesn't see the change, except if I explicitly call
> "make modules_prepare" or "make prepare-objtool".
>
> Even calling "make oldconfig" doesn't make it use the new CONFIG_*


I do not know.

I cannot look into it without detailed steps to reproduce it.



-- 
Best Regards
Masahiro Yamada
