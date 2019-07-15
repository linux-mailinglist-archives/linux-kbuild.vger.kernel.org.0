Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7943869B10
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2019 20:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbfGOS4q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jul 2019 14:56:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49769 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729513AbfGOS4q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 14:56:46 -0400
Received: from [192.168.1.110] ([95.118.111.244]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M1q8m-1hktDo3NW4-002IRt; Mon, 15 Jul 2019 20:56:28 +0200
Subject: Re: [PATCH 4/4] debian: add generic rule file
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net>
 <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
Date:   Mon, 15 Jul 2019 20:56:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hvK93i77vK63kJTVR4ogArNlnN1zGWCxPx9UupprhwHlVosg/v0
 j0b/K8jOzkk8IQGd6zTvTXIttqpqPDOa/vQJ6K+lweiKpu3XTPCF1PsDfD+FpzvZ8ILX0Dd
 0h1xeqWSatCfp11/Q+2oKS663Zba5LW9n/+DoaJo2PHehzwiq6gWu/VefhpY+8VmkQzk/Nh
 IHWiacfDp8SZkIlFOYBoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T4r/34V3t5w=:2rgr2ucWxg6EpGWRp2svKn
 U/llQSqutZffji1Y8HCfGG1iiOz+u6KFT0IuJFO30ifmk3PaofKKmuEY4PWGfclsHupikXcvj
 /WAxt3yfidQ9sgUSfMInSbGS4x4COeTwMmYxoiLykImPGUxfehOsSEsrRyC3IultacUimaeBu
 2OpvAGJWblV1cMCmTRRYWmjIZHDYdR33iyoCM6IS1c14ikVwmtw+nQPGRJr/1UbutG/gEsdok
 xaIG3jzezjviI1Op/sM/PjFsp7jLN7PQe3f1hGidripJKFdoo8HlNTE2LKX7jcextl73gHvE1
 uzL0xyhCzNuvu9szCJfhDYuA6W7TYk3NXGiTA4h8Su34UXNQ7g7HFZabw50pn7aAk6A6VP2QR
 4mSMwBkAVn1S4g4ZDmTi3ft5hVO6jhx8WhkpFYkRzwTXm8YEPT5yxb1Ji7ESlE9mPNGCqP12/
 d7rejThQzZZjz24LuHoc5Bj+/dWK8DKrUhHGtcVLtIpFW3ONdoxEyzNR0amq+LabkcgKnsuW6
 E/5C6l8Lwn90gIVvAHbxaR9OkJUFhXBajOxriYFSfuQM5b++BZOifD5YnimBQn88bWY4RWZic
 0AG5MDj0fs8MCTym1ZOX2Z7DAtu0QzEpox/8Sh6lbYKKJfCOcjWnEWbSHPf3HI5huNTVA87Do
 CkAhQtNiaVP1GfIkR7oGs+Ng/FUP1SFjOz3WBW7NWh48Q4Wotgt2gfwPEj8N8mSegQa3f5GYu
 D8W7h6UiPOuIDZnaJwpBzsc4UK8uoto/4Mt8RibCun/1XFKSKKFnzOXdnqQ=
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 15.07.19 14:28, Masahiro Yamada wrote:

>> The rule file contains a rule for creating debian/control and
>> other metadata - this is done similar to the 'deb-pkg' make rule,
>> scripts/packaging/mkdebian.
> 
> I saw a similar patch submission before, and negative feedback about it.

Do you recall what negative feedback exactly ?

> Debian maintains its own debian/rules, and it is fine.

Not for me, I don't use it - given up trying to make anything useful
out of it. It's extremly complex, practically undebuggable and doesn't
even work w/o lots of external preparations.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
