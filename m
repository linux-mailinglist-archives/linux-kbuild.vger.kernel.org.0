Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4740B14B0B9
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jan 2020 09:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgA1IMK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 Jan 2020 03:12:10 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40585 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgA1IMK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Jan 2020 03:12:10 -0500
Received: by mail-lf1-f68.google.com with SMTP id c23so8400679lfi.7
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jan 2020 00:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YtcRS1L5k8wBwwPdgRKCV0zDBNlxax9vadneAgBCrDM=;
        b=YsPuHSyJhbIqoeJPTniUj3/nc9kroQ5qUmdrzSLMXulbuST72e/qK6II+7d2ypcXnL
         WQoSVOv4y9f3Ov9svBNHmkQ16+V+HhE5ezmG18N673upe2+lor6gIHHtJd3a7p1v4qA+
         Fsxg2JFNAHVGCkVHzFvd7NiYxfQgKUd9XmN1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YtcRS1L5k8wBwwPdgRKCV0zDBNlxax9vadneAgBCrDM=;
        b=cGxk7dEZMGtYb8K8DW93bqkVFXtvXiFe3nxyNWudpDkYhhlv8v0bJDA7HYZezgATjW
         jSDFHv5m0rpBMiVgQKTBAcFBk7kCKBXDi61ktq+WaN9H+E7/fJxIK3Qa8lR2jaF0PuNI
         rS7FzxzVmH/lw02XS5ci8ZUfnI0j0y9B5c6iBV/MjBVIV+S3m24oOmBzxzUjhulJAa+u
         lLP27I0BdpCj8bBtbBVZ9lJZyZMZ6E/M7kg1wXJ0YW2ehK55PL+qPlCOKE4yjpIxKLK+
         uo07yefj9B/Hm3zuR5GV3teOmmltcb474wpd2ObYAG5rVgOKsm6FvEF80vPKgXu1tOhI
         HaFg==
X-Gm-Message-State: APjAAAVMolmKWjgJgF+jPnCmYaInc+R1Kgg19FWEmGf6Lnln03RYaVpJ
        EYOZsxE/YVQR+MALr0G6qVKRuw==
X-Google-Smtp-Source: APXvYqxHAUbMIrGBLdv8Yti7EDHcHua1MWBUehPXejuLPYcnKyCX57FpmTzajDy4Sg/aAffBMQXHgA==
X-Received: by 2002:ac2:5964:: with SMTP id h4mr1665454lfp.213.1580199127298;
        Tue, 28 Jan 2020 00:12:07 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id i13sm9246212ljg.89.2020.01.28.00.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 00:12:06 -0800 (PST)
Subject: Re: vmlinux ELF header sometimes corrupt
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        linux-ext4@vger.kernel.org
References: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
Message-ID: <5997e9b6-95fd-405b-05f8-16f9e34d9d87@rasmusvillemoes.dk>
Date:   Tue, 28 Jan 2020 09:12:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 22/01/2020 18.52, Rasmus Villemoes wrote:
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

So, I think I take that last part back. I just hit a case where I built
the kernel manually, made a copy of vmlinux to vmlinux.copy, and file(1)
said both were fine (and cmp(1) agreed they were identical). Then I went
off and did work elsewhere with a lot of I/O. When I came back to the
linux build dir, vmlinux was broken, exactly as before. So I now suspect
it to be some kind of "while the file is in the pagecache, everything is
fine, but when it's read back from disk it's broken".

My ext4 fs does have inline_data enabled, which could explain why the
corruption happens in the beginning. It's just very odd that it only
ever seems to trigger for vmlinux and not other files, but perhaps the
I/O patterns that ld and/or sortextable does are exactly what are needed
to trigger the bug.

I've done a long overdue kernel update, and there are quite a few
fs/ext4/ -stable patches in there, so now I'll see if it still happens.
And if anything more comes of this, I'll remove the kbuild and ppc lists
from cc, sorry for the noise.

Rasmus
