Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241512D46A4
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 17:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgLIQWO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 11:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730054AbgLIQWI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 11:22:08 -0500
Received: from nautica.notk.org (ipv6.notk.org [IPv6:2001:41d0:1:7a93::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738A7C061793
        for <linux-kbuild@vger.kernel.org>; Wed,  9 Dec 2020 08:21:28 -0800 (PST)
Received: by nautica.notk.org (Postfix, from userid 1001)
        id 33C14C009; Wed,  9 Dec 2020 17:20:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
        t=1607530835; bh=keyoWzApK04/Bs9zCELFJu/kJwHnZGUNf7oCPH/UEoU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yZWf3cTDPiCpzyz1E21AfgwszWxOKRIc3SGpOdKG92wbSuOqyswoELlXOhBA9x6wz
         i2qmRj5vltbWK/V/hMBJe1ug4F1XqoNY+ENI9oBUBeYVKWCrG4YtulddGBN/3OMNDf
         zA4VkSni3oSfPc9F3+160zuFkaNh+QdVljP6LH+b1MFaFZnEoS5uGNWgRzM8mhN6BY
         1ij9Z2KoluBQ/odFJcQd/yV2Elzqig2GfZ3p1gqlgQhGc/LyszqId3pnI4qswt4Bbz
         2Xt/Z0pWnEP0W+OO3Gg92N/qP3m7XuRIyejvR7k88I3HASK6eU/QURwBFnhcz5uaNp
         xEU5BrD7MLTrw==
Date:   Wed, 9 Dec 2020 17:20:20 +0100
From:   Dominique Martinet <asmadeus@codewreck.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: Broken /usr/bin/env (invalid option)
Message-ID: <20201209162020.GA15684@nautica>
References: <20201209122437.GA26815@kozik-lap>
 <20201209130709.GB15469@nautica>
 <CAJKOXPfXkZdVUuunpvLOCEim0TfRwG62hvrZu_R8vGkA+ZOapQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJKOXPfXkZdVUuunpvLOCEim0TfRwG62hvrZu_R8vGkA+ZOapQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Krzysztof Kozlowski wrote on Wed, Dec 09, 2020:
> > Hm, what version of env is that?
> > I only checked on a couple of systems that env -S exists, but it might
> > not be available (e.g. now I'm looking, at least busybox env does not
> > provide -S)
> 
> $ env --version
> env (GNU coreutils) 8.25

Ok, so this is a much newer option than I thought it was, sorry for my
lack of checking.
I know we no longer support older gccs but it's probably best to keep
supporting this.

> > I don't see any way to make this work out of the box for me (awk not in
> > /usr/bin) and you (env not supporting -S), but I guess I can keep that
> > patch around locally...
> 
> You could add a wrapper which uses PATH or searches for the awk...
> kind of reimplement other tools. Another solution is to clearly
> document the requirements for the build system and explicitly say that
> older systems like four-year Ubuntu are not supported.

Well there definitely are ways, but I'm not sure it's worth it...
For example another idea is just to use /bin/sh (which is mandated to
exist) and have it invoke awk, the script is short enough to just quote
it.


Yamada-san, how about this instead?
But to be honest I'm fine with dropping my patch altogether, I'll work
around it locally if it's too much.
---
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

