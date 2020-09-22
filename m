Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1472A274980
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Sep 2020 21:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIVTwS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Sep 2020 15:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVTwS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Sep 2020 15:52:18 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9045C061755;
        Tue, 22 Sep 2020 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=j56FVuNXjzy/9sJhXmMO7Ke2n5f1vQAjUjGFHAMk4xI=; b=dzZsEC/7pRBqkLI+PuKRhZrwPr
        lHt3XUm8WJyMFd0D4oVCjXujTYohCKx+6xFZH5KSAemU3BzJaUW2SUj/Z8JRANsL4VkU11ii42pUa
        6d7+dghUmqfqMk9q09x3fQbs5S9uF7AVL9F7nZczS90yB0Hxk58p/1zvCIL4Ha1cuDlZJGDqHncpE
        OcRL+hE0tv4wBnSwb6TWE1Y8RyzuLFxa/SmfewHueBDBTumC6SiSSYkeupkEBd46EcTXtXAmN2WKX
        4LzSn3WIL8LLgMG6aumpRPKPiqtv/Y23CmDpEioSeHQqNaQM0bLGBTP0yUFBuB/89Tk4fcNuphaNz
        XMU7S4Uw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kKoKl-0007E7-BA; Tue, 22 Sep 2020 19:52:15 +0000
Subject: Re: [PATCH 0/1] Add explicit error for missing CONFIG_ASN1
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <20200922155341.17906-1-James.Bottomley@HansenPartnership.com>
 <dfae4d4f-aa96-674d-93b1-d4c097e720e4@infradead.org>
 <260b4b85d714df822da259554ef8cc2873f3096f.camel@HansenPartnership.com>
 <36232f66-58b1-77a8-91a3-f9d3428fffb5@infradead.org>
 <15cc1edce12357799ae3caea3b89a3aad3a3bd07.camel@HansenPartnership.com>
 <8a346ff9-21a4-db8b-1636-b9b2472b5b87@infradead.org>
 <7704adabb275b652a998ab01c626bbbc99ec6afc.camel@HansenPartnership.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8dc900a4-018d-4be7-2644-81114146a0c9@infradead.org>
Date:   Tue, 22 Sep 2020 12:52:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7704adabb275b652a998ab01c626bbbc99ec6afc.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/22/20 12:48 PM, James Bottomley wrote:
> On Tue, 2020-09-22 at 12:46 -0700, Randy Dunlap wrote:
>> On 9/22/20 12:44 PM, James Bottomley wrote:
>>> On Tue, 2020-09-22 at 12:38 -0700, Randy Dunlap wrote:
>>>> On 9/22/20 12:19 PM, James Bottomley wrote:
>>>>> On Tue, 2020-09-22 at 11:54 -0700, Randy Dunlap wrote:
>>>>>> On 9/22/20 8:53 AM, James Bottomley wrote:
>>>>>>> I recently ran into this as an error from 0day.  On x86
>>>>>>> it's
>>>>>>> pretty
>>>>>>> much impossible to build a configuration where CONFIG_ASN1
>>>>>>> isn't
>>>>>>> set, so you rarely notice a problem using the ASN.1
>>>>>>> compiler
>>>>>>> because something else has selected it.  However, this
>>>>>>> compiler
>>>>>>> is
>>>>>>> never built if CONFIG_ASN1 isn't set and the error you get
>>>>>>> from
>>>>>>> kbuild is particularly unhelpful:
>>>>>>>
>>>>>>>    make[4]: *** No rule to make target
>>>>>>> 'security/keys/trusted-
>>>>>>> keys/tpm2key.asn1.o', needed by 'security/keys/trusted-
>>>>>>> keys/built-
>>>>>>> in.a'.
>>>>>>>    make[4]: *** [scripts/Makefile.build:283:
>>>>>>> security/keys/trusted-
>>>>>>> keys/trusted_tpm2.o] Error 1
>>>>>>>    make[4]: Target '__build' not remade because of errors.
>>>>>>>
>>>>>>> This patch changes the above error to the much easier to
>>>>>>> diagnose:
>>>>>>>
>>>>>>>    scripts/Makefile.build:387: *** CONFIG_ASN1 must be
>>>>>>> defined
>>>>>>> for
>>>>>>> the asn1_compiler.  Stop.
>>>>>>>    make[3]: *** [scripts/Makefile.build:505:
>>>>>>> security/keys/trusted-
>>>>>>> keys] Error 2
>>>>>>>
>>>>>>> James
>>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>> James Bottomley (1):
>>>>>>>   Makefile.build: Add an explicit error for missing ASN.1
>>>>>>> compiler
>>>>>>>
>>>>>>>  scripts/Makefile.build | 5 +++++
>>>>>>>  1 file changed, 5 insertions(+)
>>>>>>
>>>>>> Is there a missing
>>>>>> 	select ASN1
>>>>>> somewhere?
>>>>>
>>>>> You mean in the build used to produce the errors above?  Yes,
>>>>> so the patch is to make the problem more explicit.
>>>>
>>>> I appreciate that the message can be improved, but it seems
>>>> possible that some Kconfig could also be improved.
>>>
>>> I don't really see how.  To find the problem you have to identify a
>>> conditional build in the Makefile that requires the asn1 compiler
>>> but for which the config option doesn't have a select ASN1.  We
>>> don't currently preserve the "what selected this symbol"
>>> information in kconfig, which is what we'd need.
>>
>> Well, if you have a failing .config file, I would be glad to take a
>> look at it...
> 
> The original problem is already fixed.  The point of this patch is to
> make 0day explicitly identify it if it ever occurs again.

Got it. That's helpful info IMO.

thanks.

-- 
~Randy

