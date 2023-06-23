Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 881B173AD9B
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 02:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbjFWALr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Jun 2023 20:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbjFWALq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2023 20:11:46 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D7EC7
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2023 17:11:44 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-53fa2d0c2ebso76780a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2023 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687479104; x=1690071104;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5oekcbpWaYM+RGe3QAFehRbvyX8WllQ5GlGqpNCW54M=;
        b=Rdb6IeNa+bN582kGK3qp4Ii4rozTCVuUQQpEgBAs6zPE7ZRSP7TQtPZ3NPBWlRL1tM
         t04koMz43/pvfmmFxz/6CBOzsO9Vs7uk+c7s8NDsE+N0GSQp3PzITuPhz9a7gTu2Mi5N
         J3weAAdvQPHuoOLsMrmnUfuI3Y426aWWtjCblobFURtiRe9q8ccjcp58x0iIuZr8IG2W
         lZY9bsnUTX4RfzQ5RagfFmnXCn3hj889q6PoX7fMeBzJSgmpXXSagS0qrBu5GZxo4j4L
         xnF/sFFXm28NDNZCMab0/wcgJ/P8/CqAiVT9dDqOZ3DagKfQzFIFSag822sHncBtM7Hd
         KPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687479104; x=1690071104;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oekcbpWaYM+RGe3QAFehRbvyX8WllQ5GlGqpNCW54M=;
        b=RBRcS3eDpytXgUtbikrahLAa0TixibUWfdHtPOsrPnf10oo0CZRZqElAh9E3hAZSfL
         PhCjx08b8IGINNjXssIbDHUXF1r7v67neElD/nIyiQydA5ygigIOCoGbDNctxJQyUjA3
         KN53RTUiuOEsbpYPc8XhlUcrTom/xmrAr/IPFcW1E2iR8J7mnLIrAaHIV2n7L+llLGSi
         n33wlVtIdvj3jbRzKaboevFxTa+73jw/qswXdbE2679DY+5XuQHySR1hU7j4rrUvMUlI
         /WC/p+WlM7yJkuDNbBA+gkgDG0/QyRoK2XOoLvnq66LEio0G7qbdA7Ul4z9YQPdNCeww
         u4sA==
X-Gm-Message-State: AC+VfDya3sooV5CIOsQTroI9UsObLoQXIUZp1/t+kO07C8WwsCCW43M7
        Cl6V91IuOUoZwn8+HolkK7CKYkqZCB55r9Cpo7Q=
X-Google-Smtp-Source: ACHHUZ5Bbdj/Ngjl/Z69q7NG5fA7CX/VyQT7dEAumQtyQESFxG0Anm7Rfy27RCjzekbHKI25dJxcWZNJOXP3l8fny+w=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:5b15:0:b0:557:3c4e:5769 with SMTP
 id p21-20020a635b15000000b005573c4e5769mr787928pgb.3.1687479104229; Thu, 22
 Jun 2023 17:11:44 -0700 (PDT)
Date:   Fri, 23 Jun 2023 00:11:41 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=693; i=samitolvanen@google.com;
 h=from:subject; bh=6A3Z0VekOrcAMCMCoSBjX+Qi/VC1cWGyR/zEJyxpVoc=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBklOM8IwI7R/Crn8VEyZ1topwBBLxf1CeJ9XSJl
 p3FBTr7u5OJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJTjPAAKCRBMtfaEi7xW
 7mugC/9MpcW5D0WhaaWUZM8C+JzHLa9JJbPhg9hFYjXWL+Rwxh6hi7X6iGTW5gfIJ2Ar6ogm/yU
 CuPjeOilA9lpCS7UZBbG95xG49nZ/T69c4bYi7G0hi99r4WW+ToN9ZF82izlKGmIekKCiFrDLgl
 Ie7NTBQ3yMll03uKWi0Gyq2joN795JLMIwr2A9Oi/NIU72vxhUv+PXRI1J5M4wZRXeobAMojmpk
 QMPTRn5yh+fLLhBgDQRyRcdtWq5c0DPnomwNttFc1ilPg5KLH1kHpp5S4p4Bksp4NgGMPLIUssg
 WkN6j6kOkknD8IWznyBNa9tVZsk53Jzg239w4PWwE+R4AcnRxTNxy7U8fTDYtw9maeU7mQxh14q
 XtqdL7lx4s0aLqIv7ME/NinZ58oXfTbHrEbE0wMhuMK55Zr7nyQ1ix/ciaj1PTZH4XZpFRX0gdH 1BvtUZoas2rrY8vuyqrgYGXm/VXk2gJ/TA/uTdSdfEFtbUTTtI/ov2gNFSkKVyePeWVmY=
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230623001140.1111494-4-samitolvanen@google.com>
Subject: [PATCH 0/2] Fix CFI failures with GCOV_PROFILE_ALL
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi folks,

The following two patches fix CFI failures with GCOV_PROFILE_ALL,
where the compiler injects indirectly called functions to object
files that otherwise contain no executable code, and are not
processed by objtool or don't have CFI enabled. This results in
missing or incorrect type hashes during boot and when modules are
loaded.

Sami Tolvanen (2):
  kbuild: Fix CFI failures with GCOV
  kbuild: Disable GCOV for *.mod.o

 init/Makefile             | 1 +
 scripts/Makefile.modfinal | 2 +-
 scripts/Makefile.vmlinux  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)


base-commit: 007034977130b49b618a5206aad54f634d9f169c
-- 
2.41.0.162.gfafddb0af9-goog

