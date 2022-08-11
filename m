Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3986B5900BB
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Aug 2022 17:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236493AbiHKPqc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Aug 2022 11:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236586AbiHKPpu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Aug 2022 11:45:50 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8923698A4A
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2022 08:39:59 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id s11so23391693edd.13
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2022 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=x6h3ZUYE+fSHbOcAtnhM53hC5fi6FUTsoF2x5uuPJ2I=;
        b=HeMQ8zAXI4QJmplndokyGN4KBA2GRue+xq74R5DjkSz15v0bKh6AhytDDiX37HKdpR
         ho0aHxKcelq9/L6PPYv9w2sMZURJjljYqPVMZ8dH8/fres9luFz8AHpK4pO9dGonPjXy
         0MmrvWv42qdBW0TVMQOjQ0rRic8iIwEMO3R/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=x6h3ZUYE+fSHbOcAtnhM53hC5fi6FUTsoF2x5uuPJ2I=;
        b=qilUVGKKmepL7sz2zuj5p+Cghw2WXJIfO1MBx1Ew1w1+Do28dcx3wQ5K6BZDRsiAaG
         kVvAtGrFY74N6HQ1r+oj0nNF32f6hbbTF0KD6zUTcnWsMBK8luW9JwnWN8K5WCOqDa1e
         Z0NNXFzO8ymPMHoMEdwALr7IOtukKJtrZpb/C8o55I8SxQ/mSYazazEIbI35KlF9Y+u9
         YkdxBWwTBg07yd2GdWIdQzncslSUzGHYE5h6ik74KsGeyA3rQ8fBZ8LGsZIH86Svt5vh
         5PARyBygxZ+Pnk7X6yxzkAKyaKxFX1NmpLOBOXpQdwjPgbyVe8MmV79u87Bpg3eIIQvr
         rf2A==
X-Gm-Message-State: ACgBeo1tarOywAcINGzWah0tYKQN6W6UdFvmVHCgldeibN0W8ekSMfb3
        uZ2Ks9PHwnMvbrAi7ApTb06TkIRFi998v+KO
X-Google-Smtp-Source: AA6agR7vm7BD2fGR710sGABWyD55bx/g76UmntI5RPLhRjeLjxz2m7EOCxIm1aehOiA+9rdVFRfqWw==
X-Received: by 2002:a05:6402:11cf:b0:43d:fc84:c51a with SMTP id j15-20020a05640211cf00b0043dfc84c51amr30811105edw.80.1660232397954;
        Thu, 11 Aug 2022 08:39:57 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id et13-20020a056402378d00b0043ba24a26casm9042650edb.23.2022.08.11.08.39.53
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 08:39:53 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id bv3so21762648wrb.5
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2022 08:39:53 -0700 (PDT)
X-Received: by 2002:a05:6000:1888:b0:222:ca41:dc26 with SMTP id
 a8-20020a056000188800b00222ca41dc26mr11935404wri.442.1660232392668; Thu, 11
 Aug 2022 08:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <YvSxeDkmwxcJL+Z0@debian> <YvUZ+9kJ/AvUMxzO@dev-arch.thelio-3990X>
In-Reply-To: <YvUZ+9kJ/AvUMxzO@dev-arch.thelio-3990X>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 11 Aug 2022 08:39:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivP4zipYnwNWCLF5cd24GLs3m8=Sp7M-CmmPva_UC+3Q@mail.gmail.com>
Message-ID: <CAHk-=wivP4zipYnwNWCLF5cd24GLs3m8=Sp7M-CmmPva_UC+3Q@mail.gmail.com>
Subject: Re: mainline build failure for arm64 allmodconfig with clang
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 11, 2022 at 8:05 AM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> Right, these are exposed by commit 258fafcd0683 ("Makefile.extrawarn:
> re-enable -Wformat for clang").

Christ. Why is clang's format warning SO COMPLETELY BROKEN?

The warning is *WRONG*, for chrissake. Printing an 'int' with '%hhu'
is perfectly fine, and has well-defined semantics, and is what you
*want* to do in some cases.

I'm going to turn it off again, because honestly, this is a clang bug.
I don't care one whit if there are pending "fixes" for this clang bug,
until those fixes are in *clang*, not in the correct kernel code.

For chrissake, the value it is trying to print out as a char is '3'.

But even if it wasn't, and even if you wanted to print out "0xf365" as
a "char" value, then that is how C varargs *work*. It's an "int".

In fact, even a *character* is an "int". This program:

        #include <stdio.h>

        int main(int argc, char **argv)
        {
                printf("%hhu\n", 'a');
        }

generates a warning with "clang -Wformat", and dammit, if you are a
clang developer and you see no problem with that warning, then I don't
know what to say.

Nathan, please make clang people see some sense.

Because no, I'm not in the least interested in getting kernel "fixes"
for this issue. -Wformat for clang goes away until people have gotten
their heads extracted from their derri=C3=A8res.

This is ridiculous.

              Linus
