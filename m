Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BBB6029FD
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Oct 2022 13:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiJRLQE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Oct 2022 07:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiJRLQE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Oct 2022 07:16:04 -0400
X-Greylist: delayed 488 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 18 Oct 2022 04:16:01 PDT
Received: from domac.alu.hr (domac.alu.hr [161.53.235.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E431EA
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Oct 2022 04:16:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by domac.alu.hr (Postfix) with ESMTP id 01E72604F7;
        Tue, 18 Oct 2022 13:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
        t=1666091269; bh=MmXIv/futsLSEttWHrjkD/7Iu3pMBPAfJPIl8ozgwPg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=eFSzbEym782PbOz92bsvZbyk6bZWsjQoKiDNEpOmepH+Cb+J8CNt34ft5dMdkSY5z
         Y0XD5ABSH7LjoyhFvX8WIthnd3GamJNeYA1u8j4pzgGW0rIIzK/56Wf8fCJyauKupw
         +lGKdmeC2O66HZznJvZ7pGk/E5+qzupWMRBUIPaZDyLVF/eTlR5ByYd2mPmR5hHRyO
         QTdR8ZTwSYoD/aQr6RCcLrF+Cex+yV5k1stk8l2xuJTImGOSyGw9+1ywcgmhUYDE22
         65m7ScCcSdOae51Flnt4pH9QZdoxkdGM+FfRSEHseQTo4rjcEGxBpmArdgLanOCEsU
         7QG8Ayt+Kb8xw==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
        by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ju6STa8ykZhz; Tue, 18 Oct 2022 13:07:46 +0200 (CEST)
Received: from [193.198.186.200] (pc-mtodorov.slava.alu.hr [193.198.186.200])
        by domac.alu.hr (Postfix) with ESMTPSA id C3CE9604F4;
        Tue, 18 Oct 2022 13:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
        t=1666091266; bh=MmXIv/futsLSEttWHrjkD/7Iu3pMBPAfJPIl8ozgwPg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MRHWl6FebPy5uqc4eABPQ8dAq80X6KC+sqJ5JysL0+kSL/QUHOkUQ75Hr81h0npzM
         adPcTMWnLxY/9Fbjdi7Gxb1sWNFdw0TiGTcRNXlkHUQ0mvsUYHTPWTt69wrpdqU1iN
         CL4oy1kciZnzPRENJg9JmxveuLoQgFG/Te0BLvoYgFLNKyHQAFky2Y1Kj7q/eykIyD
         s4WnmCm9VJQ5LOi/S+sinTIn+xkhrimngaCnciGwcC/DNFKr8OLaI9KS3k49aPU2D4
         +y6VS0c5UyEhAViNVA7tbm9dKvUmQk7k9VrTYHx0g+Ob4z670IFt5RrrY6c63UmhkS
         AFpQM3WmKXNrg==
Message-ID: <2f0ddb46-d197-558d-4be7-d40506e0a64f@alu.unizg.hr>
Date:   Tue, 18 Oct 2022 13:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: 6.0.0-RC kernels trigger Firefox snap bug with 6.0.0-rc3 through
 6.0.0-rc7
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <b0c258c3-6dcf-aade-efc4-d62a8b3a1ce2@alu.unizg.hr>
 <Y0Zw2eHEb1aZ9f4y@debian.me>
 <29362d2e-eec6-5a23-4354-cf8868d50b2c@alu.unizg.hr>
 <6375f31f-316a-bebc-6aec-c6241049e401@alu.unizg.hr>
 <7e0b733d-db73-f9a7-0965-4744e63f1a33@gmail.com>
 <fa6c69ff-a493-a519-3564-1a1ccb932553@alu.unizg.hr>
 <81aa8527-af8c-aff9-f805-5412a0531238@gmail.com>
From:   Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <81aa8527-af8c-aff9-f805-5412a0531238@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/18/22 12:55, Bagas Sanjaya wrote:

> On 10/18/22 16:36, Mirsad Todorovac wrote:
>> Hi Bagas,
>>
>> It would be a great speed improvement for my testing kernels if ccache gcc worked
>> for me, so I wonder if you could give me some advice.
>>
>> I tried the latest binary release (compiling on our Debian 10 Buster is impossible due
>> to prerequisites required), however, it did not work though I saw that it cached
>> objs, but it also recompiled them each time.
>>
>> Now that the building cycle of 90 minutes appears too long, it would be prudent to
>> have the ccaching system working.
>>
>> Are you willing to give some advice?
> CC'ing linux-kbuild list, since people there may know this issue.
I think I fixed it, but I will inform you whether it worked.

Thanks.

-- 
Mirsad Goran Todorovac
Sistem inženjer
Grafički fakultet | Akademija likovnih umjetnosti
Sveučilište u Zagrebu
-- 
System engineer
Faculty of Graphic Arts | Academy of Fine Arts
University of Zagreb, Republic of Croatia

