Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBEE3EB74E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Aug 2021 17:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241082AbhHMPB3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 11:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241052AbhHMPB2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 11:01:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41ECEC0617AD;
        Fri, 13 Aug 2021 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=Lq6xulyx2xZPMmXDOjO5ccQRCNtNGbftA7SubnHzflA=; b=Ygvusv4VGM7iQE8DxhVpdGrptN
        CTOqYvBv8SpOIdVL5CbvlEKngQ8vxZlyx5YMgbHDqB0Bzlw9WhA36SEbfjdgg5eVNLkHcrZV6NmqQ
        xXeleCEiTpFHm/ifUZLyJzCLr2BmrYdNGBmajMvy2u8sDUFtjwOSbElx3hShhbWMBLDLu5hybOmaq
        dtoJDgQclJeXxbFMQV2bZd/Y5+r+Jt2psVJtLeQlXtF7Arw9Q12s5mCeyM6LL+fBWBqxGd3w5i0Ou
        yvHX2yEG/EHi/oF0Sum0mZl3PiRmXHGAh/UcPooja4ZhPde2KLZ4HsVDVFTU2YvmMmHSgzAUiavSk
        gNoVGTLw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mEYg7-00CsGK-Qx; Fri, 13 Aug 2021 15:00:59 +0000
Subject: Re: [PATCH] kbuild: allow "make" targets 'versioncheck' and
 'includecheck' withoug .config file
To:     Nicolas Schier <n.schier@avm.de>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
References: <20210811225442.9537-1-rdunlap@infradead.org>
 <YRYuC9p5G714Bt68@deb-nschier.ads.avm.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1ecfeb81-a2e4-a177-1886-11e4ffc54224@infradead.org>
Date:   Fri, 13 Aug 2021 08:00:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRYuC9p5G714Bt68@deb-nschier.ads.avm.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/13/21 1:32 AM, Nicolas Schier wrote:
> On Wed, Aug 11, 2021 at 03:54:42PM -0700, Randy Dunlap wrote:
>> Top-level Makefile targets 'versioncheck' and 'includecheck' don't
>> need a configured kernel (i.e., don't need a .config file), so add
>> them the the list of "no-dot-config-targets".
>> This eliminates the 'make' error:
>>
>> ***
>> *** Configuration file ".config" not found!
>> ***
>> *** Please run some configurator (e.g. "make oldconfig" or
>> *** "make menuconfig" or "make xconfig").
>> ***
>> Makefile:759: include/config/auto.conf.cmd: No such file or directory
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Michal Marek <michal.lkml@markovi.net>
>> Cc: linux-kbuild@vger.kernel.org
>> ---
> 
> I like that change, works for me as expected.  Possibly you might want
> to fix the commit subject typo (withoug -> without).
> 

Yes, I noticed that a few minutes after I sent it, but I guess
that this patch isn't going anywhere.

Thanks.

> 
> 
>> Fixes: I couldn't determine this.
>>
>>   Makefile |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> --- linux-next-20210811.orig/Makefile
>> +++ linux-next-20210811/Makefile
>> @@ -274,7 +274,8 @@ no-dot-config-targets := $(clean-targets
>>   			 cscope gtags TAGS tags help% %docs check% coccicheck \
>>   			 $(version_h) headers headers_% archheaders archscripts \
>>   			 %asm-generic kernelversion %src-pkg dt_binding_check \
>> -			 outputmakefile rustfmt rustfmtcheck
>> +			 outputmakefile rustfmt rustfmtcheck \
>> +			 versioncheck includecheck
>>   # Installation targets should not require compiler. Unfortunately, vdso_install
>>   # is an exception where build artifacts may be updated. This must be fixed.
>>   no-compiler-targets := $(no-dot-config-targets) install dtbs_install \


-- 
~Randy

