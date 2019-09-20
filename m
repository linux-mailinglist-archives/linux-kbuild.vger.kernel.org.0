Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E6FB9435
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2019 17:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389691AbfITPlP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Sep 2019 11:41:15 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38392 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387937AbfITPlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 11:41:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id b20so2155145ljj.5
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VX7KNoBIJ8sruOeElrZxFbFSWZuAc4wcswq+ygSvynk=;
        b=b6rzDbXppCSe1wCvJxP52dfQX+c4KnauaRppVi1nRpe9elnfSAYO5604jCbITdEwAN
         2HbWvxq24OZNrktog+t/a3UyCQVQ4PnJQ+mD6dKMwDWq2bGJWtMOHz1z9lUd3jpdtCTw
         lSD5hpoRUEYS/pfu9ur9Npkp3L0I2ZFnC5S5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VX7KNoBIJ8sruOeElrZxFbFSWZuAc4wcswq+ygSvynk=;
        b=n0e1bSE24wYTgHkkFttLSOMV5vC93QPjzHyWRjJJ/H6JndSNoKM69ql2sZBsbQUS5n
         I2Y/sELPKDF3LLdHGl6uP1GkaMkWitjYSd3N972hx2+ewJHgStv2tQzkFO7W+F9XYtCj
         x8LjSg+9aJJEqyuFAHGX3TZq/Dx0clsa9ZUADrPvtr4xD/M3ZYY7wZjWjWacfKdboivJ
         SQ5nbzCZeKiw/4xjKrFR4QEmGTndAnWWzm8ljop8vNwZF/azRJx251tb4uJqvnFEYh/x
         xVSLnanmU+DRGgCOo69i5V0eMyhICZBXH+dPL9U/SYhPD1c4RzIjR8mgvZduX9xUteBN
         WpeQ==
X-Gm-Message-State: APjAAAVtaww+7B6LI9wWro8JHjT8dxz8iTHskT44K3v6AlYa20PdplhE
        7Sg8AVyA0hnMyrYkJq7yV6nBwEXmy6A=
X-Google-Smtp-Source: APXvYqy7L4P9w1qv0Y7D+lIznfpUhvOHShd+TMC2DiQg52R//+djP0T+JSbpoaWdYs8nUOpJGdeYVQ==
X-Received: by 2002:a2e:1bc4:: with SMTP id c65mr2948480ljf.130.1568994072661;
        Fri, 20 Sep 2019 08:41:12 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id n9sm499229ljh.53.2019.09.20.08.41.11
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2019 08:41:11 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id n14so2480003ljj.10
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 08:41:11 -0700 (PDT)
X-Received: by 2002:a2e:5b9a:: with SMTP id m26mr9484294lje.90.1568994071382;
 Fri, 20 Sep 2019 08:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNARsoed86dY75b_HNXXkCXRAKdMUGaEWUUca4BuGaZCwcg@mail.gmail.com>
 <20190917150902.GA4116@linux-8ccs> <CAK7LNAR_8atC3M9gGQ=DBwzFG52PVuNaFVAzAr32TKxTwDCLug@mail.gmail.com>
 <20190917180136.GA10376@linux-8ccs> <20190917181636.7sngz5lrldx34rth@willie-the-truck>
 <20190917184844.GA15149@linux-8ccs> <CAK7LNARxmDwu4QmV3bRBtptu-jUaHum=hHaia11-vmOd2ZkeKw@mail.gmail.com>
 <CAHk-=wggsTOU44tvdHAXBP-mmH+UJMXbJAdZYTOYD0PzPJntkg@mail.gmail.com>
In-Reply-To: <CAHk-=wggsTOU44tvdHAXBP-mmH+UJMXbJAdZYTOYD0PzPJntkg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 20 Sep 2019 08:40:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjk=0KUP+Kkr=vRnUrL71j5q_SEQc0x5EPhq2ZJ-=sV1Q@mail.gmail.com>
Message-ID: <CAHk-=wjk=0KUP+Kkr=vRnUrL71j5q_SEQc0x5EPhq2ZJ-=sV1Q@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v5.4-rc1
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Will Deacon <will@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jessica Yu <jeyu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 19, 2019 at 8:48 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> No problem. I'm used to merges, and I appreciate the heads-up.

Heh. The Kbuild merge turns out to be painful for other trees too. I
suspect the module tree isn't going to be any worse than the
DEBUG_INFO_BTF conflict.

             Linus
