Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA632CCB2F
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 01:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgLCAqQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 19:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbgLCAqP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 19:46:15 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9861C061A4C
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 16:44:50 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id p6so177379plo.6
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 16:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bLBtcahHUgRey2bocBX3LpkzES6o85CTkdKSQIoTxiU=;
        b=Yl9WZnMaww0he7QRfW9jOqZSRgqRB8omuAfQPdgmN+mHSJ/1w2KF6OjEaqZ96ay718
         S3/lMBp4ZRYn4a9gxgDJv+VLx28wtp9e/MsAZkKcE7K1gjsFf/4efo8hg1mrkkc01iFJ
         wdPmigP/DP9pr2Htj3CmyEohPBnNZ8iEoyIcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bLBtcahHUgRey2bocBX3LpkzES6o85CTkdKSQIoTxiU=;
        b=jxDBKe2A+pytq53za+zcZ7Lwe/eNj3sYDYv5MpHm2epc6P/pKUwO+kG9x6e3WyBGYV
         LvYQr2cEvK/uxUCedcDF66U4BxJq97a886VosBq915DkRPCwJL976qyKbJUJW6pMYt5G
         woQ8DS730FBP6ZCofW3q5kIgbo6uu+DDwFHmQQfPg3Dqe+7KAav789k9lPo4ycDpUPs+
         jfvLlJsoftENgsUeAsd2F8UhmRM1EOsSXXrP2ouH/39L5kuDdyUahp87+/1h3wKIiJOF
         db/L1LLx/1ueZvNdAyiS9h4Vyc/GhiVM/6zbM8SG0uzvCZBU8HLonU2FdA8NEK/PlKhF
         MeTQ==
X-Gm-Message-State: AOAM533ZoTJvLJK/jRcheTyHj29n0ubDAShSMoxZW7cLsTmblOK8eYKv
        xnh2vu+BlAdPkaxYuFnc2jTz0Q==
X-Google-Smtp-Source: ABdhPJziTF/7Csvco5TbtDuSOeB++T5uRE9JlkYulykOl44Jt3aDFe7dFZSWRfOtFboJKpuZBB8ktg==
X-Received: by 2002:a17:90a:eb90:: with SMTP id o16mr546208pjy.45.1606956290467;
        Wed, 02 Dec 2020 16:44:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s189sm235834pfb.60.2020.12.02.16.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 16:44:46 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] ubsan: Disable UBSAN_TRAP for all*config
Date:   Wed,  2 Dec 2020 16:44:34 -0800
Message-Id: <20201203004437.389959-5-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203004437.389959-1-keescook@chromium.org>
References: <20201203004437.389959-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=7ee65f6e259e469145bd4516a970901be12cf3f3; i=K+dhdzJLSQHC/2OrzylSjjcBSx8EEn7IdlM58268AK0=; m=YBBOuBPVmA0P1a8coxM/uNwSE65GsSmjFIZeFPhFxcA=; p=MLch31Yqya7Wm7SW8qWS5SpAYj2nWDWoZGT+cDhNm18=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAl/INPMACgkQiXL039xtwCYBSw/8DTc om4n+iIU1idXW55ytKK87K4IZv1Fjd3LIN+1ZMVRkJEffet3ABmM7D2LijRwGurqERGdSbAQNg0ds KMf0NneVxosE8z/1ytEp5P0apQexcdIaXPU/1YlGOCzJ5+FXBJ1BwNFozG2VpPQwOxba9WssYbbtm vyL3W0X2VHGgdQXWv3Ogwx11d6X98S0S0geq4rSgOSzKRHqDr6U/bNQGWQHtr4r6hGOU9p5G4uRV1 gQ7R+2cDrDx0HQb8Avg/vES/td9L/wTh5TjzYr6UZTV/6EJXdEq8f+em9QMbS9DwmtMVt461bXuKv qkUnHX3BnSKqWTlAzymTy+cARSzEFry86Rz8ZxPzjtXo/ubTyD/R3IbT3zCsQNn5J1ZsAj33agvLH mTGNArntPT8jfvhsBe+IFKUUNMgFvli6FZhYcyFAGtq6pV5ILsuWsn7NEEAnjht/3hSH8V83eUqhP z8EikJENhLcSALmAQCW0DEZGsPH2P1Dh8LOgBIxj6xEmeO6kepSI/hs0dCg6KinAlk9BRe53uBCIR OxM/ERuEH3QizmQINLxQe1AuomVsx+e+ZiDjYsyOhRq1ukBclw7QSMR1CyshAr5cswbCztLiwwifR f+LEwKTBqV4vCM8x8FVGlv+bLJ4NqrFhHZ3/cV5rIyu3GZlTWs85IABUKSrnGXRg=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Doing all*config builds attempts to build as much as possible. UBSAN_TRAP
effectively short-circuits lib/usban.c, so it should be disabled for
COMPILE_TEST so that the lib/ubsan.c code gets built.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.ubsan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 4190a99b1eaa..6e8b67d4b0d9 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -14,6 +14,7 @@ if UBSAN
 
 config UBSAN_TRAP
 	bool "On Sanitizer warnings, abort the running kernel code"
+	depends on !COMPILE_TEST
 	depends on $(cc-option, -fsanitize-undefined-trap-on-error)
 	help
 	  Building kernels with Sanitizer features enabled tends to grow
-- 
2.25.1

