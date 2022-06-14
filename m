Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0138054BD96
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jun 2022 00:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243785AbiFNWYM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jun 2022 18:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242406AbiFNWYL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jun 2022 18:24:11 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3044D609;
        Tue, 14 Jun 2022 15:24:11 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id e80so10912305iof.3;
        Tue, 14 Jun 2022 15:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=HU7+1VbBNzYXZnG0+WF8xI/FycmW+RkYu4I+dGFquvo=;
        b=P6KWcuKWCZmM/ipSJcrD+VlSqzlWnp76FNm1uRNfRAcgn03NbJoun4AmA6lBKX7Z7F
         /aFiVHH1kAmTqSQvGC4iL95Z+dvfLav4aq07XZsrk9GkHKTm3E+zIJ8C/MzyrRSJ0Aai
         M7VGfTuuXrc/1kk5SipwaiZHjOYECVXoKzu803i+RRHTg+ou22H1ddnszrafjX4NY57l
         i3StehSMr6tIIAfmRxEedLQCHuUsp6EQv4uoCqBKBDjS9GrNLma8ai1RPcA89eeJk5yG
         BD96IkSM90D92oeV6SKEvMqYISWz412MI+Qypno/K71kyGEkQR4wyenMdXlJt8Lfu624
         54nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=HU7+1VbBNzYXZnG0+WF8xI/FycmW+RkYu4I+dGFquvo=;
        b=pfUYAGj/nsX8tJq7o6PIE6CL4fcZTqK+6wQygRYi5X0Ix+YWVAGdHieqGjobRNJQjA
         N81dO3TDQrJnnrzPPzcTGLMHqtbVvylpUlGBoGjbUruukCJKMPkOqACOed7zJpmqz1PM
         ys82f1YLjqliO0Xbnlp3btDE4clDqcJGR7BJwr1beRrkrYa24d2C63voe+CMyKVhVLeJ
         /DJbD5totwboPuLX0lqWwypfMv2/Jw1aufDZ1SMMd9GqGE3/umH58D5w5giCD1MyRkPd
         GzM3MK+A/e3d3hv2rCZFRKss67KanzscZo80VmJ4cLvB33cwyKL24SxuAyqVEqOYSf5o
         /RDw==
X-Gm-Message-State: AOAM531URVj25E66ZUp1JehvkovO7jv81+/oEAHf/yP7oqrezYOG7Ib9
        Tfo35CHXbvHASXzrTSrEArbmxvqXKBCwXmdCvXxR8u0F4M0lnw==
X-Google-Smtp-Source: ABdhPJy4mJL3DuTbiR8KG8/dPR3dILa+IhzS+daqkKIS3mklKJaUZENh0rMF/e9F6BcU6ZfPRhzxcqrrIe8yCF+9eOM=
X-Received: by 2002:a05:6638:1415:b0:331:d318:83ab with SMTP id
 k21-20020a056638141500b00331d31883abmr4185192jad.126.1655245450358; Tue, 14
 Jun 2022 15:24:10 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 15 Jun 2022 00:23:34 +0200
Message-ID: <CA+icZUX-=vjX1WgJLDGZYZhrpxy+KqynMMFmNPp8pWu0q2sDcg@mail.gmail.com>
Subject: [Linux v5.19-rc2] rtla: Errors when running `make tools/clean`
To:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-devel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[ CC linux-kbuild folks ]

Hi,

while digging into a perf issue I see this:

$ cd /path/to/linux.git

$ LC_ALL=C make -C tools/ clean 2>&1 | tee ../make-log_tools-clean.txt
...
  DESCEND tracing
make[1]: Entering directory '/home/dileks/src/linux-kernel/git/tools/tracing'
 DESCEND latency
make[2]: Entering directory
'/home/dileks/src/linux-kernel/git/tools/tracing/latency'
rm -f latency-collector
make[2]: Leaving directory
'/home/dileks/src/linux-kernel/git/tools/tracing/latency'
 DESCEND rtla
make[2]: Entering directory
'/home/dileks/src/linux-kernel/git/tools/tracing/rtla'
make -C /home/dileks/src/linux-kernel/git/tools/tracing/rtla/../../../Documentation/tools/rtla/
clean
make[3]: Entering directory
'/home/dileks/src/linux-kernel/git/Documentation/tools/rtla'
rm -f rtla-osnoise-hist.1 rtla-osnoise-top.1 rtla-osnoise.1
rtla-timerlat-hist.1 rtla-timerlat-top.1 rtla-timerlat.1 rtla.1
make[3]: Leaving directory
'/home/dileks/src/linux-kernel/git/Documentation/tools/rtla'
/bin/sh: 1: test: rtla-make[2]:: unexpected operator
rm: cannot remove '/home/dileks/src/linux-kernel/git': Is a directory
make[2]: *** [Makefile:120: clean] Error 1
make[2]: Leaving directory
'/home/dileks/src/linux-kernel/git/tools/tracing/rtla'
make[1]: *** [Makefile:26: rtla_clean] Error 2
make[1]: Leaving directory '/home/dileks/src/linux-kernel/git/tools/tracing'
make: *** [Makefile:170: tracing_clean] Error 2
make: Leaving directory '/home/dileks/src/linux-kernel/git/tools'

Please check yourself.

Regards,
-Sedat-
