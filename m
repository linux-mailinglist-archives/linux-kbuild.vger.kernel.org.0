Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFF63507AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 21:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236379AbhCaT4j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 15:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236375AbhCaT4T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 15:56:19 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EB9C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 12:56:16 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso1840108pjh.2
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0yVMQM63PjcObiBb0oRU4zW/nYZYAUpEebncM6/pp2o=;
        b=JBuP+/jfJ+NrzwEQ20bIwN0qlX6QRN6AmPz70dknhyQ2INu0qfYigIqNcW0xFedBlV
         xQf5RkQDJ/skE4+rekPcOkrhCWe4SeSqAXkMuakn2S2+vjrVnv2XBQ+cs1UhuMy+2Gna
         iH7QejzLyAgWxgvH2UNo92+kxrKsiWiaW2bMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0yVMQM63PjcObiBb0oRU4zW/nYZYAUpEebncM6/pp2o=;
        b=iNeNiBnM/f9OdH6BemcZZw7nk3MeMMFqLZKi7z6eyIcd8taLMzLi5mOczxP1TihvbZ
         Tk8rJZwbBafvcCBwk7OH1gDvd4e5k+sWPIjuM2zkRJS6kt/ArjrcqogSXa5B40gFPQwy
         bPKIOcajiNZrr9L5QxDnqxbA2ifh8rNliuZZsXZMqUXE5pAHo7J2YDo+Nc8VjihpzIEV
         LZk3GFVFVeXfnwIxd0dbrmb19SSo1og8qeSamrGq+muR3X63IBFqDlCLKHjirsA9wHB2
         RwldTc0lchwfp8Lk2xPWZbZZogOr/11fivNW9vS+peOpmKTu96ckOTlU5UOSoo0F3lwG
         wuWA==
X-Gm-Message-State: AOAM532B5j/csfis9bbDhT1ncCI2B6ERtA7m21ujlym2Fg4187NS8Jdb
        uoZgdND4SLmI4CuuLa+AUpIFWw==
X-Google-Smtp-Source: ABdhPJyURfcz9EDNELOeDtoZrmz4xlbjZmZib1mS3eADG+82k71SN8I1SidrNhk1Yq7veEiZDAX/Ig==
X-Received: by 2002:a17:90a:f02:: with SMTP id 2mr4975428pjy.209.1617220576022;
        Wed, 31 Mar 2021 12:56:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e1sm3109303pfi.175.2021.03.31.12.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 12:56:15 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Sean Christopherson <seanjc@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Merge module sections if and only if CONFIG_LTO_CLANG is enabled
Date:   Wed, 31 Mar 2021 12:56:02 -0700
Message-Id: <161722055925.1870138.4983509937620008210.b4-ty@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322234438.502582-1-seanjc@google.com>
References: <20210322234438.502582-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 22 Mar 2021 16:44:38 -0700, Sean Christopherson wrote:
> Merge module sections only when using Clang LTO.  With gcc-10, merging
> sections does not appear to update the symbol tables for the module,
> e.g. 'readelf -s' shows the value that a symbol would have had, if
> sections were not merged.
> 
> The stale symbol table breaks gdb's function disassambler, and presumably
> other things, e.g.
> 
> [...]

Applied to for-linus/lto, thanks!

[1/1] kbuild: lto: Merge module sections if and only if CONFIG_LTO_CLANG is enabled
      https://git.kernel.org/kees/c/8b382ebc86a8

-- 
Kees Cook

