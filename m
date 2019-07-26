Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F288077380
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2019 23:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387576AbfGZVfp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jul 2019 17:35:45 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41121 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbfGZVfp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jul 2019 17:35:45 -0400
Received: by mail-lf1-f66.google.com with SMTP id 62so33152983lfa.8
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2019 14:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cVmcZwFhu0VmRu42g2oqdHVRFxqVWleFTBghf3PdU0s=;
        b=auPaSao4Pu92MrHcL8ri0lwhHW+MxKtMjV1DpxAsA7pVZXiYOWxWxhMCN+yWqE/ApM
         N1RAQkb6zmoRJMBukop8ckoCwrxu+fdsXpdHaXZqjEngnR6ahHT+uJi/+bo3yEWp6UbC
         NE3E48fT2I4XCRhysWOc0g0KiUbHZXwqDqq8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cVmcZwFhu0VmRu42g2oqdHVRFxqVWleFTBghf3PdU0s=;
        b=HCXwpGA5eMwshT2aE2AhyXnokPRSIWGEoN0Ko8Yml7q9gUnUbsk3E7Ods0gqUnstLI
         nbrrmf7hMp4QTio36IbNvyatRBWaH2RRqEyAbCXYxepBIdLiWCOojiCo2Ta8Ei9bvmFg
         nMOj35rqqDsY/1BoCdEZ/6JcXAWbW2d06IVu/4IwzVLvZmnwhCd34PhJCbXmgoId4M9r
         XViZufvCchrqOP3z9nraho0gjVSp3T6dPRc9QZ0gLXwXLLFQIclGWwMG56uzkvxBHZYn
         trp+sgL2WfdGJlRUtnK/sqhnQnhnKOt0GbF/dzH6iZ9gKiq3v5kYSwbWpzgA1JBVCesd
         C1fg==
X-Gm-Message-State: APjAAAUxQsDERBul0EV9jgTazsuaDC+B7UagYeiVIpVAVEvbbx1nI5sZ
        DEVzVOlOulKwTlTEDtEfZRdwMwqy5ZY=
X-Google-Smtp-Source: APXvYqxdmUsAI1n0eD0iikrVUNnzln3b+F4wtxw6CQSrvReObBB4lXeyCfMkELx/1dPr4XaW0SNd5g==
X-Received: by 2002:a05:6512:1d2:: with SMTP id f18mr5837609lfp.173.1564176942440;
        Fri, 26 Jul 2019 14:35:42 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id j7sm11551366lji.27.2019.07.26.14.35.41
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 14:35:41 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id r9so52802270ljg.5
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2019 14:35:41 -0700 (PDT)
X-Received: by 2002:a2e:b003:: with SMTP id y3mr51555432ljk.72.1564176941127;
 Fri, 26 Jul 2019 14:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b4358f058e924c6d@google.com> <000000000000e87d14058e9728d7@google.com>
In-Reply-To: <000000000000e87d14058e9728d7@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 26 Jul 2019 14:35:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnM5+FBJuVoxXELvFgecuc0+vW7ibWy4Gc5qJbW8HL2Q@mail.gmail.com>
Message-ID: <CAHk-=whnM5+FBJuVoxXELvFgecuc0+vW7ibWy4Gc5qJbW8HL2Q@mail.gmail.com>
Subject: Re: INFO: rcu detected stall in vhost_worker
To:     syzbot <syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com>
Cc:     Jason Wang <jasowang@redhat.com>, KVM list <kvm@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        michal.lkml@markovi.net, "Michael S. Tsirkin" <mst@redhat.com>,
        Netdev <netdev@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        virtualization@lists.linux-foundation.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 26, 2019 at 8:26 AM syzbot
<syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to:
>
> commit 0ecfebd2b52404ae0c54a878c872bb93363ada36
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 7 22:41:56 2019 +0000
>
>      Linux 5.2

That seems very unlikely. That commit literally just changes the
EXTRAVERSION part of the version string.

So even if something actually depended on the version number, even
that wouldn't have triggered any semantic change.

              Linus
