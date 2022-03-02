Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38EA14CA9E9
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Mar 2022 17:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236382AbiCBQPj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Mar 2022 11:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiCBQPj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Mar 2022 11:15:39 -0500
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D654ECCC5B
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Mar 2022 08:14:54 -0800 (PST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4K7zj93gF6z9sSp;
        Wed,  2 Mar 2022 17:14:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Kz5UkkdHbiDu; Wed,  2 Mar 2022 17:14:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4K7zj92zhyz9sSk;
        Wed,  2 Mar 2022 17:14:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 57D488B76D;
        Wed,  2 Mar 2022 17:14:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 2G1Yxp3_d3JX; Wed,  2 Mar 2022 17:14:53 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D1358B763;
        Wed,  2 Mar 2022 17:14:53 +0100 (CET)
Message-ID: <bdaccb9b-01f5-9c5e-e219-cadb6c4424d7@csgroup.eu>
Date:   Wed, 2 Mar 2022 17:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: powerpc{32,64} randconfigs
Content-Language: fr-FR
To:     Randy Dunlap <rdunlap@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
 <87tuo0az16.fsf@mpe.ellerman.id.au>
 <4514b768-ef07-0b01-c87e-4c2d9eb95f65@infradead.org>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <4514b768-ef07-0b01-c87e-4c2d9eb95f65@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



Le 28/04/2021 à 01:45, Randy Dunlap a écrit :
> On 4/21/21 12:15 AM, Michael Ellerman wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> 
> Please merge this. :)
> 

Merged as f259fb893c69 ("powerpc/Makefile: Add ppc32/ppc64_randconfig 
targets")

