Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 275797E4EE5
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Nov 2023 03:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbjKHCaW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Nov 2023 21:30:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbjKHCaV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2023 21:30:21 -0500
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E850181
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Nov 2023 18:30:19 -0800 (PST)
Received: from webmail.free.fr (unknown [172.20.246.3])
        (Authenticated sender: vivien.gallinaro@free.fr)
        by smtp5-g21.free.fr (Postfix) with ESMTPA id 52C995FFA3
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Nov 2023 03:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1699410617;
        bh=oe9JmaqscxaeaFKS3TeQECuaLMuFz3lU9hDUHFR94c4=;
        h=Date:From:To:Subject:From;
        b=t4cg5MkBh+7OlS0dsnhlTPzn/kxlkWQXoOEDNbdW9pQdNqXrx0C95juH0u/6YFQg0
         QDAilrRYEbGksZB19DaHLx98BjuIqY7Qwo89tIvEe79DUyOhYHzE/QNPhYr/Sz583E
         CVrdE9Fh1VyB2zrniexBEDmsP3km+nvK1vNjhHVrzSHmAU2PLW2uKyQ5er3+wb01+7
         72vBVsZCJuig/JAWJCHten61SZ8tNyHyFeCHL32uWBQChMU3KxyTgMKkIT31gWnEad
         +otutfVXGOtalnZlfI7LLqNleX7tKSRju6hVm9NmXQyUhGNNeD0HHNPdowS0/yGTcu
         apHOW9e61ZAzQ==
Received: from 2a01:e0a:2b0:9080:1e01:8392:432:b1d
 via 2a01:e0a:2b0:9080:1e01:8392:432:b1d
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Nov 2023 03:30:17 +0100
MIME-Version: 1.0
Date:   Wed, 08 Nov 2023 03:30:17 +0100
From:   Vivien Gallinaro <vivien.gallinaro@free.fr>
To:     linux-kbuild@vger.kernel.org
Subject: SymSearch can cause make nconfig to segfault
User-Agent: Webmail Free/1.6.5
Message-ID: <5ec262711df2f3d3ccd84930ed4e9778@free.fr>
X-Sender: vivien.gallinaro@free.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi all,

In make nconfig, when I perform a SymSearch (F8) for "x86", I get a 
segfault. It doesn't happen in make menuconfig (/ search).

It doesn't seem to be a simple matter of "too many results" as a 
SymSearch for "fs" does ok.


For a fresh 6.6 kernel :

$ cd linux-6.6
$ make mrproper
$ make nconfig 2>../blarb
(<F8> x86 <enter>)
$ reset
$ cat ../blarb

gives :

make[2]: *** [scripts/kconfig/Makefile:48: nconfig] Segmentation fault
make[1]: *** [/home/username/linux-6.6/Makefile:697: nconfig] Error 2
make: *** [Makefile:234: __sub-make] Error 2


That's not very helpful, I know… looking up "x86" was not particularly 
useful either! (I was following a wiki referring to x86_sysfb. Before I 
realized it probably doesn't exist any more, I tried to widen the 
search, since I had just come across the deprecation of efi_vars in 
favor of efivar_fs, so to speak.) I hope some one can help the search 
fail gracefully.

Have a nice day,
VG
