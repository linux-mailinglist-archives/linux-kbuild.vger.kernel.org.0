Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5EAC397A91
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jun 2021 21:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbhFATTT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Jun 2021 15:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234671AbhFATTR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Jun 2021 15:19:17 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A7BC06174A
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Jun 2021 12:17:36 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t21so7428107plo.2
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jun 2021 12:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tXSpBBbp8umZDX2eRcS2QwQNb4xIATBt0dQ003Ln9Ig=;
        b=dbBQtsyL8TYI6C8oHFyO/gxmru5zdSVPID98stKWsan84a3hrTx94pddMuc/EtJFbf
         7g7qjEv/I3Rgmqo+peWspvcYBOsNeJgmc7YQUSji77T77/2IQYedZmF96ZtTokyw0Lah
         BtBSmnIcrE/ZD9Nx4C9+joeQIZbsxXvYyvhKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tXSpBBbp8umZDX2eRcS2QwQNb4xIATBt0dQ003Ln9Ig=;
        b=LO8D4RGIgPBrjJggJQZ9X/yODNgVbhAjIvGisnxIBoFnY7k48wXoPwnpHb3TvZU3xf
         HIgUeAaITMiTxUGuZBGi59xDtsyPZUfquCkX41/gxZM0KWf7i+aYjYZtB5a6QAzSkkEX
         vN4SX6U63nteAYkUQQastH3t8EB9GrdKd/FS+pqTu0sWv4s7Zcw+psl9YmO/myohBlSJ
         Wzz5tlUUREYdPtRPOWjXmUbrDTjAMvzUkEaanbav3wGjTRH4FH1yhaOoA0pxjRRejJ/Z
         XaksulmJUF4+pE2srSiS5wz75S5EWuMV+mf/zyomu3Ulq6mgnP6WZx7vBCbksO4EmDdn
         IR8w==
X-Gm-Message-State: AOAM530pQB4aO4ySvuTiH4JpCgK3Fb1S1UwBUZZT5UdpC27tSv8VhgR4
        LBOgTl82tY9WfVFZhmyhxeUDeA==
X-Google-Smtp-Source: ABdhPJwS5JdAcmf2q9gCv0Uxt6ES8dGbGW4xYVvGe4pYTtCgcIGIcwbajtWQSQ8dXhv955GtgjCQ0g==
X-Received: by 2002:a17:90a:8902:: with SMTP id u2mr26520768pjn.143.1622575055757;
        Tue, 01 Jun 2021 12:17:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s15sm10891489pjr.18.2021.06.01.12.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 12:17:35 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        clang-built-linux@googlegroups.com,
        Bill Wendling <morbo@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@google.com>, linux-doc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] pgo: rename the raw profile file to vmlinux.profraw
Date:   Tue,  1 Jun 2021 12:17:24 -0700
Message-Id: <162257504238.1460767.9253353990996275101.b4-ty@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531202044.426578-1-morbo@google.com>
References: <20210531202044.426578-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 31 May 2021 13:20:44 -0700, Bill Wendling wrote:
> Future PGO features may create other files in /sys/kernel/debug/pgo. So
> rename the kernel's raw profile data file to "vmlinux.profraw" to make
> which part of the kernel the file is for more explicit.
> 
> Note that future files in /sys/kernel/debug/pgo should follow a similar
> naming convention.

Applied to for-next/clang/features, thanks!

[1/1] pgo: rename the raw profile file to vmlinux.profraw
      https://git.kernel.org/kees/c/001eaf3fd0e3

-- 
Kees Cook

