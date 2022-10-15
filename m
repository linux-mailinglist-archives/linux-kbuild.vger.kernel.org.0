Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F955FFB14
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Oct 2022 17:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiJOPpU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 15 Oct 2022 11:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiJOPpT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Oct 2022 11:45:19 -0400
Received: from mail.svario.it (mail.svario.it [84.22.98.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5117F3A16F
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Oct 2022 08:45:17 -0700 (PDT)
Received: from [IPV6:2001:4645:39f:0:a49d:547f:7a4d:9cae] (unknown [IPv6:2001:4645:39f:0:a49d:547f:7a4d:9cae])
        by mail.svario.it (Postfix) with ESMTPSA id 45818B973A;
        Sat, 15 Oct 2022 17:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svario.it; s=201710;
        t=1665848713; bh=nhDUYN6uT2lcau6x55mbrv5ug2kVfvBrkGqUv5+AD3I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=bDjZkDSOeVwAGpsWeBzPjrOchGmDuRxTtTEwbNzerX18+ds8e5F4hey4RbxEX2h/g
         FeMGNRDa52fgj7DTO82IB5nG0p8T63z5KRF6AlsGZCAYbY8DteizImprCqqKnvUnom
         DxeNytNZtBF1c5tjUynIZGV5q71yB20BPeF9DmNdww9PU4UwH+c1AnsAm+q0Hgzks1
         STBRTRvn9rzi6iuqo1xWKlAhj3TtU+m7kGHEZLYsCKCmCj8Kn+PSE+DrWR9FCe1eCH
         76EMD4PNeu4E1Bmcx8wTOYi4751ypo+sjxZ6uo7YeBuy+S3ZSGdnfvnYzgL8KtIrAH
         8XNeXKzHcR7Ng==
Message-ID: <2d8b0551-ff8f-86b1-e192-a11c632b36ce@svario.it>
Date:   Sat, 15 Oct 2022 17:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: base-files: /etc/os-release should contain VERSION variables for
 testing and unstable
To:     sedat.dilek@gmail.com
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
References: <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
 <CAK7LNAQ0ynrZjtpHH=84C5qoTbV0D8SbimSFgCdC2STLcNK5DQ@mail.gmail.com>
 <77c1f13e-4711-3e76-3cfc-0186ffdd9423@svario.it>
 <CA+icZUWRVNc=gUs0Ytjp0oG9-JBnA7wsyyz8gvdScrVE17rE=A@mail.gmail.com>
Content-Language: en-US
From:   Gioele Barabucci <gioele@svario.it>
In-Reply-To: <CA+icZUWRVNc=gUs0Ytjp0oG9-JBnA7wsyyz8gvdScrVE17rE=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 15/10/22 10:56, Sedat Dilek wrote:
> # lsb_release --all 2>/dev/null
> Distributor ID: Debian
> Description:    Debian GNU/Linux bookworm/sid
> Release:        unstable
> Codename:       sid
> 
> [...]
> 
> ( Guess Debian/stable then should contain "stable" and "buster"? )
Stable currently says "Release: 11.5" and "Codename: bullseye" (that's 
the normal behavior for stable releases).

--
Gioele Barabucci

