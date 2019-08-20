Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6699688D
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2019 20:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730484AbfHTSY6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Aug 2019 14:24:58 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41932 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730552AbfHTSY6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Aug 2019 14:24:58 -0400
Received: by mail-pg1-f194.google.com with SMTP id x15so3693275pgg.8
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2019 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=54TsZDfDW3TriN1nqx27Ow/a4BBsLJIgLp0TtrQghOk=;
        b=ETn6ov6vEQVZ6Z8d+QOJIR5ZdOHT4ZDivDB2VkpQ0qnDIs9MQrQ638udwnr/9nsV39
         Q9CE1bjJjQqBou8vTO6RAPzU8X9Tiq1MLFyQK2/DJWm5diN99WuwayJaLt2azZswGQO6
         PgJRFVxL4YQGtCWP5gy6mT//u52PocvwVbmI1tMnbwHSew1qhj9G4kLkgm0cfOXOG/+z
         KBuOacguM7Ku15bvGQe9U+2RVhwBdPlfoBEveO5qY2aaNvMSGTBP0IPNRwdL5M9uwBLI
         rRbk5djqLbCbCvoJbmUcAx9Gb5ONtUGkfOKYOiRtBndtwfw3IyR9R3OQOevfv1X/iVGx
         ii2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=54TsZDfDW3TriN1nqx27Ow/a4BBsLJIgLp0TtrQghOk=;
        b=biKAGXQoED90LadSDy0dYVUk6TA2+49SbGwJpYeO1Ol/aEJu1R8TsZrjXIWS1dq25E
         X8fr8uhYh31s+VVmL56StrzuhGLFT7OXxBzrD8TMYTZjVEPTnwSjP6HCKvAcExyB+OqP
         /T7/KX8pTqZdfFW4LYlI3F8FZrWA6nRHKiDBSaXOtze6MpSSttG8YKuFHF67rJRMpTro
         WUjFvf1PZyHczo+n4xF2T/+DzOvigNw4ob448U+be3SMOAhveqY7yUFkTRVwY1Z64yWP
         yrxf0OQQ1Cl3O2UEoOcfLx2uSaokgOnWSCszcxZ+Odi1IbW6b/HKeqUvko1qo6QODqym
         YytA==
X-Gm-Message-State: APjAAAWSx3By++QPOlR2uRIttpKVxA+TP0dXWJ3rmckH4pZyBbHiLgqC
        gdrE/FqS+yPGPuHQ/f5xL/QUww==
X-Google-Smtp-Source: APXvYqz6e4UEkK1ofDpL52W0zxkSIj5ZMAzgsILYeZML13HEn/+04ibT+w1ZAtBgHDGP+VY3TZZ4jA==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id b44mr1312628pjc.87.1566325496873;
        Tue, 20 Aug 2019 11:24:56 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
        by smtp.gmail.com with ESMTPSA id u16sm20305376pgm.83.2019.08.20.11.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 11:24:55 -0700 (PDT)
Date:   Tue, 20 Aug 2019 11:24:50 -0700
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah <shuah@kernel.org>
Cc:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        tytso@mit.edu, yamada.masahiro@socionext.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190820182450.GA38078@google.com>
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 20, 2019 at 11:24:45AM -0600, shuah wrote:
> On 8/13/19 11:50 PM, Brendan Higgins wrote:
> > ## TL;DR
> > 
> > This revision addresses comments from Stephen and Bjorn Helgaas. Most
> > changes are pretty minor stuff that doesn't affect the API in anyway.
> > One significant change, however, is that I added support for freeing
> > kunit_resource managed resources before the test case is finished via
> > kunit_resource_destroy(). Additionally, Bjorn pointed out that I broke
> > KUnit on certain configurations (like the default one for x86, whoops).
> > 
> > Based on Stephen's feedback on the previous change, I think we are
> > pretty close. I am not expecting any significant changes from here on
> > out.
> > 
> 
> Hi Brendan,
> 
> I found checkpatch errors in one or two patches. Can you fix those and
> send v14.

Hi Shuah,

Are you refering to the following errors?

ERROR: Macros with complex values should be enclosed in parentheses
#144: FILE: include/kunit/test.h:456:
+#define KUNIT_BINARY_CLASS \
+       kunit_binary_assert, KUNIT_INIT_BINARY_ASSERT_STRUCT

ERROR: Macros with complex values should be enclosed in parentheses
#146: FILE: include/kunit/test.h:458:
+#define KUNIT_BINARY_PTR_CLASS \
+       kunit_binary_ptr_assert, KUNIT_INIT_BINARY_PTR_ASSERT_STRUCT

These values should *not* be in parentheses. I am guessing checkpatch is
getting confused and thinks that these are complex expressions, when
they are not.

I ignored the errors since I figured checkpatch was complaining
erroneously.

I could refactor the code to remove these macros entirely, but I think
the code is cleaner with them.

What would you prefer I do?

NB: These macros are introduced in: "[PATCH v13 05/18] kunit: test: add
the concept of expectations"

Thanks!
