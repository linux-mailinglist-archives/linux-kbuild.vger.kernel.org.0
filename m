Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6D475379A
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jul 2023 12:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236056AbjGNKNm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Jul 2023 06:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235938AbjGNKNl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Jul 2023 06:13:41 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5740C1989
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jul 2023 03:13:40 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c5a479bc2d4so1454663276.1
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jul 2023 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689329619; x=1691921619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxNp02bNCTAVyLPRZ82mLPkwbAN62CIGC9HHKgWokDk=;
        b=2F4xNUdVveqN+R5EKr8RvDc7bTWM+gLKOemIBdfkq0xCOm+Cr4UcTnXi7Ex+Z93qzm
         0Jr5cpq2w11H+0Cg6FN9ZTSvdb5obWOs5j0cgJ0bcrvXiE2RRrlmIoxST4HoWSBwgOK2
         8JD3CugG730wX57wEfvKkXfRliM7CBRRje7zXW9Eh8XpC3vlQcb8g9lC3f7RU2/c+xih
         zeerj13DLEEgAOKU8aDV2UeFmV+9cbL73eRaQL//xH4DpiXrl7+msaF7IidwNkSYAvxL
         rZh7VEifal0tY7Lt6YJ1DvF9fWQNWkiFiAlRb1vLaDscgIZXzMzIrbT3QjcbJLDqu6o/
         RHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329619; x=1691921619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxNp02bNCTAVyLPRZ82mLPkwbAN62CIGC9HHKgWokDk=;
        b=eUgHv6ojNDZW2Neae+V0ZEEEahaeHDOP69ksga6IEOdjy5BadCj19ruUDR0IzV+ifb
         Bv+syCbfqinatsMeRTFEO2Xi6w5SumdYjwws+AvmPrgHE0vS3xaMs03bBudTC6JbppPY
         qiY0HQ3IMaiSsm5gSFyNWZt2zg503k7GOoPe32WvYcBes5Yee0mGJlqYkF3FUlq1rbjU
         p36ZiWXBtfCpWaLm8PmQYog6ZtlD+QE6pkfIpBekJLwP1JL7c0xVCfLXA6QIM2NzYYn9
         gpNrtA0mbwAvlraCgADmtCatibKKmShawvdT51PJ/0L8bTFMglcVKQf8psmrC/nOMlHI
         /q5Q==
X-Gm-Message-State: ABy/qLZpHlpIbp2SqRPFtbKwk/CH8Kx6n436wLBWG2n5H4oA/D+wY9Xi
        FE9KpdZhasFEj8eSoeAwNF/z2F1EXA2hK0Q=
X-Google-Smtp-Source: APBJJlFQrE4sbqNmMgiT0tYYLjApKeHUUY+9Z7jWQry23roqS1du7n+Bvn1DHckLfj2QgRK2ut1rlpfSA3O9848=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:9cc8:0:b0:bac:5d2c:844b with SMTP id
 z8-20020a259cc8000000b00bac5d2c844bmr22156ybo.8.1689329619648; Fri, 14 Jul
 2023 03:13:39 -0700 (PDT)
Date:   Fri, 14 Jul 2023 10:13:37 +0000
In-Reply-To: <20230714-classless_lockdep-v1-0-229b9671ce31@asahilina.net>
Mime-Version: 1.0
References: <20230714-classless_lockdep-v1-0-229b9671ce31@asahilina.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714101337.2193665-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 00/11] rust: Implicit lock class creation & Arc
 Lockdep integration
From:   Alice Ryhl <aliceryhl@google.com>
To:     lina@asahilina.net
Cc:     alex.gaynor@gmail.com, alyssa@rosenzweig.io, asahi@lists.linux.dev,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, daniel@ffwll.ch, gary@garyguo.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, marcan@marcan.st, masahiroy@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        sven@svenpeter.dev, trix@redhat.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Asahi Lina <lina@asahilina.net> writes:
> Begone, lock classes!
> 
> As discussed in meetings/etc, we would really like to support implicit
> lock class creation for Rust code. Right now, lock classes are created
> using macros and passed around (similar to C). Unfortunately, Rust
> macros don't look like Rust functions, which means adding lockdep to a
> type is a breaking API change. This makes Rust mutex creation rather
> ugly, with the new_mutex!() macro and friends.
> 
> Implicit lock classes have to be unique per instantiation code site.
> Notably, with Rust generics and monomorphization, this is not the same
> as unique per generated code instance. If this weren't the case, we
> could use inline functions and asm!() magic to try to create lock
> classes that have the right uniqueness semantics. But that doesn't work,
> since it would create too many lock classes for the same actual lock
> creation in the source code.
> 
> But Rust does have one trick we can use: it can track the caller
> location (as file:line:column), across multiple functions. This works
> using an implicit argument that gets passed around, which is exactly the
> thing we do for lock classes. The tricky bit is that, while the value of
> these Location objects has the semantics we want (unique value per
> source code location), there is no guarantee that they are deduplicated
> in memory.
> 
> So we use a hash table, and map Location values to lock classes. Et
> voila, implicit lock class support!
>
> This lets us clean up the Mutex & co APIs and make them look a lot more
> Rust-like, but it also means we can now throw Lockdep into more APIs
> without breaking the API. And so we can pull a neat trick: adding
> Lockdep support into Arc<T>. This catches cases where the Arc Drop
> implementation could create a locking correctness violation only when
> the reference count drops to 0 at that particular drop site, which is
> otherwise not detectable unless that condition actually happens at
> runtime. Since Drop is "magic" in Rust and Drop codepaths very difficult
> to audit, this helps a lot.
> 
> For the initial RFC, this implements the new API only for Mutex. If this
> looks good, I can extend it to CondVar & friends in the next version.
> This series also folds in a few related minor dependencies / changes
> (like the pin_init mutex stuff).

I'm not convinced that this is the right compromise. Moving lockdep
class creation to runtime sounds unfortunate, especially since this
makes them fallible due to memory allocations (I think?).

I would be inclined to keep using macros for this.

Alice

