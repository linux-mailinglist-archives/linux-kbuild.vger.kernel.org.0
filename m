Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D546D5A9
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jul 2019 22:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391446AbfGRUSg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Jul 2019 16:18:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57394 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728022AbfGRUSg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 16:18:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A5DF68E22C;
        Thu, 18 Jul 2019 20:18:35 +0000 (UTC)
Received: from [10.18.17.153] (dhcp-17-153.bos.redhat.com [10.18.17.153])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C787B19D7A;
        Thu, 18 Jul 2019 20:18:34 +0000 (UTC)
Subject: Re: [PATCH v2 08/11] kbuild: create *.mod with full directory path
 and remove MODVERDIR
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
 <20190711054434.1177-9-yamada.masahiro@socionext.com>
 <20190716214023.GA15159@redhat.com>
 <CAK7LNAQ41NhPPO6xoVObgFctTO6WewSXPfZkE7_bZXsdAtKSpA@mail.gmail.com>
From:   Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <f1222c8a-9301-1e76-981d-a36e8687a29f@redhat.com>
Date:   Thu, 18 Jul 2019 16:18:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ41NhPPO6xoVObgFctTO6WewSXPfZkE7_bZXsdAtKSpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 18 Jul 2019 20:18:36 +0000 (UTC)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/17/19 1:21 AM, Masahiro Yamada wrote:
>> Hi Masahiro,
>>
>> I'm following this patchset changes as they will affect the klp-convert
>> series [1] that the livepatching folks have been working on...
> 
> Empty files .tmp_versions/*.livepatch are touched
> to keep track of 'LIVEPATCH_* := y', right?
> 

Pretty much.  From that patchset I think the rework would need to  modify..

- [PATCH v4 02/10] kbuild: Support for Symbols.list creation: creates a 
Symbols.list file of kernel and module symbols, but *not* including any 
from LIVEPATCH_* modules.

- [PATCH v4 05/10] modpost: Integrate klp-convert: if a LIVEPATCH_* 
module has changed, call a newly introduced klp-convert script on it.

- [PATCH v4 06/10] modpost: Add modinfo flag to livepatch modules: find 
any LIVEPATCH_* mod, add it to a livepatchmods file, then pass that file 
to modpost

> Perhaps, adding a new field
> to *.mod files might be cleaner.

I can look into that.  By "field" you mean a new row in the file?

Regards,

-- Joe
