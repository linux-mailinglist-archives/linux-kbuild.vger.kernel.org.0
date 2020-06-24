Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95E1207D54
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 22:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406585AbgFXUde (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 16:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406579AbgFXUdd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 16:33:33 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7956C061795
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:31 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id s75so2510697qka.1
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=tPGFlpm4UBb0TochKjxo1pWDKJKPOqpdcyA67hsa/L0=;
        b=UWquwQhXAU0FVu4xLvS68q0H5KMxmC2ClvghZJMO4mnRx07EpAl76zEcZBzo4oeEr0
         7QXs8i2/+8O4w4SxtWsY3wN7GwxBdmr8ei0LaPar71G/kQf7fHaujWILvZ2kj0I3OQnr
         XU2/mlOZsNQvQSHPQNf0o+Qm3V8oiEUyLdtK1wUmyBN7hxR5xoSfaX9vD6ylX1d8MUtg
         8oc06ZHQnmcIQFLeYAyeQNfJHs0QNV6Vk/mbPBcPZcsZ2TSgTBf3waXZc3e781NAKP/5
         u74kiQ+ly65wZm433U8lBfaxNpuvW2v+K3io3UW/wCh82HySe+7ylz3czOz1zaRbngJk
         H88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tPGFlpm4UBb0TochKjxo1pWDKJKPOqpdcyA67hsa/L0=;
        b=CF7pRdi4PDEU8cvDKEXGkNVL/vIV9gD3W2apRehwz30f/Gu1zo7TCitLwdoddGiILq
         4V3H/SxyiEYkIYhkXyhJrR045ZeDbnGihn4FeXgRxmWD59ez+fF9PEwPgrSp+VlX3lpI
         LRgDy4nnFc4b3n1QTfqx6sS8Vug8/yAgCwdGbM7NMC3YpCubOxFXO0GayBb4ypPMtG0a
         GnNos5NB2KE/52oOgDkLbisx//Cr6814UVmTkQQVTPQV2RcH8jXiPcVXDHwOlTeAe+ug
         OBEOrLJ8Zj7foIrjRqhwD3KQmsO7xKOOX9bFBXEVtVtyDDjnn0L/I5iWQxmlpNtgP8Yi
         s1Xg==
X-Gm-Message-State: AOAM533sPrICIeF3CEG7YPZyc2hfw4287EBC8kQc0dqhY8sr312cRkWz
        P8n31Iy6fHPZdPypNKn0HCguX9JXOO0KD1j/jlg=
X-Google-Smtp-Source: ABdhPJwOmVj5AVipomAFkeyuweymmty039I+YIpShmyF/4KLduyGozlOwEpdaQAyz+L93rzFTlrhSA4YsbqHyVAyM6Y=
X-Received: by 2002:a0c:8482:: with SMTP id m2mr33607693qva.65.1593030810891;
 Wed, 24 Jun 2020 13:33:30 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:31:56 -0700
In-Reply-To: <20200624203200.78870-1-samitolvanen@google.com>
Message-Id: <20200624203200.78870-19-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 18/22] arm64: allow LTO_CLANG and THINLTO to be selected
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Allow CONFIG_LTO_CLANG and CONFIG_THINLTO to be enabled.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a4a094bedcb2..e1961653964d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -72,6 +72,8 @@ config ARM64
 	select ARCH_USE_SYM_ANNOTATIONS
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
+	select ARCH_SUPPORTS_LTO_CLANG
+	select ARCH_SUPPORTS_THINLTO
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && (GCC_VERSION >= 50000 || CC_IS_CLANG)
 	select ARCH_SUPPORTS_NUMA_BALANCING
-- 
2.27.0.212.ge8ba1cc988-goog

