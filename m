Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FFECC4F8
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2019 23:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbfJDVmj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Oct 2019 17:42:39 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38352 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfJDVmi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Oct 2019 17:42:38 -0400
Received: by mail-lf1-f67.google.com with SMTP id u28so5452668lfc.5
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Oct 2019 14:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kSvi6bN3MgmA9q6zMgIL0cUcdQWLY9tbHblghBTgstI=;
        b=hBuewRInP5i+6gtlRLW9UtlDY0YPe0z67E0xbXSSSKYA7biQf+uXTlrPp7zLuAUPeq
         5uQ2rwixtXebf99m1RfUdMDyjGKPh3VgF3DuF8NvshRtQGRa2wNkvwDCWMNQ0VKjXHWB
         ZmI6XqYkyQwmdmiffnmLI1+ZMJ0oT9STysqR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kSvi6bN3MgmA9q6zMgIL0cUcdQWLY9tbHblghBTgstI=;
        b=PUa6zOR59CC35un5XpdB3WCK/EzfB6MA6aECeDil6CKImiuLVc4lhJ8bqTUkS+2tNo
         SpLIMD4456/JxJ1uYf74VW857VsvrlNKeRnr4tEc+mtJt3NQaiqveFljdHZTAAxNMLmG
         hcOF5HJFzbi7QIA2Y22tesK2MLhHeVGigaXwoHgP5Dx9hJSA/Nudc5H10qOyQLN6/g5e
         0OuUUbmFFS+zMPGO+QXoVspplC/a3yNA4oN3Z3OUf0+frXWtWmeO5ucr0qvHLzh/wlPx
         5CAogHJzopQg5KTMpkXdxObIBmikA/sHdLOMQ6qbPGps+TnClzV5vzmNcl1TTYfI+K7l
         bt7A==
X-Gm-Message-State: APjAAAXoriRj6M6gRaGR4S4JbSMee+ko4YquSm4iqRx36aj2mE7EkNHT
        QHb8xbGM4E8FS96gdTm/k4x+4jn0BmU=
X-Google-Smtp-Source: APXvYqwvN3lvVJZXQXS1XVu7XYCef5++zUaDiQOipjKoCM+wQ3BQEBk2LiRSbbgJWuMzXmOe5qSfZw==
X-Received: by 2002:a19:488f:: with SMTP id v137mr9825537lfa.26.1570225355004;
        Fri, 04 Oct 2019 14:42:35 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id x15sm1782061lff.54.2019.10.04.14.42.33
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2019 14:42:34 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id r2so5441859lfn.8
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Oct 2019 14:42:33 -0700 (PDT)
X-Received: by 2002:a19:7d55:: with SMTP id y82mr10113290lfc.106.1570225353484;
 Fri, 04 Oct 2019 14:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com> <20191004213812.GA24644@mit.edu>
In-Reply-To: <20191004213812.GA24644@mit.edu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 4 Oct 2019 14:42:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
Message-ID: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        kieran.bingham@ideasonboard.com,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, robh@kernel.org,
        Stephen Boyd <sboyd@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>, Tim.Bird@sony.com,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>, jdike@addtoit.com,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>, khilman@baylibre.com,
        knut.omang@oracle.com, logang@deltatee.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 4, 2019 at 2:39 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> This question is primarily directed at Shuah and Linus....
>
> What's the current status of the kunit series now that Brendan has
> moved it out of the top-level kunit directory as Linus has requested?

We seemed to decide to just wait for 5.5, but there is nothing that
looks to block that. And I encouraged Shuah to find more kunit cases
for when it _does_ get merged.

So if the kunit branch is stable, and people want to start using it
for their unit tests, then I think that would be a good idea, and then
during the 5.5 merge window we'll not just get the infrastructure,
we'll get a few more users too and not just examples.

             Linus
