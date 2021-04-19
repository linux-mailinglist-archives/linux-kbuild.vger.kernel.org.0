Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA96D364D24
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 23:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhDSViz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 17:38:55 -0400
Received: from terminus.zytor.com ([198.137.202.136]:58943 "EHLO
        terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbhDSVix (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 17:38:53 -0400
Received: from tazenda.hos.anvin.org ([IPv6:2601:646:8602:8be0:7285:c2ff:fefb:fd4])
        (authenticated bits=0)
        by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 13JKslbT2399793
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 19 Apr 2021 13:54:55 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 13JKslbT2399793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2021032801; t=1618865697;
        bh=PSRN5v6fXZoEYzmBfnsY6QxsYgPsedMVL9WdxgLS2qU=;
        h=From:To:Cc:Subject:Date:From;
        b=f5zFIsPcOREApY+mB0ii8gwVUTUMKktoUkJE6+w/n/DXJQ4+WojjMKyEXIsI6vWXJ
         9/D5d7IQ5NxZ/wLrEOJWFcaSRqYkZEP/Dx9wW0ZRA+tfI5eZl3/VEiIZuH16AHmf3T
         3modexQEAcvHCkTuayE4S15qxDN/gMiglxnJ4KQ1F3i5cQdeDDuMY67/Sa23WHO9BX
         NrwHQCSsAHMQ3JboGCWFTWzMa6sMtT9utZx87H8fq0R1FD7lOEw5snCrgaafOvNW7R
         j1CBkBW3e5FKM+x34T/3KMEKfKgugl8DzLdBE5rWHjC+oP1+58/cAVAiLR7RvxPTY7
         4J6DE7FqmTe+g==
From:   "H. Peter Anvin" <hpa@zytor.com>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 0/3] x86 disk image and modules initramfs generation
Date:   Mon, 19 Apr 2021 13:54:35 -0700
Message-Id: <20210419205438.1531413-1-hpa@zytor.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "H. Peter Anvin" (Intel) <hpa@zytor.com>

When compiling on a different machine than the runtime target,
including but not limited to simulators, it is rather handy to be able
to produce a bootable image. The scripts for that in x86 are
relatively old, and assume a BIOS system.

This adds a build target to generate a hdimage which can be booted
either from BIOS or EFI, and modernizes the genimage.sh script
including adding the ability to add an arbitrary number of initramfs
files (limited only by the length of the command line.)

Possibly more controversial, at least from a Kbuild design perspective
(as usual I'm the guy who wants to do something with Kbuild which it
seems it was never really designed to do), is add the ability to
create an initramfs image which includes all the built modules. Some
distributions cannot be easily booted without modules in initramfs,
and this creates an image which can be added to initramfs to provide
the kernel modules, as finalized by "make modules_install".

The final patch put these two together, and allows the modules
initramfs to be included in the x86 boot image.

 Makefile                     |  17 ++-
 arch/x86/Makefile            |   8 +-
 arch/x86/boot/.gitignore     |   1 +
 arch/x86/boot/Makefile       |  55 +++++----
 arch/x86/boot/genimage.sh    | 284 +++++++++++++++++++++++++++++++------------
 arch/x86/boot/mtools.conf.in |   3 +
 usr/.gitignore               |   3 +
 usr/Kconfig                  |  31 ++---
 usr/Makefile                 |  39 +++++-
 9 files changed, 318 insertions(+), 123 deletions(-)
