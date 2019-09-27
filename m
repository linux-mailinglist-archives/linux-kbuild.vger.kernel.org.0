Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F06ABC0E40
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2019 01:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbfI0XMS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 19:12:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53416 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfI0XMR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 19:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Subject:References
        :Cc:To:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XeCZtUNseW2GHe2ZEi9YJRrHUwhbktgUjULEiuq7uvw=; b=m9WPAvUBB3Qhjsyy3kdy837y2t
        D+VFc85zKmRSz/RMlCSo277bmxSqpdAzDr63oCzAu6yj/b3QeILS6F//hF2YFOwJCKJH+1oBIFOPL
        musHbFATZo6u7ihvLkcXTAcwsmGAviEBre3toEMSzFSnGTqK6HO2iiLYHqIXxG79gXgpHen3oCnzZ
        SVQBIdRjyK1KHQG8czOjn2HNvY8k49BiCq52GPvcREYzVhbl6YVzB2LlipYXdGN6JfYz6pZATKMdn
        ljlskPLzmMnVt3o3rTLlCIQX0TgwwQwgVlgcst+eu6TzpE7JpaBXu9L2FnQXq1sUCc6vnqdQPx3OS
        REERNIRQ==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iDzPM-0003co-1d; Fri, 27 Sep 2019 23:12:16 +0000
To:     jacob.e.keller@intel.com
Cc:     intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
Subject: Re: [PATCH] namespace: fix namespace.pl script to support relative
 paths
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org>
Date:   Fri, 27 Sep 2019 16:12:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190129204319.15238-1-jacob.e.keller@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


re: https://lore.kernel.org/lkml/20190129204319.15238-1-jacob.e.keller@intel.com/

Did anything happen with this patch?

Please send it to linux-kbuild@vger.kernel.org and
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>

You can also add:
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


I was just about to fix this script but I decided to first see if anyone else
had already done so.  Thanks.

-- 
~Randy
