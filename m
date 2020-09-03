Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA8BB25B89D
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Sep 2020 04:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgICCOL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Sep 2020 22:14:11 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:27186 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgICCOK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Sep 2020 22:14:10 -0400
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0832DuG2030422;
        Thu, 3 Sep 2020 11:13:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0832DuG2030422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599099237;
        bh=RIRTFKRxNzN4uC6qgVUYSAZOSYK/QYlVF4TMuKR0o20=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bf7GqFOCyFgO5BjGOjRLVQWL2XFSnQHJpSR1+dWVmiNd2HN/PxucVOmoezPGgMW2J
         N6nRKann3H7bwYep6sSpjQ8YK6zlboHSQo5CM4bcw8H5CMsd3VwhfRxfzANC3oA/gU
         O+ybYid4FgHgbJtZTtR7QfziMicMlqaeDt2FF9wLeqDwxwijuCuvEciONyeVzQhvvu
         VacSH/6Zz0wcnzmK6Y9gBJYNNrpQgRo3xpAdIZnYFqOGs/tnw26EHy3tNpdThtcaAx
         wbGk3cMJ3nSDBvdKpeT9xYo3ix0P3sSlSPlrVB+PUeRm+pVk7jw9QA9vc41J7ifdyl
         Tli5ZrRfre/Fw==
X-Nifty-SrcIP: [209.85.215.182]
Received: by mail-pg1-f182.google.com with SMTP id h12so819492pgm.7;
        Wed, 02 Sep 2020 19:13:57 -0700 (PDT)
X-Gm-Message-State: AOAM531qWfL0kTcP6mazLnHO1/RPt3/8DWn6PAXJJDpNKOJtQ35cPiw/
        bG7VZ+gIN6+USGqp52zXYdByC6KHwUEIzvdO6Fk=
X-Google-Smtp-Source: ABdhPJzAB/luh8X6zbVcb8e/cepI0eEyPNNpawO9Frtc/rpyonCNzHgkw3t0KImJJKqBBPpTNS9BesGm2WhaUxeWnoA=
X-Received: by 2002:a17:902:864c:: with SMTP id y12mr1296231plt.155.1599099236203;
 Wed, 02 Sep 2020 19:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <be80ceda-596b-03aa-394f-166cc6388aa0@infradead.org>
 <CAK7LNAQekh08D6=+CqRWiB7F4KCLOgSK9oof8ArVUvMc7B1YXQ@mail.gmail.com> <CALaQ_hq01BCA7=sVJjm6LQrjjBFy1V79uUXcRXeLBB5g3k9M1Q@mail.gmail.com>
In-Reply-To: <CALaQ_hq01BCA7=sVJjm6LQrjjBFy1V79uUXcRXeLBB5g3k9M1Q@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 3 Sep 2020 11:13:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARp41EXMmT+ghGVw0Ew8wgHND+Ufn_uCevaVk+OP2-UFQ@mail.gmail.com>
Message-ID: <CAK7LNARp41EXMmT+ghGVw0Ew8wgHND+Ufn_uCevaVk+OP2-UFQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: streamline_config.pl: check defined(ENV
 variable) before using it
To:     Nathan Royce <nroycea+kernel@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 3, 2020 at 3:22 AM Nathan Royce <nroycea+kernel@gmail.com> wrote:
>
> Thanks, but I'd just as soon not be acknowledged/credited. All I did
> was submit a report.
>
> On Wed, Sep 2, 2020 at 11:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Applied to linux-kbuild/fixes with Nathan's tag
> >
> > Reported-by: Nathan Royce <nroycea+kernel@gmail.com>
> >
> >
> >
> > Nathan,
> > I think adding your tag is OK to credit your contribution.
> > Please let me know if you do not have it in
> > the commit log.


Even if you do not write the code,
reporting bugs is a great contribution,
and the Reported-by exists for that, I think.

So, I just want to add your Reported-by tag
(if you do not mind).


-- 
Best Regards
Masahiro Yamada
