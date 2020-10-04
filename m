Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D95A282AF1
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 15:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgJDN3s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 09:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgJDN3s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 09:29:48 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7460C0613CE
        for <linux-kbuild@vger.kernel.org>; Sun,  4 Oct 2020 06:29:46 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id y74so6424584iof.12
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Oct 2020 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=RIL6A+OZd3fYqZkONJoUxRJ5GAIotTMlgsPXufFj89s=;
        b=QEABDPHM4oJ3JVYktljWLMqL6ky5SAmSYWZSbY01k3J8NCSl6lwkeqvtHehpaEoOvB
         a2/u8vSnAXP5bVLMrkoveTnk4aZbdrxfQqbXa3dmZ8MIxvohyZp29Qi+zDzSU/LHK6NM
         A34r2osyzALjfRSmcNkylZfInHuoJR3iFWcM1DPp3LtZkLE89SKYLWJw06IQQGen14Wx
         jLUdqRLKwGqqFDUni0pVv7oALHzbMjWUZHxJqH/dAWeOJyQDK8ZI5sVN1Y5FwF95R69h
         alE7lBAEZCLpXYC6xI4G8hqxBnuiWoL9k/TJT1apk+hUQ/Kk/aEG5z2yzMuk/A9l68Oy
         Z8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=RIL6A+OZd3fYqZkONJoUxRJ5GAIotTMlgsPXufFj89s=;
        b=uk4/3lWo+57APaGzX81AsmtQLYQm4wvs8h4dHltiD9ByO8EgBhV4ijx7QSEaMzhlQJ
         rz+ZFnBvh3RRsBGX73tsEHpfFQH+MOX6hG05rpDlumx2RwnePinDM0RrMC3tkLG30Tsl
         c7IGr10v6XbQe4aHiv71uUIlyGng1qb2pzRp4JyIqItPmbJ3U/qhHROX7QjoJr6R9eBR
         Hwr+CqAUGQ/hphk+Otmt1q3wAZdMGUebmTdOTT9tISZkxq8Xp9LoFf4Lxshizo5KVV4I
         lE3NUEntPS88CDQp/9qI/vo2hBK2/xNu36nFa447a/wjdInY7CCu+HMH+eFRWe6vrnj5
         lY1Q==
X-Gm-Message-State: AOAM533RmoFbqfHRN24VklZR0eq+kONS5D+w32e+xcKuE4xyYg1sLF4n
        6vtZLWmxC4FRoso6RAm5gbv+5syNpWd5s7xC0klab8eibq3HMg==
X-Google-Smtp-Source: ABdhPJxK23tj2s6ZiUEVD9v6bvH3HPH+FG3SQd3tuOv6MulrC1RtcGrfIbwhOO+l1Zwfl9oE+/Gy8ebapi+8Ehi2dvU=
X-Received: by 2002:a05:6638:1389:: with SMTP id w9mr9361333jad.138.1601818186000;
 Sun, 04 Oct 2020 06:29:46 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sun, 4 Oct 2020 15:29:35 +0200
Message-ID: <CA+icZUUss+XGHxtSXB3WaRLODdQ0-Ln03N45NUQ=QaP49O3e0A@mail.gmail.com>
Subject: Linux-5.9: Remove CC_FLAGS_USING via asflags-remove
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

I wanted to get rid of CC_FLAGS_USING in lib/Makefile:

ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
+ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_USING)
+asflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_USING)

...it makes no sense to me to remove CC_FLAGS_FTRACE and not CC_FLAGS_USING.

ccflags-remove-y (here: CONFIG_FUNCTION_TRACER=y) seems  to work but
*not* asflags-remove-y.

Am I missing something?
It is getting overridden?

Documentation/kbuild/makefiles.rst says:
"...AFLAGS_$@ has the higher priority than asflags-remove..."

How can I check if there is another AFLAGS_XXX interfering?

I see -DCC_XXX in...

lib/.crc-t10dif.mod.o.cmd
lib/.crc-t10dif.o.cmd

I want to remove all -DCC_XXX assembler-options derived from lib/Makefile.

Regards,
- Sedat -
