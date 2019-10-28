Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 419F5E6B74
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2019 04:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730301AbfJ1D2s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Oct 2019 23:28:48 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39348 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbfJ1D2s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Oct 2019 23:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=pGhxkZI8OXt4Dcv5JMCcpWKbsOITOhSGDHxn01NkRKs=; b=lqVwejqYmQ40NJtL8805W13Gu
        9dGBFtITGO6W+HQm2bDplGabfhNuIfXkQplk9D41H5ZdHrenEClZ5AIMSd1Ouo/lteL5eJC/Bo8k0
        A0Ito7JK/G0SYyGnAJwLTRd9B9eZM+fjShyuA3wUvK60F3Xm/0msb5uWcIQ2yxzuWhtIvjOMhgsf4
        8Tg2kznFaT53594WV2aUhZAv4J/BX4RIUPim3P3hBUOV6U5hrP9t2et8khP8YqrNf356DJ/cqLeiU
        +DbHk6D4bWypsYAUd6koUSwwCOzV7ISOejpKI5ABJdXeFWF5QtgC9oxyFvTbhVvaemFcKAjamq18o
        4d947lKTQ==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iOvi3-00047S-IT; Mon, 28 Oct 2019 03:28:47 +0000
Subject: Re: [PATCH] scripts:prune-kernel:prune old kernels and modules dir
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        bfields@fieldses.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191025054703.16400-1-unixbhaskar@gmail.com>
 <4adba61c-9c1b-dee3-0a9b-9159dcce5a82@infradead.org>
 <20191028032203.GA28082@Gentoo>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <83f11555-8364-1e2d-f0df-c90e889710a3@infradead.org>
Date:   Sun, 27 Oct 2019 20:28:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028032203.GA28082@Gentoo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/27/19 8:22 PM, Bhaskar Chowdhury wrote:
>>> +do 
>>
>> 'do' has a trailing space after it.  drop it.
>>
> Certain thing ..this space and tab killing me...how fix these damn thing
> Randy??

I dunno.  It depends on what editor you are using and what
options.  So what editor?

-- 
~Randy

