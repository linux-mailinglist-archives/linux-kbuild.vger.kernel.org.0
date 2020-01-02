Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 542CD12E891
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2020 17:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728812AbgABQOq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Jan 2020 11:14:46 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:42264 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728780AbgABQOq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jan 2020 11:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZIlIhj6T1GPGAChnUyIP7cY1+AAB0fs5v+t/uRkEsgo=; b=dwDccB8G6vqBRm61ohhaOaOgK
        w3mEJ3sUqIafWUpbtWV76qPPfuOCg5LHD0er5OyxmVMEDQFVcDC3N1tjiQxb3occlGA5FuiU7OT0r
        wENSqalZnTFMVSxu0EvctKXfl72+84sWhFcU5XUnR/PerrLnySgrbEPyl2bjNq5gGSkT6bKEohjps
        e7ljvXUm3xP7s5cT1LFOntDM48aKifd/a8HE27kpSKaIMtcSM6spbJZGEcLgBw9GW2/foBl553IFX
        YvRmUxvh6wP2VILvmMeesb4seqrZmQkyyyVPifTPvZPpFBVXUYky7dY6sAyLib/c3c1T+jtCAVdW1
        JaWCm84ag==;
Received: from [2601:1c0:6280:3f0::34d9]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1in37V-0005nO-8G; Thu, 02 Jan 2020 16:14:45 +0000
Subject: Re: [PATCH] menuconfig: restore prompt dependencies in help text
To:     Arvind Sankar <nivedita@alum.mit.edu>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Rob Landley <rob@landley.net>,
        linux-kernel@vger.kernel.org
References: <20191231055839.GG4203@ZenIV.linux.org.uk>
 <20200101204152.402906-1-nivedita@alum.mit.edu>
 <20200101210426.GA8904@ZenIV.linux.org.uk>
 <20200101222644.GA438328@rani.riverdale.lan>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0ea3e528-4835-ff9c-f5a2-f711666ba75f@infradead.org>
Date:   Thu, 2 Jan 2020 08:14:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200101222644.GA438328@rani.riverdale.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/1/20 2:26 PM, Arvind Sankar wrote:
> On Wed, Jan 01, 2020 at 09:04:26PM +0000, Al Viro wrote:
>> On Wed, Jan 01, 2020 at 03:41:52PM -0500, Arvind Sankar wrote:
>>> Commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
>>> prompts") moved some code from get_prompt_str to get_symbol_str so that
>>> dependency information for symbols without prompts could be shown.
>>>
>>> This code would be better copied rather than moved, as the change had
>>> the side-effect of not showing any extra dependencies that the prompt
>>> might have over the symbol.
>>>
>>> Put back a copy of the dependency printing code in get_prompt_str.
>>
>> Umm... Is "visible" really accurate in this case?  AFAICS, the
>> entry (and help for it) _is_ visible with EXPERT=n.  OTOH, with
>> EXPERT=y and MULTIUSER=n it disappears completely.
>>
>> I'm not familiar with kconfig guts (and not too concerned about that
>> feature of help there, TBH), but it looks like what you are printing
>> there is some mix of dependencies ("visible when") and selectability...
> 
> Perhaps not the most accurate term. For NAMESPACES it has a submenu, so
> it can't disappear as long as its selected, even if it's not editable
> any more. A "leaf" level option like MULTIUSER, otoh, does disappear
> completely (even though it's still selected).
> 
> But there are also things like CONFIG_VT, which stays visible, even
> though its not a menu.. I think because there is a visible option that
> depends on it and immediately follows, which menuconfig shows by
> indenting. If the order of UNIX98_PTYS and VT_HW_CONSOLE_BINDING is
> flipped in drivers/tty/Kconfig, then VT disappears when EXPERT=n.
> 
> Dunno, maybe Editable would be a better word than Visible?

I would prefer Editable instead of Visible.

and the Subject should be more than menuconfig since the patch also
"fixes" nconfig, xconfig, and gconfig.


Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy

