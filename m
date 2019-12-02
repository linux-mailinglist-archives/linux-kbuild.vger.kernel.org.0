Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9992F10E8F9
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2019 11:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfLBKdD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Dec 2019 05:33:03 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:49160 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfLBKdD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Dec 2019 05:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7lplhg5FVe4WdSN0TLaSo3Rq+vfl5p/UhqKfE2T37QY=; b=ayH50QNkkkLf9dIa+Ha4ydRQ3
        0WK1HJo/c058TC76fb6h+6Z518GYwocAS+GGdoq7h0z1dkErXjDJia9CTf/1cdtPJ0fLh2ccBKwZd
        f6dysRhng7J/WEJPoOD4RLHKbFAM5901AjrYZJ/OdtEcBOPP5D4Sahdn4jy+DMnhZN68Q59nXGCyR
        mRIv3ZoCLKxXZ+lSv1B44OYhlAB1H/acVxtC4b7yc4RFI6Vvi4ETnEYcrHFtPyZFH++S0Ih2yn4Bd
        lp10EeDJwu0VLoP2NkuLmHc5NVG36PwdC+S+rXsh84pVhyQP52uKUhys5IjtHK8XSsAtO2iqr8voF
        Zbjwz6cqQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ibj0d-0000rb-SA; Mon, 02 Dec 2019 10:32:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 04A6B301A6C;
        Mon,  2 Dec 2019 11:31:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id CE2BA2059DAEC; Mon,  2 Dec 2019 11:32:48 +0100 (CET)
Date:   Mon, 2 Dec 2019 11:32:48 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@amacapital.net>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v5 0/7] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191202103248.GB2827@hirez.programming.kicks-ass.net>
References: <20191128110206.2107-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128110206.2107-1-shile.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 28, 2019 at 07:01:59PM +0800, Shile Zhang wrote:
> This series refactored the original sortextable tools, add ORC unwind
> tables sort at build time.
> 
> To sort the ORC unwind tables(.orc_unwind & .orc_unwind_ip) can save
> about 100ms in my test ENV (2C4G VM w/ Xeon 2.5GHz CPU).
> It costs about 30ms sort by new sorttable tool.

IIRC from your previous emails the new build-time sort is actually
shorter than that, so even for single build+run scenarios we win.

The code looks good to me, so:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Who it going to apply this? I suppose we could take it through -tip,
like we do with all x86 and objtool related bits.
