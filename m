Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD7389F58
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 15:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbfHLNN2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 09:13:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56984 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbfHLNN2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 09:13:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id A818A285330
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the
 environment
To:     Mark Brown <broonie@kernel.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        kernel@collabora.com
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
 <20190808223512.GT3795@sirena.co.uk>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <0d0a5126-73fb-8815-f4d6-d60506dea0ab@collabora.com>
Date:   Mon, 12 Aug 2019 15:13:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808223512.GT3795@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 09/08/2019 00:35, Mark Brown wrote:
> On Thu, Aug 08, 2019 at 11:06:52PM +0200, Guillaume Tucker wrote:
> 
>> @@ -412,7 +412,7 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>>  # Make variables (CC, etc...)
>>  AS		= $(CROSS_COMPILE)as
>>  LD		= $(CROSS_COMPILE)ld
>> -CC		= $(CROSS_COMPILE)gcc
>> +CC	       ?= $(CROSS_COMPILE)gcc
>>  CPP		= $(CC) -E
>>  AR		= $(CROSS_COMPILE)ar
>>  NM		= $(CROSS_COMPILE)nm
> 
> Why only for CC and not for anything else here?

This was the smallest possible change to fix the issue and what I
tested for this RFC.  Of course, if using ?= is a valid way to
fix it then it would seem logical to apply it to the other
variables defined there.

Guillaume

