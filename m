Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354472D4834
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 18:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgLIRnu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 12:43:50 -0500
Received: from nautica.notk.org ([91.121.71.147]:42329 "EHLO nautica.notk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726576AbgLIRnu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 12:43:50 -0500
X-Greylist: delayed 4952 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Dec 2020 12:43:48 EST
Received: by nautica.notk.org (Postfix, from userid 1001)
        id 626D0C01A; Wed,  9 Dec 2020 18:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
        t=1607535787; bh=3I60BVokN26eXe/da78K5ujczl/m97T6r86SgjOzMwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zqv1w3swRounFyPzor/YKTZbqNEdFCB3FULtVzV+IcS3rYZ1WpUKE7zdKaX+4gU7m
         oSZdUIgdKQf/QdezJNd9xf6ea3xDYjfKqoo/GftMvaTXYr8MzRV1vdyNQZYrP5NPb9
         zWYJkyaP1uuvQvCJYuVzuoI7FCta1Qi27dpC4s5FKHEpncQCpB7k9IUGhCkXOUZHQH
         omTUw/BoO7jvgNSoyAbk5Qcxhf/or26mfijdG+lrMDRhn1SLNldAYwV+n3Sc4x8oe2
         4LOd+OdK/ktjps9QlA0cTAMNPko5L3ke/AlivN/LAyvl1vquZKNxF9WsLR0bSSsnfd
         VKeZy3n8QZgXw==
Date:   Wed, 9 Dec 2020 18:42:52 +0100
From:   Dominique Martinet <asmadeus@codewreck.org>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ld-version: use /usr/bin/env awk for shebank
Message-ID: <20201209174252.GA27721@nautica>
References: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
 <69c82aee-59ec-f8d8-9546-b38f85bf08c0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69c82aee-59ec-f8d8-9546-b38f85bf08c0@arm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Vincenzo Frascino wrote on Wed, Dec 09, 2020:
> On 12/1/20 1:17 PM, Dominique Martinet wrote:
> > /usr/bin/awk is not garanteed to exist (and doesn't on e.g. nixos),
> > using /usr/bin/env to have it look in PATH is more robust
> 
> This patch breaks the compilation on Ubuntu 16.04 and 18.04 in fact:

Thanks for the report, I was told the same by Krzysztof Kozlowski (added
to Ccs) earlier today, I don't have any "old" machines like this around
so didn't notice when I checked unfortunately :(


I've suggested either just reverting this (I'll keep my local
workaround) or going through /bin/sh which is always safe like the
following patch -- leaving this to maintainers.

Thanks!
-----
From d53ef3b4c55aa2ea5f9ae887b3e1ace368f30f66 Mon Sep 17 00:00:00 2001
From: Dominique Martinet <asmadeus@codewreck.org>
Date: Wed, 15 Jul 2020 16:00:13 +0200
Subject: [PATCH] ld-version: use /bin/sh then awk for shebank

/usr/bin/awk is not garanteed to exist (and doesn't on e.g. nixos),
using /bin/sh and invoking awk to have it look in PATH is more robust.

Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index f2be0ff9a738..02dbad7b5613 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -1,11 +1,11 @@
-#!/usr/bin/awk -f
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # extract linker version number from stdin and turn into single number
-       {
+awk '{
        gsub(".*\\)", "");
        gsub(".*version ", "");
        gsub("-.*", "");
        split($1,a, ".");
        print a[1]*100000000 + a[2]*1000000 + a[3]*10000;
        exit
-       }
+}'
