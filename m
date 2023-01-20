Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28260675A1F
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jan 2023 17:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjATQhz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Jan 2023 11:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjATQhw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jan 2023 11:37:52 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBEFA5013
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Jan 2023 08:37:20 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id a11so9013137lfg.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Jan 2023 08:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/fWtacqrJMeePmjQZHP39whGP5vkqWAGAcCPad6+vwU=;
        b=PbiSbHcoJy0BSsIYNI5VHXoUWPDg7n/WvdPbuTPSpBjsxrN6HqPo9CwjW9kdMB1cDw
         qt1JQfaDbPvkDKeZLfJ/bcCTQ//ZJRuEn9I9Z9JXV6xsMUEgftSYpxxjJSRCzipum08i
         jIiZdnTDOEjTCXSUxnKcmuSc1fyNXED21MuhfQf9CkITdEizigxKw3PNkaeQZ5i70lgg
         A+E1vqXOeVQpYw9qO+kjF31+vDHmoObKfC2VUW5QV5Yo8uQEcCNmn2p5XtnxccIElJih
         TbF7fl9v9nZgfBF3ucVYGo5C3Vh0il7yxD6jp4gXmNrlllZpXi9+DbPkx8vkjyIKmgyK
         X/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fWtacqrJMeePmjQZHP39whGP5vkqWAGAcCPad6+vwU=;
        b=QMLnhX5W06KYlES1X05cqKpDiysMsxinc6Cn6oOU4XoJzJjnr6YGwctVHhkv99u14Z
         SylhWH5ZbC50Sj5A5fRFFuOh2d1wphsDDVqnsMEDxyMp9AVBXa55KOvT4/nN9fYlbQDt
         Vdl8q+tDkO0qFphe0NO5rXNHmgpg5uSpZ+LhlZYsGJUsZxH/vTH/tzfh592Vhtchb6LK
         /+/85QvF+NdZI5vZtrAqYnFqctsLS/3dj4uRbU0lVa5Vc7S19QSIq15StjYYc8I/BEVf
         0mK7QWWUykIjbcwLDxQXKnF2YVgm7GtCJymFK727YWuXY4gK/MC6BpdA/GSQoSDV1fxV
         ar4g==
X-Gm-Message-State: AFqh2kpR9BRPFcx+S5MQQnyu7ZmvcfkCFqo2IWyVf7Do9nvdhtFRngD3
        mvyUzbozAU0XzlseYXQ8QUXE7OIzsXcT0lY2PGydeQYIN1RHlQ==
X-Google-Smtp-Source: AMrXdXtPxoysaFeOlUw1RshF5JkB0/PcfudZ4kDHPXBpHRrFmJVCGSoJl1/eDBUvzXcQdD5mYTBpYFVNPyVxfUyZIR0=
X-Received: by 2002:a05:6512:96a:b0:4c4:dd2a:284f with SMTP id
 v10-20020a056512096a00b004c4dd2a284fmr957391lft.440.1674232636538; Fri, 20
 Jan 2023 08:37:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
 <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
 <CA+icZUXJgR1MFtgpChvwr5iFa_FVr4bEGe3GAM62_3xNSmDeXQ@mail.gmail.com> <CAK7LNARzDnVk7JV6WLRYm54HkY4CVmpcv17YWkr9Q8GT2Epdig@mail.gmail.com>
In-Reply-To: <CAK7LNARzDnVk7JV6WLRYm54HkY4CVmpcv17YWkr9Q8GT2Epdig@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 20 Jan 2023 17:36:39 +0100
Message-ID: <CA+icZUX0OFa7dD7xsy7V=3_FdvcKD12y0L=F08R5OXPTr3C91A@mail.gmail.com>
Subject: Re: [6.2-rc4] warning: cannot check the header due to sha1sum missing
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Test-Case:

cd /path/to/linux.git

make clean

make distclean

sha1sum include/linux/atomic/atomic-* > ../SHA1SUM.before

make V=1 mrproper defconfig prepare 2>&1 | tee ../test-masahiro-sha1sum-v2.log

sha1sum include/linux/atomic/atomic-* > ../SHA1SUM.after

ll .checked-atomic-* ..checked-atomic-*
-rw-r--r-- 1 dileks dileks   0 20. Jan 17:22 .checked-atomic-arch-fallback.h
-rw-r--r-- 1 dileks dileks 460 20. Jan 17:22
..checked-atomic-arch-fallback.h.cmd
-rw-r--r-- 1 dileks dileks   0 20. Jan 17:22 .checked-atomic-instrumented.h
-rw-r--r-- 1 dileks dileks 455 20. Jan 17:22 ..checked-atomic-instrumented.h.cmd
-rw-r--r-- 1 dileks dileks   0 20. Jan 17:22 .checked-atomic-long.h
-rw-r--r-- 1 dileks dileks 415 20. Jan 17:22 ..checked-atomic-long.h.cmd

grep warning: ../test-masahiro-sha1sum-v2.log
2096:  if ! command -v sha1sum >/dev/null; then echo "warning: cannot
check the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n
'$s:// ::p' include/linux/atomic/atomic-arch-fallback.h)" != "$(sed
'$d' include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
.*//')" ]; then echo "error:
include/linux/atomic/atomic-arch-fallback.h has been modified." >&2;
exit 1; fi; touch .checked-atomic-arch-fallback.h
2097:  if ! command -v sha1sum >/dev/null; then echo "warning: cannot
check the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n
'$s:// ::p' include/linux/atomic/atomic-instrumented.h)" != "$(sed
'$d' include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/
.*//')" ]; then echo "error:
include/linux/atomic/atomic-instrumented.h has been modified." >&2;
exit 1; fi; touch .checked-atomic-instrumented.h
2098:  if ! command -v sha1sum >/dev/null; then echo "warning: cannot
check the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n
'$s:// ::p' include/linux/atomic/atomic-long.h)" != "$(sed '$d'
include/linux/atomic/atomic-long.h | sha1sum | sed 's/ .*//')" ]; then
echo "error: include/linux/atomic/atomic-long.h has been modified."
>&2; exit 1; fi; touch .checked-atomic-long.h

cd ..

git diff SHA1SUM.before SHA1SUM.after
[ empty ]

OK, so no atomic header files were changed - looks to me like a "I
have checked them... found no diff... leave some checked files to
confirm this".

-Sedat-
