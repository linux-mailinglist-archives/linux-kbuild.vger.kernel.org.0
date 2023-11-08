Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32E177E4E77
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Nov 2023 02:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjKHBKy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Nov 2023 20:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjKHBKx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2023 20:10:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773E2181;
        Tue,  7 Nov 2023 17:10:51 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7686DC433C7;
        Wed,  8 Nov 2023 01:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699405851;
        bh=QPRBMCqMqQoD9h8h7LN/+esq/02W/lEv7At7WJFqPX0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=D+TVHmkU/6ePUy2BlCRRIjj6Y7N2Oc42eCatn0oxFJDVqDflzQZrb6Zj6oiYdLBz1
         idxZxzTAjibPTzlzpwsXH/NElBagWCbHkoGAYm6zzTUzEybjXJtHicAGBMqqjZTA1W
         9GADcgD2oWAc3FTConzYbkR8buyt0wCPTwqQ/dTTHCG4WlHSs0MqQGAd5lBsxIBArf
         njnyVRv2J8Dlv6/FUrlnlNaDpW/RI4z8VvLo/SlV8lk2phUzB0BN9s2fhwY3W4cGt1
         dIHwJp8N+muRSLK4BjYf0U5xrlhWbxhmFNhcHldbfqFCxWtb2pwUcZsmEt2F78q44m
         A5lsaIqPLK5OA==
Message-ID: <ea5f8a61-7385-45ac-931c-0144b11db7a6@kernel.org>
Date:   Wed, 8 Nov 2023 10:10:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ata: Drop platform_driver_probe() and convert to
 platform remove callback returning void (part II)
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        kernel@pengutronix.de, linux-kbuild@vger.kernel.org
References: <20231105150037.3724669-6-u.kleine-koenig@pengutronix.de>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20231105150037.3724669-6-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/6/23 00:00, Uwe Kleine-König wrote:
> Hello,
> 
> there are two different types of patches here that would justify to
> different series. But as the patches are not independent I chose to put
> them in a single series.
> 
> The first two patches drop usage of platform_driver_probe(). This is a
> concept that isn't so relevant any more today. I didn't check, but it
> saves typically only a few 100k and there are thoughts to deprecate it
> to simplify the core. Getting the usage right is not trivial though the
> drivers here got it nearly right. The alternative to these patches is to
> add __refdata to the driver struct ideally with a comment describing the
> need like is e.g. done in commit 5b44abbc39ca ("platform/x86: hp-wmi::
> Mark driver struct with __refdata to prevent section mismatch warning").
> Note that the warning only happens starting with commit f177cd0c15fc
> ("modpost: Don't let "driver"s reference .exit.*") that is expected to
> be part of v6.7-rc1.
> 
> The remaining two patches convert the platform drivers to .remove_new(),
> see commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> All conversions are trivial as the remove functions return zero
> unconditionally. The other ata drivers were already converted earlier,
> my coccinelle script just missed these two drivers (because of the
> __exit_p macro).

Applied to for-6.7-fixes. Thanks !

> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (4):
>   ata: pata_falcon: Stop using module_platform_driver_probe()
>   ata: pata_gayle: Stop using module_platform_driver_probe()
>   ata: pata_falcon: Convert to platform remove callback returning void
>   ata: pata_gayle: Convert to platform remove callback returning void
> 
>  drivers/ata/pata_falcon.c | 11 +++++------
>  drivers/ata/pata_gayle.c  | 11 +++++------
>  2 files changed, 10 insertions(+), 12 deletions(-)
> 
> 
> base-commit: e27090b1413ff236ca1aec26d6b022149115de2c

-- 
Damien Le Moal
Western Digital Research

