Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34224258F69
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Sep 2020 15:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgIANsy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Sep 2020 09:48:54 -0400
Received: from mx2.veeam.com ([12.182.39.6]:40438 "EHLO mx2.veeam.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727906AbgIANbI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Sep 2020 09:31:08 -0400
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx2.veeam.com (Postfix) with ESMTPS id 1A91341364;
        Tue,  1 Sep 2020 09:30:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veeam.com; s=mx2;
        t=1598967018; bh=umHfvOL0J1ZkxkzjujOKSRjD07bmjbQWixfcQCpw0uI=;
        h=Date:From:To:CC:Subject:References:In-Reply-To:From;
        b=UgcD+WupLi7EW3I9d/5JdtcO3zzYeAgEio3FVeuj2Xsy58gMNQRGq2C/0g1Fl7sz6
         yV0tX8ohZs6DqYVLjwth3GJ9i6RTpYyZkcy5FtyBPcHRo5TRXrzCoKyFWWsQRFv0hU
         9ZHXkSqf0HzwAOVHLLyEC+QkxsD2lX5SLAArkE58=
Received: from veeam.com (172.24.14.5) by prgmbx01.amust.local (172.24.0.171)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.595.3; Tue, 1 Sep 2020
 15:30:15 +0200
Date:   Tue, 1 Sep 2020 16:29:57 +0300
From:   Sergei Shtepa <sergei.shtepa@veeam.com>
To:     Jens Axboe <axboe@kernel.dk>
CC:     "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "koct9i@gmail.com" <koct9i@gmail.com>,
        "jack@suse.cz" <jack@suse.cz>,
        "damien.lemoal@wdc.com" <damien.lemoal@wdc.com>,
        "ming.lei@redhat.com" <ming.lei@redhat.com>,
        "steve@sk2.org" <steve@sk2.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Subject: Re: [PATCH 0/1] block io layer filters api
Message-ID: <20200901132957.GA18251@veeam.com>
References: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
 <7a517822-6be2-7d0d-fae3-31472c85f543@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7a517822-6be2-7d0d-fae3-31472c85f543@kernel.dk>
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx02.amust.local (172.24.0.172) To prgmbx01.amust.local
 (172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D26B63716B
X-Veeam-MMEX: True
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx2.veeam.com [172.18.16.6]); Tue, 01 Sep 2020 09:30:18 -0400 (EDT)
X-Veeam-MailScanner-Information: Please contact email@veeam.com if you have any problems
X-Spam-Status: No
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The 08/28/2020 16:54, Jens Axboe wrote:
> On 8/27/20 1:13 PM, Sergei Shtepa wrote:
> > Hello everyone! Requesting for your comments and suggestions.
> > 
> > We propose new kernel API that should be beneficial for out-of-tree
> > kernel modules of multiple backup vendors: block layer filter API.
> 
> That's just a non-starter, I'm afraid. We generally don't carry
> infrastructure in the kernel for out-of-tree modules, that includes
> even exports of existing code.
> 
> If there's a strong use case *in* the kernel, then such functionality
> could be entertained.
> 
> -- 
> Jens Axboe
>

To be honest, we've always dreamed to include our out-of-tree module into
the kernel itself - so if you're open to that, that is great news indeed!

We've spent some time before responding to estimate how long it will take
us to update the current source code to meet coding requirements.
It looks like we will need 2-4 months of development and QC, and possibly
much more to work on your feedback thereafter.
This is much work, but we are fully committed to this if you are willing
to include this module into the kernel.

However, the same time requirement also presents a big immediate problem -
as until this is done, over a hundred thousands of Linux users will not be
able to protect their servers running the impacted kernels
(our backup agent is free).
They will be forced to stop using the new version of the kernel
(or take a risk of data loss).

Given that, is there any chance that you accept the proposed patch now, to
restore the ability to protect their Linux machines - and buy us time to 
deliver the compliant module for inclusion into the kernel?

-- 
Sergei Shtepa
Veeam Software developer.
