Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDFF59B592
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Aug 2022 19:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiHURMJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Aug 2022 13:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiHURMH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Aug 2022 13:12:07 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C209F21E15
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Aug 2022 10:12:06 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id w19so17227671ejc.7
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Aug 2022 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2IG7yxCXKhrrmlYS5yO7XY8+9kSj2TtQKMSIeXBcBeM=;
        b=KzixGCuDnswaMadZqR4ynhhwNXnoXEVyUxEjeuDGHd5tL+ljlGzsi+LE8LF7F5lwRn
         v9mjz4V1ufMkIAeKimYo9EAgIy0HyOy9AOd/PAq3eqylpiDSkisiUMxEQp1Y8V7AtTGo
         NbrWgFjyqJ/5NmxocTy3bgtBX7ufagCwkWDhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2IG7yxCXKhrrmlYS5yO7XY8+9kSj2TtQKMSIeXBcBeM=;
        b=EyLg8uASgYlhmQO/fc0Oo0LfBsm+ec658CH+h/HwJZ/P89qCNdXlN69UeVarMf/HZq
         YL1zYWh8+MurYCeNCe+AeQ3+tRbcgsQXfaIntKXd9nuCvNZxcWsxeJqowatQiyri0gYx
         R3UgoaKm6MNZagjDSEB1MVfhuDpkZwrCy7XMvLDB6m2OMHpMgP+vg8C4KCdhgi8DrctO
         X54pxwuZSUtZGfk7uREhVHVPqHFrh4BfJlSdOoKlhd7i4awzFQVppH1W0VHizmYgjg43
         CkRxgvVurWgqFMjXxcc89Bxvzc6+nRZpk9N+X3JRcI481nfusHkGrPElbd64vb+jIf2X
         S2+Q==
X-Gm-Message-State: ACgBeo0mcoDDd2KnQoLfO9Cbl8p+pqwcvRNdGj0+UTer4vyh6p0JfRdg
        X1NovK8d2ISNj5SSMqWWYcB8jAiKmlZW4OSW
X-Google-Smtp-Source: AA6agR6PHySxMuEggsYws7DFXaHoTG+iYGplAjE9V3VgS3ZzZXQbw8ykeShpz+r+fiTlyru2xdV/Fg==
X-Received: by 2002:a17:906:ef90:b0:730:9cd8:56d7 with SMTP id ze16-20020a170906ef9000b007309cd856d7mr9964038ejb.94.1661101924985;
        Sun, 21 Aug 2022 10:12:04 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm6712562edv.55.2022.08.21.10.12.03
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Aug 2022 10:12:03 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id d5so4502442wms.5
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Aug 2022 10:12:03 -0700 (PDT)
X-Received: by 2002:a7b:c399:0:b0:3a5:f3fb:85e0 with SMTP id
 s25-20020a7bc399000000b003a5f3fb85e0mr10127541wmj.38.1661101922857; Sun, 21
 Aug 2022 10:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAADnVQJFc9AnH_9CW+bSRotkKvOmkO9jq-RF6dmyPYOpq691Yg@mail.gmail.com>
 <20220819190640.2763586-1-ndesaulniers@google.com>
In-Reply-To: <20220819190640.2763586-1-ndesaulniers@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 21 Aug 2022 10:11:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLcuvDDS3rZfEgDrwbdJrTx8HCRNiZ5cDc80-_gzHCxw@mail.gmail.com>
Message-ID: <CAHk-=whLcuvDDS3rZfEgDrwbdJrTx8HCRNiZ5cDc80-_gzHCxw@mail.gmail.com>
Subject: Re: [PATCH v2] asm goto: eradicate CC_HAS_ASM_GOTO
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
        kvm@vger.kernel.org, llvm@lists.linux.dev,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Borislav Petkov <bp@suse.de>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Applied directly, just because I love seeing old nasty stuff like this go away.

             Linus
