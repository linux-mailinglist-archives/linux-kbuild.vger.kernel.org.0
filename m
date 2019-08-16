Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAE08FD9D
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2019 10:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfHPITy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Aug 2019 04:19:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:40836 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726575AbfHPITy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Aug 2019 04:19:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E024EB04C;
        Fri, 16 Aug 2019 08:19:52 +0000 (UTC)
Date:   Fri, 16 Aug 2019 10:19:46 +0200 (CEST)
From:   Miroslav Benes <mbenes@suse.cz>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        live-patching@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v4 06/10] modpost: Add modinfo flag to livepatch
 modules
In-Reply-To: <CAK7LNATRLTBqA9c=b+Y38T-zWc9o5JMq18r9auA=enPC=p10pA@mail.gmail.com>
Message-ID: <alpine.LSU.2.21.1908161016430.2020@pobox.suse.cz>
References: <20190509143859.9050-1-joe.lawrence@redhat.com> <20190509143859.9050-7-joe.lawrence@redhat.com> <CAK7LNAQuS-YcXecfJ21BGzc0CimzWxQcYST5-1xRgnCQGtcL4A@mail.gmail.com> <20190812155626.GA19845@redhat.com>
 <CAK7LNATRLTBqA9c=b+Y38T-zWc9o5JMq18r9auA=enPC=p10pA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

> I cleaned up the build system, and pushed it based on my
> kbuild tree.
> 
> Please see:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> klp-cleanup

This indeed looks much simpler and cleaner (as far as I can judge with my 
limited kbuild knowledge). We just need to remove MODULE_INFO(livepatch, 
"Y") from lib/livepatch/test_klp_convert_mod_a.c to make it compile and 
work (test_klp_convert_mod_a is not a livepatch module, it is just a dummy 
module which is then livepatched by lib/livepatch/test_klp_convert1.c).

Thanks a lot!

Miroslav
