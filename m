Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987D9434DDC
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 16:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhJTOeq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 10:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhJTOeq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 10:34:46 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E21C06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=9AkGDaaFsWkFtKH4tiUlgD21og+UvuFDdkFAvUOz6yQ=; b=GWom52pKpkWE0HgQBCt8idhG1J
        1241l2YIUoYGt1c1m1a/wiBxj3LkAoWoB4isJI4CXPtV6o5X/umOxw1ftkXPojlEJf3mhuEy8VkFY
        JQ7GGv0pcSTTz3IuR4frmTzIxdtgLI5SaEM7xjzpnalorbgYWhWrJhSb9usUkIBGl4ZkMcXoK1k4L
        T+0o4F6E848Fg2dGShDQCNIP3Cf4wM1U0gBR3eNOj/ORODb4xBcgJGZoVuPPTyR0COECPax0mPSKZ
        3Ej9EdnzgwIOGYIy93R1oVeOvB48G5azgUrkp6AFL/y6r7jU+7AuKqAnQ8G49B4tEwQZzPwSBDV4D
        WronDCHg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mdCdl-004m5C-8z; Wed, 20 Oct 2021 14:32:25 +0000
Subject: Re: [RFC 0/3] kconfig: add support for conflict resolution
To:     Thorsten Berger <thorsten.berger@rub.de>,
        linux-kbuild@vger.kernel.org
Cc:     "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <f89e6f6d-99a1-ab3f-ead8-c55b7144ebe5@rub.de>
 <20b94a01-63d3-1cfd-320c-ddbe112bab29@infradead.org>
 <176bb83c-1269-6970-128c-9b170d5120c4@rub.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <71dd9168-b827-d7b0-0145-794f7793c30d@infradead.org>
Date:   Wed, 20 Oct 2021 07:32:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <176bb83c-1269-6970-128c-9b170d5120c4@rub.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/20/21 1:06 AM, Thorsten Berger wrote:

>> Hi,
>>
>> It looks like patches 1/3 and 2/3 didn't make it to the
>> mailing list.  My guess is that they are too large
>> (I don't know the limit -- it may be 100 KB per email).
>>
> Hi Randy,
> 
> Yes, they might have been too large. We'll send a more fine-grained patch set. Shall we create a new thread or reply to the first email I sent yesterday?
> 
> Best, Thorsten
> 


Hi,
A new thread, please.

thanks.
-- 
~Randy
