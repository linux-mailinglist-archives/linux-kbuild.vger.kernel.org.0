Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4803A5984
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Jun 2021 18:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhFMQWA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 13 Jun 2021 12:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbhFMQWA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 13 Jun 2021 12:22:00 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7D5C061574;
        Sun, 13 Jun 2021 09:19:58 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x16so4530320pfa.13;
        Sun, 13 Jun 2021 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=swZNKhWU4ByrgWcQOACGFdi714AM3CVRgtHSHQDsGXc=;
        b=el51K2oL2HE1MmkthYPBnK1GJtxG1/7BLslO8eDkynsAUsLCbVDXZ21AoMAUnwc0Xy
         JP2bbKxNBnkrrgHNrt2pTjVt1v5CkujAizlu5WDbSXwRQa/tJ7/1fTKH8cChA0Xk6mMc
         zMmsstGmPUuugqHzu+OCLy7Uc6M3l3Lp2ngSR5IjhRolO4S3Ysg/6h/sZlN5jN5bQD+v
         ualfCDh6eseWb/+35avGbcDolyPXqaDsyvVTyPIbdft3v/mQtad/edXIJKX1D9r0hL0X
         +0ks5i8+OC3h1F8zUfcay0EKPXlWlygFD1ZgG6nhD0R+dU/ZdYh8EEGHs59qyo0ZlS4R
         OExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swZNKhWU4ByrgWcQOACGFdi714AM3CVRgtHSHQDsGXc=;
        b=grx3YESalZBZRbn8EOMvv3NVfBh8q6I102fgFcuaGGC2E2XtcuU3cqvVJiRZ3X5ZAr
         lJwtrC+BuymlADZHY5WXWVa/2j8zMFSGPpDWC+Pihu5rtBZXV2fA9vE0IaBre+v/96eK
         BDQzYoVhD1HqGL6mYtICecshlV77BTiMu4l4M6d1oJTibhcWX+OPL7VHQKuF7rAVTDqX
         Wm4ksGmxhPqBMiP1b+6CUDGtwExNWPnC/YuUZwSkf5pKBRWL4BBLVTD1Bb9zJKUi+RJb
         ErTuY6u1Um2tZlc73b8XnDikKZSFi3N3FepjGpUSSq9urnqHa33JyHTQ/SVHeOnB34fu
         JasQ==
X-Gm-Message-State: AOAM531YktnxBzi1XQXSgbhOrqhm8PHNuEO46G9oP1gxogZLTfvwbW0+
        SPhqXnO3Rvb3CP7qYlR4JGQ=
X-Google-Smtp-Source: ABdhPJzD99+YPNz3NQ9s3f6eTK4VCY2zEn7xkJKaQ2GH3GUg5ehmFayQHYw73mWa5sNk/IkhbIVh8A==
X-Received: by 2002:a05:6a00:26c6:b029:2f5:358c:6761 with SMTP id p6-20020a056a0026c6b02902f5358c6761mr17991388pfw.50.1623601198072;
        Sun, 13 Jun 2021 09:19:58 -0700 (PDT)
Received: from zen.local (97-126-22-202.tukw.qwest.net. [97.126.22.202])
        by smtp.gmail.com with ESMTPSA id k30sm10749363pgf.59.2021.06.13.09.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 09:19:57 -0700 (PDT)
From:   Trent Piepho <tpiepho@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Elliot Berman <eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Sami Tolvanen <samitolvanen@google.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Jeff Johnson <jjohnson@codeaurora.org>
Subject: Re: [RFC 0/2] Kbuild: Support nested composite objects
Date:   Sun, 13 Jun 2021 09:19:56 -0700
Message-ID: <6837671.QJadu78ljV@zen.local>
In-Reply-To: <1611343638-28206-1-git-send-email-eberman@codeaurora.org>
References: <1611343638-28206-1-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Friday, January 22, 2021 11:27:16 AM PDT Elliot Berman wrote:
> The motivation for this series is an out-of-tree module which contains a
> large number of source files. This causes Kbuild to exceed the maximum
> command line argument length when linking the files. Proposal here

I think I am familiar with this module.

In addition to exceeding the argument length when linking, it will fail to 
compile due to 169 include directories being added to c_flags.  Depending on 
root path, this can also overflow the single argument limit of 128 kB.  
Perhaps you have not triggered this yet?  These patches here will not help 
with this issue.  But see below for correct and incorrect fixes.

The fundamental problem is that the kernel build system is designed to be 
recursive, with one makefile per directory.  This module has a single Kbuild 
of over 3000 lines for the entire tree.

Some of this is from this driver not using multiple modules for what is a 
giant driver (337 MB .ko file).  It should be split into multiple modules, if 
only to manage complexity by creating public vs private interfaces through 
choosing what symbols to export or not.  It would avoid merge conflicts on 
the single shared Kbuild file used tree-wide.  Potential name collisions 
across the 100+ include directories could be avoided by not having a shared 
set of include flags for the entire tree.

But some I think is also a limitation of kbuild.  Giant monolithic Kbuilds 
do not work well, but this is ok, because you are supposed to use a 
recursive make design with a Kbuild per directory.  But only non-module code 
may be split across directories.  This important design feature is not 
extended to modules.  A module must be be contained in one directory or 
monolithic tree.  Why should non-module code be allowed the complexity of a 
recursive build but code for a module is not?

I did split this driver.  I'm not aware of any way for me to send patches to 
Qualcomm.   I'd have to maintain this change myself and that would be very 
difficult.

So I worked around it without needing to modify the kernel build system and 
with a minimal patch to Qualcomm's code for me to maintain.

1st, use @file to inject the include directories.  I didn't test well, but I 
think this does not break kbuild's ability to detect changes in command 
lines.  

-ccflags-y += $(INCS)
+ccflags-y += @$(obj)/includes
+$(obj)/includes: FORCE
+       $(call if_changed,include_flag_file)
+
+quiet_cmd_include_flag_file = I-FLAGS $@
+cmd_include_flag_file = echo "$(INCS)" > $@
+
+# To make all objects depend on the file that contains the flags
+$(addprefix $(obj)/,$(OBJS)): $(obj)/includes

The last line might be a bit hacky.  I couldn't find any proper mechanism to 
manually add a dependency to object files.  It seems like auto dependency 
discovered headers are the only ones supported.

Next, we must deal with ~550 object files being linked at once.  The subject 
of this patch series.

-$(MODNAME)-y := $(OBJS)
+$(MODNAME)-y := blob1.o blob2.o blob3.o
+blob1-objs := $(wordlist 1, 200, $(OBJS))
+blob2-objs := $(wordlist 201, 400, $(OBJS))
+blob3-objs := $(wordlist 401, 700, $(OBJS))
+# Multiple levels of composite objects don't really work.  There is no rule
+# to create blobX.o unless we add them to the obj-m list, even though
+# wlan-y lists them and will be used to create wlan.o from them.  We'll get
+# blobX.ko modules we don't actually want by doing this.
+obj-$(CONFIG_QCA_CLD_WLAN) += blob1.o blob2.o blob3.o

The last line here is a total hack, but it does work.  By added blob1.ko as 
a module to be built, a rule to build blob1.o is also created, which will 
then be used by wlan.o's dependency on blob1.o
 


