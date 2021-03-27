Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF7E34B965
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Mar 2021 22:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhC0VCj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Mar 2021 17:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbhC0VCQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Mar 2021 17:02:16 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E792C0613B1
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Mar 2021 14:02:16 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id m13so9319366oiw.13
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Mar 2021 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ROhhiPLOglr4HBo5gqWsOCimLATekGYUn9F4i9FodmA=;
        b=m7jteOCCY+W8/WZS+nR0Kx7fzY6YnBioLlk6SNHeE5H+uDgw7sNJHEu3BWfMf2hjHM
         5ym2d+G+5fYJxqvAiPgcWOfafClooItW8rrD5NnVax9If9y3K8HL7NwEmVMFGG1M3Vv/
         D/JaSRi22b4XiedDE8H4LeRIhxpQ74cFcYn8sDMnQW/8+tIvaN+hoaRouKSElXQMtxAJ
         ML6ghpNPkAulYVgV/aby02HiZEfidC0leuHypEx6Un8Laiu+Jt+92ytWEn0tHTqxZzfo
         9dpzu30aQwZ16yybjaae5mce5Cizfk9Hof2nWr9WlHrdrrm7QH/s1vearKTykz1vXzIc
         z3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ROhhiPLOglr4HBo5gqWsOCimLATekGYUn9F4i9FodmA=;
        b=Es1xiz8aUsUSJNaGPkHHLhOEpJ9CCEMOVp35HV7fTRE4hxG6t7ANt46zke555GLVI3
         1bLnYfZUd8vBlU6k17tzEZkBYY9UeEdEKdcWQ99kRAkjyNgKbmznsWSXjZIuveu45tGJ
         Znc85MInToxdX13S3i4Cl82q2qe3N27icDgGDLDzK9deE+H29pjXe8mLsT3Qrl+H7PDr
         iK76eFJLfsa+QLF2uNXucYeedZsCB29S82lRpXIdA2IbZZUU8KolPosWsejbP86wQlJ2
         iThVemKWq1gBGuNVAm/TQPVZlI3DGGA9vlRSwScAJ/0jO22kr6xUipWDkW2eYQLCnN0K
         Df/g==
X-Gm-Message-State: AOAM530IK36v4zqCZSf6W5Kr5OsvipsBfVqGoH4fGAKWUs3euskSESd0
        T0VI0FGzvhdypUtLwoebUWCePn2u/xGUCIB8fhfYrAfxKHI/hQ==
X-Google-Smtp-Source: ABdhPJy7oY7QBXjaTzgy3QNcdgXL6u8kDp5pH1u9fuMi8b6RpXL/+FBfFrCy/K0Zt3y8fRqqmKG3rO9v11rMeTm+TNM=
X-Received: by 2002:a54:4793:: with SMTP id o19mr13638730oic.137.1616878935759;
 Sat, 27 Mar 2021 14:02:15 -0700 (PDT)
MIME-Version: 1.0
From:   John S Gruber <johnsgruber@gmail.com>
Date:   Sat, 27 Mar 2021 17:02:04 -0400
Message-ID: <CAPotdmSmgPFtrk=Ef2D_azjnWs474JjOtmwvSqqwe-vfKZ0Ffg@mail.gmail.com>
Subject: Possible Regression Regarding bcf637f5 interfering with dkms
 automatic module builds
To:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I've run into a problem installing 5.12 test kernels. When dkms tries
to build a module invoked by kernel make install it cleans the linux
tree and tries to do a make modules there (both by root). The dkms
module is left unbuilt.

I bisected to the above commit -- kbuild: parse C= and M= before
changing the working directory

This commit changes the main Makefile so that make doesn't parse the
M= parameter if the variable sub_make_done is in the environment and
set to 1.

On my and on similar systems make install uses /sbin/installkernel to
do the installation. /sbin/installkernel uses run-parts on
/etc/kernel/postinst.d/ to perform various elements in the
installation, e.g. boot loader configuration. One of these is dkms to
build an out-of-tree module. dkms autoinstall then attempts to make
clear and make build the module(s) in a source directory using the
linux source tree.

The sub_make_done=1 variable is still in the environment after all
this and the above make commands therefore don't parse the necessary
M= parameter pointing to the source tree. Thus the initiated make
invocations, ignoring the two parameters, process against the linux
source tree instead.

I was able to get proper function by unsetting sub_make_done in either
dkms or in arch/x86/boot/install.sh

This kind of problem is obtuse enough I wonder if the optimization
attempted in the above commit is worth the complexity. On the other
hand if it produces meaningful performance improvement perhaps changes
to the architecture Makefiles or install scripts could be patched.

I'd be happy to test patches on my system. Are there any questions or
issues I've neglected?

Thanks.
