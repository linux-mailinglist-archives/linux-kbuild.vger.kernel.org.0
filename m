Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137ED2D5854
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Dec 2020 11:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgLJKh2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Dec 2020 05:37:28 -0500
Received: from foss.arm.com ([217.140.110.172]:34112 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbgLJKh2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Dec 2020 05:37:28 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29C8731B;
        Thu, 10 Dec 2020 02:36:42 -0800 (PST)
Received: from [10.37.8.43] (unknown [10.37.8.43])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B78F3F718;
        Thu, 10 Dec 2020 02:36:40 -0800 (PST)
Subject: Re: [PATCH 1/2] ld-version: use /usr/bin/env awk for shebank
To:     David Laight <David.Laight@ACULAB.COM>,
        'Dominique Martinet' <asmadeus@codewreck.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
 <69c82aee-59ec-f8d8-9546-b38f85bf08c0@arm.com>
 <20201209174252.GA27721@nautica>
 <5ca5c3bb23614af0a35f01f1e3a84ead@AcuMS.aculab.com>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <a68a09ce-f172-bfb4-6422-b1776d798f5f@arm.com>
Date:   Thu, 10 Dec 2020 10:40:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5ca5c3bb23614af0a35f01f1e3a84ead@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Dominique and Dave,

On 12/9/20 10:03 PM, David Laight wrote:
> From: Dominique Martinet
>> Sent: 09 December 2020 17:43
>>
>> I've suggested either just reverting this (I'll keep my local
>> workaround) or going through /bin/sh which is always safe like the
>> following patch -- leaving this to maintainers.
>>
>> Thanks!
>> -----
>> From d53ef3b4c55aa2ea5f9ae887b3e1ace368f30f66 Mon Sep 17 00:00:00 2001
>> From: Dominique Martinet <asmadeus@codewreck.org>
>> Date: Wed, 15 Jul 2020 16:00:13 +0200
>> Subject: [PATCH] ld-version: use /bin/sh then awk for shebank
>>
>> /usr/bin/awk is not garanteed to exist (and doesn't on e.g. nixos),
>> using /bin/sh and invoking awk to have it look in PATH is more robust.
>>
>> Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
>>
>> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
>> index f2be0ff9a738..02dbad7b5613 100755
>> --- a/scripts/ld-version.sh
>> +++ b/scripts/ld-version.sh
>> @@ -1,11 +1,11 @@
>> -#!/usr/bin/awk -f
>> +#!/bin/sh
>>  # SPDX-License-Identifier: GPL-2.0
>>  # extract linker version number from stdin and turn into single number
>> -       {
>> +awk '{
>>         gsub(".*\\)", "");
>>         gsub(".*version ", "");
>>         gsub("-.*", "");
>>         split($1,a, ".");
>>         print a[1]*100000000 + a[2]*1000000 + a[3]*10000;
>>         exit
>> -       }
>> +}'
> 
> Why bother with awk?
> I think you can do it all in a shell function.
> Something like:
> 	read line
> 	line=${line##*)}
> 	line=${line##*version }
> 	IFS='.-'
> 	set $line
> 	echo $(($1*100000000 + $2*1000000 + $3*10000))
> 
> That will work on any recent shell.
> 

I would suggest to revert the patch for now since we are close to the merge
window and then maybe in -rc1 start discussing a better solution.

What do you think?

> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

-- 
Regards,
Vincenzo
