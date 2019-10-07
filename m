Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEE10CE9F4
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2019 18:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbfJGQ63 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Oct 2019 12:58:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60842 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbfJGQ61 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 12:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=M1olqyDfSGoMIsdSc+T5PN89uxP7EflDYmXBg03m/Tk=; b=MdwKcAKdqP7IXITupOTHJxXm4
        e24SkkeEV5TSj97fhYNM+2yoHZ6oTmvtMrmloRNAzVnk56GdXxTFXCM2MLxIi8fy59/+SGC+8JgeX
        weXcIbg/H1niihCFNEcI15EkvR0Gd15Eug+S/kxkgrtuyRMG0MaUn2euRvxqFRjSo4hkVf3Ng9dN8
        tWkP6T6yGG49vF8WW0VeZaTqOSIeo+/xGr3uPAu9pJ7H5dM2OV/YKHERA5VOrmgV4YI7M+rKG9qOJ
        DKyhj/zrjr7V5qfnx2/Ae4qcIBW/q11rl+9g8BNgJN/GiOI2e52/D6XfjEowk6tgs8ZiHmvNdtLAY
        giYMxxHHw==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iHWL4-0001O1-8G; Mon, 07 Oct 2019 16:58:26 +0000
Subject: Re: [PATCH] doc: move namespaces.rst out of kbuild directory
To:     Matthias Maennich <maennich@google.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adam Zerella <adam.zerella@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191007043611.31036-1-yamada.masahiro@socionext.com>
 <20191007060614.GA142813@google.com> <20191007081241.GA8279@linux-8ccs>
 <20191007072930.07b1e90a@lwn.net> <20191007134124.GC23938@google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <373b2646-7894-cf4b-21b6-a8a63ad707fa@infradead.org>
Date:   Mon, 7 Oct 2019 09:58:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007134124.GC23938@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/7/19 6:41 AM, Matthias Maennich wrote:
> On Mon, Oct 07, 2019 at 07:29:30AM -0600, Jonathan Corbet wrote:
>> On Mon, 7 Oct 2019 10:12:42 +0200
>> Jessica Yu <jeyu@kernel.org> wrote:
>>
>>> This was my line of thought as well, since the audience of
>>> admin-guide/ is sysadmins and users. Namespaces are mostly relevant to
>>> module authors and kernel developers. Currently, I don't think there
>>> is an existing good place in Documentation/ for this topic :-/
>>> I suppose kernel-hacking/ might be the closest fit, as Adam suggested.
>>
>> I didn't see this thread before responding in the first, naturally...
>>
>> I think the core-api manual is probably as good a place as any for this.
>> Changing the name to something like symbol-namespaces.rst is probably a
>> good idea, since most people think of other things when they see
>> "namespaces".  Or perhaps that mythical Somebody could expand it into a
>> proper description of symbol exports in general...:)
> 
> As I said in the other thread, I am happy for it to be moved to a better
> location. core-api/ as well as kernel-hacking/ seem to be good
> locations.

core-api/ please.  kernel-hacking/ does not make any sense to me.

> I could imagine expanding the documentation, but would not like to
> commit to it right now. (Even though I feel very encouraged by your talk
> in Paris, Jon. Thanks for that!)


-- 
~Randy
