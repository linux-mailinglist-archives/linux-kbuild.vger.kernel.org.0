Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90467E9577
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2019 04:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfJ3D7B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Oct 2019 23:59:01 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42056 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfJ3D7B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 23:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Otea3GUj7Y6yguIprmqpsQUijyiqZsI5ui8Xykspypg=; b=AypR2kirE85cx/HxaOLtBJvgy
        M141UOXaRHiXPhK9e6+ousO4gSfopG3UVn6f+hCqcMTsi7536slqOuBBmzbj0TljXhEbgrYtdNFrK
        DLu60Cq6znXVZRBBPVAGK4O6PBK6YKsK/ZDFxki6Dlkd/AwhQZy0F0xg1wPe3JkU7j2GwPln5kjsN
        WbnI5mEzm3pjrD5bOLffg8ang/9H8QCH3c9+0SkzFqcnwc5BegGaYVf9jf8Gm0apRE6GyRhJ9IKfe
        3MBwdhrY4QcbwcKXfP8cGmMJEzkjv134bZZs3J359/h7TE3LrJCwp8WyOphqVlnEvoj6AJQOl4o1d
        DWqeFdpVQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iPf8O-0005RW-Nc; Wed, 30 Oct 2019 03:59:00 +0000
Subject: Re: [PATCH] scripts:prune-kernel:prune kernel and modules dir from
 the system
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191029030030.31659-1-unixbhaskar@gmail.com>
 <de2a4604-e3ba-dab1-c72c-a0ff451541cf@infradead.org>
 <20191030024312.GA1251@ArchLinux>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d9f7acd6-e948-4eb7-41ef-4d9a2cafe15a@infradead.org>
Date:   Tue, 29 Oct 2019 20:58:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030024312.GA1251@ArchLinux>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/29/19 7:43 PM, Bhaskar Chowdhury wrote:
> On 17:05 Tue 29 Oct 2019, Randy Dunlap wrote:
> 
>> Hi,
> Thank you Randy, my answers are inline , kindly look.
> 
> The modified version(implemented your suggestions) of the script and their interaction will send in next patch mail.
>>
>>
>> This patch does not delete the original script loop, so that still follows
>> after the 'done' above.  Was that intentional?
> This is confuse me! not sure  what you meant. Did you meant to say
> the do loop inside does not match with this pair???

I mean that the old loop that begins with
for f in "$@"

is still there after your patch.


-- 
~Randy

