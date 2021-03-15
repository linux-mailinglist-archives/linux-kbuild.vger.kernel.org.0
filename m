Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777BB33C149
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 17:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhCOQLO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 12:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhCOQLH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 12:11:07 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68B7C06174A
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Mar 2021 09:11:06 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id 30so10986023ple.4
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Mar 2021 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=hhUk1ZutX9HeS0lzI3Bat1GYGrLoYfaht/OLl4NuTvE=;
        b=I/6DZi0jLUqzWhGhezzj5bcEfqtg+uFpSKe8hOd0L6H3qUrYp1BL70r9avJykGNHOt
         FG9APoWnIONwJv6EPgbl9hwaqAxCQsIYwJdJpWyysfdt+78tjLg7LmcZV6w3SSBZQbEb
         YJmpPBUUlSDH0Xp25ERkYtuJtCSIv0dKyhn+N7MAbooCds+5yfzga56w4bzqZEi/hXkV
         9bhz00QWBMK4ZztAiXyBvDFc/XQs9CvHsEoErzzxFlK85BB1Rw1EJoTLBWs9rVqRiTeG
         FCr9i/1MWpHYir/OyL1QlGTpWqHKGLksLb3XX7FsUvLboti5+aJUfvbBh+uA+vmw4Qr1
         fEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=hhUk1ZutX9HeS0lzI3Bat1GYGrLoYfaht/OLl4NuTvE=;
        b=aBbQHSRmlBz9lRRNtC8iMi908Q8VZA+xK/bBcxVnrYoChxAhmSXj7RTeXmysTdF4k9
         VUY8LYZUeZICsXTXUPoSIWTQle/6O2YOvHaDIaZ9RT08FFQwo46ML/eE0WrSKOjLudhN
         SsVr11rTXSPHbruElPmFgi3PtbFXVk3DoTs3fkavhpMEmH4TJOFyctxJC1p/6yqBRL7G
         n0fIzoXUeMr9ELmde9jJgp7D4LmJW71SBH96g0fBW1Je3tleM0pR1dXxSzH6n1i5UNEM
         a7Z917RcCCGvIIog9PW3Y9kE60f13xsL08pXCntq4Jac64ngkb3CUMGiNYQ3AIxIwwWm
         OVuw==
X-Gm-Message-State: AOAM530bOlf5JxIvpLgN6gOd99+57dSBgiD9WCSiJZvxtbZimDKR4SyV
        PayrdMazNmSLjgEMfSSG/Qkje3bV/jCkS04oKkbmEooX9Rc=
X-Google-Smtp-Source: ABdhPJy4/PawAnAyFmYmS8cI80o31FIpfObZUKbqFwyY+5RBjNkPHGqBZcU69bEQNLwM5kb3K52UovEV8HLBijwZldw=
X-Received: by 2002:a17:90a:a10c:: with SMTP id s12mr13674664pjp.166.1615824666163;
 Mon, 15 Mar 2021 09:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRSmLvKs2rzST5KJZMRwX+FGKHxJOM8LmT+Y040u5d8NWF87g@mail.gmail.com>
In-Reply-To: <CAGRSmLvKs2rzST5KJZMRwX+FGKHxJOM8LmT+Y040u5d8NWF87g@mail.gmail.com>
From:   "David F." <df7729@gmail.com>
Date:   Mon, 15 Mar 2021 09:10:55 -0700
Message-ID: <CAGRSmLvuvxBr15zTFm4PM4Gn0bBAJC3PycOSXO3R1MtZ+nYoYw@mail.gmail.com>
Subject: Fwd: Moving from 5.4 to 5.10 breaks custom module build.
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

I moved to 5.10 from 5.4 now I have another build problem:

"No rule to make target '/path/to/sourcefile.o', needed by '/path/to/lib.a' Stop

The build will build a small library file of shared driver support
routines, but it doesn't appear the build will support a library
anymore?  Is there a patch for that?

There was a patch that fix a prior problem of linking to a lib.a file:

Subject: Moving from 4.x to 5.4.22 breaks custom module build.
Thanks.
