Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BE917E3AC
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2020 16:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgCIPei (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Mar 2020 11:34:38 -0400
Received: from mx.sdf.org ([205.166.94.20]:50302 "EHLO mx.sdf.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726921AbgCIPei (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Mar 2020 11:34:38 -0400
X-Greylist: delayed 431 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Mar 2020 11:34:36 EDT
Received: from sdf.org (IDENT:lkml@faeroes.freeshell.org [205.166.94.9])
        by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id 029FRKYJ026590
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits) verified NO);
        Mon, 9 Mar 2020 15:27:21 GMT
Received: (from lkml@localhost)
        by sdf.org (8.15.2/8.12.8/Submit) id 029FRKi9008621;
        Mon, 9 Mar 2020 15:27:20 GMT
Date:   Mon, 9 Mar 2020 15:27:20 +0000
From:   George Spelvin <lkml@SDF.ORG>
To:     ardb@kernel.org
Cc:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        George Spelvin <lkml@SDF.ORG>
Subject: Bug in CONFIG_CC_HAS_INT128 (5.5 regression)
Message-ID: <20200309152720.GA24424@SDF.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Here's an interesting bug I just ran into, a bug in commit
c12d3362a74b ("int128: move __uint128_t compiler test to Kconfig")

My x86-64 kernel build is lacking CC_HAS_INT128 and therefore
 CONFIG_ARCH_SUPPORTS_INT128, even through it supports
__int128 just fine.

The reason is that the actuall call which tests for compiler support is 
execve("/usr/bin/gcc", ["gcc", "-Werror", "-D__SIZEOF_INT128__=0", "-S", "-x", "c", "/dev/null", "-o", "/dev/null"], 0x5818d390 /* 122 vars */) = 0

and it doesn't detect the redefined symbol.

$ gcc -Werror -D__SIZEOF_INT128__=0 -S -x c /dev/null -o /dev/null
$ echo $?
0

But on my machine, gcc defaults to the 32-bit compiler.  The kernel
is compiled with -m64, and with that on the command line, things
fail as expected:

$ gcc -m64 -Werror -D__SIZEOF_INT128__=0 -S -x c /dev/null -o /dev/null
<command-line>: error: "__SIZEOF_INT128__" redefined [-Werror]
<built-in>: note: this is the location of the previous definition
cc1: all warnings being treated as errors
$

I haven't figured out how to fix this, but hopefully someone more familiar
with the innards of Kconfig can.
