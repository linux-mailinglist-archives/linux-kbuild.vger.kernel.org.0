Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1632848CF
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Oct 2020 10:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgJFItl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Oct 2020 04:49:41 -0400
Received: from mx4.veeam.com ([104.41.138.86]:48200 "EHLO mx4.veeam.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgJFItl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Oct 2020 04:49:41 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Oct 2020 04:49:41 EDT
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx4.veeam.com (Postfix) with ESMTPS id A280D1C0EA;
        Tue,  6 Oct 2020 11:42:43 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veeam.com; s=mx4;
        t=1601973763; bh=e9f9XYoSs4yUz+6D/V0mbo/RjIBkU4bh11PRahPKKpM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To:From;
        b=ZxPWIA3PCdH7kv811Feros9C+xubBZ2Z524Ik/NnkcTGj7Ize7riljrfCh4Uir2wK
         JimOg2zgRP5KbNKvez+Wkoh3JrT1YYstOeAenrBlX7SP9KSoAQ5eZUACCnQLVNOuwT
         FfjobPKg0OHc5Zl5qwRqLoEXFz/WId4R82X0vBqc=
Received: from veeam.com (172.24.14.5) by prgmbx01.amust.local (172.24.0.171)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.595.3; Tue, 6 Oct 2020
 10:42:41 +0200
Date:   Tue, 6 Oct 2020 11:43:32 +0300
From:   Sergei Shtepa <sergei.shtepa@veeam.com>
To:     Konstantin Khlebnikov <koct9i@gmail.com>
CC:     Jens Axboe <axboe@kernel.dk>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        David Miller <davem@davemloft.net>,
        "robh@kernel.org" <robh@kernel.org>,
        "damien.lemoal@wdc.com" <damien.lemoal@wdc.com>,
        Jan Kara <jack@suse.cz>,
        "ming.lei@redhat.com" <ming.lei@redhat.com>,
        "steve@sk2.org" <steve@sk2.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Subject: Re: [PATCH 1/1] blk-snap - Block snapshot module This module
 implements snapshot and changed block tracking functionality. It is intended
 to create backup copies of any block devices without usage of device-mapper.
Message-ID: <20201006084332.GA9979@veeam.com>
References: <1601643362-7370-1-git-send-email-sergei.shtepa@veeam.com>
 <1601643362-7370-2-git-send-email-sergei.shtepa@veeam.com>
 <CALYGNiORw=DrKxoaoQPJP8TNM-S_W0Zdtpvra_eMs+Ri5f2P-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CALYGNiORw=DrKxoaoQPJP8TNM-S_W0Zdtpvra_eMs+Ri5f2P-g@mail.gmail.com>
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx01.amust.local (172.24.0.171) To prgmbx01.amust.local
 (172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D26A657660
X-Veeam-MMEX: True
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx4.veeam.com [172.31.224.40]); Tue, 06 Oct 2020 11:42:43 +0300 (MSK)
X-Veeam-MailScanner-Information: Please contact email@veeam.com if you have any problems
X-Spam-Status: No
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks for the answer.

Unfortunately, blk-rq-qos cannot be used efficiently for this purpose.
blk-rq-qos is good for collecting request queue processing metrics.
The level at which the interception is performed is too low - it happens 
after the device driver has already received the request for processing.

For the filter to work efficiently, we need to ensure that the interception
is performed on a higher level. It is required to put processing of 
multiple BIOs on hold while COW algorithm is being executed for them.
We must not be blocking the request processing queue, and also we would
like to avoid impacting the IO scheduler operations.

-- 
Sergei Shtepa
Veeam Software developer.
