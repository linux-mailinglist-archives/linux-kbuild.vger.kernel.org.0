Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983CF2C8418
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Nov 2020 13:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgK3M2K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Nov 2020 07:28:10 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:40355 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725298AbgK3M2K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Nov 2020 07:28:10 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kjiH9-001Zqo-Hz; Mon, 30 Nov 2020 13:27:27 +0100
Received: from p57bd9091.dip0.t-ipconnect.de ([87.189.144.145] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kjiH9-001cul-0G; Mon, 30 Nov 2020 13:27:27 +0100
Subject: Re: vmlinux link failure on ia64 with zstd
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Tony Luck <tony.luck@intel.com>
References: <f0a93b2d435252b3878ce821142677754f5e434c.camel@decadent.org.uk>
 <6A76267A-6B60-4428-94DF-E05706EB85FB@fb.com>
 <CAK7LNAToB3n9Y9OPXR55VKbDAkYgm1kUDO8gUu0Ak_+=6AhzCw@mail.gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <067e9ef5-7555-6f8d-f744-e6400184d6ef@physik.fu-berlin.de>
Date:   Mon, 30 Nov 2020 13:27:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAToB3n9Y9OPXR55VKbDAkYgm1kUDO8gUu0Ak_+=6AhzCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.145
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro!

On 9/15/20 8:48 AM, Masahiro Yamada wrote:
> dc35da16a2e2 is more than two years old (i.e. v4.17)
> 
> Are we discussing a long-standing issue
> or something that arose recently?

Kernels up to 5.7.0 built fine on ia64 in Debian [1], but I assume that zstd was
only recently enabled in Debian's standard kernel.

Adrian

> [1] https://buildd.debian.org/status/logs.php?pkg=linux&arch=ia64

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

