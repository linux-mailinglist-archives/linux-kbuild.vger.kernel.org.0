Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 419B5145B1D
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2020 18:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgAVRwZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jan 2020 12:52:25 -0500
Received: from mail-lj1-f176.google.com ([209.85.208.176]:46175 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgAVRwY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jan 2020 12:52:24 -0500
Received: by mail-lj1-f176.google.com with SMTP id m26so7786307ljc.13
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2020 09:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Kwfb980H2zFKYYbHaFvisTOICKVRfP4l7wqRW0yzW7k=;
        b=YqqjYCS469tBGefnBZCHaLOnvCEU6RwmU1Ym07beUKu4bL09uWTNZ1nt968GsPQoOq
         hbv2BR2GZt2/EJClXZnd1ehzVW5dPVI+a/fu8bRIymQ4uovVqAAAT6xartThfhLh7E7X
         6S9Zvq6eJl2OlyLkBfi1N/AcYSjc/JsxYa8N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Kwfb980H2zFKYYbHaFvisTOICKVRfP4l7wqRW0yzW7k=;
        b=o2SINHGjJL9fV4PjXRjgv/sfpfzLHfJ93/mng1TqOOY69AiksvI28OKodjeXcb+2oh
         Yag8YEpG2uo4lu+mk56k4cugJ8hii+z9lqpzSAk2olicAWu/D26j7Rlul3hIyFVgKx3p
         85udgqr8wXvPevncj9La1yf+hYnpuKGlMr4InwdIO1HW96ou+rwJ7PijWDiiO+CAIBG/
         unC6iP/pSWhxUHfgKrmmAy50p4tx5W3MbnhbbsENcQVkeUiKfwjsm6P//w5B0NlM807Z
         vVO79eGLkrG+bl6oQCjP8FkS0dK+TnrT2jq7gwD52Joahi536jzP5daWs0+OT4t1X/ci
         zn4g==
X-Gm-Message-State: APjAAAW2ZiPrdBBoulaIbGI4tE6FhO1eIuZdPV0mfWEq/D84M4OJ/29f
        IGA7J1wvPPRGpE/5A7NlTaggQ5Z2LoIGoX/y
X-Google-Smtp-Source: APXvYqzjSckBf1b85YfqGd+aDBBQkbREIKg8UrhShurtzZaYsPKOvuFLad0ZOZ/cNOpPlfEgL2IiHg==
X-Received: by 2002:a2e:8595:: with SMTP id b21mr18485013lji.219.1579715542683;
        Wed, 22 Jan 2020 09:52:22 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id f16sm20549672ljn.17.2020.01.22.09.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2020 09:52:22 -0800 (PST)
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: vmlinux ELF header sometimes corrupt
Message-ID: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
Date:   Wed, 22 Jan 2020 18:52:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I'm building for a ppc32 (mpc8309) target using Yocto, and I'm hitting a
very hard to debug problem that maybe someone else has encountered. This
doesn't happen always, perhaps 1 in 8 times or something like that.

The issue is that when the build gets to do "${CROSS}objcopy -O binary
... vmlinux", vmlinux is not (no longer) a proper ELF file, so naturally
that fails with

  powerpc-oe-linux-objcopy:vmlinux: file format not recognized

So I hacked link-vmlinux.sh to stash copies of vmlinux before and after
sortextable vmlinux. Both of those are proper ELF files, and comparing
the corrupted vmlinux to vmlinux.after_sort they are identical after the
first 52 bytes; in vmlinux, those first 52 bytes are all 0.

I also saved stat(1) info to see if vmlinux is being replaced or
modified in-place.

$ cat vmlinux.stat.after_sort
  File: 'vmlinux'
  Size: 8608456     Blocks: 16696      IO Block: 4096   regular file
Device: 811h/2065d  Inode: 21919132    Links: 1
Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
Access: 2020-01-22 10:52:38.946703081 +0000
Modify: 2020-01-22 10:52:38.954703105 +0000
Change: 2020-01-22 10:52:38.954703105 +0000

$ stat vmlinux
  File: 'vmlinux'
  Size: 8608456         Blocks: 16688      IO Block: 4096   regular file
Device: 811h/2065d      Inode: 21919132    Links: 1
Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
Access: 2020-01-22 17:20:00.650379057 +0000
Modify: 2020-01-22 10:52:38.954703105 +0000
Change: 2020-01-22 10:52:38.954703105 +0000

So the inode number and mtime/ctime are exactly the same, but for some
reason Blocks: has changed? This is on an ext4 filesystem, but I don't
suspect the filesystem to be broken, because it's always just vmlinux
that ends up corrupt, and always in exactly this way with the first 52
bytes having been wiped.

Any ideas?

Rasmus
