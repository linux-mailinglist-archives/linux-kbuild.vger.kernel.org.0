Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC0DD659099
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Dec 2022 19:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiL2Sza (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Dec 2022 13:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbiL2SzZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Dec 2022 13:55:25 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918CE1403F
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Dec 2022 10:55:24 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id a16so15617994qtw.10
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Dec 2022 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xV2T7Ezr7Tu9usVmsoEJDL7ttiEd8vTPNlCNm/CjYXw=;
        b=Q8HGzhiP2ohA79pqC6Uy+jj5SeJtp8cWeQ++imJzVTvC0X7BH8zjPfQTyKq8UYKaK9
         1AC0vSgoFmGjyhDwqsUYuyR+M+DxG50cnO99tmHxSZf7+2kV4e7QwsWLvOtElB4S0MiR
         HyZtfODh6bFwebfqF/nLXlLMHXXZZGqY4HgxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xV2T7Ezr7Tu9usVmsoEJDL7ttiEd8vTPNlCNm/CjYXw=;
        b=jFOKiKLDxvv7wABArSdkMLyTYGQ2e6W31L06y6M0yVyT3Y7MAYY3ttySvG1hCqiabe
         jj/hanwcPzQ9Cy2tsaoPfzVlTqA7ijbsFSSRqGg84e/UmnAlnOjo/jhyGdmNz9C93eRo
         tS6ji+jPvjvsln8kVo+GaM751lTzcqeh82d/6MulMj5cb1m+GfxqzhsUbfloXFOWRlXU
         6Xcl6Hy/dSPX+UiDnd90Z2fc/Y7uq0+25+gzCIDS7lwCPEnhkOTDaZk6ajdQmkOe95P0
         3Nulby4tWx/P4UYWi8Y2Ma31XBSJdXBbOXpchI3oL8HdIu7XclgACINvkNXchpOrfimN
         N5SA==
X-Gm-Message-State: AFqh2kqPqJ2BdBz2fMEs3P+cQIYMkKsuUVxWJmdfWkFwUWH6Lhw8MI60
        pPcakg7jLW3kqYAucUrDPcuxdNTewoF7xiTK
X-Google-Smtp-Source: AMrXdXtgoQv5Hk5jP66/w6ngAv9YXZlyjofUDbdL4gFfVboPdPleX0hLKHju5pBxOJklETHmV9y9RQ==
X-Received: by 2002:ac8:6bc1:0:b0:3a5:24fc:4bbb with SMTP id b1-20020ac86bc1000000b003a524fc4bbbmr46401048qtt.7.1672340123405;
        Thu, 29 Dec 2022 10:55:23 -0800 (PST)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id br34-20020a05620a462200b006fc7c5d456asm13422704qkb.136.2022.12.29.10.55.22
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 10:55:22 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id bp44so13010782qtb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Dec 2022 10:55:22 -0800 (PST)
X-Received: by 2002:ac8:67da:0:b0:3a5:122:fb79 with SMTP id
 r26-20020ac867da000000b003a50122fb79mr787348qtp.452.1672340121841; Thu, 29
 Dec 2022 10:55:21 -0800 (PST)
MIME-Version: 1.0
References: <202212291509.704a11c9-oliver.sang@intel.com>
In-Reply-To: <202212291509.704a11c9-oliver.sang@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 29 Dec 2022 10:55:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wieOBgQ-7aoihBzywKqxiO7o7hc6gd_csn69ChcxR1FuQ@mail.gmail.com>
Message-ID: <CAHk-=wieOBgQ-7aoihBzywKqxiO7o7hc6gd_csn69ChcxR1FuQ@mail.gmail.com>
Subject: Re: [linus:master] [kbuild] 3bc753c06d: xfstests.generic.454.fail
To:     kernel test robot <oliver.sang@intel.com>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com, Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        "Theodore Ts'o" <tytso@mit.edu>,
        Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 29, 2022 at 12:49 AM kernel test robot
<oliver.sang@intel.com> wrote:
>
> generic/454       _check_generic_filesystem: filesystem on /dev/sda4 is inconsistent

The commentary on that test is:

  Create xattrs with multiple keys that all appear the same
  (in unicode, anyway) but point to different values.  In theory all
  Linux filesystems should allow this (filenames are a sequence of
  arbitrary bytes) even if the user implications are horrifying.

and looking at the script it seems to indeed just do setfattr and
getfattr with some unusual data (ie high bit set).

Adding Ted, since this is apparently all on ext4. I guess it could be
the vfs layer too, but it really doesn't tend to look very much at the
xattr data, so.. Adding Christian Brauner anyway, since he's been
working in this area for other reasons.

Ted, Christian - I cut down the report mercilessly. It's not really
all that interesting, apart from the basic information of "xfstest
generic/454 started failing consistently on ext4 at commit
3bc753c06dd0 ('kbuild: treat char as always unsigned')".

If you think you need more, see

    https://lore.kernel.org/all/202212291509.704a11c9-oliver.sang@intel.com/

Also, I'm surprised this hasn't been an issue earlier - 'char' has
always been unsigned on arm (among other architectures), so if this
test started failing now on x86-64 due to -funsigned-char, it has
presumably been failing on arm the whole time.

I assume it's something that compares a 'char *name' by value, but the
ones I looked at (eg xattr_find_entry() used strlen()/memcmp() which
should be all good).

Oh, I think I see one potential problem in ext4:

ext4_xattr_hash_entry() is hot garbage. Lookie here:

        while (name_len--) {
                hash = (hash << NAME_HASH_SHIFT) ^
                       (hash >> (8*sizeof(hash) - NAME_HASH_SHIFT)) ^
                       *name++;
        }

so that hash will now depend on the sign of that 'char *name' pointer.

If that hash ever has any long-term meaning (ie saved on disk or
exposed some other way), that would be problematic.

Of course, if it's just an ephemeral thing only used on that one
machine, then it isn't a problem - having different hashes on
different machines (and different boots) is a non-issue. But
considering that it then does

        return cpu_to_le32(hash);

at the end does seem to imply to me that it all really *tries* to be
architecture-neutral, and has just failed horrendously.

Because that does look like code that might get confused by the sign of a char.

There might be other cases, I only looked very quickly for these kinds
of problems.

          Linus
