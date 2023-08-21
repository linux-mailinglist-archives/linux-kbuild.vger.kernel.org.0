Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461EF78303B
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Aug 2023 20:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237116AbjHUS0i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Aug 2023 14:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjHUS0i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Aug 2023 14:26:38 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA758A1
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Aug 2023 11:26:36 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-76ce59842c1so202727685a.3
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Aug 2023 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692642396; x=1693247196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/YqDlNw5F1+rz9QXavoHkrghYGlNNsfuAy+jwFR/+c=;
        b=Cn+E3s9l83bpTkhkBFoDwWI1REgs//74bQ30HcY1zP2uPoC2+vqvnDzu2LrQKdyczK
         8Ug7uh64s/ghAlPfCHxqZxrkpjNGn9J5nygKGsM7LZRDsd7m/6+eP70u2yAPthIYjFW8
         0Hdid6xF0CrdZUwrEWItO/2JnDZ39zq0vCYLWgCBN4OA3Pa6oVJ9UB3T7hpBgj+2ClEB
         PU9RsebMdfIKugiHBGt10o61MPJRQJ9H4gvHmCfOAaD2myHdytV02AGjM4sXFV1dfNEc
         tD21GLGFAljhm80XJPOq2xAQdCKhhpBwg849VbGFBTUJXI2iiylrUyt7R0UkBTVI3wd+
         P8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692642396; x=1693247196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/YqDlNw5F1+rz9QXavoHkrghYGlNNsfuAy+jwFR/+c=;
        b=SDvve5eDcuKiyRzJEvpcqAsflrUhbzdajb/7sNy4i6Qses+CfXkjvG9CeZERnl0n5G
         hde2N9Jv3zrSI7PxJsvXpc4336FvPcifW1JF3vCPRHQuEl9Tw2EiRdXifUFoDzo+y3Ti
         m1Gyv8+YG5NBRXLmT1aujePJ/QFy9610ydxOrgPoNbL9C5xEyDjSMisVWb0CNST08rzu
         h/fMgixpkKhSCLQEM8zu7PwUiyODeWedXVlRjKW1MWXbQ5AHSeUKhKj8xEOr3cCchJX5
         Iceq+e72UJounj0pXwz3sIr/CmzguqQoSJiZhzHai43bfEYemIDbJzUOgBpbfg0kH7Dd
         Y5iA==
X-Gm-Message-State: AOJu0YzFo5Y/B+WTpm63r+9uYYljFPBNsQJdC+mVezdfYVReYp/fmk6P
        /+cEyJMKLgve8O4GLYsgwfqqASKgl0fHcj6tA8J5yQ==
X-Google-Smtp-Source: AGHT+IHXtZwGvbFEutjrNJHqOIEErZqxeqIeGAh97FrMelK9DNT79hfeLwYEmYOGkf7p3JeTnORDflFl0PbPdil/8mI=
X-Received: by 2002:a05:6214:513:b0:647:1ff2:b2f3 with SMTP id
 px19-20020a056214051300b006471ff2b2f3mr6096818qvb.62.1692642395713; Mon, 21
 Aug 2023 11:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230811140327.3754597-1-arnd@kernel.org> <20230811140327.3754597-6-arnd@kernel.org>
 <CAK7LNASuTOwHA0zz8MqxPdt5snMstpSY7==0o6kmU-RML3nioQ@mail.gmail.com>
In-Reply-To: <CAK7LNASuTOwHA0zz8MqxPdt5snMstpSY7==0o6kmU-RML3nioQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 21 Aug 2023 11:26:24 -0700
Message-ID: <CAKwvOd=7HedYtAN3fTdTwxQbS7eYPxsxuX9wxxvNQ0BRFG0AbQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] extrawarn: enable format and stringop overflow
 warnings in W=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 12, 2023 at 6:11=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> These are redundant because -Wall implies
> -Wformat-overflow and -Wformat-truncation
> according to the GCC manual.

To triple check this grouping behavior in clang, there's a utility
called `diagtool`.

$ diagtool tree

will print the hierarchy of diagnostics and color code them to explain
whether they're on/off by default or not-implemented-but-recognized.

For the above two -Wformat-* warnings, note that clang does not yet
implement those.  I've filed
https://github.com/llvm/llvm-project/issues/64871 to track that.
--=20
Thanks,
~Nick Desaulniers
