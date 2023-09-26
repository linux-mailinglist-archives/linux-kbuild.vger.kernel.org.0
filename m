Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 493F47AEAAD
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Sep 2023 12:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbjIZKpr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Sep 2023 06:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234225AbjIZKpq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Sep 2023 06:45:46 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6267B11D
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Sep 2023 03:45:39 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59c4ec85ea9so156061357b3.0
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Sep 2023 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695725138; x=1696329938; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI+eNbg0qpdq3vkkOFQPywNCLJtuGTIXCWjIkj4E0SQ=;
        b=QoVKALhyKW/p0vPNr9KgtrV33qk3V2inFxxclL0UsckIDxx8cL4wFaxhcVkjzDnL/T
         +lVTYKAVH7R+9qi+6PaL1USfB2VZDInwJQMuYNtV6smZFFGowkYa714ol+zyEe4zWOQn
         njo58A+VPuQXw3qhWO9aZRKdEiYf2ULJvOs9lvoNg7d5eSxdCA/sR8jdhZXJ4bgv7wcI
         egB8t+UXu3G/rSBOJtu4qNHtpON5P8xwWoLGOd5MPhW0R1Of2knip+Ek5vSWGig3Jr7q
         uuUlMvy1rWc5BjCEFGajgsEBEmUfOGYYzYphETo4mHNx/4Dx2/io0teMh3kAOJfiJ1d4
         lOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695725138; x=1696329938;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI+eNbg0qpdq3vkkOFQPywNCLJtuGTIXCWjIkj4E0SQ=;
        b=eub9326DpNHB+7DB37pHZT4vAnet+zZJWI2w+68r9Byu+Pw0WTvePUnep4A1jTxja5
         /UtNEQOuWA6VKok9psiH5oNpnWgHto6OaDQqqVC+NoItnuQjoGNakvxFpg9lTIcFjWGD
         4rBFEhZfhkCOJPgNS8g3SDqCoz/Tq5W9AuRaOHmZK5nDe7iSJ6sbPqo/mr0ppqFdf8tT
         jTCRE0pBchgK7vkreH+9IfmtmK6N8wRPmEaGQhcH+MfdrV3LmSRKo1Y3DvhuwenvyoIz
         YxpmpCjeUYXIJDuMRXCLkCEEEvp9cWi/QG0qWtxMwCOpEK8OILW/qLWMDbJnFSuRhBV7
         6vEw==
X-Gm-Message-State: AOJu0YwsKFmRyXcadH/RkMuqIe8AcIIkMHp6/nH8UMwR22ZxEJOcN5tC
        a880Sjo16/PxrJRYpQkwQ0tcUwkO1Vc7dc8=
X-Google-Smtp-Source: AGHT+IGIcPd49DrH+Dfh7mAReV5rlgiSMBoqAdy5TxgYzI4sEGmEMbcZtmWkPKIs3cuVkncvuJ25WaosBw7tTpg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:eb12:0:b0:59f:3cde:b33a with SMTP id
 n18-20020a81eb12000000b0059f3cdeb33amr116549ywm.6.1695725138575; Tue, 26 Sep
 2023 03:45:38 -0700 (PDT)
Date:   Tue, 26 Sep 2023 10:45:34 +0000
In-Reply-To: <20230918234412.363087-2-mmaurer@google.com>
Mime-Version: 1.0
References: <20230918234412.363087-2-mmaurer@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230926104534.2227995-1-aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: Respect HOSTCC when linking for host
From:   Alice Ryhl <aliceryhl@google.com>
To:     mmaurer@google.com
Cc:     a.hindborg@samsung.com, alex.gaynor@gmail.com,
        aliceryhl@google.com, benno.lossin@proton.me,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
        nicolas@fjasle.eu, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Matthew Maurer <mmaurer@google.com> writes:
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
> 
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Tested-by: Alice Ryhl <aliceryhl@google.com>
