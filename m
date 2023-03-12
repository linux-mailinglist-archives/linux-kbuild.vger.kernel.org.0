Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0F56B6C83
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Mar 2023 00:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjCLX0i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 Mar 2023 19:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjCLX0h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Mar 2023 19:26:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6BF298CC
        for <linux-kbuild@vger.kernel.org>; Sun, 12 Mar 2023 16:26:36 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id o12so41901641edb.9
        for <linux-kbuild@vger.kernel.org>; Sun, 12 Mar 2023 16:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678663594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7amGatuf567fWRNk3AylR5pwT0OyOTnaMCjO7lph9w=;
        b=I+hm1Wj25LW1lzjukQhpLqGWXB4x4lnS4GtOm8JZjWKcwuXPGsA0vpAI1zmfUPLYXM
         unOcRfx28HaiKX47cuJNWq3+Z2s10apUCqi4Lw6PO/4Rsm6jSiZZOI8Q3E3iMYIJR5w/
         4IX2iggxJFl8rNGeIIAe2cnRe1JujZmuIT8EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678663594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7amGatuf567fWRNk3AylR5pwT0OyOTnaMCjO7lph9w=;
        b=f471xz5wOXGRxGxGRBplhBi/t+N0Rzd0R0e/LlACBFX5hEIfXU/ooP0Os9K+Cid4yU
         PEfT7l/RbXMnG/D+BpmpzyLMRbFduk29UxhEWzt6I6mub2fQegAJkV6kvdyO0LbISUzX
         FY4lHmialt+CQkRmwnLhPIsbvmAtjEqwfjt9T06fqWPAudqoqb+ydWBJhYxuT22W9f37
         Od9ILV0wd2Jf2t4voAc4Yif4HMNnZ5Qhq3IjZzT8LPrJmlYRFmYkbHxoQ1ntKmMoZ1Ky
         u5wTHclLSO0MoozhUcaH4Iz3rehgUYI37C8oKqNsDRniGs4LFsprxDTmmH84xVt6Jiag
         FsRw==
X-Gm-Message-State: AO0yUKXlQeFWToAvQoNnpU9AjoKixdIlLCWuS1WhiA+nGF+AloOhJ+Bw
        csYzkglSSG/Fm/79MEmqruzgbX4YQ88pU8pTuijBhQ==
X-Google-Smtp-Source: AK7set/4llmf9T1h0UzgMPXbzydI2XBFtmlapAmKDdLT7DX6jcp69qS6dy9Fprw2Nl9CTh8Jh+gJQg==
X-Received: by 2002:a17:907:d308:b0:8b1:3a1c:3174 with SMTP id vg8-20020a170907d30800b008b13a1c3174mr33867834ejc.77.1678663594551;
        Sun, 12 Mar 2023 16:26:34 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id u21-20020a17090657d500b008b69aa62efcsm2726650ejr.62.2023.03.12.16.26.33
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 16:26:33 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id s11so41897113edy.8
        for <linux-kbuild@vger.kernel.org>; Sun, 12 Mar 2023 16:26:33 -0700 (PDT)
X-Received: by 2002:a50:9992:0:b0:4fb:4a9f:eb18 with SMTP id
 m18-20020a509992000000b004fb4a9feb18mr1699488edb.5.1678663593229; Sun, 12 Mar
 2023 16:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230312200731.599706-1-masahiroy@kernel.org>
In-Reply-To: <20230312200731.599706-1-masahiroy@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 12 Mar 2023 16:26:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgL-GspdmghwQ2kXJO1QCKFY+HieU0arYSFDHBLO0dZuA@mail.gmail.com>
Message-ID: <CAHk-=wgL-GspdmghwQ2kXJO1QCKFY+HieU0arYSFDHBLO0dZuA@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: fix some packaging issues, and use
 git-archive for source package
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 12, 2023 at 1:07=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> This series fixes some bugs, then switch to 'git archive'
> for source package creation as suggested by Linus.

Thanks, looks good.

Shouldn't we also revert e0ca16749ac3 ("kbuild: make perf-tar*-src-pkg
work without relying on git")?

           Linus
