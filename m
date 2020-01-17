Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8468C14029D
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 04:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbgAQDyp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Jan 2020 22:54:45 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58496 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729037AbgAQDyp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 22:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=D2eqEc9iWrOC6nuYKXmjMUzCmhTUZW0frYdfgGY7luQ=; b=MSe05zNS4Up8FnibnyD4+SQ7p
        /4LtR2VOkSRJZ/CtSg8cL/7mon6OmtAuZCyAJKfygQuVyHyFEMUUs4dvPxCnhb7bDisxw2YXkVZmc
        4cErl3TezYDcnjHCnjcnC74scJJ47mv8t3VbxRLLKE5MOYghoguWk1MuyfnLYK8ZBlKLpW4EX2NJn
        Z983NEOQm9at8lFsXomOM4qbWWsloDY7kOKSK9MqAxQIgfEuunVka2cpNXUs2HvXxEX1DM+jYD/v2
        XHJekFPAr/A1JoiVv0FZSGNqz+CyQlzyuIxIQapjfI/XdCGcR/uFZPxQh/3rYRIh7jtwXuYCB1/aQ
        76mQyRaow==;
Received: from [2601:1c0:6280:3f0::ed68]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1isIia-00056b-Pd; Fri, 17 Jan 2020 03:54:44 +0000
Subject: Re: [PATCH] kconfig: fix documentation typos
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
References: <20200113232212.138327-1-helgaas@kernel.org>
 <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <26736fee-6e8e-9a05-59c4-6f9d13e31864@infradead.org>
Date:   Thu, 16 Jan 2020 19:54:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/16/20 6:17 PM, Masahiro Yamada wrote:
> On Tue, Jan 14, 2020 at 8:22 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>>
>> From: Bjorn Helgaas <bhelgaas@google.com>
>>
>> Fix a couple typos in kconfig-language documentation.
>>
>> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>> ---
>>  Documentation/kbuild/kconfig-language.rst | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
>> index 74bef19f69f0..f547720bd82d 100644
>> --- a/Documentation/kbuild/kconfig-language.rst
>> +++ b/Documentation/kbuild/kconfig-language.rst
>> @@ -594,7 +594,7 @@ The two different resolutions for b) can be tested in the sample Kconfig file
>>  Documentation/kbuild/Kconfig.recursion-issue-02.
>>
>>  Below is a list of examples of prior fixes for these types of recursive issues;
>> -all errors appear to involve one or more select's and one or more "depends on".
>> +all errors appear to involve one or more "selects" and one or more "depends on".
> 
> 
> I think "selects" is strange here.

I thought so when I read it also.

> 
> "select" is a Kconfig keyword.
> select's is intentional, I guess.

Yes, I expect so.

> Keep it as-is, or perhaps change it into "select" (singular) ?

Maybe:

 Below is a list of examples of prior fixes for these types of recursive issues;
-all errors appear to involve one or more select's and one or more "depends on".
+all errors appear to involve one or more "select"s and one or more "depends on".


-- 
~Randy

