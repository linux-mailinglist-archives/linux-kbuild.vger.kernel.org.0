Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44F0F43F6
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2019 10:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbfKHJza (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Nov 2019 04:55:30 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:57566 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbfKHJz3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 04:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WTPpFRwPMuBGMswcnZzjehjGbeLjrVVn4GW+ZOg77Q0=; b=lynymReQ4Pwr3nOT8Nttvv4eH
        Q158yVa54IXgLtDzqYYiuzQcDomkT01c12rNtYy5kNwci0Wz56XirFQlHKwqcWOZXTdrMK4eRpqEs
        V7lYB3YqL+UzEsTGsz40beXVhNtpDsjAFY7KLQ1A1ERtIjH4R4B78+YIq1CKpFrztcPkNJ3VWRf+C
        kIXreuPofejmE+jWyAWl/ZIccDPE6X0qzJRCdchfHleziHcZChnPNu8o6x6iMxxom14t5lGK3XI+e
        bigAOAVAu8Me3gCpbZAHwzENKHmeIQQD5dQeXQ9ff+x8iZrWdDD/RODChDwsbFlmtFDoMPi3o9c2A
        iQh/vhg8w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iT0zC-0005oW-7h; Fri, 08 Nov 2019 09:55:22 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 74E6730038D;
        Fri,  8 Nov 2019 10:54:15 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 5CDA72022B9E1; Fri,  8 Nov 2019 10:55:20 +0100 (CET)
Date:   Fri, 8 Nov 2019 10:55:20 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     shile.zhang@linux.alibaba.com
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/3] scripts: Add sortorctable to sort ORC unwind
 tables
Message-ID: <20191108095520.GK4114@hirez.programming.kicks-ass.net>
References: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
 <20191108071108.72132-2-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108071108.72132-2-shile.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 08, 2019 at 03:11:06PM +0800, shile.zhang@linux.alibaba.com wrote:
> From: Shile Zhang <shile.zhang@linux.alibaba.com>
> 
> Sort orc_unwind and orc_unwind_ip tables at build time instead of runtime
> in boot pharse can save more boot time.

I still object to adding a copy of sortextable instead of making one
tool for all sorts.

