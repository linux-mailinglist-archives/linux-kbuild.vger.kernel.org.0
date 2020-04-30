Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B79E1BEE50
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2020 04:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgD3Ccd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Wed, 29 Apr 2020 22:32:33 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:53549 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726180AbgD3Ccd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Apr 2020 22:32:33 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=changhuaixin@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0Tx3dQqF_1588213937;
Received: from 30.27.116.2(mailfrom:changhuaixin@linux.alibaba.com fp:SMTPD_---0Tx3dQqF_1588213937)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 30 Apr 2020 10:32:18 +0800
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
From:   changhuaixin <changhuaixin@linux.alibaba.com>
In-Reply-To: <20200429084933.GF13592@hirez.programming.kicks-ass.net>
Date:   Thu, 30 Apr 2020 10:32:17 +0800
Cc:     changhuaixin <changhuaixin@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        bp@alien8.de, hpa@zytor.com, jpoimboe@redhat.com,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com
Content-Transfer-Encoding: 8BIT
Message-Id: <1CACF61E-FA7C-4986-AAD2-20A3B2BAC425@linux.alibaba.com>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
 <20200429084933.GF13592@hirez.programming.kicks-ass.net>
To:     Peter Zijlstra <peterz@infradead.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Apr 29, 2020, at 4:49 PM, Peter Zijlstra <peterz@infradead.org> wrote:
> 
> On Wed, Apr 29, 2020 at 02:46:24PM +0800, Huaixin Chang wrote:
>> Move building of fast lookup table from boot to sorttable tool. This saves us
>> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.
> 
> And what does it add to the build time?

It takes a little more than 7ms to build fast lookup table in sorttable on the same CPU. And it is on the critical path.  
