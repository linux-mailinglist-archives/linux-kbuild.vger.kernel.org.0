Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71BC2125DE0
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 10:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfLSJn0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 04:43:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:46466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbfLSJnZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 04:43:25 -0500
Received: from linux-8ccs (ip-109-41-193-110.web.vodafone.de [109.41.193.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01AE824679;
        Thu, 19 Dec 2019 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576748605;
        bh=fkqYO7rkVI3p4RNR8XQLB/x4sl5NZV+dUWXunaiqAiU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g6Vrk7TRlYlsURSCIXKDDtvtX0tBozeP3uZCGybSvSUv7em3FMuK27WQYR+n71PhR
         6H3ehkev8rMB8cuHNOSJT9JI5tB4RwKicEK9URh5GQrKdp3vuyIfQpjQoiJLvOrkeC
         MMwI5xXdUSvQ6cASmiKDBRgRCvPs6b5+TOcS1BuQ=
Date:   Thu, 19 Dec 2019 10:43:17 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Eugene Loh <eugene.loh@oracle.com>, corbet@lwn.net,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, maz@kernel.org,
        songliubraving@fb.com, tglx@linutronix.de,
        jacob.e.keller@intel.com, Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>
Subject: Re: [PATCH v4] kallsyms: add names of built-in modules
Message-ID: <20191219094317.GA15318@linux-8ccs>
References: <7e0f4a74-63c5-ad62-c619-c6277c4bc791@oracle.com>
 <20191210174826.5433-1-eugene.loh@oracle.com>
 <2a535000-e71e-fab9-cf6a-e7e5fb8053d8@oracle.com>
 <20191218222931.76131c6a@rorschach.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191218222931.76131c6a@rorschach.local.home>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Steven Rostedt [18/12/19 22:29 -0500]:
>On Wed, 18 Dec 2019 15:55:18 -0800
>Eugene Loh <eugene.loh@oracle.com> wrote:
>
>> Ping.
>
>Couple of notes:
>
>1) this affects code that doesn't really have a maintainer. I could
>take it in my tree, but I would like to have acks from other
>maintainers. Perhaps Jessica Yu (Module maintainer), and probably one
>from Linus himself.

I hardly look through scripts/, so this patch would definitely need
Masahiro's (for all things kbuild) ack as well.

>2) Do not send new versions of a patch as a reply to the old version. I
>and many other maintainers sort our inbox by threads, and I look at the
>top of the thread for patches. That is, if there's another version of a
>patch that is a reply to a previous version, it is basically off my
>radar, unless I happen to notice it by chance (which I did with this
>email).
>
>You can send your v4 patch again, but please send it as its own thread,
>that way it will be on the radar of other maintainers. Hopefully we can
>get some acks on this as well.

Also, why wasn't this patch sent to lkml? At least I don't see it on
cc. If you resend v4, please send it there as well so it can get more
coverage.

Thanks,

Jessica
