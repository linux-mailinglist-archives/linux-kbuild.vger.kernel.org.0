Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8DFE77C824
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Aug 2023 08:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjHOGyL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Aug 2023 02:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235270AbjHOGx5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Aug 2023 02:53:57 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E792E45
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Aug 2023 23:53:55 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7381A3F915
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Aug 2023 06:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1692082434;
        bh=RB9ghWRFzrC2S/go43Pr90Xm2atl6VsbU7few10mp7c=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=pRKGziI3BXeqc6LXVXyXw7DflbYrs5OyS7hZXSZNAahzjDQzl6rfonTDf8cYjtVWv
         gsBFi2RhXfatlmDBOy9005q14kOChgH9Y9LWrqwmWxqhm/uBOH1hghqcS2PA45HHGt
         dJwkp81Tbsq9ig4cnZWPhc9Qdr/+wavJkeS3q0PBvJx07rkDIncNlM+sBerznmkWrn
         yPSDjXcp4WSQGPKKxxm7HRx/0zLC+nOnDJGlU+xqBC/yQOf5V3IlhrnCQB0nPQftzk
         YCLxyXEA3CKZV2gSy38v0THWxUPRY1kDz+PizX6ALsaJnrEBWqJb/CDfZFdowtNnE2
         7uy5XYahnuVHQ==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50daa85e940so3403871a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Aug 2023 23:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692082434; x=1692687234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB9ghWRFzrC2S/go43Pr90Xm2atl6VsbU7few10mp7c=;
        b=HLSVXS/BzScHjuHbKzfdmKS16U37vk+6nfbNBMjRLerkJnRRJvaaXNFpTO0jnLerD9
         wL7kAGGj79M5+LAUh6pjzAnfXYBvQN7b5IHBN9k2/Z8V6F4y/Nhoh2iVstKoDL5YUClj
         vFvDGxj82MWmLiSXy0dPJyS2urT3mncalyRpMDTHQbQFx8zoDYU7lkFFcUQqBy+ZSuGc
         PfHcT+aPGVJhWeyz0BZQdZMyF+kMcsmuqHELVQU47PmNnHhdoDqUHp+00BvHivigvYXA
         GfOoZ0H1eMYlKNyHYMZTV/SPAQdEKYHKFLpzbT2XWdgTu7G908IL48tVpdbvuuLrT2Q7
         rnTA==
X-Gm-Message-State: AOJu0YyXcHVd9jo8WOjUHP+4/+mF8BnsF303lZ6bvTYbbUlvOM++LOBw
        8k0D44QODc3mhMsQFjOxC77EX7whEjFZ1/haX+Igddgcn8+Qaj5ZafFNv3hG/eQ08GyZ86gsuI/
        UGRGZcVsuLO7ID8wEJe9AJF8gMsQoDiL/MrIgf0+W6g==
X-Received: by 2002:aa7:d50e:0:b0:523:d363:1627 with SMTP id y14-20020aa7d50e000000b00523d3631627mr8036451edq.33.1692082434190;
        Mon, 14 Aug 2023 23:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG28gpy4hdT1nvVWM72ZLlZkYrhVpysNu5tg6V2wH0wB/ok8CuiJHKGjqtM9571bluVibImkg==
X-Received: by 2002:aa7:d50e:0:b0:523:d363:1627 with SMTP id y14-20020aa7d50e000000b00523d3631627mr8036436edq.33.1692082433774;
        Mon, 14 Aug 2023 23:53:53 -0700 (PDT)
Received: from localhost.localdomain (host-79-33-195-131.retail.telecomitalia.it. [79.33.195.131])
        by smtp.gmail.com with ESMTPSA id n5-20020aa7c785000000b0052338f5b2a4sm6544040eds.86.2023.08.14.23.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 23:53:53 -0700 (PDT)
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rust: fix bindgen build error with fstrict-flex-arrays
Date:   Tue, 15 Aug 2023 08:53:46 +0200
Message-Id: <20230815065346.131387-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3") enabled
'-fstrict-flex-arrays=3' globally, but bindgen does not recognized this
compiler option, triggering the following build error:

 error: unknown argument: '-fstrict-flex-arrays=3', err: true

Add '-fstrict-flex-arrays' to the list of cflags that should be ignored
by bindgen.

Fixes: df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3")
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 rust/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/Makefile b/rust/Makefile
index 4124bfa01798..ae2f5421da25 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -258,6 +258,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-reorder-blocks -fno-allow-store-data-races -fasan-shadow-offset=% \
 	-fzero-call-used-regs=% -fno-stack-clash-protection \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
+	-fstrict-flex-arrays=% \
 	--param=% --param asan-%
 
 # Derived from `scripts/Makefile.clang`.
-- 
2.40.1

