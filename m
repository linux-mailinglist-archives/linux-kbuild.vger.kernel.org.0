Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6985FEC6C
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Oct 2022 12:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiJNKQc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Oct 2022 06:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiJNKQb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Oct 2022 06:16:31 -0400
X-Greylist: delayed 344 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 14 Oct 2022 03:16:29 PDT
Received: from mail.svario.it (mail.svario.it [84.22.98.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A398E2BB1D
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Oct 2022 03:16:29 -0700 (PDT)
Received: from [193.157.119.75] (ekstern-eduroam-193-157-119-75.wlan.uio.no [193.157.119.75])
        by mail.svario.it (Postfix) with ESMTPSA id 69D9CB6560;
        Fri, 14 Oct 2022 12:10:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svario.it; s=201710;
        t=1665742238; bh=ICDBDXD5HlkSkPOWcOc5jfhB/QTiRAZm/15/pqRV1Jw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jxFQXo342EGpkWJ5UmIDfbbIQtOadwl4CnpTH8Sz4knYlhd/n/OgnFhqF6lcXdSmA
         YTdU/AzylAJy66LSQEMPXeXeXVtKO41Ij2faiiNzFXDPrJtuBYmbTfBh2YHnzBgsGW
         0lXCHIUNeyrJK14acQkmdcYzA9K5PknyrqY4KtS8dZmayf7m96fC8HSY41WU3ktCA7
         SAS8yePSVOCeikKYd41+9WmUhCjkNfNwgs3kkxkBTK7L0TMi7+aWeSeiBfLuJlmDnS
         bgKCY2YPtfWz0HIfVeEX4pbnwMldLEWmJcyCPK0MjF/vMSdg7+MZMrbGYOc4uzE5Hf
         fAyyiO2YD25xQ==
Message-ID: <77c1f13e-4711-3e76-3cfc-0186ffdd9423@svario.it>
Date:   Fri, 14 Oct 2022 12:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: base-files: /etc/os-release should contain VERSION variables for
 testing and unstable
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>, sedat.dilek@gmail.com
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
References: <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
 <CAK7LNAQ0ynrZjtpHH=84C5qoTbV0D8SbimSFgCdC2STLcNK5DQ@mail.gmail.com>
From:   Gioele Barabucci <gioele@svario.it>
In-Reply-To: <CAK7LNAQ0ynrZjtpHH=84C5qoTbV0D8SbimSFgCdC2STLcNK5DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dear Masahiro, dear Sedat,

[Debian bug #1008735 removed from CC]

On 13/10/22 16:02, Masahiro Yamada wrote:
> On Mon, Oct 3, 2022 at 6:56 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> 
> Can you give me more context of this email?
> 
>> I am using Debian/unstable AMD64 and doing Linux-kernel upstream
>> development and testing.
>>
>> People using bindeb-pkg (mkdebian) from Linux-kernel sources
>> (scripts/packages) to build and test their selfmade Debian kernels get
>> a now a "n/a" for distribution.
> 
> Right, if I try the latest sid,
> "lsb_release -cs" returns "n/a".
> It returned "sid" before IIRC.
> 
> What was changed in Debian?
> Any change in the lsb_release program?


A quick summary from the upstream developer (me) of the new 
`lsb_release` implementation being rolled out in Debian.

Debian dropped the legacy `lsb_release` package. Now the `lsb_release` 
command is provided by `lsb-release-minimal`.

`lsb-release-minimal` relies on `/etc/os-release` to provide LSB 
information in a format that is byte-for-byte compatible with the 
`lsb_release` specifications.

The issue you experienced is due to Debian's `/etc/os-release` (provided 
by the `base-files` package) not contain all the necessary information. 
See <https://bugs.debian.org/1008735>.

The situation is now changing. The maintainer of `base-files` has added 
VERSION_CODENAME ("bookworm" for both unstable and testing).

However VERSION_ID (used for `lsb_release --release`) has not been added 
yet. This is being tracked at <https://bugs.debian.org/1021663>.

Until #1021663 is fixed, `lsb_release -rc` will return the following 
info in both unstable and testing.

     Release:   n/a
     Codename:  bookworm

A workaround to get the old behavior is:

     rm /etc/os-release
     cp /usr/lib/os-release /etc/os-release
     echo "VERSION_ID=unstable" >> /etc/os-release
     echo "VERSION_CODENAME=sid" >> /etc/os-release

Regards,

--
Gioele Barabucci
