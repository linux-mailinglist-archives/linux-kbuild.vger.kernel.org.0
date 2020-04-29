Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABED81BD795
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2020 10:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgD2IuJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Apr 2020 04:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgD2IuI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Apr 2020 04:50:08 -0400
Received: from merlin.infradead.org (unknown [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DCCC03C1AD;
        Wed, 29 Apr 2020 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=McfirHER2yliCK9xpcEcEd1SIT40pFKzGHso+arjjzQ=; b=GsDbKg9d6S9lAVnn/+3nwAs5Jr
        q/RY4ejijZl5Hev7SoOJXQUu4GC1BmGEyq3fFYqi89zNIncP4btsgI6B0zF4VMLjwQBQyGiaML8M1
        oylzCAhztdbxb/56fnPxFpwqQ73nzJDW655pbk9oIAwnym+Og6vmAiL84RoV+98HWTi+IDxGhxHup
        YmJcb84Q3e0q8CvCL6aRoxPmCtQdbhKRLGeG+BfRinzeHwoR8xVdlTi/+jB5rcgb1UmPXj00WEwTk
        82YEzKxEBz5kk1KdQfPhQBUG4BMXkrhUwjDSuC1etJ4E+/zZmRWhIuPVHYmA6n5W8usbmhKsRljNz
        OnyY+2Xg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jTiPP-0007O2-Ip; Wed, 29 Apr 2020 08:49:35 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 52A18303F45;
        Wed, 29 Apr 2020 10:49:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 3E2C820BD8FF8; Wed, 29 Apr 2020 10:49:33 +0200 (CEST)
Date:   Wed, 29 Apr 2020 10:49:33 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Huaixin Chang <changhuaixin@linux.alibaba.com>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        bp@alien8.de, hpa@zytor.com, jpoimboe@redhat.com,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
Message-ID: <20200429084933.GF13592@hirez.programming.kicks-ass.net>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 29, 2020 at 02:46:24PM +0800, Huaixin Chang wrote:
> Move building of fast lookup table from boot to sorttable tool. This saves us
> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.

And what does it add to the build time?
