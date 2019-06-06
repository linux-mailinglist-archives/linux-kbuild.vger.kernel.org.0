Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0445E37EFF
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2019 22:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfFFUyL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Jun 2019 16:54:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39446 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFFUyL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jun 2019 16:54:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id g9so1394113plm.6
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jun 2019 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YoJ3njYYHju4gWF0UDBaqx7cQlwNKwpKTA90sZyzSuQ=;
        b=Nu7nnn9vfPpPz7sJxzqHoDx7JUBZai+/vvUUZYEVShpjf+/WoIFd69vDm490dRtAIC
         3/H83DydzDP+pAjIcUz9k3WNrfVW0HsVmlqELKBg8gnj0bRoyZo8MVo1UcJiTEVY2SI+
         pnj0Drye6jfQILs7l22P2xML1Elc79OSNTLn4hgwyOo/QokPL2q6Bmp14mQsmpbNN7Rk
         iksow+4qEgKgcWET9s4ApvtocM1MVqaHqiuwD9GJmJEWAY6uTTDP42BEuTOpf9/+GPfL
         WWTAxu5+ByvouWksg97xH8Dg414XiC58pgwqSdUEyZHtgoUsqO/HF76Hq1EUCG95Cvh5
         cbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YoJ3njYYHju4gWF0UDBaqx7cQlwNKwpKTA90sZyzSuQ=;
        b=AdLM2Qb+yQg1+5V4aeXxRg1b0iNsp8wyeev9D+0bWFqZUtHzAaTYNjD8NcokMXmrDT
         fFzF8pKrSjTo6Z4iMcOi3BqXfmkp6PPSY5sXV69hYpenIg9P9/sdMxZ4pQtNAO/vYR00
         xu+8Yj0ncddoGtrQydEpMNklxskRlbsovoWpoJkg/Br/10T2R4tYIqCNRuaq9dQk2tVw
         T55tbScKUQPDILpSvedaj3PR1b/qNCeLp9yeEEoXCg47YyyMtFajZz++J4n9bVU7+AOk
         dDTQ46jT3SrabZ38cFI2NHlRv0QXE7j06a8KgqBRTLCq9TQLKe0fepsBamnyiwbdetMs
         GisQ==
X-Gm-Message-State: APjAAAW37zWih8+RVb36jReQEvEitCpC6LZVAn0TOBTmUtc2WgNTO75E
        C2sNaIIJHg4GdimlqA8LRfgu/Q==
X-Google-Smtp-Source: APXvYqzzAMglGevfusW7tK60HbnxOfGl1ecbxmkWIc836qB8QYHrsxg3mMGRvfA5XFepfVeRePnaHA==
X-Received: by 2002:a17:902:2ba9:: with SMTP id l38mr45854802plb.300.1559854450219;
        Thu, 06 Jun 2019 13:54:10 -0700 (PDT)
Received: from google.com ([2620:0:1008:1100:dac3:f780:2846:b802])
        by smtp.gmail.com with ESMTPSA id m5sm60680pgc.84.2019.06.06.13.54.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 13:54:09 -0700 (PDT)
Date:   Thu, 6 Jun 2019 13:54:06 -0700
From:   Tom Roeder <tmroeder@google.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     yamada.masahiro@socionext.com, mka@chromium.org,
        ndesaulniers@google.com, zwisler@chromium.org,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Changbin Du <changbin.du@intel.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] kbuild: Add option to generate a Compilation Database
Message-ID: <20190606205406.GA120512@google.com>
References: <20190606203003.112040-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606203003.112040-1-rrangel@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 06, 2019 at 02:30:03PM -0600, Raul E Rangel wrote:
> Clang tooling requires a compilation database to figure out the build
> options for each file. This enables tools like clang-tidy and
> clang-check.
> 
> See https://clang.llvm.org/docs/HowToSetupToolingForLLVM.html for more
> information.

I'm glad to see someone adding this to the Makefile directly. I added
scripts/gen_compile_commands.py in b302046 (in Dec 2018) when I was
working on using clang-check to look for bugs in KVM. That script
sidesteps the -MJ option because I found that trying to add it as an
extra option ended up adding entries to the database that didn't work
properly in some cases. This patch adds -MJ in a different way than I
was trying, so I hope it doesn't have the same problems.

I would much prefer to have this functionality integrated into the
Makefile system directly, so if this works with clang-check over all
files and doesn't lead to spurious entries in the database, I'm all for
it.

> 
> Normally cmake is used to generate the compilation database, but the
> linux kernel uses make. Another option is using
> [BEAR](https://github.com/rizsotto/Bear) which instruments
> exec to find clang invocations and generate the database that way.
> 
> Clang 4.0.0 added the -MJ option to generate the json for each
> compilation unit. https://reviews.llvm.org/D27140
> 
> This patch takes advantage of the -MJ option. So it only works for
> Clang.
> 
Can you please add details about how this was tested and compare
coverage with the existing script?

Tom
