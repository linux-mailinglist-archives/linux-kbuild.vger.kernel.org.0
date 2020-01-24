Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C10A147EFF
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jan 2020 11:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbgAXKuY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jan 2020 05:50:24 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33189 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730054AbgAXKuY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 05:50:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 483wsB4n3Wz9s1x;
        Fri, 24 Jan 2020 21:50:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1579863022;
        bh=FlLbOGsqSlCeC/50V2BI8ts1eiue9EfeRzHTZVTueQg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=BxtlYqQM9H66VT2RNOtC7Bk7cxDqT6NgJxHqcVpfQK/c7arwiUOxIqc70ZZxD7sBj
         cHpwvubEP3UZqTcTOrU2m+aJ8oXRSSNrCuk52dC15/+913/vwDQ+JUO2tBk20C1Fhk
         XCNr84UBbCr2X423huWtIyPAn2tEXYZsnJJZxlcus0Yh/aMC1H3/1FY0fBL+0XW+Y7
         6pyL6VjtmzVwttuczrqmNxPrizOPMVk0NEBU04K03/hEfTY+TVt/Olzf830r1AJfAD
         S4sabn2a2pSO1+kOVq3ptKiwWixyF3/6UntCJhpYclLZ9/hLWZhmJ1iV17quIdSrSS
         JtmedbTIa50yA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linuxppc-dev\@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: vmlinux ELF header sometimes corrupt
In-Reply-To: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
References: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
Date:   Fri, 24 Jan 2020 21:50:20 +1100
Message-ID: <875zh1i0wj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Rasmus Villemoes <linux@rasmusvillemoes.dk> writes:
> I'm building for a ppc32 (mpc8309) target using Yocto, and I'm hitting a
> very hard to debug problem that maybe someone else has encountered. This
> doesn't happen always, perhaps 1 in 8 times or something like that.
>
> The issue is that when the build gets to do "${CROSS}objcopy -O binary
> ... vmlinux", vmlinux is not (no longer) a proper ELF file, so naturally
> that fails with
>
>   powerpc-oe-linux-objcopy:vmlinux: file format not recognized
>
> So I hacked link-vmlinux.sh to stash copies of vmlinux before and after
> sortextable vmlinux. Both of those are proper ELF files, and comparing
> the corrupted vmlinux to vmlinux.after_sort they are identical after the
> first 52 bytes; in vmlinux, those first 52 bytes are all 0.
>
> I also saved stat(1) info to see if vmlinux is being replaced or
> modified in-place.
>
> $ cat vmlinux.stat.after_sort
>   File: 'vmlinux'
>   Size: 8608456     Blocks: 16696      IO Block: 4096   regular file
> Device: 811h/2065d  Inode: 21919132    Links: 1
> Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
> Access: 2020-01-22 10:52:38.946703081 +0000
> Modify: 2020-01-22 10:52:38.954703105 +0000
> Change: 2020-01-22 10:52:38.954703105 +0000
>
> $ stat vmlinux
>   File: 'vmlinux'
>   Size: 8608456         Blocks: 16688      IO Block: 4096   regular file
> Device: 811h/2065d      Inode: 21919132    Links: 1
> Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
> Access: 2020-01-22 17:20:00.650379057 +0000
> Modify: 2020-01-22 10:52:38.954703105 +0000
> Change: 2020-01-22 10:52:38.954703105 +0000
>
> So the inode number and mtime/ctime are exactly the same, but for some
> reason Blocks: has changed? This is on an ext4 filesystem, but I don't
> suspect the filesystem to be broken, because it's always just vmlinux
> that ends up corrupt, and always in exactly this way with the first 52
> bytes having been wiped.
>
> Any ideas?

Not really sorry. Haven't seen or heard of that before.

Are you doing a parallel make? If so does -j 1 fix it?

If it seems like sortextable is at fault then strace'ing it would be my
next step.

cheers
