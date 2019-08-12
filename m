Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB7A8AB8B
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 01:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfHLX4n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 19:56:43 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46886 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbfHLX4n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 19:56:43 -0400
Received: by mail-pf1-f193.google.com with SMTP id q139so2222372pfc.13
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 16:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gYpSAuCXXKxryh8QTeN+G2zHTLzdvz4q0W6bw5kxZF4=;
        b=kj+TnowRhwNBHJOh8ghz79tlvll8x/4UGw5bdSUzfSM675Bmppn0T+5pwwMqUi1Pj8
         SkfxC53wkTjuPEqLDzqpMT8o02usB1hT7ISXFNR37RoScwW9mBXE4G6OWWcEhGxQ4RjE
         ZULQCeKPfhmyKaUvhvxsP1ztH072L3pIFOOb1mQPoepGl9JYtada5S4xJGf8kTW6G2ed
         agtpkDcP4Se/8cfElAOE/jMH6pWLmTG0sCRAYFHxhMUFNN99If6/5pZXWUcydlo5gP79
         cH+LRfP7b/BQG+d1ym6KyAQRfa3JaLfiK6f13kXjD96rm3bbdFV/J9GFHUpWjzV//M/H
         yS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gYpSAuCXXKxryh8QTeN+G2zHTLzdvz4q0W6bw5kxZF4=;
        b=REehK6tUlkvCYH3vxQBQfSDEy7saZuz6lVHY72ZpP9FntGZ5r/HIeJlkbBtPsuc77M
         pEf71yF8qy9Rmv5ku8QtVsiRFa3J6nCzJk//bZO2Sa1bUX/VQ1/qBDl+jNnHhAGyztnx
         NaBQQXmYajbUQNdPBnC8n8JlFEPDwx6Ky4E8pmNMiAoAiI/X5DhmgffgoZDlmQXvlvz4
         tFigY+dCTQ7l91AH8SkGUt3P0pKlzW7nAb4V9d/XH+kQf8ySxEEV41KnGMiBsbZCud68
         YFd3K7barXbJzgEuw3ZiOJ9QI5fjWuQ6/9CYN2ZMxbNIe5Db5tSoGzLYLX39F60t+2qZ
         4u8w==
X-Gm-Message-State: APjAAAU2dVvzu86mC4yRjSqa/5VEknyd6vhyTLWX542b0KynLpqHz9yf
        HfT2jDWGLybTzv7W08MhavsDGwlZ3P7Frje0PWXgqA==
X-Google-Smtp-Source: APXvYqw7Md+FhMdhe7gt7ZbaYFjad4Qutk9q143YLYnyDZF1R0tUF3skBOerqPAJS3PaDxgm1xGa9mrupUlIDIlaGXw=
X-Received: by 2002:a63:b919:: with SMTP id z25mr31882885pge.201.1565654201390;
 Mon, 12 Aug 2019 16:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-5-brendanhiggins@google.com> <20190812234644.E054D20679@mail.kernel.org>
In-Reply-To: <20190812234644.E054D20679@mail.kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 12 Aug 2019 16:56:29 -0700
Message-ID: <CAFd5g44huOiR9B0H1C2TtiPy63BDuwi_Qpb_exF3zmT3ttV8eg@mail.gmail.com>
Subject: Re: [PATCH v12 04/18] kunit: test: add assertion printing library
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Logan Gunthorpe <logang@deltatee.com>,
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

On Mon, Aug 12, 2019 at 4:46 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-08-12 11:24:07)
> > Add `struct kunit_assert` and friends which provide a structured way to
> > capture data from an expectation or an assertion (introduced later in
> > the series) so that it may be printed out in the event of a failure.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>
> Just some minor nits below
>
> > diff --git a/include/kunit/assert.h b/include/kunit/assert.h
> > new file mode 100644
> > index 0000000000000..55f1b88b0cb4d
> > --- /dev/null
> > +++ b/include/kunit/assert.h
> > @@ -0,0 +1,183 @@
> [...]
> > +                           struct string_stream *stream);
> > +
> > +struct kunit_fail_assert {
> > +       struct kunit_assert assert;
> > +};
> > +
> > +void kunit_fail_assert_format(const struct kunit_assert *assert,
> > +                             struct string_stream *stream);
> > +
> > +#define KUNIT_INIT_FAIL_ASSERT_STRUCT(test, type) {                           \
> > +               .assert = KUNIT_INIT_ASSERT_STRUCT(test,                       \
> > +                                                  type,                       \
> > +                                                  kunit_fail_assert_format)   \
>
> This one got indented one too many times?

Not unless I have been using the wrong formatting for multiline
macros. You can see this commit applied here:
https://kunit.googlesource.com/linux/+/870964da2990920030990dd1ffb647ef408e52df/include/kunit/assert.h#59

I have test, type, and kunit_fail_assert_format all column aligned (it
just doesn't render nicely in the patch format).

> > +}
> > +
> > +struct kunit_unary_assert {
> > +       struct kunit_assert assert;
> > +       const char *condition;
> > +       bool expected_true;
> > +};
> > +
> > +void kunit_unary_assert_format(const struct kunit_assert *assert,
> > +                              struct string_stream *stream);
> > +
> [...]
> > +#define KUNIT_INIT_BINARY_STR_ASSERT_STRUCT(test,                             \
> > +                                           type,                              \
> > +                                           op_str,                            \
> > +                                           left_str,                          \
> > +                                           left_val,                          \
> > +                                           right_str,                         \
> > +                                           right_val) {                       \
> > +       .assert = KUNIT_INIT_ASSERT_STRUCT(test,                               \
> > +                                          type,                               \
> > +                                          kunit_binary_str_assert_format),    \
> > +       .operation = op_str,                                                   \
> > +       .left_text = left_str,                                                 \
> > +       .left_value = left_val,                                                \
> > +       .right_text = right_str,                                               \
> > +       .right_value = right_val                                               \
> > +}
>
> It would be nice to have kernel doc on these macros so we know how to
> use them.

Sounds good. Will fix.
