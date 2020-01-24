Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 490EF1485BC
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jan 2020 14:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389248AbgAXNOK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jan 2020 08:14:10 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:60422 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387445AbgAXNOJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 08:14:09 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4840334LS5z1rcCL;
        Fri, 24 Jan 2020 14:14:07 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4840333w79z1qtfj;
        Fri, 24 Jan 2020 14:14:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id OTsYTgp8ntPR; Fri, 24 Jan 2020 14:14:06 +0100 (CET)
X-Auth-Info: xmms9xcLKLS2+MW3eS4U+yowtELEEjqovyRjmONM1OFC0M9wZJ1K7vO9b17vJEyA
Received: from igel.home (ppp-46-244-165-242.dynamic.mnet-online.de [46.244.165.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 24 Jan 2020 14:14:06 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id 05AB72C008F; Fri, 24 Jan 2020 14:14:05 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linuxppc-dev\@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: vmlinux ELF header sometimes corrupt
References: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
X-Yow:  TAILFINS!!  ...click...
Date:   Fri, 24 Jan 2020 14:14:05 +0100
In-Reply-To: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk> (Rasmus
        Villemoes's message of "Wed, 22 Jan 2020 18:52:21 +0100")
Message-ID: <87sgk5m1ya.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Jan 22 2020, Rasmus Villemoes wrote:

> So the inode number and mtime/ctime are exactly the same, but for some
> reason Blocks: has changed? This is on an ext4 filesystem, but I don't
> suspect the filesystem to be broken, because it's always just vmlinux
> that ends up corrupt, and always in exactly this way with the first 52
> bytes having been wiped.

Note that the size of the ELF header (Elf32_Ehdr) is 52 bytes.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
