Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479E721BD76
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2020 21:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgGJTQm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 Jul 2020 15:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgGJTQm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Jul 2020 15:16:42 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C44C08C5DC
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2020 12:16:41 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 207so2953250pfu.3
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2020 12:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=96+Cy2+6hRlxREM/YADx3aqUoqMRbhPlFPhRU/hnMmA=;
        b=Szp8+mJrXaxNAE+CDQqWN2vkKD/F1PM2sJ/T6zJr4iG6RrqnYWpaPloz2K3i7OHOu+
         nBEVk1EbhJKWTOQBOCGHTUtZZ1k1uEqfb88H6gIZ5UbW4SJYhamAoVlFxu5VWLU71uan
         o6n9oYQJ31t0lIaR7CYU/mYmoSEzNg+/toS4BPDlCawVzNcP+/G4JXcy85x2nrWl6W7h
         UNIH0Z2Za+MPC7amRaplIShCYCTbc14J87I/sFCCOpAAXoCgff0x84ZFGUpVu5MeCEPc
         LWfK8tEQzecQ9Pr0Bo6D/rcZZbERYKwTW5bNe3+wJTKhtf4onpq+C9mVTJZllr9yTiT9
         IFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=96+Cy2+6hRlxREM/YADx3aqUoqMRbhPlFPhRU/hnMmA=;
        b=jI21chnsO75P9N2PZyamODfi9Ew6Dp4kQ8SIdIKKtBg4zgtnhhpUTgMD+H6Y2oRANO
         6ON39qkqYUSqpDkycjLntIBMu+l1lhUoP+RLkn0XCrC51Kypsw2KIx0Y0d4nbI2zZIJJ
         KPawguFuuqlSi1sG7zE4TkCAvcewJnzzLlha774dHL4Y5RXDHeo9OAYuNEYsb4POVCgL
         uyXAfQT7CP0EX/+UYKFUHQEuWPk0dBq0eWZCAw1JoV94JdlDTJ0DuWGs8rS8GCgpoGMP
         ErhpLmHhXwds+GMcgeltvqJv/DJE+UP1mUkryPNOeCe//GtHEaCBU1b1bvXKtnMjF99x
         TKQg==
X-Gm-Message-State: AOAM533lkOvmpV7VGPv0QCNKDsAWr8K9zJwA1+pPhlnjdcCy0wFg2opc
        ase983ZAdebCiiAkXThml3ofqZvFaVIIavIt8LBPvQ==
X-Google-Smtp-Source: ABdhPJxYxWdKb0302bd7zKRT3d2rnQkO1AKsPabYkGFFrNZJC9sldy393z9R/bFChsMgXhqdbH0LVP+pZrsXxRwud+E=
X-Received: by 2002:a63:a119:: with SMTP id b25mr58325015pgf.10.1594408600922;
 Fri, 10 Jul 2020 12:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org> <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <CAK7LNASg9ZMN0bKnXi0vJDEpmhX7CLVhqDZ_BvsvoTZKS7LbsA@mail.gmail.com>
In-Reply-To: <CAK7LNASg9ZMN0bKnXi0vJDEpmhX7CLVhqDZ_BvsvoTZKS7LbsA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 10 Jul 2020 12:16:30 -0700
Message-ID: <CAKwvOdkJuT=7kBGEMu=a6kTdZtqOrqnynRGhYdP1xOs=JF_zxw@mail.gmail.com>
Subject: Re: linux-kbuild missing from lore?
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Hank Leininger <hlein@marc.info>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(minus LF helpdesk)

Here's what I put in the helpdesk ticket via their website, not sure
if it will be posted on the mailing list, apologies if it does and
results in a double post:

Hello, can the admin of the lore.kernel.org helpdesk please accept the
following sanitized archive?

https://drive.google.com/file/d/1d0oS3fCYxGhB0p_IQum9Gh20B3aFxKeI/view?usp=sharing

With generous assistance from Hank Leininger from marc.info, I was
able to get mbox's for linux-kbuild@vger.kernel.org dating back to
2008.

The archive was provided as a tarball of directories of gzip archives.
To generate the above, I ran:

$ tar xvf linux-kbuild_2008-2020.tar
$ find . -name \*.gz | xargs gunzip
$ for F in $(find untared -type f); do ./list-archive-maker.py -s $F
-e linux-kbuild -k linux-kbuild-known-ids.txt -l
linux-kbuild.vger.kernel.org; done
$ tar cf linux-kbuild.tar linux-kbuild
$ xz -9 linux-kbuild.tar

as per https://korg.docs.kernel.org/lore.html.

This response is via the ticket #93182 filed at
rt.linuxfoundation.org's web site.
-- 
Thanks,
~Nick Desaulniers
